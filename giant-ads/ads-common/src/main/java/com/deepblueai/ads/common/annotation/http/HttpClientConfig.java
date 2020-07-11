package com.deepblueai.ads.common.annotation.http;

/**
 * HttpClient配置类
 */
public class HttpClientConfig {

  private int maxConn = 100;// 最大连接数
  private int maxConnPerRoute = 20;// 每个目标地址最大连接数，需要小于最大连接数
  private int maxSocketTime = 35000;// 收包最大超时时间
  private int maxConnectTime = 10000;// 最大连接超时时间
  private int maxRequestConnectTime = 20000;// 最大请求连接超时时间

  public int getMaxConn() {
    return maxConn;
  }

  public void setMaxConn(int maxConn) {
    this.maxConn = maxConn;
  }

  public int getMaxConnPerRoute() {
    return maxConnPerRoute;
  }

  public void setMaxConnPerRoute(int maxConnPerRoute) {
    this.maxConnPerRoute = maxConnPerRoute;
  }

  public int getMaxSocketTime() {
    return maxSocketTime;
  }

  public void setMaxSocketTime(int maxSocketTime) {
    this.maxSocketTime = maxSocketTime;
  }

  public int getMaxConnectTime() {
    return maxConnectTime;
  }

  public void setMaxConnectTime(int maxConnectTime) {
    this.maxConnectTime = maxConnectTime;
  }

  public int getMaxRequestConnectTime() {
    return maxRequestConnectTime;
  }

  public void setMaxRequestConnectTime(int maxRequestConnectTime) {
    this.maxRequestConnectTime = maxRequestConnectTime;
  }

  @Override
  public String toString() {
    StringBuilder builder = new StringBuilder();
    builder.append("HttpClientConfig [maxConn=");
    builder.append(maxConn);
    builder.append(", maxConnPerRoute=");
    builder.append(maxConnPerRoute);
    builder.append(", maxSocketTime=");
    builder.append(maxSocketTime);
    builder.append(", maxConnectTime=");
    builder.append(maxConnectTime);
    builder.append(", maxRequestConnectTime=");
    builder.append(maxRequestConnectTime);
    builder.append("]");
    return builder.toString();
  }

}
