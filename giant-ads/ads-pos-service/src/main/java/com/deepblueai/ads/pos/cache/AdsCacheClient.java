package com.deepblueai.ads.pos.cache;


import com.fasterxml.jackson.databind.ObjectMapper;

import java.lang.reflect.Method;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import lombok.Data;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;

@Data
@Component
public class AdsCacheClient implements InitializingBean, Runnable {

    private static Logger logger = LoggerFactory.getLogger(AdsCacheClient.class);

    private Map<String, Map<String, CacheWrapper>> inMemoryCache = new ConcurrentHashMap<>();

    /**
     * 初始化相关
     */
    private boolean inited = false;

    private ScheduledExecutorService adsCachePool;

    /**
     * jason相关
     */
    private ObjectMapper mapper;

    private static final String DASH = "_";

    @Override
    public void afterPropertiesSet() throws Exception {
        mapper = new ObjectMapper();

        // 5分钟秒执行一次
        adsCachePool = Executors.newSingleThreadScheduledExecutor();
        adsCachePool.scheduleAtFixedRate(this, 1, 5 * 60, TimeUnit.SECONDS);

        init();
    }

    private void init() {
        inited = true;
    }


    @Override
    public void run() {

        if (inMemoryCache.size() > 0) {
            Set<String> keySet = inMemoryCache.keySet();
            for (String key : keySet) {
                Map<String, CacheWrapper> cacheWrapperMap = inMemoryCache.get(key);
                handleExpiredObjects(cacheWrapperMap);
            }
        }
    }

    private void handleExpiredObjects(Map<String, CacheWrapper> cacheWrapperMap) {
        if (cacheWrapperMap.size() > 0) {
            Set<String> wrapperKeySet = cacheWrapperMap.keySet();
            Long current = System.currentTimeMillis();

            for (String wrapperKey : wrapperKeySet) {
                CacheWrapper cacheWrapper = cacheWrapperMap.get(wrapperKey);
                Long expiredTime = cacheWrapper.getExpiredTime();
                if (current < expiredTime) {
                    cacheWrapperMap.remove(wrapperKey);
                }
            }
        }
    }

    // 使用缓存
    @SuppressWarnings("deprecation")
    public Object getCacheObject(String cacheName, String cacheKey, Method objMethod,
                                 boolean inMemory) {

        Object cacheObject = null;

        // 内存中缓存
        if (inMemory) {
            return getCacheObjectInMemory(cacheName, cacheKey);
        }

        return cacheObject;

    }


    private Object getCacheObjectInMemory(String cacheName, Object cacheKey) {
        Object cacheObject = null;
        Map<String, CacheWrapper> memoryCache = inMemoryCache.get(cacheName);
        if (memoryCache != null) {
            CacheWrapper cacheWrapper = memoryCache.get(cacheKey);
            if (cacheWrapper != null) {
                cacheObject = cacheWrapper.getObject();
            }
        }
        return cacheObject;
    }

    public void putCacheObject(String cacheName, String cacheKey, Object object,
                               boolean cacheIsExpire,
                               int cacheExpireTime,
                               boolean inMemory) throws Exception {

        // 内存中缓存
        if (inMemory) {
            putCacheObjectInMemory(cacheName, cacheKey, object, cacheIsExpire, cacheExpireTime);
            return;
        }
    }

    private void putCacheObjectInMemory(String cacheName, String cacheKey, Object object,
                                        boolean cacheIsExpire, int cacheExpireTime) {
        Map<String, CacheWrapper> memoryCache = inMemoryCache.get(cacheName);
        if (memoryCache == null) {
            memoryCache = new ConcurrentHashMap<>();
            inMemoryCache.put(cacheName, memoryCache);
        }
        CacheWrapper cacheWrapper = new CacheWrapper();

        cacheWrapper.setObject(object);
        if (cacheIsExpire) {
            Long current = System.currentTimeMillis();
            cacheWrapper.setExpiredTime(current + cacheExpireTime * 1000);
        }

        memoryCache.put(cacheKey, cacheWrapper);
    }

    public void removeCacheObject(String cacheName, String cacheKey, boolean inMemory) {
        if (inMemory) {
            removeCacheObjectInMemory(cacheName, cacheKey);
            return;
        }
    }

    private void removeCacheObjectInMemory(String cacheName, String cacheKey) {
        Map<String, CacheWrapper> memoryCache = inMemoryCache.get(cacheName);
        if (memoryCache != null) {
            memoryCache.remove(cacheKey);
        }
    }

    @Data
    public static class CacheWrapper {

        private Object object;
        private Long expiredTime;

    }

}
