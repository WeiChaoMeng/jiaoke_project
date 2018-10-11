/**
 * FileName: QualityMatchingInf
 * Author:   Melone
 * Date:     2018/10/11 12:28
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.jiaoke.common.bean.PageBean;
import com.jiaoke.quality.bean.QualityRatioModel;

import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *  配比模板页面方法
 * @author: Melone
 * @create: 2018/10/11 12:28
 * @Description:
 */
public interface QualityMatchingInf {

    /**
     * 分页查询配比模板基本信息
     * @return
     */
    PageBean<QualityRatioModel> selectMatchingMoudelByLimte(int currentPageNum,String url);

    /**
     * 返回所有添加剂类型
     * @return
     */
    List<Map<String, String>> selectAdditiveTypeList();

    /**
     * 返回所有再生料的类型
     * @return
     */
    List<Map<String, String>> selectRegenerateTypeList();
}
