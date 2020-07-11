package com.deepblueai.ads.pos.config;

import com.deepblueai.ads.common.exception.AdsException;


import javax.servlet.http.HttpServletRequest;

import com.quixmart.common.vo.JsonResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

@SuppressWarnings("Duplicates")
@ControllerAdvice
public class AdsExceptionHandler {

    Logger logger = LoggerFactory.getLogger(AdsExceptionHandler.class);

    @ExceptionHandler(Throwable.class)
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    public JsonResult handleUnexpectedError(Exception ex, HttpServletRequest request) {
        logger.warn("url: {}, message: {}", request.getRequestURL(), ex.getMessage(), ex);
        return buildResult("RUNTIME_ERROR", ex.getMessage());
    }

    @ExceptionHandler(AdsException.class)
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    public JsonResult handleServiceExceptions(AdsException ex, HttpServletRequest request) {
        logger.debug("from URL:::::::::::::::::::{}", request.getRequestURL());
//    String errorMessage = getMessage(ex.getErrorCode(), ex.getParams(), request);
        String errorMessage = ex.getMessage();
        logger.error(errorMessage, ex);
        return buildResult(ex.getErrorCode(), errorMessage);
    }

    private JsonResult buildResult(String errorCode, String message) {
        JsonResult result = new JsonResult();
        result.setCode(errorCode);
        result.setSuccess(false);
        result.setMessage(message);
        return result;
    }

}
