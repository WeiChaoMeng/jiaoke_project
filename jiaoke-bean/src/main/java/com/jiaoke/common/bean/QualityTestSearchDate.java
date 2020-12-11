package com.jiaoke.common.bean;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.Date;

public class QualityTestSearchDate extends  QualityTestPage {
    /***/
    @JSONField(name="begindate")
    private Date begindate;
    /***/
    @JSONField(name="enddate")
    private Date enddate;

    public Date getBegindate() {
        return begindate;
    }

    public void setBegindate(Date begindate) {
        this.begindate = begindate;
    }

    public Date getEnddate() {
        return enddate;
    }

    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }
}
