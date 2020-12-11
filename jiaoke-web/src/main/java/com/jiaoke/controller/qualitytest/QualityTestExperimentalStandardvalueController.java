package com.jiaoke.controller.qualitytest;

import com.jiaoke.qualitytest.bean.QualityTestExperimentalStandardvalue;
import com.jiaoke.qualitytest.service.QualityTestExperimentalStandardvalueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


/**
 * QualityTestExperimentalStandardvalue的路由接口服务
 * 
 * @author 
 *
 */
@Controller
@RequestMapping("/QualityTestExperimentalStandardvalue")
public class QualityTestExperimentalStandardvalueController {

	/** QualityTestExperimentalStandardvalueService服务 */
	@Autowired
	private QualityTestExperimentalStandardvalueService qualityTestExperimentalStandardvalueService;

	@RequestMapping("/page.do")
	public String page() {
		return "qualitytest/qualitytestexperimentalstandardvalue";
	}
	@RequestMapping("/add.do")
	public String add(){
		return "qualitytest/qualitytestexperimentalstandardvalue_detail.jsp?view=0";
	}

	@RequestMapping("/view.do")
	public String view(Integer id){
		return "qualitytest/qualitytestexperimentalstandardvalue_detail.jsp?view=1&id="+id;
	}
	@RequestMapping("/edit.do")
	public String detail(Integer id){
		return "qualitytest/qualitytestexperimentalstandardvalue_detail.jsp?view=2&id="+id;
	}


	/**
	 * 查询所有QualityTestExperimentalStandardvalue数据的方法
	 * @param value
	 * @return
	 */
	@GetMapping(value = "/list", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String find(QualityTestExperimentalStandardvalue value) {
		return qualityTestExperimentalStandardvalueService.find(value);
	}
	
	/**
	 * 通过id查询QualityTestExperimentalStandardvalue数据的方法
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/find/{id}", method = RequestMethod.GET)
	public String findOne(@PathVariable(name = "id") Integer id) {
		return qualityTestExperimentalStandardvalueService.findOne(id);
	}
	
	/**
	 * 插入QualityTestExperimentalStandardvalue属性不为空的数据方法
	 * @param id
	 * @return
	 */
	@PostMapping(value = "/save", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String save(QualityTestExperimentalStandardvalue value) {
		return qualityTestExperimentalStandardvalueService.saveNotNull(value);
	}
	
	/**
	 * 更新QualityTestExperimentalStandardvalue属性不为空的数据方法
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(QualityTestExperimentalStandardvalue value) {
		return qualityTestExperimentalStandardvalueService.updateNotNullById(value);
	}

	/**
	 * 通过id删除QualityTestExperimentalStandardvalue数据方法
	 * @param id
	 * @return
	 */
	@DeleteMapping(value = "/delete/{id}", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String delete(@PathVariable(name="id") Integer id) {
		return qualityTestExperimentalStandardvalueService.deleteById(id);
	}
}
