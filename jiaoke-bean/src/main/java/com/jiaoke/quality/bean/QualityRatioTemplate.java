/**
 * FileName: Quality_RatioTemplate
 * author:   Melone
 * Date:     2018/10/8 12:59
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.bean;

import lombok.Data;

/**
 *  <一句话功能描述>
 *  质量监控 配比模板实体类
 * @author: Melone
 * @create: 2018/10/8 12:59
 * @Description:
 */
@Data
public class QualityRatioTemplate {

    private int id;
    private String proName;
    private float repertoryOne;
    private float repertoryTwo;
    private float repertoryThree;
    private float repertoryFour;
    private float repertoryFive;
    private float repertorySix;
    //矿粉
    private float breeze;
    //油石比
    private float ratioStone;
    //再生料比粗
    private float ratioRegenerate1;
    //再生料比细
    private float ratioRegenerate2;
    //再生料比中
    private float ratioRegenerate3;
    //添加剂比
    private float ratioAdditive;
    //再生料编号
    private int regenerate;
    //添加剂编号
    private int additive;
    //沥青温度下限
    private int temperatureAsphalt;
    //沥青温度上限
    private int temperatureAsphaltUp;
    //骨料温度下限
    private int temperatureAggregate;
    //骨料温度上限
    private int temperatureAggregateUp;
    //混合料温度
    private int temperatureMixture;
    //混合料温度上限
    private int temperatureMixtureUp;
    //一仓温度
    private int temperatureMilling;
    //再生料温度上限
    private int temperatureMillingUp;
    //机组一对应的模板ID
    private int crew1ModeleId;
    //机组二对应的模板ID
    private int crew2ModeleId;
    //上传人
    private String upUser;
    //备注
    private String remark;
    //创建时间
    private String creatTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    public float getRepertoryOne() {
        return repertoryOne;
    }

    public void setRepertoryOne(float repertoryOne) {
        this.repertoryOne = repertoryOne;
    }

    public float getRepertoryTwo() {
        return repertoryTwo;
    }

    public void setRepertoryTwo(float repertoryTwo) {
        this.repertoryTwo = repertoryTwo;
    }

    public float getRepertoryThree() {
        return repertoryThree;
    }

    public void setRepertoryThree(float repertoryThree) {
        this.repertoryThree = repertoryThree;
    }

    public float getRepertoryFour() {
        return repertoryFour;
    }

    public void setRepertoryFour(float repertoryFour) {
        this.repertoryFour = repertoryFour;
    }

    public float getRepertoryFive() {
        return repertoryFive;
    }

    public void setRepertoryFive(float repertoryFive) {
        this.repertoryFive = repertoryFive;
    }

    public float getRepertorySix() {
        return repertorySix;
    }

    public void setRepertorySix(float repertorySix) {
        this.repertorySix = repertorySix;
    }

    public float getBreeze() {
        return breeze;
    }

    public void setBreeze(float breeze) {
        this.breeze = breeze;
    }

    public float getRatioStone() {
        return ratioStone;
    }

    public void setRatioStone(float ratioStone) {
        this.ratioStone = ratioStone;
    }

    public float getRatioRegenerate1() {
        return ratioRegenerate1;
    }

    public void setRatioRegenerate1(float ratioRegenerate1) {
        this.ratioRegenerate1 = ratioRegenerate1;
    }

    public float getRatioRegenerate2() {
        return ratioRegenerate2;
    }

    public void setRatioRegenerate2(float ratioRegenerate2) {
        this.ratioRegenerate2 = ratioRegenerate2;
    }

    public float getRatioAdditive() {
        return ratioAdditive;
    }

    public void setRatioAdditive(float ratioAdditive) {
        this.ratioAdditive = ratioAdditive;
    }

    public int getRegenerate() {
        return regenerate;
    }

    public void setRegenerate(int regenerate) {
        this.regenerate = regenerate;
    }

    public int getAdditive() {
        return additive;
    }

    public void setAdditive(int additive) {
        this.additive = additive;
    }

    public int getTemperatureAsphalt() {
        return temperatureAsphalt;
    }

    public void setTemperatureAsphalt(int temperatureAsphalt) {
        this.temperatureAsphalt = temperatureAsphalt;
    }

    public int getTemperatureAsphaltUp() {
        return temperatureAsphaltUp;
    }

    public void setTemperatureAsphaltUp(int temperatureAsphaltUp) {
        this.temperatureAsphaltUp = temperatureAsphaltUp;
    }

    public int getTemperatureAggregate() {
        return temperatureAggregate;
    }

    public void setTemperatureAggregate(int temperatureAggregate) {
        this.temperatureAggregate = temperatureAggregate;
    }

    public int getTemperatureAggregateUp() {
        return temperatureAggregateUp;
    }

    public void setTemperatureAggregateUp(int temperatureAggregateUp) {
        this.temperatureAggregateUp = temperatureAggregateUp;
    }

    public int getTemperatureMixture() {
        return temperatureMixture;
    }

    public void setTemperatureMixture(int temperatureMixture) {
        this.temperatureMixture = temperatureMixture;
    }

    public int getTemperatureMixtureUp() {
        return temperatureMixtureUp;
    }

    public void setTemperatureMixtureUp(int temperatureMixtureUp) {
        this.temperatureMixtureUp = temperatureMixtureUp;
    }

    public int getTemperatureMilling() {
        return temperatureMilling;
    }

    public void setTemperatureMilling(int temperatureMilling) {
        this.temperatureMilling = temperatureMilling;
    }

    public int getTemperatureMillingUp() {
        return temperatureMillingUp;
    }

    public void setTemperatureMillingUp(int temperatureMillingUp) {
        this.temperatureMillingUp = temperatureMillingUp;
    }

    public int getCrew1ModeleId() {
        return crew1ModeleId;
    }

    public void setCrew1ModeleId(int crew1ModeleId) {
        this.crew1ModeleId = crew1ModeleId;
    }

    public int getCrew2ModeleId() {
        return crew2ModeleId;
    }

    public void setCrew2ModeleId(int crew2ModeleId) {
        this.crew2ModeleId = crew2ModeleId;
    }

    public String getUpUser() {
        return upUser;
    }

    public void setUpUser(String upUser) {
        this.upUser = upUser;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
