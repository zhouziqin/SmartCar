package com.deepblueai.ads.pos.support;

import lombok.Getter;

/**
 * 业务类型
 */
@Getter
public enum  EventTypeEnum {
    STARTUP_SUCCESSFUL("STARTUP_SUCCESSFUL", "初始化,获取广告列表"),
    HEARTBEAT("HEARTBEAT", "心跳"),
    AD_PLAY_PLAN_UPDATE("AD_PLAY_PLAN_UPDATE","处理全量更新的⼴告列表"),
    PLAYER_CONTROL_VOLUME("PLAYER_CONTROL_VOLUME","⾳量控制信息");
    private String code;
    private String message;
    EventTypeEnum(String code, String message) {
        this.code = code;
        this.message = message;
    }
}
