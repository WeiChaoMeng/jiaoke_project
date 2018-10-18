package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaContractArchives;
import com.jiaoke.oa.dao.OaContractArchivesMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * oa-档案-合同档案
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/18 13:30
 */
@Service
public class OaContractArchivesServiceImpl implements OaContractArchivesService {

    @Resource
    private OaContractArchivesMapper oaContractArchivesMapper;

    /**
     * 添加
     *
     * @param oaContractArchives oaContractArchives
     * @return NumberOfAffectedRows
     */
    public int add(OaContractArchives oaContractArchives) {
        oaContractArchives.setId(random());
        oaContractArchives.setCreatedDate(new Date());
        return oaContractArchivesMapper.insertSelective(oaContractArchives);
    }

    /**
     * 获取所有
     *
     * @return oaContractArchivesList
     */
    public List<OaContractArchives> getAll() {
        List<OaContractArchives> contractArchivesList = oaContractArchivesMapper.getAll();
        for (OaContractArchives oaContractArchives : contractArchivesList) {
            oaContractArchives.setCreatedDateStr(getStringDate(oaContractArchives.getCreatedDate()));
        }
        return contractArchivesList;
    }

    /**
     * 根据id获取详情
     *
     * @param id id
     * @return oaContractArchives
     */
    public OaContractArchives getDetailsById(Integer id) {
        OaContractArchives oaContractArchives = oaContractArchivesMapper.selectByPrimaryKey(id);
        oaContractArchives.setCreatedDateStr(getStringDate(oaContractArchives.getCreatedDate()));
        return oaContractArchives;
    }

    /**
     * 随机数
     *
     * @return 10位纯数字
     */
    private static Integer random() {
        int end = 3;
        SimpleDateFormat sdf = new SimpleDateFormat("HHmmss");
        String newDate = sdf.format(new Date());
        String result = "";
        Random random = new Random();
        for (int i = 0; i < end; i++) {
            result += random.nextInt(10);
        }
        return Integer.valueOf(newDate + result);
    }

    /**
     * 时间转换 date > string
     *
     * @param date date
     * @return string
     */
    private static String getStringDate(Date date) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return formatter.format(date);
    }
}
