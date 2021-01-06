package com.jiaoke.controller.qualitytest;

import com.jiaoke.qualitytest.bean.QualityTestExperimentalStandardvalueItem;
import com.jiaoke.qualitytest.service.QualityTestExperimentalStandardvalueItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


/**
 * QualityTestExperimentalStandardvalueItem的路由接口服务
 * 
 * @author 
 *
 */
@Controller
@RequestMapping("/QualityTestExperimentalStandardvalueItem")
public class QualityTestExperimentalStandardvalueItemController {

	/** QualityTestExperimentalStandardvalueItemService服务 */
	@Autowired
	private QualityTestExperimentalStandardvalueItemService qualityTestExperimentalStandardvalueItemService;
	
	/**
	 * 查询所有QualityTestExperimentalStandardvalueItem数据的方法
	 * @param value
	 * @return
	 */
	@GetMapping(value = "/list", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String find(QualityTestExperimentalStandardvalueItem value) {
		return qualityTestExperimentalStandardvalueItemService.find(value);
	}
	
	/**
	 * 通过id查询QualityTestExperimentalStandardvalueItem数据的方法
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/find/{id}", method = RequestMethod.GET)
	public String findOne(@PathVariable(name="id") Integer id) {
		return qualityTestExperimentalStandardvalueItemService.findOne(id);
	}
	
	/**
	 * 插入QualityTestExperimentalStandardvalueItem属性不为空的数据方法
	 * @param id
	 * @return
	 */
	@PostMapping(value = "/save", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String save(QualityTestExperimentalStandardvalueItem value) {
		return qualityTestExperimentalStandardvalueItemService.saveNotNull(value);
	}
	
	/**
	 * 更新QualityTestExperimentalStandardvalueItem属性不为空的数据方法
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(QualityTestExperimentalStandardvalueItem value) {
		return qualityTestExperimentalStandardvalueItemService.updateNotNullById(value);
	}

	/**
	 * 通过id删除QualityTestExperimentalStandardvalueItem数据方法
	 * @param id
	 * @return
	 */
	@DeleteMapping(value = "/delete/{id}", produces = {"application/json;charset=UTF-8"})
	@ResponseBody	public String delete(@PathVariable(name="id") Integer id) {
		return qualityTestExperimentalStandardvalueItemService.deleteById(id);
	}
}
