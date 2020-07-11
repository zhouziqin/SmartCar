package com.deepblueai.ads.common.utils;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * created by  zhouzq on 2020/7/7
 * desc
 */
public class ThreadPool {
   public static ExecutorService executorService = new ThreadPoolExecutor(2, 10,
            10, TimeUnit.SECONDS,
            new ArrayBlockingQueue<>(512), // 使用有界队列，避免OOM
            new ThreadPoolExecutor.DiscardPolicy());
}
