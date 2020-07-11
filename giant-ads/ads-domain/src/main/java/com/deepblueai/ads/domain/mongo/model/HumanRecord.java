/*
package com.deepblueai.ads.domain.mongo.model;

import java.util.Date;
import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

@Data
@Document
public class HumanRecord {

  @Id
  private String id;

  //时间戳yyyyMMdd
  private String timeDivision;

  //广告系统中车辆ID
  @Indexed
  private Long carId;

  //广告系统中车辆对应设备编号
  @Indexed
  private String deviceCode;

  //left1/right2/middle1
  private String cameraId;

  //工控机MAC，computerId
  @Indexed
  private String algMac;

  //#oss url
  private String imageUrl;

  // GUID
  private String personId;

  //female/male,
  private String gender;


  private Integer age;

  //smile/neutral,
  private String emotion;

  //yes/no,
  private String smoke;

  // #attention timestamp
  @Indexed
  private Long beginTime;

  //#attention timestamp
  private Long endTime;

  // 位置json字符串{x: 123, y: 122, width: 555, height: 666 }
  private String position;

  //创建时间
  private Date createTime;


//  @Indexed
//  private String deviceCode;
//
//  //时间戳yyyyMMdd
//  private String timeDivision;
//
//  //商户ID
//  private Long customerId;
//
//  //广告素材ID
//  private Long materialId;
//
//  //广告播放开始时间
//  private Long beginTime;
//
//  //广告播放结束时间
//  private Long endTime;
//
//  //播放统计标识0:入库，1,：播放次数统计完成
//  private String playFlag;
//
//  //观看统计标识：0未统计，1：观看次数统计完成
//  private String watchFlag;
//
//  //创建时间
//  private Date createTime;

}
*/
