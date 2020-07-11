/**
 * dangbao.common - HttpClientProxy 创建时间 ： 2016年2月16日
 */
package com.deepblueai.ads.common.annotation.http;

import com.deepblueai.ads.common.utils.AdsStringUtils;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.security.KeyManagementException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.net.ssl.SSLContext;

import org.apache.http.HttpEntity;
import org.apache.http.HttpException;
import org.apache.http.HttpResponse;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.config.Registry;
import org.apache.http.config.RegistryBuilder;
import org.apache.http.conn.socket.ConnectionSocketFactory;
import org.apache.http.conn.socket.PlainConnectionSocketFactory;
import org.apache.http.conn.ssl.NoopHostnameVerifier;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.entity.InputStreamEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.ssl.SSLContexts;
import org.apache.http.ssl.TrustStrategy;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class HttpClientProxy {

  private Logger logger = LoggerFactory.getLogger(HttpClientProxy.class);

  private CloseableHttpClient httpClient;

  private Charset defaultCharset;

  public static HttpClientProxy create(HttpClientConfig config) throws Exception {
    return new HttpClientProxy(config);
  }

  private HttpClientProxy(HttpClientConfig config) throws Exception {
    httpClient = generatorHttpClient(config);
    defaultCharset = Charset.forName("UTF-8");
  }

  /**
   * 关闭Http连接
   */
  public void close() throws IOException {
    if (httpClient != null) {
      httpClient.close();
    }
  }

  private CloseableHttpClient generatorHttpClient(HttpClientConfig config)
      throws KeyManagementException, KeyStoreException, NoSuchAlgorithmException {

    logger.info("init httpClientProxy, config:" + config);

    RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(config.getMaxSocketTime())
        .setConnectTimeout(config.getMaxConnectTime())
        .setConnectionRequestTimeout(config.getMaxRequestConnectTime()).build();
    ConnectionSocketFactory sslSocketFactory = new SSLConnectionSocketFactory(generatorSSLContext(),
        NoopHostnameVerifier.INSTANCE);
    Registry<ConnectionSocketFactory> registry = RegistryBuilder.<ConnectionSocketFactory>create()
        .register("http", PlainConnectionSocketFactory.getSocketFactory())
        .register("https", sslSocketFactory)
        .build();
    PoolingHttpClientConnectionManager connManager = new PoolingHttpClientConnectionManager(
        registry);
    connManager.setDefaultMaxPerRoute(config.getMaxConnPerRoute());
    connManager.setMaxTotal(config.getMaxConn());

    return HttpClients.custom().setDefaultRequestConfig(requestConfig)
        .setConnectionManager(connManager).build();
  }

  private SSLContext generatorSSLContext()
      throws KeyStoreException, KeyManagementException, NoSuchAlgorithmException {
    KeyStore trustStore = KeyStore.getInstance(KeyStore.getDefaultType());

    TrustStrategy anyTrustStrategy = new TrustStrategy() {
      public boolean isTrusted(X509Certificate[] x509Certificates, String s)
          throws CertificateException {
        return true;
      }
    };
    return SSLContexts.custom().loadTrustMaterial(trustStore, anyTrustStrategy).build();
  }

  /**
   * POST提交,有header，返回HttpResponse
   */
  public HttpResponse doPostWithHeader(String url, Map<String, String> paramsMap,
      Map<String, String> headerMap,
      Charset charset) throws IOException, HttpException {

    StringBuffer log = new StringBuffer("Invoke HTTP POST, ");
    log.append("url : ").append(url).append(" headerMap : ").append(headerMap).append(",paramsMap")
        .append(paramsMap);
    logger.info(log.toString());

    if (AdsStringUtils.isBlank(url)) {
      throw new NullPointerException("URL is NULL!");
    }

    HttpPost post = createPostRequest(url, paramsMap, headerMap, charset);
    return doPost(post);
  }

  public HttpResponse doPostWithHeader(String url, String strBody, Map<String, String> headerMap,
      Charset charset)
      throws HttpException, IOException {
    StringBuffer log = new StringBuffer("Invoke HTTP POST, ");
    log.append("url : ").append(url).append(" headerMap : ").append(headerMap).append(",strBody")
        .append(strBody);
    logger.info(log.toString());

    if (AdsStringUtils.isBlank(url)) {
      throw new NullPointerException("URL is NULL!");
    }

    HttpPost post = createPostRequest(url, strBody, headerMap, charset);
    return doPost(post);
  }

  private HttpResponse doPost(HttpPost post) throws HttpException, IOException {
    StringBuffer log = new StringBuffer("Invoke HTTP POST, RESPONSE, ");

    try {
      HttpResponse response = httpClient.execute(post);
      if (response.getStatusLine().getStatusCode() == 200) {

        log.append(response.getEntity().toString());
        logger.info(log.toString());

        return response;
      }

      log.append("Status ").append(response.getStatusLine().getStatusCode()).append(", NOT 200!");
      logger.error(log.toString());

      post.abort();
      throw new HttpException(
          "HTTP RESPONSE STATUS CODE:" + response.getStatusLine().getStatusCode());
    } catch (IOException ioe) {

      log.append("GET EXCEPTION. message:").append(ioe.getMessage());
      logger.error(log.toString());

      post.abort();
      throw ioe;
    }
  }

  /**
   * POST提交,无header，返回HttpResponse
   */
  public String doPostWithHeaderStr(String url, Map<String, String> paramsMap,
      Map<String, String> headerMap,
      Charset charset) throws IOException, HttpException {
    HttpResponse response = doPostWithHeader(url, paramsMap, headerMap, charset);
    return EntityUtils.toString(response.getEntity(), charset == null ? defaultCharset : charset);
  }

  /**
   * POST提交,无header，返回HttpResponse
   */
  public String doPostWithHeaderStr(String url, String strBody, Map<String, String> headerMap,
      Charset charset)
      throws IOException, HttpException {
    HttpResponse response = doPostWithHeader(url, strBody, headerMap, charset);
    return EntityUtils.toString(response.getEntity(), charset == null ? defaultCharset : charset);
  }

  /**
   * POST提交,无header，返回HttpResponse
   */
  public HttpResponse doPost(String url, Map<String, String> paramsMap, Charset charset)
      throws IOException, HttpException {
    return doPostWithHeader(url, paramsMap, null, charset);
  }

  public HttpResponse doPost(String url, String strBody, Charset charset)
      throws IOException, HttpException {
    return doPostWithHeader(url, strBody, null, charset);
  }

  /**
   * POST提交，无header，返回String
   */
  public String doPostStr(String url, Map<String, String> paramsMap, Charset charset)
      throws IOException, HttpException {
    HttpResponse response = doPost(url, paramsMap, charset);
    return EntityUtils.toString(response.getEntity(), charset == null ? defaultCharset : charset);
  }

  public String doPostStr(String url, String strBody, Charset charset)
      throws IOException, HttpException {
    HttpResponse response = doPost(url, strBody, charset);
    return EntityUtils.toString(response.getEntity(), charset == null ? defaultCharset : charset);
  }

  private HttpPost createPostRequest(String url, Map<String, String> paramsMap,
      Map<String, String> headerMap,
      Charset charset) {
    HttpPost post = new HttpPost(url);
    if (paramsMap != null) {
      List<BasicNameValuePair> nameValuePairs = new ArrayList<BasicNameValuePair>();
      for (String paramName : paramsMap.keySet()) {
        String paramValue = (String) paramsMap.get(paramName);
        nameValuePairs.add(new BasicNameValuePair(paramName, paramValue));
      }

      HttpEntity entity = new UrlEncodedFormEntity(nameValuePairs,
          charset == null ? Charset.forName("UTF-8") : charset);
      post.setEntity(entity);
    }

    if (headerMap != null) {
      Iterator<Entry<String, String>> its = headerMap.entrySet().iterator();
      while (its.hasNext()) {
        Entry<String, String> entry = its.next();
        post.setHeader(entry.getKey().toString(), headerMap.get(entry.getKey()).toString());
      }
    }

    return post;
  }

  private HttpPost createPostRequest(String url, String strBody, Map<String, String> headerMap,
      Charset charset)
      throws UnsupportedEncodingException {
    HttpPost post = new HttpPost(url);
    if (strBody != null) {

      InputStream input = new ByteArrayInputStream(strBody.getBytes("UTF-8"));
      HttpEntity entity = new InputStreamEntity(input);
      post.setEntity(entity);

    }

    if (headerMap != null) {
      Iterator<Entry<String, String>> its = headerMap.entrySet().iterator();
      while (its.hasNext()) {
        Entry<String, String> entry = its.next();
        post.setHeader(entry.getKey().toString(), headerMap.get(entry.getKey()).toString());
      }
    }

    return post;

  }

  ///////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////

  /**
   * GET提交,有header，返回HttpResponse
   */
  public HttpResponse doGet(String url, Map<String, String> headerMap, Charset charset)
      throws IOException, HttpException {

    StringBuffer log = new StringBuffer("Invoke HTTP GET, ");
    log.append("url : ").append(url).append("  headerMap : ").append(headerMap);
    logger.info(log.toString());

    if (AdsStringUtils.isBlank(url)) {
      throw new NullPointerException("URL is NULL!");
    }
    HttpGet get = createGetRequest(url, headerMap, charset);

    log = new StringBuffer("Invoke HTTP GET, RESPONSE, ");
    try {
      HttpResponse response = httpClient.execute(get);
      if (response.getStatusLine().getStatusCode() == 200) {

        log.append(response.getEntity().toString());
        logger.info(log.toString());

        return response;
      }

      log.append("Status ").append(response.getStatusLine().getStatusCode()).append(", NOT 200!");
      logger.error(log.toString());

      get.abort();
      throw new HttpException(
          "HTTP RESPONSE STATUS CODE:" + response.getStatusLine().getStatusCode());
    } catch (IOException ioe) {

      log.append("GET EXCEPTION. message:").append(ioe.getMessage());
      logger.error(log.toString());

      get.abort();
      throw ioe;
    }
  }

  /**
   * GET提交,无header，返回HttpResponse
   */
  public String doGetStr(String url, Map<String, String> headerMap, Charset charset)
      throws IOException, HttpException {
    HttpResponse response = doGet(url, headerMap, charset);
    return EntityUtils.toString(response.getEntity(), charset == null ? defaultCharset : charset);
  }

  private HttpGet createGetRequest(String url, Map<String, String> headerMap, Charset charset) {
    HttpGet get = new HttpGet(url);

    if (headerMap != null) {
      Iterator<Entry<String, String>> its = headerMap.entrySet().iterator();
      while (its.hasNext()) {
        Entry<String, String> entry = its.next();
        get.setHeader(entry.getKey().toString(), headerMap.get(entry.getKey()).toString());
      }
    }

    return get;
  }

  public static void main(String[] args) throws Exception {
    HttpClientConfig config = new HttpClientConfig();
    HttpClientProxy proxy = new HttpClientProxy(config);

    HttpResponse response = proxy.doGet("https://www.baidu.com", null, null);

    System.out.println(response);

  }
}
