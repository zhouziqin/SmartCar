package com.deepblueai.ads.common.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface AdsCacheEvict {

  /**
   * 缓存的名字
   */
  String name();

  /**
   * 是否缓存在内存
   */
  boolean inMemory() default true;

}
