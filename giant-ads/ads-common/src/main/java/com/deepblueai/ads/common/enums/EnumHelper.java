package com.deepblueai.ads.common.enums;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@SuppressWarnings("Duplicates")
public class EnumHelper {

  private static final Map<String, Map<String, EnumItf>> ENUM_CODE_MAP = new HashMap<String, Map<String, EnumItf>>();
  private static final Map<String, Map<String, EnumItf>> ENUM_NAME_MAP = new HashMap<String, Map<String, EnumItf>>();

  private static final Integer lockObj = new Integer(1);

  @SuppressWarnings("unchecked")
  public static <T extends EnumItf> T getEnumByCode(String code, Class<T> clazz) {
    if (!ENUM_CODE_MAP.containsKey(clazz.getName())) {
      synchronized (lockObj) {
        try {
          if (!ENUM_CODE_MAP.containsKey(clazz.getName())) {
            ENUM_CODE_MAP.put(clazz.getName(), initEnumCodeMap(clazz));
          }
        } catch (Exception e) {
          throw new IllegalArgumentException("No such a enum class:" + clazz, e);
        }
      }
    }
//		if (!ENUM_CODE_MAP.get(clazz.getName()).containsKey(code)) {
//			throw new IllegalArgumentException("No enum constant " + clazz.getName() + "." + code);
//		}
    return (T) ENUM_CODE_MAP.get(clazz.getName()).get(code);
  }

  @SuppressWarnings("unchecked")
  public static <T extends EnumItf> T getEnumByName(String name, Class<T> clazz) {
    if (!ENUM_NAME_MAP.containsKey(clazz.getName())) {
      synchronized (lockObj) {
        try {
          if (!ENUM_NAME_MAP.containsKey(clazz.getName())) {
            ENUM_NAME_MAP.put(clazz.getName(), initEnumNameMap(clazz));
          }
        } catch (Exception e) {
          throw new IllegalArgumentException("No such a enum class:" + clazz, e);
        }
      }
    }
//		if (!ENUM_NAME_MAP.get(clazz.getName()).containsKey(name)) {
//			throw new IllegalArgumentException("No enum constant " + clazz.getName() + "." + name);
//		}
    return (T) ENUM_NAME_MAP.get(clazz.getName()).get(name);
  }

  @SuppressWarnings({"unchecked", "rawtypes"})
  public static <T extends EnumItf> List<T> getEnumList(Class<T> clazz) {
    if (!ENUM_CODE_MAP.containsKey(clazz.getName())) {
      synchronized (lockObj) {
        try {
          if (!ENUM_CODE_MAP.containsKey(clazz.getName())) {
            ENUM_CODE_MAP.put(clazz.getName(), initEnumCodeMap(clazz));
          }
        } catch (Exception e) {
          throw new IllegalArgumentException("No such a enum class:" + clazz, e);
        }
      }
    }
    Map<String, EnumItf> infoMap = ENUM_CODE_MAP.get(clazz.getName());
    return new ArrayList(infoMap.values());
  }

  private static <T> Map<String, EnumItf> initEnumCodeMap(Class<?> cls) throws Exception {
    Method method = cls.getMethod("values");
    EnumItf infos[] = (EnumItf[]) method.invoke(null);
    Map<String, EnumItf> result = new LinkedHashMap<String, EnumItf>();
    for (EnumItf info : infos) {
      result.put(info.getCode(), info);
    }
    return result;
  }

  private static <T> Map<String, EnumItf> initEnumNameMap(Class<?> cls) throws Exception {
    Method method = cls.getMethod("values");
    EnumItf infos[] = (EnumItf[]) method.invoke(null);
    Map<String, EnumItf> result = new LinkedHashMap<String, EnumItf>();
    for (EnumItf info : infos) {
      result.put(info.getName(), info);
    }
    return result;
  }

}
