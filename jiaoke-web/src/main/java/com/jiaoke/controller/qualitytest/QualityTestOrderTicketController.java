package com.jiaoke.controller.qualitytest;

import com.jiaoke.qualitytest.bean.QualityTestOrderTicket;
import com.jiaoke.qualitytest.service.QualityTestOrderTicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


/**
 * QualityTestOrderTicket委托单的路由接口服务
 * 
 * @author 
 *
 */
@Controller
@RequestMapping("/QualityTestOrderTicket")
public class QualityTestOrderTicketController {

	/** QualityTestOrderTicketService服务 */
	@Autowired
	private QualityTestOrderTicketService qualityTestOrderTicketService;

	/**
	 * 列表
	 * @return
	 */
	@RequestMapping("/page.do")
	public String page(){
		return "qualitytest/qualitytestorderticket";
	}


	/**
	 * 添加试验
	 * @param id
	 * @return
	 */
	@RequestMapping("/add_experimental.do")
	public String add_experimental(Integer id){
		return "qualitytest/qualitytestorderticket_add.jsp?id="+id;
	}

	/**
	 * 查询所有QualityTestOrderTicket数据的方法
	 * @param value
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public String find(QualityTestOrderTicket value) {
		return qualityTestOrderTicketService.find(value);
	}


	/**
	 * 通过id查询QualityTestOrderTicket数据的方法
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/find/{id}",method = RequestMethod.GET)
	public String find(@PathVariable(name="id") Integer id) {
		return qualityTestOrderTicketService.findOne(id);
	}


	/**
	 * 插入QualityTestOrderTicket属性不为空的数据方法
	 * @param value
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/save",method = RequestMethod.POST)
	public String save(QualityTestOrderTicket value) {
		return qualityTestOrderTicketService.saveNotNull(value);
	}
	
	/**
	 * 更新QualityTestOrderTicket属性不为空的数据方法
	 * @param value
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/update",method = RequestMethod.POST)
	public String update(QualityTestOrderTicket value) {
		return qualityTestOrderTicketService.updateNotNullById(value);
	}

	/**
	 * 通过id删除QualityTestOrderTicket数据方法
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/delete/{id}",method = RequestMethod.POST)
	public String delete(@PathVariable(name="id") Integer id) {
		return qualityTestOrderTicketService.deleteById(id);
	}

	/**
	 * 通过id添加试验
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/addexp/{id}/{eid}",method = RequestMethod.POST)
	public String addexp(@PathVariable(name="id") Integer id,@PathVariable(name="eid") String eid) {
		return qualityTestOrderTicketService.addexp(id,eid);
	}


}
