package com.deepblueai.ads.pos.service.impl;

import com.deepblueai.ads.domain.model.BaseConfig;
import com.deepblueai.ads.domain.repository.BaseConfigRepository;
import com.deepblueai.ads.pos.service.BaseConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BaseConfigServiceImpl implements BaseConfigService {

  @Autowired
  private BaseConfigRepository baseConfigRepository;

  @Override
  public String getConfigValue(String configGroup, String configKey) {

    String configValue = null;
    BaseConfig config = baseConfigRepository.getConfigByGroupAndKey(configGroup, configKey);

    if (config != null) {
      configValue = config.getConfigValue();
    }

    return configValue;
  }
}
