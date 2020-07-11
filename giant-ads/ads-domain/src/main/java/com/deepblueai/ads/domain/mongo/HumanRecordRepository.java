/*
package com.deepblueai.ads.domain.mongo;

import com.deepblueai.ads.common.utils.TimeUtils;
import com.deepblueai.ads.domain.mongo.model.HumanRecord;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Component;

@Component
public class HumanRecordRepository {

  private static final String HUMAN_RECORD_NAME = "zz_human_record";
  private static final String DASH = "_";

  @Resource(name = "humanMongoTemplate")
  private MongoTemplate humanMangoTemplate;

  public void insert(List<HumanRecord> humanRecords,String timeDivision) {

    String collectionName = HUMAN_RECORD_NAME + DASH + timeDivision;

    humanMangoTemplate.insert(humanRecords, collectionName);

  }

  public Long getHumanRecordCount(String deviceCode, Long beginTime, Long endTime) {

    Date beginDate = new Date(beginTime);
    String timeDivision = TimeUtils.getTimeN8(beginDate);

    String collectionName = HUMAN_RECORD_NAME + DASH + timeDivision;

    Criteria criteria = Criteria.where("deviceCode").is(deviceCode)
        .and("beginTime").lt(endTime)
        .and("endTime").gt(beginTime);

    Query query = new Query();
    query.addCriteria(criteria);

    List<HumanRecord> humanRecordList = humanMangoTemplate
        .find(query, HumanRecord.class, collectionName);

    if (humanRecordList == null) {
      return 0L;
    }

    int size = humanRecordList.size();
    return Long.valueOf(size);

  }

  public List<HumanRecord> getHumanRecord(String deviceCode, Long deadLine) {

    Date beginDate = new Date(deadLine);
    String timeDivision = TimeUtils.getTimeN8(beginDate);
    String collectionName = HUMAN_RECORD_NAME + DASH + timeDivision;

    Criteria criteria = Criteria.where("deviceCode").is(deviceCode).and("beginTime").gt(deadLine);

    Query query = new Query();
    query.addCriteria(criteria);

    List<HumanRecord> humanRecordList = humanMangoTemplate
        .find(query, HumanRecord.class, collectionName);

    return humanRecordList;
  }
}
*/
