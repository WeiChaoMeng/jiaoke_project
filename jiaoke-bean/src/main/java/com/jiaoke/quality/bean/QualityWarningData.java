/**
 * FileName: QualityWarningData
 * author:   Melone
 * Date:     2018/10/8 20:16
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
 * @create: 2018/10/8 20:16
 * @Description:
 */
@Data
public class QualityWarningData {

    private String crewId;
    private String materialName;
    private String actualRatio;
    private String moudleRatio;
    private String deviationRatio;
    private String warningLevel;
}
