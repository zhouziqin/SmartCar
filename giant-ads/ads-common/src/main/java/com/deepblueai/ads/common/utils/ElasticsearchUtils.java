package com.deepblueai.ads.common.utils;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;
import net.logstash.logback.encoder.org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.util.Strings;
import org.elasticsearch.action.DocWriteResponse;
import org.elasticsearch.action.bulk.BulkRequest;
import org.elasticsearch.action.get.GetRequest;
import org.elasticsearch.action.get.GetResponse;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.update.UpdateRequest;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.common.xcontent.XContentType;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.aggregations.Aggregation;
import org.elasticsearch.search.aggregations.AggregationBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.aggregations.bucket.terms.ParsedTerms;
import org.elasticsearch.search.aggregations.bucket.terms.Terms;
import org.elasticsearch.search.aggregations.metrics.ParsedSum;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.elasticsearch.search.sort.SortOrder;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.IOException;
import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.util.*;

@Slf4j
@Component
public class ElasticsearchUtils {

    @Resource
    private RestHighLevelClient restHighLevelClient;


    private static final String formatStr = "yyyy-MM-dd'T'HH:mm:ss.SSSZ";

    private Map<String , Aggregation> aggs;


    /**
     * 插入一条数据(已存在则更新)
     *
     * @param index   ads_service-yyyy.MM.dd
     * @param id      playId/flowID
     * @param source  playLog 类信息
     * @return
     */
    public DocWriteResponse.Result addData(String index, String id, Object source) {

        IndexRequest indexRequest = new IndexRequest(index);

        if (StringUtils.isNotBlank(id)) {
            indexRequest.id(id);
        }

        try {

            indexRequest.source(JSON.toJSONStringWithDateFormat(
                    source
                    ,formatStr
                    ,SerializerFeature.WriteDateUseDateFormat),XContentType.JSON);

            IndexResponse response = restHighLevelClient.index(indexRequest, RequestOptions.DEFAULT);
            log.info("add Data :{} , response -> {}", JSON.toJSONString(source), response.getResult());
            return response.getResult();
        } catch (Exception e) {
            e.printStackTrace();
            log.error("elasticsearch 插入数据失败 !  ---> index = {}  , id = {}", index ,id);
        }
        return null;
    }


    /**
     * 批量插入数据
     * @param index   格式   ads_service-yyyy.MM.dd
     * @param sources key= id (playId/flowID) ,  value = document (playLog)
     */
    public  void batchAddData(String index  ,Map<String,Objects> sources){

        if(sources.size() <= 0 ){
            return ;
        }

        BulkRequest bulkRequest =  new BulkRequest();

        for(Map.Entry entry : sources.entrySet()){

            IndexRequest indexRequest = new IndexRequest(index);
            indexRequest
                    .id(String.valueOf(entry.getKey()))
                    .source(JSONObject.toJSONString(entry.getValue()) , XContentType.JSON);

            bulkRequest.add(indexRequest);
            log.info("es insert batch success ,data ids -->{}", Arrays.toString(sources.keySet().toArray()));

        }

        try {
            restHighLevelClient.bulk(bulkRequest,RequestOptions.DEFAULT);

        } catch (IOException e) {
            log.error("elasticsearch 批量插入数据失败---> index = {} ",index);
        }
    }


    /**
     * elasticsearch 更新操作(索引不可为通配符)
     * @param index  ads_service-yyyy.MM.dd
     * @param id      playId/flowID
     * @param source
     */
    public void update(String index ,String id, Object source){
        UpdateRequest updateRequest = new UpdateRequest(index,id);
        IndexRequest indexRequest = new IndexRequest(index,id);
        try{

            indexRequest.source(JSON.toJSONStringWithDateFormat(source
                    ,formatStr
                    ,SerializerFeature.WriteDateUseDateFormat),XContentType.JSON);

            updateRequest.doc(indexRequest);
            restHighLevelClient.update(updateRequest,RequestOptions.DEFAULT);

            log.info("es update success ,data is ->{} ",JSON.toJSONString(source));

        }catch (Exception ex){
            ex.printStackTrace();
            log.error("更新数据失败---> index = {} , id = {}",index,id);
        }


    }






    /**
     * 根据多个索引获取数据
     *
     * @param indexNames
     * @return
     */
    public <T> List<T> search(SearchSourceBuilder sourceBuilder, Type clazz , String... indexNames) {

        List<T> sources = Lists.newArrayList();

        SearchResponse response = search(sourceBuilder, indexNames);
        if (response == null) {
            return null;
        }

        for (SearchHit hit : response.getHits().getHits()) {
            T data = JSONObject.parseObject(hit.getSourceAsString(), clazz);
            sources.add(data);
        }
        return sources;

    }


    /**
     * 聚合查询
     * @param sourceBuilder
     * @param indexNames
     * @return
     */
    public ElasticsearchUtils aggregationSearch(SearchSourceBuilder sourceBuilder ,String... indexNames){
        SearchResponse response = search(sourceBuilder,indexNames);
        if(response != null ){
            aggs = response.getAggregations().asMap();
        }
        return this;
    }


    /**
     * 需执行前置方法 aggregationSearch
     * @param fieldName
     * @return
     */
    public Double sum(String fieldName){
        if(aggs == null){
            return null;
        }

        ParsedSum sum = (ParsedSum)aggs.get(fieldName);
        return sum.getValue();
    }

    /**
     * 分组后的结果
     * @param groupBy
     * @return key groupBy ,value = sum
     */
    public Map<String,Double> sumByGroup(String groupBy,String fieldName){
        if(aggs == null || ! aggs.containsKey(groupBy)){
            return null;
        }

        ParsedTerms terms = (ParsedTerms)aggs.get(groupBy);
        Map<String,Double> result = new HashMap<>(terms.getBuckets().size());
        for(Terms.Bucket item :  terms.getBuckets()){
            Double value = ((ParsedSum)item.getAggregations().get(fieldName)).getValue();
            result.put(item.getKeyAsString(),value);
        }
        return result;
    }



    /**
     * 获取索引下所有数据
     * @param indexName
     * @param clazz
     * @param <T>
     * @return
     */
    public <T> List<T> search(String indexName, Type clazz){
        return search(null,clazz,indexName);
    }



    /**
     *
     * 根据单个数据(索引不可为通配符)
     * @param indexName
     * @param clazz
     * @param <T>
     * @return
     */
    public <T> T search(String indexName,String id, Type clazz) {

        GetRequest getRequest = new GetRequest(indexName,id);

        try {
            GetResponse response = restHighLevelClient.get(getRequest,RequestOptions.DEFAULT);

            log.info("elasticsearch search success ,data : {}",response.getSourceAsString());
            return JSONObject.parseObject(response.getSourceAsString(),clazz);

        }catch (Exception ex){
            ex.printStackTrace();
            log.error("查询失败 index-> {} , id -> {}", indexName, id);
            return null;

        }

    }

    /**
     * 根据条件获取索引
     * @param queryBuilder
     * @param indexPattern index通配符
     * @return
     */
    public String searchIndex(QueryBuilder queryBuilder ,String indexPattern){
        if(Strings.isBlank(indexPattern)){
            indexPattern = "*";
        }
        SearchRequest request = new SearchRequest(indexPattern);

        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();
        sourceBuilder.query(queryBuilder);
        request.source(sourceBuilder);
        try{
            SearchResponse response =  restHighLevelClient.search(request,RequestOptions.DEFAULT);

            SearchHit[] hits = response.getHits().getHits();
            if(hits.length > 0){
                log.info("elasticsearch get index success ,index = {}",hits[0].getIndex());

                return hits[0].getIndex();
            }
        }catch (Exception ex){
            log.error("获取索引失败 ---> index : {} query : {} ",indexPattern,queryBuilder.toString());
        }

        return null;
    }


    /**
     * 构建 searchSourceBuilder 对象
     * @param queryBuilder
     * @param pageIndex
     * @param pageSize
     * @param sortFieldName
     * @param sortOrder
     * @return
     */
    public SearchSourceBuilder  createSearchSourceBuilder(QueryBuilder queryBuilder
            , Integer pageIndex
            , Integer pageSize
            , String sortFieldName
            , SortOrder sortOrder){
        SearchSourceBuilder builder = new SearchSourceBuilder();
        if(queryBuilder != null){
            builder.query(queryBuilder);
        }

        if(pageIndex != null){
            builder.from(pageIndex);
        }

        if(pageSize != null){
            builder.size(pageSize);
        }

        if(sortFieldName != null && sortOrder != null) {
            builder.sort(sortFieldName,sortOrder);

        }


        return builder;
    }

    /**
     * 构造查询类
     * @param queryBuilder
     * @return
     */
    public SearchSourceBuilder  createSearchSourceBuilder(QueryBuilder queryBuilder){

        return createSearchSourceBuilder(queryBuilder,null,null,null,null);
    }

    /**
     * 构造带有多个聚合查询的source
     * @param builders
     * @return
     */
    public SearchSourceBuilder createSearchSourceBuilder(AggregationBuilder... builders){
        SearchSourceBuilder builder = new SearchSourceBuilder();
        for(AggregationBuilder item : builders){
            builder.aggregation(item);
        }

        return builder;
    }



    /**
     * 构造 sum 聚合查询实例
     * @param fieldName 返回的结果字段,返回的字段默认sum_开头
     * @return
     */
    public static AggregationBuilder builderSumBuilder(String fieldName){
        return AggregationBuilders.sum("sum_" + fieldName).field(fieldName);
    }


    /**
     * 根据group by 分组 聚合查询一个或多个sum结果 ，
     * 返回的结果字段默认sum_ 开头
     * @param groupBy
     * @param fieldNames
     * @return
     */
    public static AggregationBuilder builderSumBuilder(String groupBy,String... fieldNames){
        AggregationBuilder builder = AggregationBuilders.terms(groupBy).field(groupBy);
        for(String fieldName : fieldNames){
            builder.subAggregation(AggregationBuilders.sum("sum_" + fieldName).field(fieldName));
        }
        return builder;
    }


    /**
     * 构造查询条件  注：默认为must条件(必须满足)
     * @return
     */
    public static ESQueryBuilder createESQuery(){
        return new ESQueryBuilder();
    }


    private SearchResponse search(SearchSourceBuilder sourceBuilder,String... indexNames){
        SearchRequest request = new SearchRequest();

        if(indexNames.length > 0){
            request.indices(indexNames);
        }

        if(!Objects.isNull(sourceBuilder)){
            request.source(sourceBuilder);
        }


        try {
            return restHighLevelClient.search(request, RequestOptions.DEFAULT);

        }catch (Exception ex){
            ex.printStackTrace();
            log.error("elasticsearch search data failed !  ");
        }
        return null;
    }





    public static class ESQueryBuilder{

        private enum  Reference{
            MUST ,SHOULD,NOT
        }

        private  BoolQueryBuilder queryBuilder ;

        private  Reference  refs = Reference.MUST;


        private final SimpleDateFormat formatter = new SimpleDateFormat(formatStr);

        protected  ESQueryBuilder(){
            queryBuilder = QueryBuilders.boolQuery();
        }

        /**
         * 条件必须满足,相当于and
         * @return
         */
        public  ESQueryBuilder must(){
            refs = Reference.MUST;
            return this;
        }

        /**
         * 条件可以不满足,相当于or
         * @return
         */
        public ESQueryBuilder should(){
            refs = Reference.SHOULD;
            return this;
        }

        /**
         * 添加必须不满足
         * @return
         */
        public ESQueryBuilder not(){
            refs = Reference.NOT;
            return this;
        }

        /**
         * 自定义查询
         * @param builder
         * @return
         */
        public  ESQueryBuilder query(QueryBuilder builder){
            buildBoolQuery(builder);
            return this;
        }

        public  ESQueryBuilder  equal(String fieldName,Object value){

            buildBoolQuery(QueryBuilders.termQuery(fieldName,value));
            return this;

        }

        public   ESQueryBuilder between(String fieldName,Object minValue,Object maxValue){

             buildBoolQuery(QueryBuilders.rangeQuery(fieldName).from(minValue).to(maxValue));
             return this;
        }

        public  ESQueryBuilder betweenTime(String fieldname, Date beginTime, Date endTime){
            buildBoolQuery(QueryBuilders.rangeQuery(fieldname).from(formatter.format(beginTime)).to(formatter.format(endTime)));
            return this;
        }


        public  ESQueryBuilder like(String fieldName,String query){
             buildBoolQuery(QueryBuilders.wildcardQuery(fieldName,query));
            return this;
        }





        public ESQueryBuilder greaterThan  (String fieldName, Object value){
            buildBoolQuery(QueryBuilders.rangeQuery(fieldName).gt(value));
            return this;
        }

        public ESQueryBuilder greaterOrEqualThan(String fieldName,Object value){
            buildBoolQuery(QueryBuilders.rangeQuery(fieldName).gte(value));
            return this;
        }

        public ESQueryBuilder lessOrEqualThan(String fieldName,Object value){
            buildBoolQuery(QueryBuilders.rangeQuery(fieldName).lte(value));
            return this;
        }


        public ESQueryBuilder lessThan(String fieldName,Object value){
            buildBoolQuery(QueryBuilders.rangeQuery(fieldName).lt(value));
            return this;
        }


        public ESQueryBuilder in(String fieldName , List<Object> values){
            buildBoolQuery(QueryBuilders.termsQuery(fieldName,values));
            return this;

        }

        public BoolQueryBuilder buildBoolQueryBuilder(){
            return queryBuilder;
        }

        private   void buildBoolQuery(QueryBuilder builder){
            try {
                switch (refs){
                    case MUST:
                        queryBuilder.must(builder);
                        break;
                    case SHOULD:
                        queryBuilder.should(builder);
                        break;
                    case NOT:
                        queryBuilder.mustNot(builder);
                        break;
                }
            }catch (Exception ex){
                if(queryBuilder == null){
                    log.error("BoolQueryBuilder init failed");
                }else {
                    ex.printStackTrace();
                    log.error("failed build BoolQuery");
                }
            }

        }


    }









}
