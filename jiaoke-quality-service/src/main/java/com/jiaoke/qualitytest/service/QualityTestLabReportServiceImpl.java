package com.jiaoke.qualitytest.service;

import com.alibaba.fastjson.JSONObject;
import com.jiake.utils.DateUtil;
import com.jiake.utils.RandomUtil;
import com.jiaoke.common.bean.Assist;
import com.jiaoke.common.bean.LayUIPage;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.qualitytest.bean.QualityTestExperimental;
import com.jiaoke.qualitytest.bean.QualityTestLabReport;
import com.jiaoke.qualitytest.bean.QualityTestOrderTicket;
import com.jiaoke.qualitytest.dao.QualityTestExperimentalDao;
import com.jiaoke.qualitytest.dao.QualityTestLabReportDao;
import com.jiaoke.qualitytest.dao.QualityTestOrderTicketDao;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * QualityTestLabReport的服务接口的实现类
 *
 * @author
 */
@Service
public class QualityTestLabReportServiceImpl implements QualityTestLabReportService {
    private final Logger LOG = LogManager.getLogger(this.getClass());

    @Autowired
    private QualityTestLabReportDao qualityTestLabReportDao;
    @Autowired
    private QualityTestOrderTicketDao qualityTestOrderTicketDao;
    @Autowired
    private QualityTestExperimentalDao qualityTestExperimentalDao;
    // TODO 当你看到这个方法时你应该创建一个工具类做通用的方法,定义自己的返回格式化
    private static final int C200 = 200;
    private static final int C412 = 412;

    public String resultFormat(int code, Object data) {
        JSONObject result = new JSONObject();
        result.put("code", code);
        if (data != null) {
            result.put("data", data);
        }
        return result.toJSONString();
    }

    public void setSeachFilter(Assist assist, QualityTestLabReport value) {

        if (value == null) {
            assist.andGt("experiment_status", 0);
            return;
        }
        if (value.getOrderTicketNum() != null && !value.getOrderTicketNum().isEmpty()) {
            assist.andLike("order_ticket_num", "%" + value.getNum() + "%");
        }
        if (value.getMaterials() != null && !value.getMaterials().isEmpty()) {
            assist.andEq("materials", value.getMaterials());
        }
        if (value.getSpecification() != null && !value.getSpecification().isEmpty()) {
            assist.andLike("specification", "%" + value.getSpecification() + "%");
        }
        if (value.getManufacturers() != null && !value.getManufacturers().isEmpty()) {
            assist.andLike("manufacturers", "%" + value.getManufacturers() + "%");
        }
        if (value.getExperimentResult() != null) {
            assist.andLike("experiment_result", value.getExperimentResult());
        }
        if (value.getExperimentStatus() != null && value.getExperimentStatus() >= 0) {
            assist.andEq("experiment_status", value.getExperimentStatus());
        } else {
            assist.andGt("experiment_status", 0);
        }
    }

    @Override
    public String find(QualityTestLabReport value) {

        //autoCreateReport();

        //TODO这里可以做通过Assist做添加查询
        Assist assist = new Assist();
        assist.setStartRow((value.getPage() - 1) * value.getLimit());
        assist.setRowSize(value.getLimit());
        setSeachFilter(assist, value);
        assist.setOrder(Assist.order("create_time", false));

        List<QualityTestLabReport> result = qualityTestLabReportDao.selectQualityTestLabReport(assist);
        if (LOG.isDebugEnabled()) {
            LOG.debug("执行获取QualityTestSamplingpage数据集-->结果:", result);
        }
        Assist assistCount = new Assist();
        setSeachFilter(assistCount, value);
        int count = (int) qualityTestLabReportDao.getQualityTestLabReportRowCount(assistCount);
        LayUIPage ResultPage = new LayUIPage<QualityTestLabReport>(0, "OK", count, result);
        return ResultPage.toJson();
    }

    @Override
    public String findOne(String id) {
        if (id == null) {
            if (LOG.isDebugEnabled()) {
                LOG.debug("执行通过QualityTestLabReport的id获得QualityTestLabReport对象-->失败:id不能为空");
            }
            return resultFormat(C412, null);
        }
        QualityTestLabReport result = qualityTestLabReportDao.selectQualityTestLabReportById(id);
        if (LOG.isDebugEnabled()) {
            LOG.debug("执行通过QualityTestLabReport的id获得QualityTestLabReport对象-->结果:", result);
        }
        return resultFormat(C200, result);
    }

    @Override
    public String findbyTicketNum(String order_ticket_num) {
        Assist assist = new Assist();
        assist.andEq("order_ticket_num", order_ticket_num);
        List<QualityTestLabReport> orderCount = qualityTestLabReportDao.selectQualityTestLabReport(assist);
        if (orderCount.size() > 0) {
            return resultFormat(C200, orderCount.get(0).toJson());
        } else {
            return resultFormat(C412, null);
        }
    }

    /**
     * 根据委托单查询返回ID
     *
     * @param order_ticket_num
     * @return
     */
    @Override
    public QualityTestLabReport findOneByOrderTicketNum(String order_ticket_num) {
        Assist assist = new Assist();
        assist.andEq("order_ticket_num", order_ticket_num);
        List<QualityTestLabReport> orderCount = qualityTestLabReportDao.selectQualityTestLabReport(assist);
        if (orderCount.size() > 0) {
            return orderCount.get(0);
        } else {
            return null;
        }
    }

    @Override
    public String saveNotNull(QualityTestLabReport value, boolean updateCheckUser) {
        if (value == null) {
            if (LOG.isDebugEnabled()) {
                LOG.debug("执行将QualityTestLabReport中属性值不为null的数据保存到数据库-->失败:对象不能为空");
            }
            return resultFormat(C412, null);
        }
        if (value.getOrderTicketNum() == null) {
            if (LOG.isDebugEnabled()) {
                LOG.debug("执行将QualityTestLabReport中属性值不为null的数据保存到数据库-->失败:存在不能为空的空值");
            }
            return resultFormat(C412, null);
        }
        String id = String.valueOf(RandomUtil.random());
        value.setId(id);
        updateReportInfo(value, updateCheckUser);

        int result = qualityTestLabReportDao.insertNotNullQualityTestLabReport(value);
        if (LOG.isDebugEnabled()) {
            LOG.debug("执行将QualityTestLabReport中属性值不为null的数据保存到数据库-->结果:", result);
        }
        return resultFormat(C200, result);
    }

    /**
     * 获取试验结果及试验时间
     *
     * @param value
     */
    public void updateReportInfo(QualityTestLabReport value, boolean updateCheckUser) {
        if (value.getExperimentStatus() == null || value.getExperimentStatus() == 0) {
            QualityTestExperimental obj = new QualityTestExperimental();
            obj.setOrderTicketNum(value.getOrderTicketNum());
            List<QualityTestExperimental> lstExperimental = qualityTestExperimentalDao.selectQualityTestExperimentalByObj(obj);
            String UnExp = "", strVerdict = "", strDate = "";
            Date minDate = new Date(), maxDate = new Date();
            int nExperimentStatus = 1;//0 未完成 1完成
            int nExperimentResult = 0;//-1 不合格 1合格
            int nExperimentCount = 0;
            if (lstExperimental != null && lstExperimental.size() > 0) {
                for (int i = 0; i <= lstExperimental.size() - 1; i++) {
                    obj = lstExperimental.get(i);
                    if (obj.getStatus() != -1)//除去删除的试验
                    {
                        nExperimentCount++;
                        if (i == 0) {
                            minDate = obj.getCreateTime();
                            maxDate = obj.getCreateTime();
                        } else {
                            if (minDate.after(obj.getCreateTime())) {
                                minDate = obj.getCreateTime();
                            }
                            if (maxDate.before(obj.getCreateTime())) {
                                maxDate = obj.getCreateTime();
                            }
                        }
                        if (obj.getExperimentalResult() != null && obj.getExperimentalResult() == -1) {
                            if (UnExp.trim().length() > 0) {
                                UnExp += "、";
                            }
                            UnExp += obj.getExperimentalName();
                        }
                        if (obj.getStatus() != 2) {
                            nExperimentStatus = 0;
                        }
                    }
                }
                if (UnExp.trim().length() > 0) {
                    strVerdict = "依据《公路沥青路面施工技术规范》(JTGF40-2004),其所检项目" + UnExp + "试验结果不符合规范的技术要求。";
                    nExperimentResult = -1;
                } else {
                    strVerdict = "依据《公路沥青路面施工技术规范》(JTGF40-2004),其所检项目试验结果符合规范的技术要求。";
                    nExperimentResult = 1;
                }

                if (minDate.getDay() != maxDate.getDay()) {
                    strDate = DateUtil.dateConvertYYYYMMDD2(minDate) + "-" + DateUtil.dateConvertYYYYMMDD2(maxDate);
                } else {
                    strDate = DateUtil.dateConvertYYYYMMDD2(minDate);
                }
            }
            //委托单没有试验为未完成
            if (nExperimentCount == 0) {
                nExperimentStatus = 0;
            }
            //所有试验完成后判定是否合格
            if (nExperimentStatus == 1) {
                value.setExperimentResult(nExperimentResult);
            } else {
                value.setExperimentResult(0);
            }
            value.setTestDate(strDate);
            value.setVerdict(strVerdict);
            value.setExperimentStatus(nExperimentStatus);
        }
        if (updateCheckUser) {
            UserInfo user = (UserInfo) SecurityUtils.getSubject().getPrincipal();
            if (user.getPosition().indexOf("副总经理") > -1) {
                if (value.getChargePerson() == null) {
                    value.setChargePerson(user.getNickname());
                }
            } else if (user.getPosition().indexOf("部长") > -1) {
                if (value.getCheckPerson() == null) {
                    value.setCheckPerson(user.getNickname());
                }
            } else {
                if (value.getReportPerson() == null) {
                    value.setReportPerson(user.getNickname());
                    value.setReportDate(new Date());
                }
            }
            if (value.getReportDate() == null) {
                value.setReportDate(new Date());
            }
        }

    }

    @Override
    public String updateNotNullById(QualityTestLabReport value, boolean updateCheckUser) {
        if (value == null) {
            if (LOG.isDebugEnabled()) {
                LOG.debug("执行通过QualityTestLabReport的id更新QualityTestLabReport中属性不为null的数据-->失败:对象为null");
            }
            return resultFormat(C412, null);
        }
        updateReportInfo(value, updateCheckUser);
        int result = qualityTestLabReportDao.updateNotNullQualityTestLabReportById(value);
        if (LOG.isDebugEnabled()) {
            LOG.debug("执行通过QualityTestLabReport的id更新QualityTestLabReport中属性不为null的数据-->结果:", result);
        }
        return resultFormat(C200, result);
    }

    @Override
    public String deleteById(String id) {
        if (id == null) {
            if (LOG.isDebugEnabled()) {
                LOG.debug("执行通过QualityTestLabReport的id删除QualityTestLabReport-->失败:id不能为空");
            }
            return resultFormat(C412, null);
        }
        int result = qualityTestLabReportDao.deleteQualityTestLabReportById(id);
        if (LOG.isDebugEnabled()) {
            LOG.debug("执行通过QualityTestLabReport的id删除QualityTestLabReport-->结果:", result);
        }
        return resultFormat(C200, result);
    }

    /**
     * 自动生成以完成的试验报告
     *
     * @return
     */
    @Override
    public void autoCreateReport() {
        Assist assist = new Assist();
        assist.setStartRow(0);
        assist.setRowSize(1000);
        assist.andGt("status", -1);
        assist.setOrder(Assist.order("sampling_create_time", false));
        List<QualityTestOrderTicket> lstData = qualityTestOrderTicketDao.selectUnCompleteQualityTestOrderTicket(assist);
        if (lstData.size() <= 0) {
            return;
        }
        for (int i = 0; i < lstData.size(); i++) {
            QualityTestLabReport obj = findOneByOrderTicketNum(lstData.get(i).getOrderTicketNum());
            if (obj == null) {
                QualityTestLabReport value = new QualityTestLabReport();
                value.setOrderTicketNum(lstData.get(i).getOrderTicketNum());
                saveNotNull(value, false);

            } else if (obj.getExperimentStatus() != null && obj.getExperimentStatus() != 3) {
                updateNotNullById(obj, false);
            }
        }

    }

    @Override
    public String UserInfo() {
        UserInfo user = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        return resultFormat(C200, user);
    }
}