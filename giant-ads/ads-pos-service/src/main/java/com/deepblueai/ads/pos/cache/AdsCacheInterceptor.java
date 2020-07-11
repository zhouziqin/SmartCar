package com.deepblueai.ads.pos.cache;

import com.deepblueai.ads.common.annotation.AdsCacheAble;
import com.deepblueai.ads.common.annotation.AdsCacheEvict;
import com.deepblueai.ads.common.annotation.AdsCacheKey;
import com.deepblueai.ads.common.exception.AdsErrorCodes;
import com.deepblueai.ads.common.exception.AdsException;

import java.lang.annotation.Annotation;
import java.lang.reflect.Method;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class AdsCacheInterceptor {

    private Logger logger = LoggerFactory.getLogger(AdsCacheInterceptor.class);

    @Autowired
    private AdsCacheClient adsCacheClient;

    @Pointcut("execution(public * com.deepblueai.ads..*.*(..))"
            + "&& @annotation(com.deepblueai.ads.common.annotation.AdsCacheAble)")
    private void cacheAble() {
    }

    @Around("cacheAble() ")
    public Object aroundCacheAble(ProceedingJoinPoint pjp) throws Throwable {

        return processCacheAble(pjp);

    }

    private static final int CACHE_ABLE_INIT = 0;
    private static final int CACHE_ABLE_GET_CACHE = 1;
    private static final int CACHE_ABLE_KEY_NULL = 2;
    private static final int CACHE_ABLE_PROCESS_START = 3;
    private static final int CACHE_ABLE_PROCESS_END = 4;

    private static final String NULL = "NULL";

    private Object processCacheAble(ProceedingJoinPoint pjp) throws Throwable {

        Object[] args = pjp.getArgs();
        Object object = null;

        String methodName = pjp.getSignature().getName();
        Method objMethod = getObjMethod(pjp, methodName);

        AdsCacheAble cacheAble = objMethod.getAnnotation(AdsCacheAble.class);

        // 获得注解上所有的属性。
        String cacheName = cacheAble.name();
        boolean cacheIsExpire = cacheAble.isExpire();
        int cacheExpireTime = cacheAble.expireSeconds();
        boolean inMemory = cacheAble.inMemory();
        boolean cacheNull = cacheAble.isCacheNull();

        int cacheState = CACHE_ABLE_INIT;

        try {
            // 从缓存中拿对象
//			Class<?> returnType = objMethod.getReturnType();
            // 可能缓存中没有,所以要调用proceed方法,并扔到缓存中
            Object cacheKey = getAdsCacheKey(args, objMethod);

//      boolean isString = cacheKey instanceof String;

            if (NULL.equals(cacheKey) || cacheKey == null) {

                cacheState = CACHE_ABLE_KEY_NULL;
                // key为空，则不走缓存。
                object = pjp.proceed(args);// 执行该方法

            } else {

                cacheState = CACHE_ABLE_GET_CACHE;

                Object getCacheObject = adsCacheClient
                        .getCacheObject(cacheName, cacheKey.toString(), objMethod, inMemory);

                if (NULL.equals(getCacheObject)) {

                    object = null;

                } else if (getCacheObject == null) {

                    Object pucCacheObject = null;

                    //缓存中无对象，则执行方法，并放到缓存中。
                    cacheState = CACHE_ABLE_PROCESS_START;
                    object = pjp.proceed(args);

                    if (object == null) {
                        if (cacheNull) {
                            pucCacheObject = NULL;
                            adsCacheClient
                                    .putCacheObject(cacheName, cacheKey.toString(), pucCacheObject, cacheIsExpire,
                                            cacheExpireTime
                                            , inMemory);
                        } else {
                            //do nothing
                        }

                    } else {
                        pucCacheObject = object;
                        adsCacheClient
                                .putCacheObject(cacheName, cacheKey.toString(), pucCacheObject, cacheIsExpire,
                                        cacheExpireTime
                                        , inMemory);
                    }

                    cacheState = CACHE_ABLE_PROCESS_END;
                } else {
                    object = getCacheObject;
                }

            }

        } catch (Exception e) {

            switch (cacheState) {

                case CACHE_ABLE_INIT:
                    object = pjp.proceed(args);// 执行该方法
                    break;

                case CACHE_ABLE_KEY_NULL:
                    throw e;

                case CACHE_ABLE_GET_CACHE:
                    // 缓存出现异常
                    logger.error("execute repositoryGetCacheAble methodName:" + methodName + " Error!", e);
                    // 异常出现，一般出现在缓存拿对象的时候
                    adsCacheClient.setInited(false);
                    object = pjp.proceed(args);// 执行该方法
                    break;
                case CACHE_ABLE_PROCESS_START:
                    throw e;

                case CACHE_ABLE_PROCESS_END:
                    // 缓存出现异常
                    logger.error("execute repositoryGetCacheAble methodName:" + methodName + " Error!", e);
                    // 异常出现，一般出现在缓存拿对象的时候
                    adsCacheClient.setInited(false);
                    break;
                default:
                    throw new AdsException(AdsErrorCodes.CACHE_ABLE_ERROR,
                            "cacheAble error:" + e.getMessage());
            }

        }
        return object;
    }

    ////

    @Pointcut("execution(public * com.deepblueai.ads..*.*(..))"
            + "&& @annotation(com.deepblueai.ads.common.annotation.AdsCacheEvict)")
    private void cacheEvict() {
    }

    @Around("cacheEvict() ")
    public Object aroundCacheEvict(ProceedingJoinPoint pjp) throws Throwable {
        return processCacheEvict(pjp);
    }

    private static final int CACHE_EVICT_INIT = 0;
    // private static final int CACHE_EVICT_GET_CACHE = 1;
    // private static final int CACHE_EVICT_KEY_NULL = 2;
    private static final int CACHE_EVICT_PROCESS_START = 3;
    // private static final int CACHE_EVICT_PROCESS_END = 4;

    private Object processCacheEvict(ProceedingJoinPoint pjp) throws Throwable {

        Object[] args = pjp.getArgs();
        Object object = null;
        String methodName = pjp.getSignature().getName();

        object = pjp.proceed(args);// 执行该方法

        if (!adsCacheClient.isInited()) {
            return object;
        }

        int cacheState = CACHE_EVICT_INIT;
        try {
            Class<?> classTarget = pjp.getTarget().getClass();
            Class<?>[] par = ((MethodSignature) pjp.getSignature()).getParameterTypes();
            Method objMethod = classTarget.getMethod(methodName, par);

            // 获得方法上的注解，得到cache-name
            AdsCacheEvict cacheEvict = objMethod.getAnnotation(AdsCacheEvict.class);
            String cacheName = cacheEvict.name();
            // boolean cacheIsExpire = cacheAble.isExpire();
            // int cacheExpireTime = cacheAble.expireTime();
            boolean inMemory = cacheEvict.inMemory();

            Object cacheKey = getAdsCacheKey(args, objMethod);
            if (cacheKey == null || KEY_NULL.equals(cacheKey)) {

            } else {
                cacheState = CACHE_EVICT_PROCESS_START;
                adsCacheClient.removeCacheObject(cacheName, cacheKey.toString(), inMemory);
            }

        } catch (Exception e) {
            switch (cacheState) {

                case CACHE_EVICT_INIT:
                    break;

                case CACHE_EVICT_PROCESS_START:
                    // 缓存出现异常
                    logger.error("execute repositoryGetCacheEvict methodName:" + methodName + " Error!", e);
                    // 异常出现，一般出现在缓存拿对象的时候
                    adsCacheClient.setInited(false);

                default:
                    throw new AdsException(AdsErrorCodes.CACHE_EVICT_ERROR,
                            "cacheEvict error:" + e.getMessage());
            }
        }

        return object;

    }

    /////

    private Method getObjMethod(ProceedingJoinPoint pjp, String methodName)
            throws NoSuchMethodException, SecurityException {

        Class<?> classTarget = pjp.getTarget().getClass();
        Class<?>[] par = ((MethodSignature) pjp.getSignature()).getParameterTypes();
        Method objMethod = classTarget.getMethod(methodName, par);

        return objMethod;
    }

    private static final String KEY_NULL = "NULL";

    // 返回定义在参数上的cache-key参数。
    private Object getAdsCacheKey(Object[] args, Method objMethod) {
        Annotation[][] annotationArrays = objMethod.getParameterAnnotations();
        if (annotationArrays == null || annotationArrays.length == 0) {
            return KEY_NULL;
        }
        int index = 0;
        for (Annotation[] annotationArray : annotationArrays) {
            if (annotationArray == null || annotationArray.length == 0) {
                index++;
                continue;
            }
            for (Annotation annotation : annotationArray) {
                if (annotation == null) {
                    continue;
                }

                if (AdsCacheKey.class.equals(annotation.annotationType())) {
                    if (index < args.length) {
                        Object key = args[index];

                        return key;
                    } else {
                        return KEY_NULL;
                    }
                }
            }
        }
        return KEY_NULL;
    }

}
