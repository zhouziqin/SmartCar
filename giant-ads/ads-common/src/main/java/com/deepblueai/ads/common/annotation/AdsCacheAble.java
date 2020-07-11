package com.deepblueai.ads.common.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface AdsCacheAble {

  /**
   * 缓存的名字
   */
  String name();

  /**
   * 是否缓存在内存
   */
  boolean inMemory() default true;

  /**
   * 是否设置超时
   */
  boolean isExpire() default true;

  /**
   * 超时时间，60秒
   */
  int expireSeconds() default 60;

  /**
   * 缓存null
   */
  boolean isCacheNull() default false;

}
