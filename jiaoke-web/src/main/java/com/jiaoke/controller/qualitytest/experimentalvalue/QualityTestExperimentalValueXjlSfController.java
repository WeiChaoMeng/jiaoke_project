package com.jiaoke.controller.qualitytest.experimentalvalue;

import com.jiaoke.qualitytest.bean.experimentalvalue.QualityTestExperimentalValueXjlSf;
import com.jiaoke.qualitytest.service.experimentalvalue.QualityTestExperimentalValueXjlSfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


/**
 * QualityTestExperimentalValueXjlSf的路由接口服务
 * 
 * @author 
 *
 */
@Controller
@RequestMapping("/QualityTestExperimentalValueXjlSf")
public class QualityTestExperimentalValueXjlSfController {

	/** QualityTestExperimentalValueXjlSfService服务 */
	@Autowired
	private QualityTestExperimentalValueXjlSfService qualityTestExperimentalValueXjlSfService;
	
	/**
	 * 查询所有QualityTestExperimentalValueXjlSf数据的方法
	 * @param value
	 * @return
	 */
	@GetMapping(value = "/list", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String find(QualityTestExperimentalValueXjlSf value) {
		return qualityTestExperimentalValueXjlSfService.find(value);
	}
	
	/**
	 * 通过id查询QualityTestExperimentalValueXjlSf数据的方法
	 * @param id
	 * @return
	 */
	@GetMapping(value = "/findOne/{id}", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String findOne(@PathVariable(name="id") Integer id) {
		return qualityTestExperimentalValueXjlSfService.findOne(id);
	}
	
	/**
	 * 插入QualityTestExperimentalValueXjlSf属性不为空的数据方法
	 * @param id
	 * @return
	 */
	@PostMapping(value = "/save", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String save(QualityTestExperimentalValueXjlSf value) {
		return qualityTestExperimentalValueXjlSfService.saveNotNull(value);
	}
	
	/**
	 * 更新QualityTestExperimentalValueXjlSf属性不为空的数据方法
	 * @param id
	 * @return
	 */
	@PutMapping(value = "/update", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String update(QualityTestExperimentalValueXjlSf value) {
		return qualityTestExperimentalValueXjlSfService.updateNotNullById(value);
	}

	/**
	 * 通过id删除QualityTestExperimentalValueXjlSf数据方法
	 * @param id
	 * @return
	 */
	@DeleteMapping(value = "/delete/{id}", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String delete(@PathVariable(name="id") Integer id) {
		return qualityTestExperimentalValueXjlSfService.deleteById(id);
	}
}
