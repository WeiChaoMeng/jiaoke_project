package com.jiaoke.controller.qualitytest;

import com.jiaoke.qualitytest.bean.QualityTestMaterialDictionary;
import com.jiaoke.qualitytest.service.QualityTestMaterialDictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


/**
 * QualityTestMaterialDictionary材料字典的路由接口服务
 * 
 * @author 
 *
 */
@Controller
@RequestMapping("/QualityTestMaterialDictionary")
public class QualityTestMaterialDictionaryController {

	/** QualityTestMaterialDictionaryService服务 */
	@Autowired
	private QualityTestMaterialDictionaryService qualityTestMaterialDictionaryService;
	
	/**
	 * 查询所有QualityTestMaterialDictionary数据的方法
	 * @param value
	 * @return
	 */
	@GetMapping(value = "/list", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String find(QualityTestMaterialDictionary value) {
		return qualityTestMaterialDictionaryService.find(value);
	}
	/**
	 * 通过id查询QualityTestMaterialDictionary数据的方法
	 * @param id
	 * @return
	 */
	@GetMapping(value = "/find/{id}", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String findOne(@PathVariable(name="id") Integer id) {
		return qualityTestMaterialDictionaryService.findOne(id);
	}
	
	/**
	 * 插入QualityTestMaterialDictionary属性不为空的数据方法
	 * @param id
	 * @return
	 */
	@PostMapping(value = "/save", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String save(QualityTestMaterialDictionary value) {
		return qualityTestMaterialDictionaryService.saveNotNull(value);
	}
	
	/**
	 * 更新QualityTestMaterialDictionary属性不为空的数据方法
	 * @param id
	 * @return
	 */
	@PutMapping(value = "/update", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String update(QualityTestMaterialDictionary value) {
		return qualityTestMaterialDictionaryService.updateNotNullById(value);
	}

	/**
	 * 通过id删除QualityTestMaterialDictionary数据方法
	 * @param id
	 * @return
	 */
	@DeleteMapping(value = "/delete/{id}", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String delete(@PathVariable(name="id") Integer id) {
		return qualityTestMaterialDictionaryService.deleteById(id);
	}
}
