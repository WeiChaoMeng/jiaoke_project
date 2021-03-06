package com.jiaoke.controller.qualitytest.report;

import com.jiaoke.qualitytest.bean.QualityTestOrderTicket;
import com.jiaoke.qualitytest.bean.QualityTestSamplingpage;
import com.jiaoke.qualitytest.bean.report.*;
import com.jiaoke.qualitytest.service.QualityTestOrderTicketService;
import com.jiaoke.qualitytest.service.QualityTestSamplingpageService;
import com.jiaoke.qualitytest.service.report.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * 台账管理的路由接口服务
 * 
 * @author 
 *
 */
@Controller
@RequestMapping("/QualityTestReport")
public class VQualityTestReportController {
	/** QualityTestOrderTicketService服务 */
	@Autowired
	private QualityTestOrderTicketService qualityTestOrderTicketService;
	/**
	 * QualityTestSamplingpageService服务
	 */
	@Autowired
	private QualityTestSamplingpageService qualityTestSamplingpageService;

	/** VQualityTestReportKfService服务 */
	@Autowired
	private VQualityTestReportKfService vQualityTestReportKfService;
	/** VQualityTestReportXjlService服务 */
	@Autowired
	private VQualityTestReportXjlService vQualityTestReportXjlService;

	/** VQualityTestReportCjlService服务 */
	@Autowired
	private VQualityTestReportCjlService vQualityTestReportCjlService;
	@Autowired
	private VQualityTestReportLqService vQualityTestReportLqService;
	@Autowired
	private VQualityTestReportRhlqService vQualityTestReportRhlqService;
	@Autowired
	private VQualityTestReportLqhhlService vQualityTestReportLqhhlService;
	/**
	 * 委托单台账页面
	 * @return
	 */
	@RequestMapping("/reports_wtdtz_pape.do")
	public String reports_wtdtz_pape(){
		return "qualitytest/reports/qualitytestorderticket_reports";
	}
	/**
	 * 材料台账页面
	 * @return
	 */
	@RequestMapping("/reports_cltz_pape.do")
	public String reports_cltz_pape(){
		return "qualitytest/reports/qualitytestsamplingpage_reports";
	}
	/**
	 * 材料台账页面
	 * @return
	 */
	@RequestMapping("/reports_experimental_pape.do")
	public String reports_experimental_pape(){
		return "qualitytest/reports/qualitytestexperimental_reports";
	}
	/**
	 * 委托单台账
	 * @param value
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/ReportWTD",method = RequestMethod.GET)
	public String ReportWTD(QualityTestOrderTicket value) {
		return qualityTestOrderTicketService.reports(value);
	}
	/**
	 * 材料台账
	 * @param value
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/ReportCL",method = RequestMethod.GET)
	public String ReportCL(QualityTestSamplingpage value) {
		return qualityTestSamplingpageService.reports(value);
	}

	/**
	 * 试验台账-矿粉
	 * @param value
	 * @return
	 */
	@GetMapping(value = "/ReportKF", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String ReportKF(VQualityTestReportKf value) {
		return vQualityTestReportKfService.find(value);
	}



	/**
	 * 试验台账-粗集料
	 * @param value
	 * @return
	 */
	@GetMapping(value = "/ReportCJL", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String ReportCJL(VQualityTestReportCjl value) {
		return vQualityTestReportCjlService.find(value);
	}



	/**
	 * 试验台账-细集料
	 * @param value
	 * @return
	 */
	@GetMapping(value = "/ReportXJL", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String ReportXJL(VQualityTestReportXjl value) {
		return vQualityTestReportXjlService.find(value);
	}
	/**
	 * 试验台账-沥青
	 * @param value
	 * @return
	 */
	@GetMapping(value = "/ReportLQ", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String ReportLQ(VQualityTestReportLq value) {
		return vQualityTestReportLqService.find(value);
	}
	/**
	 * 试验台账-乳化沥青
	 * @param value
	 * @return
	 */
	@GetMapping(value = "/ReportRHLQ", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String ReportRHLQ(VQualityTestReportRhlq value) {
		return vQualityTestReportRhlqService.find(value);
	}
	/**
	 * 试验台账-细集料
	 * @param value
	 * @return
	 */
	@GetMapping(value = "/ReportLQHHL", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String ReportLQHHL(VQualityTestReportLqhhl value) {
		return vQualityTestReportLqhhlService.find(value);
	}


}
