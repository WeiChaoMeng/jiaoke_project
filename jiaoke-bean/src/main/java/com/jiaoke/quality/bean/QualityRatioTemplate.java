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
    //再生料比1
    private float ratioRegenerate1;
    //再生料比2
    private float ratioRegenerate2;
    //添加剂比
    private float ratioAdditive;
    //再生料编号
    private int regenerate;
    //添加剂编号
    private int additive;
    //沥青温度
    private int temperatureAsphalt;
    //骨料温度
    private int temperatureAggregate;
    //混合料温度
    private int temperatureMixture;
    //铣刨料温度
    private int temperatureMilling;

}
