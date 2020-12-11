package com.jiaoke.common.bean;

import com.alibaba.fastjson.annotation.JSONField;

public class QualityTestPage {



    /***/
    @JSONField(name="page")
    private Integer page;
    /***/
    @JSONField(name="limit")
    private Integer limit;

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }
}
