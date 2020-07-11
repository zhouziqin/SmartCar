package com.deepblueai.ads.common.exception;

public interface AdsErrorCodes {

  String ERROR_MESSAGE_UNKNOWN = "系统错误";

  String SUCCESS = "0";

  String PARA_IS_NULL = "1001";//1个参数
  String PARA_ERROR = "1002";//2个参数
  String PARA_TOO_SHORT = "1003";//2个参数
  String PARA_TOO_LONG = "1004";//2个参数
  String PAGE_SIZE_ERROR = "1005";//2个参数
  String PAGE_NUM_ERROR = "1006";//2个参数
  String PAGE_NOT_MATCH = "1007";//1个参数
  String TIME_RANGE_ERROR = "1008";//0个参数

  String ERROR_CODE_UNKNOWN = "1999";

  String ADD_ERROR = "2001";//2个参数
  String UPDATE_ERROR = "2002";//2个参数
  String DELETE_ERROR = "2003";//2个参数
  String QUERY_ERROR = "2004";//2个参数

  String IOT_ADD_ERROR = "3001";
  String IOT_UPDATE_ERROR = "3002";
  String IOT_DELETE_ERROR = "3003";

  String RECORD_NOT_EXIST = "4001";//记录不存在

  String CACHE_ABLE_ERROR = "7001";
  String CACHE_EVICT_ERROR = "7002";

  //鉴权失败异常
  String INVALID_ACCESS_TOKEN = "9001";
  String INVALID_ROLE_ERROR = "9002";
  String LOGIN_IN_ERROR = "9003";

}
