package com.jchenry.myblog.dto;

import java.util.HashMap;
import java.util.Map;

/**
 * Msg
 *
 * @Description TODO
 * @Author jc-henry
 * @Date 2019/08/22 1:14
 * @Version 1.0
 **/
public class Msg {

    private Integer code;

    private String message;

    private Map<String, Object> extend = new HashMap<>();

    public static final int SUCCESS_CODE = 200;

    public static final int ERROR_CODE = 500;

    public Msg() {
    }

    public Msg(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

    public static Msg success() {
        Msg msg = new Msg();
        msg.setStatus(SUCCESS_CODE, "success");
        return msg;
    }

    public static Msg error() {
        Msg msg = new Msg();
        msg.setStatus(ERROR_CODE, "error");
        return msg;
    }

    public static Msg error(String message){
        Msg msg = new Msg();
        msg.setStatus(ERROR_CODE,message);
        return msg;
    }

    public Msg add(String key, Object value) {
        if (key != null) {
            extend.put(key, value);
        } else {
            throw new IllegalArgumentException("key cannot be null");
        }
        return this;
    }

    public Msg setStatus(Integer code, String message) {
        this.code = code;
        this.message = message;
        return this;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    @Override
    public String toString() {
        return "Msg{" +
                "code=" + code +
                ", message='" + message + '\'' +
                ", extend=" + extend +
                '}';
    }
}
