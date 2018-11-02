/**
 * FileName: QualityStatementImpl
 * author:   Melone
 * Date:     2018/11/2 10:59
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.jiaoke.quality.dao.QualityStatementDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2018/11/2 10:59
 * @Description:
 */
@Service
public class QualityStatementImpl implements  QualityStatementInf {

    @Resource
    private  QualityStatementDao qualityStatementDao;


    @Override
    public String selectLastMonthStatementToEchars() {

        List<Map<String,Object>> list =  qualityStatementDao.selectLastMonthStatementToEchars();
        return null;
    }
}
