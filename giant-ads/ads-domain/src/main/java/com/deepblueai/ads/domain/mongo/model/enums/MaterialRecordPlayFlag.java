package com.deepblueai.ads.domain.mongo.model.enums;


import com.deepblueai.ads.common.enums.EnumItf;

public enum MaterialRecordPlayFlag implements EnumItf {

  INIT("0", "初始化"),//0:入库，初始化
  COUNTERED("1", "统计完成")//1：播放次数统计完成。
  ;

  private String code;
  private String name;

  private MaterialRecordPlayFlag(String code, String name) {
    this.code = code;
    this.name = name;
  }

  @Override
  public String getCode() {
    return code;
  }

  @Override
  public String getName() {
    return name;
  }
}
