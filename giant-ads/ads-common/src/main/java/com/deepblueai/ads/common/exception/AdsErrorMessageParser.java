package com.deepblueai.ads.common.exception;

import java.io.InputStream;
import java.util.Properties;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class AdsErrorMessageParser implements InitializingBean {

  private Properties errorProperties;

  @Override
  public void afterPropertiesSet() throws Exception {
    errorProperties = new Properties();
    try {
      InputStream in = AdsErrorMessageParser.class.getClassLoader()
          .getResourceAsStream("error-message.properties");
      errorProperties.load(in);
    } catch (Exception e) {
      log.error("ERROR! LOAD error-message.properties ERROR!", e);
      // 如果没有error-message.properties文件，则不允许项目启动。
      throw e;
    }
  }

  // 根据key读取value
  public String readValue(String key) {
//    try {
    String value = errorProperties.getProperty(key);
    if (value == null) {
      value = AdsErrorCodes.ERROR_MESSAGE_UNKNOWN;
    }
    return value;
//    } catch (Exception e) {
//      log.error("ERROR! error-code[" + key + "] get error-message ERROR!", e);
//    }
  }


}
