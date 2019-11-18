/**
 * FileName: QualityProjectImpl
 * author:   Melone
 * Date:     2019/11/14 16:59
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.jiaoke.quality.bean.QualityProjectItem;
import com.jiaoke.quality.dao.QualityProjectDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/11/14 16:59
 * @Description:
 */
@Service
public class QualityProjectImpl implements QualityProjectInf {

    @Resource
    private QualityProjectDao qualityProjectDao;
    @Override
    public int addProjectItem(QualityProjectItem fromData) {
        int res = qualityProjectDao.insertProjectItem(fromData);
        return res;
    }

    @Override
    public List<QualityProjectItem> getUserProjectList() {
        List<QualityProjectItem> list = qualityProjectDao.selectUserProjectList();
        return list;
    }

    @Override
    public QualityProjectItem getUserProjectById(String id) {
        QualityProjectItem list = qualityProjectDao.selectUserProjectById(id);
        return list;
    }

    @Override
    public int delectUserProject(String idStr) {
        int res  = qualityProjectDao.delectUserProject(idStr);
        return res;
    }

    @Override
    public int delectUserProjectByIdArray(String[] idArr) {
        int res  = qualityProjectDao.delectUserProjectByIdArray(idArr);
        return res;
    }

    @Override
    public int editProjectItem(QualityProjectItem fromData) {
        int res  = qualityProjectDao.updateProjectItem(fromData);
        return res;
    }
}
