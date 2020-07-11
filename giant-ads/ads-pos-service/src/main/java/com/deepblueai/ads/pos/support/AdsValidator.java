package com.deepblueai.ads.pos.support;

import com.deepblueai.ads.common.enums.EnumHelper;
import com.deepblueai.ads.common.enums.EnumItf;
import com.deepblueai.ads.common.exception.AdsErrorCodes;
import com.deepblueai.ads.common.exception.AdsException;
import org.springframework.stereotype.Component;

@Component
public class AdsValidator {

  public void validatorString(String paraValue, String paraName, int minLength, int maxLength) {

    // 参数不为空
    if (paraValue == null || paraValue.length() == 0) {
      if (minLength > 0) {
        throw new AdsException(AdsErrorCodes.PARA_IS_NULL, paraName);
      }
    } else {
      int length = paraValue.getBytes().length;
      if (length < minLength) {
        throw new AdsException(AdsErrorCodes.PARA_TOO_SHORT,
            paraName, minLength);
      }
      if (length > maxLength) {
        throw new AdsException(AdsErrorCodes.PARA_TOO_LONG,
            paraName, maxLength);
      }
    }
  }

  public void validatorNotNull(Object paraValue, String paraName) {

    // 参数不为空
    if (paraValue == null) {
      throw new AdsException(AdsErrorCodes.PARA_IS_NULL, paraName);
    }
  }

  public void validatePageParam(String pageSize, String pageNum) {
    try {
      Integer pageSizeInt = Integer.parseInt(pageSize);
      if (pageSizeInt <= 0) {
        throw new AdsException(AdsErrorCodes.PAGE_SIZE_ERROR,
            "pageSize", "小于0");
      }
    } catch (NumberFormatException ex) {
      throw new AdsException(AdsErrorCodes.PAGE_SIZE_ERROR,
          "pageSize", "非数字");
    }

    try {
      Integer pageNumInt = Integer.parseInt(pageNum);
      if (pageNumInt <= 0) {
        throw new AdsException(AdsErrorCodes.PAGE_NUM_ERROR,
            "pageNum:", "小于0");
      }
    } catch (NumberFormatException ex) {
      throw new AdsException(AdsErrorCodes.PAGE_NUM_ERROR,
          "pageNum:", "非数字");
    }

  }

  public void validatorEnum(String paraValue, String paraName, Class clazz) {
    EnumItf paramEnum = EnumHelper.getEnumByCode(paraValue, clazz);
    if (paramEnum == null) {
      throw new AdsException(AdsErrorCodes.PARA_ERROR,
          paraName, "不匹配" + clazz.getName());
    }
  }

}