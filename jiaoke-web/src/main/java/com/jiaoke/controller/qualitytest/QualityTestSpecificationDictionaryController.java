package com.jiaoke.controller.qualitytest;

import com.jiaoke.qualitytest.bean.QualityTestSpecificationDictionary;
import com.jiaoke.qualitytest.service.QualityTestSpecificationDictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


/**
 * QualityTestSpecificationDictionary规格字典的路由接口服务
 * 
 * @author 
 *
 */
@Controller
@RequestMapping("/QualityTestSpecificationDictionary")
public class QualityTestSpecificationDictionaryController {

	/** QualityTestSpecificationDictionaryService服务 */
	@Autowired
	private QualityTestSpecificationDictionaryService qualityTestSpecificationDictionaryService;

	@RequestMapping("/page.do")
	public String page(){
		return "qualitytest/dictionary/qualitytestspecificationdictionary";
	}

	@RequestMapping("/add.do")
	public String add(){
		return "qualitytest/dictionary/qualitytestspecificationdictionary_add";
	}

	@RequestMapping("/edit.do")
	public String detail(Integer id){
		return "qualitytest/dictionary/qualitytestspecificationdictionary_edit.jsp?id="+id;
	}

	@RequestMapping("/view.do")
	public String view(Integer id){
		return "qualitytest/dictionary/qualitytestspecificationdictionary_edit.jsp?id="+id;
	}
	/**
	 * 查询所有QualityTestSpecificationDictionary数据的方法
	 * @param value
	 * @return
	 */
	@GetMapping(value = "/list", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String find(QualityTestSpecificationDictionary value) {
		return qualityTestSpecificationDictionaryService.find(value);
	}
	
	/**
	 * 通过id查询QualityTestSpecificationDictionary数据的方法
	 * @param id
	 * @return
	 */
	@GetMapping(value = "/find/{id}", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String findOne(@PathVariable(name="id") Integer id) {
		return qualityTestSpecificationDictionaryService.findOne(id);
	}
	
	/**
	 * 插入QualityTestSpecificationDictionary属性不为空的数据方法
	 * @param id
	 * @return
	 */
	@PostMapping(value = "/save", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String save(QualityTestSpecificationDictionary value) {
		return qualityTestSpecificationDictionaryService.saveNotNull(value);
	}
	
	/**
	 * 更新QualityTestSpecificationDictionary属性不为空的数据方法
	 * @param id
	 * @return
	 */
	@PostMapping(value = "/update", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String update(QualityTestSpecificationDictionary value) {
		return qualityTestSpecificationDictionaryService.updateNotNullById(value);
	}

	/**
	 * 通过id删除QualityTestSpecificationDictionary数据方法
	 * @param id
	 * @return
	 */
	@DeleteMapping(value = "/delete/{id}", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String delete(@PathVariable(name="id") Integer id) {
		return qualityTestSpecificationDictionaryService.deleteById(id);
	}
}
