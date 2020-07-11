package com.deepblueai.ads.common.utils;

import java.util.Random;
import java.util.UUID;

public class RandomUtils {

  public static String getUuid16() {

    //8-4-4-4-12
    String uuid = UUID.randomUUID().toString();

    StringBuffer sb = new StringBuffer(uuid.substring(0, 8));
    sb.append(uuid.substring(9, 13));
    sb.append(uuid.substring(14, 18));
    return sb.toString();
  }

  private static String SEPARATOR_OF_MAC = ":";

  public static String getRandomMac17() {
    Random random = new Random();
    String[] mac = {
        String.format("%02x", random.nextInt(0xff)),
        String.format("%02x", random.nextInt(0xff)),
        String.format("%02x", random.nextInt(0xff)),
        String.format("%02x", random.nextInt(0xff)),
        String.format("%02x", random.nextInt(0xff)),
        String.format("%02x", random.nextInt(0xff))
    };
    return String.join(SEPARATOR_OF_MAC, mac);
  }

  public static void main(String[] args) {

    System.out.println(getRandomMac17());
  }

}
