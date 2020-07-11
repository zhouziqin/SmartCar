package com.deepblueai.ads.domain.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "base_config")
public class BaseConfig {
  /**
   * id
   */
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  /**
   * 客户id
   */
  @Column(name = "customer_id")
  private Long customerId;

  /**
   * 预留字段1
   */
  @Column(name = "config_group")
  private String configGroup;

  /**
   * 预留字段1
   */
  @Column(name = "config_key")
  private String configKey;

  /**
   * 预留字段1
   */
  @Column(name = "config_value")
  private String configValue;

  /**
   * 预留字段1
   */
  @Column(name = "reserve_1")
  private String reserve1;

  /**
   * 预留字段2
   */
  @Column(name = "reserve_2")
  private String reserve2;

  /**
   * 创建人userId，对应此表的id字段，非ssoId
   */
  @Column(name = "create_id")
  private Long createId;

  /**
   * 创建人
   */
  @Column(name = "create_name")
  private String createName;

  /**
   * 创建时间
   */
  @Column(name = "create_time")
  private Date createTime;

  /**
   * 获取id
   *
   * @return id - id
   */
  public Long getId() {
    return id;
  }

  /**
   * 设置id
   *
   * @param id id
   */
  public void setId(Long id) {
    this.id = id;
  }

  /**
   * 获取客户id
   *
   * @return customer_id - 客户id
   */
  public Long getCustomerId() {
    return customerId;
  }

  /**
   * 设置客户id
   *
   * @param customerId 客户id
   */
  public void setCustomerId(Long customerId) {
    this.customerId = customerId;
  }

  /**
   * 获取预留字段1
   *
   * @return config_group - 预留字段1
   */
  public String getConfigGroup() {
    return configGroup;
  }

  /**
   * 设置预留字段1
   *
   * @param configGroup 预留字段1
   */
  public void setConfigGroup(String configGroup) {
    this.configGroup = configGroup;
  }

  /**
   * 获取预留字段1
   *
   * @return config_key - 预留字段1
   */
  public String getConfigKey() {
    return configKey;
  }

  /**
   * 设置预留字段1
   *
   * @param configKey 预留字段1
   */
  public void setConfigKey(String configKey) {
    this.configKey = configKey;
  }

  /**
   * 获取预留字段1
   *
   * @return config_value - 预留字段1
   */
  public String getConfigValue() {
    return configValue;
  }

  /**
   * 设置预留字段1
   *
   * @param configValue 预留字段1
   */
  public void setConfigValue(String configValue) {
    this.configValue = configValue;
  }

  /**
   * 获取预留字段1
   *
   * @return reserve_1 - 预留字段1
   */
  public String getReserve1() {
    return reserve1;
  }

  /**
   * 设置预留字段1
   *
   * @param reserve1 预留字段1
   */
  public void setReserve1(String reserve1) {
    this.reserve1 = reserve1;
  }

  /**
   * 获取预留字段2
   *
   * @return reserve_2 - 预留字段2
   */
  public String getReserve2() {
    return reserve2;
  }

  /**
   * 设置预留字段2
   *
   * @param reserve2 预留字段2
   */
  public void setReserve2(String reserve2) {
    this.reserve2 = reserve2;
  }

  /**
   * 获取创建人userId，对应此表的id字段，非ssoId
   *
   * @return create_id - 创建人userId，对应此表的id字段，非ssoId
   */
  public Long getCreateId() {
    return createId;
  }

  /**
   * 设置创建人userId，对应此表的id字段，非ssoId
   *
   * @param createId 创建人userId，对应此表的id字段，非ssoId
   */
  public void setCreateId(Long createId) {
    this.createId = createId;
  }

  /**
   * 获取创建人
   *
   * @return create_name - 创建人
   */
  public String getCreateName() {
    return createName;
  }

  /**
   * 设置创建人
   *
   * @param createName 创建人
   */
  public void setCreateName(String createName) {
    this.createName = createName;
  }

  /**
   * 获取创建时间
   *
   * @return create_time - 创建时间
   */
  public Date getCreateTime() {
    return createTime;
  }

  /**
   * 设置创建时间
   *
   * @param createTime 创建时间
   */
  public void setCreateTime(Date createTime) {
    this.createTime = createTime;
  }
}