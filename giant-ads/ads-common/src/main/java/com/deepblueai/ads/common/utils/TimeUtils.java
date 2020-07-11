package com.deepblueai.ads.common.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class TimeUtils {

  private static final SimpleDateFormat timeN8 = new SimpleDateFormat("yyyyMMdd");

  private static final SimpleDateFormat timeN10 = new SimpleDateFormat("yyyyMMddHH");

  private static final SimpleDateFormat timeN4 = new SimpleDateFormat("yyyy.MM.dd");

  private static final SimpleDateFormat timeN14 = new SimpleDateFormat("yyyyMMddHHmmss");

  private static final SimpleDateFormat timeN18 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

  public static String getTimeN8(Date date) {

    return timeN8.format(date);
  }

  public static String getTimeN10(Date date) {

    return timeN10.format(date);
  }

  public static String getTimeN14(Date date) {

    return timeN14.format(date);
  }

  public static Date getTimeFromN14(String time) throws ParseException {

    return timeN14.parse(time);
  }

  public static String getTimeN18(Date date) {

    return timeN18.format(date);
  }
  public static Date getTimeFromN8(String time) throws ParseException {

    return timeN8.parse(time);
  }

  public static String getTimeN4(Date date){
    return timeN4.format(date);
  }

 public static Date getZeroTime(){
   Calendar calendar = Calendar.getInstance();
   calendar.setTime(new Date());
   calendar.set(Calendar.HOUR_OF_DAY,0);
   calendar.set(Calendar.MINUTE,0);
   calendar.set(Calendar.SECOND,0);
   return calendar.getTime();
 }
  public static void main(String[] args) {

    Date date = new Date();

    System.out.println(getTimeN14(date));
  }


}
