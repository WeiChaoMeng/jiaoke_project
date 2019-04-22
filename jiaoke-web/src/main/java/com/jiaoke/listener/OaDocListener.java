package com.jiaoke.listener;

import com.jiaoke.oa.bean.OaDocument;
import com.jiaoke.oa.service.OaDocumentService;
import com.jiaoke.oa.service.OaDocumentServiceImpl;
import org.activiti.engine.ProcessEngines;
import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.ExecutionListener;
import org.activiti.engine.history.HistoricProcessInstance;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.annotation.Resource;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.ArrayList;
import java.util.List;

/**
 * 公文监听器
 *
 * @author lihui
 * @version 1.0
 * @date 2018/11/21 10:18
 */
public class OaDocListener implements ExecutionListener, ServletContextListener {

    private static OaDocumentService oaDocumentService = null;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        oaDocumentService = WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext()).getBean(OaDocumentServiceImpl.class);
    }

    @Override
    public void notify(DelegateExecution delegateExecution) {
        String eventName = delegateExecution.getEventName();
        if ("start".equals(eventName)) {
            System.out.println("-----------------------start----------------------------");
        } else if ("end".equals(eventName)) {
            System.out.println("-----------------------end------------------------------");
            System.out.println("流程实例id：-----------------" + delegateExecution.getProcessInstanceId() + "------------------------------");
            //根据流程实例id查询业务id
            List<Object> arrayList = new ArrayList<>();
            HistoricProcessInstance historicProcessInstance = ProcessEngines
                    .getDefaultProcessEngine()
                    .getHistoryService()
                    .createHistoricProcessInstanceQuery()
                    .processInstanceId(delegateExecution.getProcessInstanceId()).singleResult();
            String businessKey = historicProcessInstance.getBusinessKey();
            OaDocument document = oaDocumentService.getAllById(Integer.valueOf(businessKey));
//            String documentMainGive = document.getMainGive();
//            String[] split1 = documentMainGive.split(",");


            List<HistoricProcessInstance> list = ProcessEngines
                    .getDefaultProcessEngine()
                    .getHistoryService()
                    .createHistoricProcessInstanceQuery()
                    .processInstanceId(delegateExecution.getProcessInstanceId())
                    .list();
            for (HistoricProcessInstance processInstance : list) {
                System.out.println("业务id:=============" + processInstance.getBusinessKey() + "==========");
                //根据业务id查询公文详情
                OaDocument oaDocument = oaDocumentService.getAllById(Integer.valueOf(processInstance.getBusinessKey()));
//                System.out.println("标题：" + oaDocument.getFormTitle() + "-----主送：" + oaDocument.getMainGive());
//                String mainGive = oaDocument.getMainGive();
//                if (mainGive.contains(",")) {
//                    String[] split = mainGive.split(",");
//                    for (String s : split) {
//                        arrayList.add(s);
            }
        } else {
//                    arrayList.add(mainGive);
        }
    }

//            for (Object object : arrayList) {
//                System.out.println("看看" + object);
//            }
}
        /*
            1.监听流程结束
            2.获取当前流程实例id
            3.根据流程实例id获取业务id
            4.根据业务id获取相应业务的主送列表
            5.根据主送列表查询相关人员
            6.给人员
        * */
//    }
//
//            }
