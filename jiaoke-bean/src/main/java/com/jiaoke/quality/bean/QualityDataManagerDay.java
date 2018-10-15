/**
 * FileName: QualityDataManagerDay
 * author:   Melone
 * Date:     2018/10/15 11:41
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
 * @create: 2018/10/15 11:41
 * @Description:
 */
@Data
public class QualityDataManagerDay {

    private String produceDate;
    private String materialTotal;
    private String startTime;
    private String endTime;
    private String crewNum;
}
