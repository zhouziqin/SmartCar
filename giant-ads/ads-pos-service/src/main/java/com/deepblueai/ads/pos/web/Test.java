package com.deepblueai.ads.pos.web;

import com.alibaba.fastjson.JSON;
import com.deepblueai.ads.common.utils.ElasticsearchUtils;
import com.deepblueai.ads.common.utils.TimeUtils;
import lombok.extern.slf4j.Slf4j;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Slf4j
@RestController
public class Test {
    public static void main(String[] args) {
        Object[] arr=new Object[]{"ma","1027","zxc","0622"};
        ArrayList<Object[]> result=new ArrayList<Object[]>();
        perm(arr,0,arr.length,result);
        //输出集合中的数组元素
        for (Object[] o:result){
            for (int i=0;i<o.length;i++){
                System.out.print(o[i]+" ");
            }
            System.out.println();
        }

        System.out.println("===========");

        Object[] arr2=new Object[]{"Ma","1027","zxc","0622"};
        ArrayList<Object[]> result2=new ArrayList<Object[]>();
        perm(arr2,0,arr2.length,result2);


        //输出集合中的数组元素
        for (Object[] o:result){
            for (int i=0;i<o.length;i++){
                System.out.print(o[i]+" ");
            }
            System.out.println();
        }
    }

    public static void perm(Object[] arr, int k, int length, ArrayList<Object[]> result) {
        //只有一个数，则排列确定，将该数组保存在集合中
        if (k==length-1){
            Object[] b=arr.clone();
            result.add(b);
        }else {
            for (int i=k;i<length;i++){
                if (IsSwap(arr,k,i)) {
                    swap(arr, k, i);
                    perm(arr, k + 1, length,result);
                    swap(arr, k, i);
                }
            }
        }
    }

    private static boolean IsSwap(Object[] arr, int begin, int end) {
        for (int i=begin;i<end;i++)
            if (arr[i]==arr[end])return false;
        return true;
    }

    private static void swap(Object[] arr, int k, int i) {
        Object temp;
        temp=arr[k];
        arr[k]=arr[i];
        arr[i]=temp;
    }


    @Resource
    private ElasticsearchUtils elasticsearchUtils;


    @Resource
    private PlayLogMapper playLogMapper;


    private static final String ES_INDEX_PREFIX = "ads_service-";

    private static final SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ");

    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");


    @PostMapping("/test")
    public void test(@RequestBody  PlayLog playLog){
        elasticsearchUtils.addData(buildIndex(playLog.getExposeTime()),playLog.getPlayId(),playLog);
    }

    @PostMapping("/test/search")
    public void test2(@RequestBody  PlayLog playLog) {

        long start = System.currentTimeMillis();

        Date minDate = playLog.getBeginTime();
        Date maxDate = playLog.getEndTime();
        log.info("beginTime -> {} , endTime -> {}",format.format(minDate),format.format(maxDate));

        //step 1. create query
        BoolQueryBuilder builder = ElasticsearchUtils.createESQuery()
                .betweenTime("exposeTime",minDate,maxDate)
                .buildBoolQueryBuilder();

        //step2. create query source
        SearchSourceBuilder sourceBuilder = elasticsearchUtils.createSearchSourceBuilder(builder);

        //step3.
        List<PlayLog> result = elasticsearchUtils.search(sourceBuilder,
                PlayLog.class,
                ES_INDEX_PREFIX + "*");

        for(PlayLog item : result){
            log.info("item : {}", JSON.toJSONString(item));
        }
        long end = System.currentTimeMillis();

        log.info("this controller is need {} ms" ,end - start);
    }

    @PostMapping("/test/update")
    public void test3(@RequestBody  PlayLog playLog){
        PlayLog log = new PlayLog();
        log.setPlanName("heiheihei");
        log.setViewCount(4L);
        log.setViewLength(5L);
        log.setExposeTime(new Date());
        elasticsearchUtils.update("ads_service-2020.07.03","20",log);
        elasticsearchUtils.update("ads_service-2020.07.03","200",log);
        elasticsearchUtils.update("ads_service-2020.07.03","2000",log);
        elasticsearchUtils.update("ads_service-2020.07.03","20000",log);
        elasticsearchUtils.update("ads_service-2020.07.03","200000",log);


    }

    private String buildIndex(Date exposeTime) {
        return ES_INDEX_PREFIX + TimeUtils.getTimeN4(exposeTime);
    }

    @PostMapping("/test/insert/batch")
    public void test4()throws  Exception{
        Example exp = Example.builder(PlayLog.class).build();
        Date time = dateFormat.parse("2020-06-03 00:00:00");
        exp.createCriteria().andGreaterThan("exposeTime",time);
        List<PlayLog> playLogs = playLogMapper.selectByExample(exp);

        log.info("select success");

        for(PlayLog playLog : playLogs){
            elasticsearchUtils.addData(buildIndex(playLog.getExposeTime()),playLog.getPlayId(),playLog);
        }

    }


    /**
     * 分组测试
     */
    @PostMapping("/test5")
    public void test5(){

        SearchSourceBuilder builder = elasticsearchUtils.createSearchSourceBuilder(ElasticsearchUtils
                .builderSumBuilder("adsItemId","viewCount"));

        elasticsearchUtils.aggregationSearch(builder,"ads_service-2020.07.03")
                .sumByGroup("adsItemId","sum_viewCount");


    }


}
