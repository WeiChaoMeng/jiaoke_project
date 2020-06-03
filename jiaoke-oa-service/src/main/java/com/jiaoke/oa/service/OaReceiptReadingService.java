package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaReceiptReading;

import java.util.List;
import java.util.Map;

/**
 * 参数管理-收文阅办单-部门意见
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/9 9:41
 */
public interface OaReceiptReadingService {

    /**
     * 查询全部数据
     *
     * @return list
     */
    List<OaReceiptReading> selectAllData();

    /**
     * 新增
     *
     * @param name        name
     * @param description description
     * @return int
     */
    int insertSelective(String name, String description);

    /**
     * 根据name查询
     *
     * @param name name
     * @return oaMainDelivery
     */
    OaReceiptReading selectByName(String name);

    /**
     * 根据Id删除
     *
     * @param id id
     * @return int
     */
    int deleteById(Integer id);

    /**
     * 更新数据
     *
     * @param id          id
     * @param description description
     * @return int
     */
    int updateData(Integer id, String description);

    /**
     * 根据名字搜索
     *
     * @param name name
     * @return list
     */
    List<OaReceiptReading> nameFilter(String name);

    /**
     * 绑定用户
     *
     * @param id id
     * @return map
     */
    Map<String, Object> boundInfo(String id);

    /**
     * 更新绑定
     *
     * @param mainId mainId
     * @param array  array
     * @return int
     */
    int updateBinding(String mainId, String[] array);

    /**
     * 加载已绑定用户
     *
     * @param id id
     * @return list
     */
    List<String> selectBoundUser(String id);

    /**
     * 批量删除数据
     *
     * @param ids ids
     * @return int
     */
    int batchDeleteData(String[] ids);
}
