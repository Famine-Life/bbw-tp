package com.wsk.response;

import com.fasterxml.jackson.databind.ser.Serializers;
import com.wsk.handle.GlobalExceptionHandler;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.HashMap;
import java.util.Map;

/**
 * 封装好的返回类，通常配合@ResponseBody注解返回json数据
 */
@Data
public class BaseResponse {
    private int result;

    private String msg;

    private Map<String,Object> extend = new HashMap<>();

    public BaseResponse add(String key, Object value){
        this.getExtend().put(key, value);
        return this;
    }


    public static BaseResponse fail() {
        BaseResponse baseResponse = new BaseResponse();
        baseResponse.setResult(0);
        baseResponse.setMsg(GlobalExceptionHandler.DEFAULT_ERROR_MESSAGE);
        return baseResponse;
    }

    public static BaseResponse fail(String msg) {
        BaseResponse baseResponse = new BaseResponse();
        baseResponse.setMsg(msg);
        return baseResponse;
    }

    public static BaseResponse fail(int result) {
        BaseResponse baseResponse = new BaseResponse();
        baseResponse.setResult(result);
        return baseResponse;
    }

    public static BaseResponse success() {
        BaseResponse baseResponse = new BaseResponse();
        baseResponse.setResult(1);
        return baseResponse;
    }

    public static BaseResponse success(String msg) {
        BaseResponse baseResponse = new BaseResponse();
        baseResponse.setResult(1);
        baseResponse.setMsg(msg);
        return baseResponse;
    }

    public static BaseResponse list(Map<String,Object> extend){
        BaseResponse baseResponse = new BaseResponse();
        baseResponse.setExtend(extend);
        return baseResponse;
    }

    public int getResult() {
        return result;
    }

    public void setResult(int result) {
        this.result = result;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
