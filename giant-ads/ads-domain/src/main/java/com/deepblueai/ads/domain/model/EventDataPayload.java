package com.deepblueai.ads.domain.model;

 import lombok.Data;

/**
 * 事件消息
 */
@Data
public class EventDataPayload {
    /**
     * 业务类型
     *     ("INIT", "初始化信息"),
     *     ("HEARTBEAT", "心跳"),
     *     ("EVENT","拍摄事件"),
     */
     String eventType;
    /**
     * 设备id
     */
    String id;
    /**
     * json
     {"pic":"图片地址",
     "video":"视频地址",
     "plateNo":"车牌号",
     "happendTime":"发生时间"
     }
     */
    String eventInfo;
    //扩展信息
    String extendInfo;

    /**
     * 时间yyyy-MM-dd HH:mm:ss
     */
    String createTime;


}
