package com.deepblueai.ads.common.exception;

import lombok.Data;

@Data
public class AdsException extends RuntimeException {

  private String errorCode;
  private Object[] params;

  public AdsException(String errorCode, Object... params) {
    super(errorCode);
    this.errorCode = errorCode;
    this.params = params;
  }

//  public AdsException(String errorCode, Throwable e, Object... params) {
//    super(errorCode, e);
//    this.errorCode = errorCode;
//    this.params = params;
//  }

  public AdsException(String errorCode) {
    super(errorCode);
    this.errorCode = errorCode;
  }

  public AdsException(Throwable e, String errorCode) {
    super(e);
    this.errorCode = errorCode;
  }

  public AdsException(Throwable e, String errorCode, Object... params) {
    super(e);
    this.errorCode = errorCode;
    this.params = params;
  }

}
