/*
package com.deepblueai.ads.domain.mongo;

import com.deepblueai.ads.common.utils.TimeUtils;
import com.deepblueai.ads.domain.mongo.model.MaterialRecord;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Component;

@Component
public class MaterialRecordRepository {

  private static final String MATERIAL_RECORD_NAME = "z_ads_material_record";
  private static final String DASH = "_";


  private static final String FIELD_DEVICE_CODE = "deviceCode";
  private static final String FIELD_PLAY_FLAG = "playFlag";
  private static final String FIELD_WATCH_FLAG = "watchFlag";


  @Resource(name = "materialMongoTemplate")
  private MongoTemplate materialMangoTemplate;

  public void insert(MaterialRecord materialRecord) {

    String collectionName = MATERIAL_RECORD_NAME + DASH + materialRecord.getTimeDivision();

//    // 防止MQTT发送重复消息
//    Criteria criteria = new Criteria();
//    criteria.where("deviceCode").is(materialRecord.getDeviceCode())
//        .and("materialId").is(materialRecord.getMaterialId())
//        .and("beginTime").is(materialRecord.getBeginTime())
//        .and("endTime").is(materialRecord.getEndTime());
//
//    Query query = new Query(criteria);
//
//    MaterialRecord record = materialMangoTemplate
//        .findOne(query, MaterialRecord.class, collectionName);
//    if (record == null) {
//      materialMangoTemplate.insert(materialRecord, collectionName);
//    }

    materialMangoTemplate.insert(materialRecord, collectionName);
  }


  public List<MaterialRecord> getMaterialRecord(String deviceCode, String playFlag) {

    List<MaterialRecord> result = new ArrayList<>();
    Date now = new Date();

    String timeN8 = TimeUtils.getTimeN8(now);
    String collectionName = MATERIAL_RECORD_NAME + DASH + timeN8;

    Query query = new Query(
        Criteria.where(FIELD_DEVICE_CODE).is(deviceCode).and(FIELD_PLAY_FLAG).is(playFlag));

    List<MaterialRecord> records = materialMangoTemplate
        .find(query, MaterialRecord.class, collectionName);

    result.addAll(records);

    handleYesterdayRecord(now, result, deviceCode, playFlag);

    return result;
  }

  private void handleYesterdayRecord(Date now, List<MaterialRecord> result, String deviceCode,
      String playFlag) {

    Calendar calendar = Calendar.getInstance();
    calendar.setTime(now);

    int hour = calendar.get(Calendar.HOUR);
    if (hour != 0) {
      return;
    }

    int minute = calendar.get(Calendar.MINUTE);
    if (minute > 10) {
      return;
    }

    String yesterdayTimeN8 = TimeUtils.getTimeN8(now);
    String yesterdayCollectionName = MATERIAL_RECORD_NAME + DASH + yesterdayTimeN8;

    Query query = new Query(
        Criteria.where(FIELD_DEVICE_CODE).is(deviceCode).and(FIELD_PLAY_FLAG).is(playFlag));

    List<MaterialRecord> yesterdayRecords = materialMangoTemplate
        .find(query, MaterialRecord.class, yesterdayCollectionName);

    result.addAll(yesterdayRecords);

  }

  public void updateMaterialRecordFlag(MaterialRecord materialRecord, String playFlag,
      String watchFlag) {

    String timeDivision = materialRecord.getTimeDivision();
    String collectionName = MATERIAL_RECORD_NAME + DASH + timeDivision;

    Query query = new Query();
    query.addCriteria(Criteria.where("_id").is(materialRecord.getId()));
//    Update update = Update.update(FIELD_PLAY_FLAG, playFlag);
    Update update = new Update();
    update.set(FIELD_PLAY_FLAG, playFlag);
    update.set(FIELD_WATCH_FLAG, watchFlag);

    materialMangoTemplate.updateFirst(query, update, MaterialRecord.class, collectionName);
  }


}
*/
