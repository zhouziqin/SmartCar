package com.deepblueai.ads.common.utils;

import org.springframework.util.Assert;

import java.util.Calendar;
import java.util.Date;

/**
 * @author:huangxg
 * @date: 2019-09-15:01
 * @desc:
 */
public class DateUtil {

    public static String getWeekOfDate(Date dt) {
        String[] weekDays = {"SUNDAY", "MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY"};
        Calendar cal = Calendar.getInstance();
        cal.setTime(dt);

        int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
        if (w < 0)
            w = 0;

        return weekDays[w];
    }

    /**
     * 功能描述：返回小时
     *
     * @param date
     *            日期
     * @return 返回小时
     */
    public static int getHour(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        return calendar.get(Calendar.HOUR_OF_DAY);
    }

    /**
     * 功能描述：返回分
     *
     * @param date
     *            日期
     * @return 返回分钟
     */
    public static int getMinute(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        return calendar.get(Calendar.MINUTE);
    }

    /**
     * 将{@code PlanWeekdays}中halfHourIndex转换为一个日期时间中
     * 的开始时间。
     *
     * @return  如：index=4 date=2019-11-21，返回2019-11-21 02:00:00
     */
    public static Date transferHalfHourIndexIntoStartTime(Date date, int halfHourIndex) {
        Assert.notNull(date, "date must not be null");
        Assert.state(halfHourIndex >= 0 && halfHourIndex <= 48, "halfHourIndex is incorrect");
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        //小时
        calendar.set(Calendar.HOUR_OF_DAY, halfHourIndex / 2);
        //分钟
        calendar.set(Calendar.MINUTE, halfHourIndex % 2 * 30);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        return calendar.getTime();
    }

    /**
     * 将{@code PlanWeekdays}中halfHourIndex转换为一个日期时间中
     * 的结束时间。
     *
     * @return  如：index=4 date=2019-11-21，返回2019-11-21 02:30:00
     */
    public static Date transferHalfHourIndexIntoEndTime(Date date, int halfHourIndex) {
        return transferHalfHourIndexIntoStartTime(date, halfHourIndex + 1);
    }

    public static Date getEndOfDay(Date end) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(end);
        calendar.set(Calendar.HOUR,23);
        calendar.set(Calendar.MINUTE,59);
        calendar.set(Calendar.MILLISECOND, 59 );
        return calendar.getTime();
    }
}
