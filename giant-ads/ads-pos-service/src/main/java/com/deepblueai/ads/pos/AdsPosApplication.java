package com.deepblueai.ads.pos;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.data.mongo.MongoDataAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.mongo.MongoAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

@tk.mybatis.spring.annotation.MapperScan(basePackages = "com.deepblueai.ads.domain.mapper")
@SpringBootApplication(scanBasePackages = {"com.deepblueai"})
@EnableDiscoveryClient
@EnableFeignClients
public class AdsPosApplication {

    public static void main(String[] args) {
        SpringApplication.run(AdsPosApplication.class, args);


    }

}
