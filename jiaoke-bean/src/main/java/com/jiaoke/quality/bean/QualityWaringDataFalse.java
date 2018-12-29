/**
 * FileName: QualityWaringDataFalse
 * author:   Melone
 * Date:     2018/12/28 13:44
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.bean;

import lombok.Data;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2018/12/28 13:44
 * @Description:
 */
@Data
public class QualityWaringDataFalse {

    private int id;
    private int realtimeDataShamId;
    private String materialName;
    private double actualRatio;
    private double moudleRatio;
    private double deviationRatio;
    private int warningLevel;

}
