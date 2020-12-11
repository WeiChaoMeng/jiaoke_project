package com.jiaoke.controller.qualitytest.experimentalvalue;

import com.jiaoke.qualitytest.bean.experimentalvalue.QualityTestExperimentalValue;
import com.jiaoke.qualitytest.service.experimentalvalue.QualityTestExperimentalValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


/**
 * QualityTestExperimentalValue的路由接口服务
 * 
 * @author 
 *
 */
@Controller
@RequestMapping("/QualityTestExperimentalValue")
public class QualityTestExperimentalValueController {

	/** QualityTestExperimentalValueService服务 */
	@Autowired
	private QualityTestExperimentalValueService qualityTestExperimentalValueService;
	
	/**
	 * 查询所有QualityTestExperimentalValue数据的方法
	 * @param value
	 * @return
	 */
	@GetMapping(value = "/list", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String find(QualityTestExperimentalValue value) {
		return qualityTestExperimentalValueService.find(value);
	}
	
	/**
	 * 通过id查询QualityTestExperimentalValue数据的方法
	 * @param id
	 * @return
	 */
	@GetMapping(value = "/find/{id}", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String findOne(@PathVariable(name="id") Integer id) {
		return qualityTestExperimentalValueService.findOne(id);
	}
	
	/**
	 * 插入QualityTestExperimentalValue属性不为空的数据方法
	 * @param id
	 * @return
	 */
	@PostMapping(value = "/save", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String save(QualityTestExperimentalValue value) {
		return qualityTestExperimentalValueService.saveNotNull(value);
	}
	
	/**
	 * 更新QualityTestExperimentalValue属性不为空的数据方法
	 * @param id
	 * @return
	 */
	@PutMapping(value = "/update", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String update(QualityTestExperimentalValue value) {
		return qualityTestExperimentalValueService.updateNotNullById(value);
	}

	/**
	 * 通过id删除QualityTestExperimentalValue数据方法
	 * @param id
	 * @return
	 */
	@DeleteMapping(value = "/delete/{id}", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String delete(@PathVariable(name="id") Integer id) {
		return qualityTestExperimentalValueService.deleteById(id);
	}
}
