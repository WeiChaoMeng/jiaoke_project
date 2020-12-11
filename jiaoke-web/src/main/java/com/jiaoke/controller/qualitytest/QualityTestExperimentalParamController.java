package com.jiaoke.controller.qualitytest;

import com.jiaoke.qualitytest.bean.QualityTestExperimentalParam;
import com.jiaoke.qualitytest.service.QualityTestExperimentalParamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


/**
 * QualityTestExperimentalParam试验参数的路由接口服务
 * 
 * @author 
 *
 */
@Controller
@RequestMapping("/QualityTestExperimentalParam")
public class QualityTestExperimentalParamController {

	@RequestMapping("/page.do")
	public String page(){
		return "qualitytest/dictionary/qualitytestexperimentalparam";
	}

	@RequestMapping("/add.do")
	public String add(){
		return "qualitytest/dictionary/qualitytestexperimentalparam_detail";
	}

	@RequestMapping("/edit.do")
	public String detail(Integer id){
		return "qualitytest/dictionary/qualitytestexperimentalparam_detail.jsp?id="+id;
	}
	@RequestMapping("/view.do")
	public String view(Integer id){
		return "qualitytest/dictionary/qualitytestexperimentalparam_detail.jsp?id="+id;
	}

	/** QualityTestExperimentalParamService服务 */
	@Autowired
	private QualityTestExperimentalParamService qualityTestExperimentalParamService;
	
	/**
	 * 查询所有QualityTestExperimentalParam数据的方法
	 * @param value
	 * @return
	 */
	@GetMapping(value = "/list", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String find(QualityTestExperimentalParam value) {
		return qualityTestExperimentalParamService.find(value);
	}
	
	/**
	 * 通过id查询QualityTestExperimentalParam数据的方法
	 * @param id
	 * @return
	 */
	@GetMapping(value = "/find/{id}", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String findOne(@PathVariable(name="id") Integer id) {
		return qualityTestExperimentalParamService.findOne(id);
	}
	
	/**
	 * 插入QualityTestExperimentalParam属性不为空的数据方法
	 * @param value
	 * @return
	 */
	@PostMapping(value = "/save", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String save(QualityTestExperimentalParam value) {
		return qualityTestExperimentalParamService.saveNotNull(value);
	}
	
	/**
	 * 更新QualityTestExperimentalParam属性不为空的数据方法
	 * @param value
	 * @return
	 */
	@PostMapping(value = "/update", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String update(QualityTestExperimentalParam value) {
		return qualityTestExperimentalParamService.updateNotNullById(value);
	}

	/**
	 * 通过id删除QualityTestExperimentalParam数据方法
	 * @param id
	 * @return
	 */
	@DeleteMapping(value = "/delete/{id}", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String delete(@PathVariable(name="id") Integer id) {
		return qualityTestExperimentalParamService.deleteById(id);
	}
	/**
	 * 通过id删除QualityTestExperimentalParam数据方法
	 * @param id
	 * @return
	 */
	@PostMapping(value = "/copy/{id}", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String copy(@PathVariable(name="id") Integer id) {
		return qualityTestExperimentalParamService.copyById(id);
	}
}
