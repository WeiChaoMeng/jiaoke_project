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
    private float repertorySeven;
    private float repertoryEight;
    private float repertoryNine;
    private float repertoryTen;
    //矿粉1
    private float breeze;
    //矿粉2
    private float breezeTwo;
    //矿粉3
    private float breezeThree;
    //矿粉4
    private float breezeFour;
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
    //添加剂比2
    private float ratioAdditiveTwo;
    //添加剂比3
    private float ratioAdditiveThree;
    //添加剂比4
    private float ratioAdditiveFour;
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
}
