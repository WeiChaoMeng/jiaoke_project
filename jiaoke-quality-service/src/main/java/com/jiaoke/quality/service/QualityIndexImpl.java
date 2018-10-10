/**
 * FileName: QualityIndexImpl
 * author:   Melone
 * Date:     2018/10/9 17:52
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.jiaoke.quality.dao.QualityIndexDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2018/10/9 17:52
 * @Description:
 */
@Service
public class QualityIndexImpl implements QualityIndexInf {

    @Autowired
    QualityIndexDao qualityIndexDao;

    public Map<String, String> getLastWeekCrewData() {
        return null;
    }
}
