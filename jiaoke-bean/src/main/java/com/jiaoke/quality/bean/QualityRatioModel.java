/**
 * FileName: QualityRatioModel
 * author:   Melone
 * Date:     2018/10/11 11:43
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.bean;

import lombok.Data;

/**
 *  <一句话功能描述>
 * quality_proportioning_model  配比模板简单信息实体类
 * @author: Melone
 * @create: 2018/10/11 11:43
 * @Description:
 */
@Data
public class QualityRatioModel {

    private int id;
    /**
     * 配比模板详细信息表对应的ID
     */
    private int messageId;
    private String modelName;
    private String createTime;
    private String modifyTime;
    private String createUser;

}
