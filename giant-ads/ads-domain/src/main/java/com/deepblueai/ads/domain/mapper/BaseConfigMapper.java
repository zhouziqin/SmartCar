package com.deepblueai.ads.domain.mapper;

import com.deepblueai.ads.domain.model.BaseConfig;
import com.quixmart.common.mapper.CommonMapper;
import org.apache.ibatis.annotations.Param;


public interface BaseConfigMapper extends CommonMapper<BaseConfig> {



  BaseConfig getConfigByGroupAndKey(
      @Param("configGroup") String configGroup,
      @Param("configKey") String configKey);
}
