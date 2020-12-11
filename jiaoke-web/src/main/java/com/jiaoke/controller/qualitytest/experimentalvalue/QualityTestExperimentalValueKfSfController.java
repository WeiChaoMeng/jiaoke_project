package com.jiaoke.controller.qualitytest.experimentalvalue;

import com.jiaoke.qualitytest.bean.experimentalvalue.QualityTestExperimentalValueKfSf;
import com.jiaoke.qualitytest.service.experimentalvalue.QualityTestExperimentalValueKfSfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;



/**
 * QualityTestExperimentalValueKfSf的路由接口服务
 * 
 * @author 
 *
 */
@Controller
@RequestMapping("/QualityTestExperimentalValueKfSf")
public class QualityTestExperimentalValueKfSfController {

	/** QualityTestExperimentalValueKfSfService服务 */
	@Autowired
	private QualityTestExperimentalValueKfSfService qualityTestExperimentalValueKfSfService;
	
	/**
	 * 查询所有QualityTestExperimentalValueKfSf数据的方法
	 * @param value
	 * @return
	 */
	@GetMapping(value = "/list", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String find(QualityTestExperimentalValueKfSf value) {
		return qualityTestExperimentalValueKfSfService.find(value);
	}
	
	/**
	 * 通过id查询QualityTestExperimentalValueKfSf数据的方法
	 * @param id
	 * @return
	 */
	@GetMapping(value = "/findOne/{id}", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String findOne(@PathVariable(name="id") Integer id) {
		return qualityTestExperimentalValueKfSfService.findOne(id);
	}
	
	/**
	 * 插入QualityTestExperimentalValueKfSf属性不为空的数据方法
	 * @param id
	 * @return
	 */
	@PostMapping(value = "/save", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String save(QualityTestExperimentalValueKfSf value) {
		return qualityTestExperimentalValueKfSfService.saveNotNull(value);
	}
	
	/**
	 * 更新QualityTestExperimentalValueKfSf属性不为空的数据方法
	 * @param id
	 * @return
	 */
	@PutMapping(value = "/update", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String update(QualityTestExperimentalValueKfSf value) {
		return qualityTestExperimentalValueKfSfService.updateNotNullById(value);
	}

	/**
	 * 通过id删除QualityTestExperimentalValueKfSf数据方法
	 * @param id
	 * @return
	 */
	@DeleteMapping(value = "/delete/{id}", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String delete(@PathVariable(name="id") Integer id) {
		return qualityTestExperimentalValueKfSfService.deleteById(id);
	}
}
