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
import com.jiaoke.quality.bean.QualityRatioTemplate;

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

    /**
     *  插入配比模板对象
     * @param qualityRatioTemplate
     * @return
     */
    boolean insetRatioTemplate(QualityRatioTemplate qualityRatioTemplate);

    /**
     * 根据id传入待删除的配比模板id
     * @param idStr
     * @return
     */
    String delectRation(String idStr);

    /**
     * 根据传入ID查询模板对象
     * @param idStr
     * @return
     */
    String selectRationById(String idStr);
    /**
     *
     * 功能描述: <br>
     *  <插入新的配比>
     * @param
     * @return
     * @auther Melone
     * @date 2019/5/28 11:26
     */
    String insetGrading(String jsonData, String crew1Id, String crew2Id,String gradingName,String upUser,String gradingRemaker);

    /**
     *
     * 功能描述: <br>
     *  <更新配比>
     * @param
     * @return
     * @auther Melone
     * @date 2019/5/28 11:26
     */
    Boolean EditRationById(QualityRatioTemplate qualityRatioTemplate);

    /**
     *
     * 功能描述: <br>
     *  <查询所有非本年历史模板>
     * @param
     * @return
     * @auther Melone
     * @date 2020/3/19 22:53
     */
    String getOldRation();

    /**
     *
     * 功能描述: <br>
     *  <查询历史级配>
     * @param
     * @return
     * @auther Melone
     * @date 2020/3/25 15:30
     */
    String getOldGrading();
}
