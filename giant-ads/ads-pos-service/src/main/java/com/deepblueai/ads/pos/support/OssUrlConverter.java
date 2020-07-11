/*
package com.deepblueai.ads.pos.support;

import com.aliyun.oss.OSSClient;
import com.deepblueai.ads.pos.config.OSSClientConfig;
import java.net.URL;
import java.util.Date;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class OssUrlConverter {

  @Autowired
  private OSSClient ossClient;

  @Autowired
  private OSSClientConfig ossClientConfig;

  public String convertToAbsoluteUrl(String relativeUrl) {

    String absoluteUrl = null;

    try {

      String bucketName = ossClientConfig.getBucketName();

      // 设置URL过期时间为1小时。
      Date expiration = new Date(new Date().getTime() + 3600 * 1000);

      URL url = ossClient.generatePresignedUrl(bucketName, relativeUrl, expiration);
      absoluteUrl = url.toString();

    } catch (Exception ex) {
      log.error("OssUrlConverter.convertToAbsoluteUrl() getError ex:" + ex.getMessage(), ex);
    }

    return absoluteUrl;
  }


}
*/
