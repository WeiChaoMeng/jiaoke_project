/**
 * FileName: QualityProjectItem
 * author:   Melone
 * Date:     2019/11/14 16:24
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
 * @create: 2019/11/14 16:24
 * @Description:
 */
@Data
public class QualityProjectItem {
    private int id;
    private int clientNum;
    private String projectName;
    private String clientName;
    private String update;
    private String upUser;
    private String remaker;
}
