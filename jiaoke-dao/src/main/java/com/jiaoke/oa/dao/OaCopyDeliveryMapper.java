package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaCopyDelivery;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 参数管理-发送公文-抄送
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaCopyDeliveryMapper extends Mapper<OaCopyDelivery> {

    /**
     * 根据名字搜索
     *
     * @param name name
     * @return list
     */
    List<OaCopyDelivery> copyDeliveryFilter(String name);

    /**
     * 加载已绑定用户
     *
     * @param id id
     * @return list
     */
    List<String> selectBoundUser(String id);

    /**
     * 删除关联表（main_user）
     *
     * @param mainId mainId
     * @return int
     */
    int deleteByCopyId(String mainId);

    /**
     * 添加
     *
     * @param copyId copyId
     * @param array  array
     * @return 影响函数
     */
    int insertData(@Param("copyId") String copyId, @Param("array") String[] array);

    /**
     * 批量删除数据
     *
     * @param ids ids
     * @return int
     */
    int batchDeleteCopy(String[] ids);

    /**
     * 批量删除关联表数据
     *
     * @param ids ids
     * @return int
     */
    int batchDeleteRelation(String[] ids);
}
