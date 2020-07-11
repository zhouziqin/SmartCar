/*
package com.deepblueai.ads.pos.config;

import com.aliyun.oss.OSSClient;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class OSSClientConfig {

    @Value("${cdn.ali.endpoint}")
    private String endpoint;

    @Value("${cdn.ali.accessKeyId}")
    private String accessKeyId;

    @Value("${cdn.ali.accessKeySecret}")
    private String accessKeySecret;

    @Value("${cdn.ali.bucketName}")
    private String bucketName;

    public String getBucketName() {
        return bucketName;
    }

    @Bean(name = "ossClient", destroyMethod = "shutdown")
    public OSSClient createOSSClient() {

        return new OSSClient(endpoint, accessKeyId, accessKeySecret);
    }
}
*/
