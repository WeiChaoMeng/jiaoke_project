package com.jiaoke.controller.qualitytest.experimentalvalue;

import com.jiaoke.qualitytest.bean.experimentalvalue.QualityTestExperimentalValueCjlSf;
import com.jiaoke.qualitytest.service.experimentalvalue.QualityTestExperimentalValueCjlSfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


/**
 * QualityTestExperimentalValueCjlSf的路由接口服务
 * 
 * @author 
 *
 */
@Controller
@RequestMapping("/QualityTestExperimentalValueCjlSf")
public class QualityTestExperimentalValueCjlSfController {

	/** QualityTestExperimentalValueCjlSfService服务 */
	@Autowired
	private QualityTestExperimentalValueCjlSfService qualityTestExperimentalValueCjlSfService;
	
	/**
	 * 查询所有QualityTestExperimentalValueCjlSf数据的方法
	 * @param value
	 * @return
	 */
	@GetMapping(value = "/list", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String find(QualityTestExperimentalValueCjlSf value) {
		return qualityTestExperimentalValueCjlSfService.find(value);
	}
	
	/**
	 * 通过id查询QualityTestExperimentalValueCjlSf数据的方法
	 * @param id
	 * @return
	 */
	@GetMapping(value = "/findOne/{id}", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String findOne(@PathVariable(name="id") Integer id) {
		return qualityTestExperimentalValueCjlSfService.findOne(id);
	}
	
	/**
	 * 插入QualityTestExperimentalValueCjlSf属性不为空的数据方法
	 * @param id
	 * @return
	 */
	@PostMapping(value = "/save", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String save(QualityTestExperimentalValueCjlSf value) {
		return qualityTestExperimentalValueCjlSfService.saveNotNull(value);
	}
	
	/**
	 * 更新QualityTestExperimentalValueCjlSf属性不为空的数据方法
	 * @param id
	 * @return
	 */
	@PutMapping(value = "/QualityTestExperimentalValueCjlSf", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String update(QualityTestExperimentalValueCjlSf value) {
		return qualityTestExperimentalValueCjlSfService.updateNotNullById(value);
	}

	/**
	 * 通过id删除QualityTestExperimentalValueCjlSf数据方法
	 * @param id
	 * @return
	 */
	@DeleteMapping(value = "/QualityTestExperimentalValueCjlSf/{id}", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String delete(@PathVariable(name="id") Integer id) {
		return qualityTestExperimentalValueCjlSfService.deleteById(id);
	}
}
