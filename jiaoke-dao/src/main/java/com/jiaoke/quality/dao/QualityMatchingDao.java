/**
 * FileName: QualityMatchingDao
 * Author:   Melone
 * Date:     2018/10/11 10:04
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.dao;

import com.jiaoke.quality.bean.QualityRatioModel;
import com.jiaoke.quality.bean.QualityRatioTemplate;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *  配比模板页面数据Dao层
 * @author: Melone
 * @create: 2018/10/11 10:04
 * @Description:
 */
public interface QualityMatchingDao {

    /**
     * 分页查询 配比模板简单信息对象
     * @param startLineNum
     * @param endLineNum
     * @return
     */
    List<QualityRatioModel> selectMatchingMoudelByLimte(@Param("startLineNum") int startLineNum,@Param("endLineNum") int endLineNum);

    /**
     * 分页查询 配比模板简单信息对象个数
     * @return
     */
    int selectMatchingMoudelDataCount();

    /**
     * 返回所有再生料的类型
     * @return
     */
    List<Map<String, String>> selectRegenerateTypeList();

    /**
     * 返回所有添加剂的类型
     * @return
     */
    List<Map<String, String>> selectAdditiveTypeList();

    /**
     * 插入配比模板数据返回主键ID
     * @param qualityRatioTemplate
     * @return
     */
    int insetRatioTemplate(  QualityRatioTemplate qualityRatioTemplate);


    /**
     * 插入配比模板简略数据
     * @param map
     */
    int insertRationCreateMessage(@Param("map")Map<String,String> map);

    /**
     * 根据id传入待删除的配比模板id
     * @param strArray
     * @return
     */
    int delectRation(@Param("idArray") String[] strArray);

    /**
     * 根据传入id查询模板
     * @param idStr
     * @return
     */
    QualityRatioTemplate selectRationById(@Param("idStr") String idStr);

    /**
     * 插入级配
     * @param list
     */
    void insetGrading( @Param("list") List<Map<String, String>> list);
}
