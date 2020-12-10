package com.jiaoke.common.bean;

import com.google.gson.Gson;

import java.util.ArrayList;
import java.util.List;

public class LayUIPage<T> {

    private int code;
    private String msg;
    private int count;
    private List<T> data;

    public LayUIPage(int code, String msg, int count, List<T> data) {
        this.code = code;
        this.msg = msg;
        this.count = count;
        this.data = data;
    }

    public String toJson() {
        Gson gson = new Gson();
        String json = gson.toJson(this);
        return json;
    }

}

