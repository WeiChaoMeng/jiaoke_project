package com.jiaoke.controller.qualitytest.experimentalvalue;

import com.jiaoke.qualitytest.bean.experimentalvalue.QualityTestExperimentalValueLqhhlMs;
import com.jiaoke.qualitytest.service.experimentalvalue.QualityTestExperimentalValueLqhhlMsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


/**
 * QualityTestExperimentalValueLqhhlMs的路由接口服务
 * 
 * @author 
 *
 */
@Controller
@RequestMapping("/QualityTestExperimentalValueLqhhlMs")
public class QualityTestExperimentalValueLqhhlMsController {

	/** QualityTestExperimentalValueLqhhlMsService服务 */
	@Autowired
	private QualityTestExperimentalValueLqhhlMsService qualityTestExperimentalValueLqhhlMsService;
	
	/**
	 * 查询所有QualityTestExperimentalValueLqhhlMs数据的方法
	 * @param value
	 * @return
	 */
	@GetMapping(value = "/QualityTestExperimentalValueLqhhlMs", produces = {"application/json;charset=UTF-8"})
	public String find(QualityTestExperimentalValueLqhhlMs value) {
		return qualityTestExperimentalValueLqhhlMsService.find(value);
	}
	
	/**
	 * 通过id查询QualityTestExperimentalValueLqhhlMs数据的方法
	 * @param id
	 * @return
	 */
	@GetMapping(value = "/QualityTestExperimentalValueLqhhlMs/{id}", produces = {"application/json;charset=UTF-8"})
	public String findOne(@PathVariable(name="id") Integer id) {
		return qualityTestExperimentalValueLqhhlMsService.findOne(id);
	}
	
	/**
	 * 插入QualityTestExperimentalValueLqhhlMs属性不为空的数据方法
	 * @param id
	 * @return
	 */
	@PostMapping(value = "/QualityTestExperimentalValueLqhhlMs", produces = {"application/json;charset=UTF-8"})
	public String save(QualityTestExperimentalValueLqhhlMs value) {
		return qualityTestExperimentalValueLqhhlMsService.saveNotNull(value);
	}
	
	/**
	 * 更新QualityTestExperimentalValueLqhhlMs属性不为空的数据方法
	 * @param id
	 * @return
	 */
	@PutMapping(value = "/QualityTestExperimentalValueLqhhlMs", produces = {"application/json;charset=UTF-8"})
	public String update(QualityTestExperimentalValueLqhhlMs value) {
		return qualityTestExperimentalValueLqhhlMsService.updateNotNullById(value);
	}

	/**
	 * 通过id删除QualityTestExperimentalValueLqhhlMs数据方法
	 * @param id
	 * @return
	 */
	@DeleteMapping(value = "/QualityTestExperimentalValueLqhhlMs/{id}", produces = {"application/json;charset=UTF-8"})
	public String delete(@PathVariable(name="id") Integer id) {
		return qualityTestExperimentalValueLqhhlMsService.deleteById(id);
	}
}
