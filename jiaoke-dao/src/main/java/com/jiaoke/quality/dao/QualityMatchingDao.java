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
    void insetGrading( @Param("list") List<Map<String, String>> list,@Param("id") String id);

    /**
     *
     * 功能描述: <br>
     *  <修改模板>
     * @param
     * @return
     * @auther Melone
     * @date 2019/5/28 11:49
     */
    int updateRatioById(@Param("ratioTemplate") QualityRatioTemplate qualityRatioTemplate);

    /**
     *
     * 功能描述: <br>
     *  <插入级配上传相关信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/3 12:52
     */
    void insetGradingModel(@Param("map") Map<String,Object> map);

    /**
     *
     * 功能描述: <br>
     *  <查询除去今年，一共有几个年份有模板>
     * @param
     * @return
     * @auther Melone
     * @date 2020/3/19 23:05
     */
    List<Map<String, String>> selectRationYear();

    /**
     *
     * 功能描述: <br>
     *  <查询除本年历史模板>
     * @param
     * @return
     * @auther Melone
     * @date 2020/3/19 23:13
     */
    List<QualityRatioModel> selectAllRation();

        /**
         *
         * 功能描述: <br>
         *  <查询除去今年，一共有几个年份的级配>
         * @param
         * @return
         * @auther Melone
         * @date 2020/3/25 15:43
         */
    List<Map<String, String>> selectGradingYear();

    /**
     *
     * 功能描述: <br>
     *  <查询所有历史级配>
     * @param
     * @return
     * @auther Melone
     * @date 2020/3/25 15:52
     */
    List<QualityRatioModel> selectAllGrading();
}
