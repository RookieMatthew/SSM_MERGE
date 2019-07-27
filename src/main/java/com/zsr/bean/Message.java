package com.zsr.bean;

import java.util.HashMap;
import java.util.Map;

public class Message {
    //状态码
    private Integer code;

    //提示信息
    private String message;

    //传输的信息
    private Map<String,Object> info = new HashMap<>();

    public static Message success(){
        Message result = new Message();
        result.setCode(100);
        result.setMessage("成功");
        return result;
    }

    public static Message fail(){
        Message result = new Message();
        result.setCode(200);
        result.setMessage("失败！");
        return result;
    }

    public Message addInfo(String key,Object value){
        this.getInfo().put(key,value);
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

    public Map<String, Object> getInfo() {
        return info;
    }

    public void setInfo(Map<String, Object> info) {
        this.info = info;
    }
}
