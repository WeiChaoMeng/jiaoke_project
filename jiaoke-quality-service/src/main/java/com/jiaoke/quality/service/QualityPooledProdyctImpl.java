/**
 * FileName: QualityPooledProdyctImpl
 * author:   Melone
 * Date:     2020/10/23 10:15
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.jiaoke.quality.dao.QualityPooledProdyctDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2020/10/23 10:15
 * @Description:
 */
@Service
public class QualityPooledProdyctImpl implements QualityPooledProdyctInf {

    @Resource
    private QualityPooledProdyctDao qualityPooledProdyctDao;

    @Override
    public List<Map<String,String>> getProdycyTotalByDate(String startDate, String lastDate) {
        List<Map<String,String>> res = qualityPooledProdyctDao.selectProdycyTotalByDate(startDate,lastDate);
        return res;
    }

    @Override
    public List<Map<String, String>> getEverDayProdacuByDate(String startDate, String lastDate) {
        List<Map<String,String>> res = qualityPooledProdyctDao.selectEverDayProdacuByDate(startDate,lastDate);
        return res;
    }

    @Override
    public List<Map<String, String>> getAllProductTypeTotal(String startDate, String lastDate) {
        List<Map<String,String>> res = qualityPooledProdyctDao.getAllProductTypeTotal(startDate,lastDate);
        return res;
    }

    @Override
    public List<Map<String, String>> getTwoCrewProduct(String startDate, String lastDate) {
        List<Map<String,String>> res = qualityPooledProdyctDao.getTwoCrewProduct(startDate,lastDate);
        return res;
    }
}
