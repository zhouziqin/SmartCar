package com.deepblueai.ads.domain.repository;

import com.deepblueai.ads.domain.mapper.BaseConfigMapper;
import com.deepblueai.ads.domain.model.BaseConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BaseConfigRepository {

  @Autowired
  private BaseConfigMapper baseConfigMapper;

  public BaseConfig getConfigByGroupAndKey(String configGroup, String configKey) {

    return baseConfigMapper.getConfigByGroupAndKey(configGroup, configKey);
  }
}
