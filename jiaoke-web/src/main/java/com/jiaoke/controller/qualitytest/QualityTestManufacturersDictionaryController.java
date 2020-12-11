package com.jiaoke.controller.qualitytest;

import com.jiaoke.qualitytest.bean.QualityTestManufacturersDictionary;
import com.jiaoke.qualitytest.service.QualityTestManufacturersDictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


/**
 * QualityTestManufacturersDictionary厂家字典的路由接口服务
 * 
 * @author 
 *
 */
@Controller
@RequestMapping("/QualityTestManufacturersDictionary")
public class QualityTestManufacturersDictionaryController {

	/** QualityTestManufacturersDictionaryService服务 */
	@Autowired
	private QualityTestManufacturersDictionaryService qualityTestManufacturersDictionaryService;

	@RequestMapping("/page.do")
	public String page(){
		return "qualitytest/dictionary/qualitytestmanufacturersdictionary";
	}

	@RequestMapping("/add.do")
	public String add(){
		return "qualitytest/dictionary/qualitytestmanufacturersdictionary_add";
	}

	@RequestMapping("/edit.do")
	public String detail(Integer id){
		return "qualitytest/dictionary/qualitytestmanufacturersdictionary_edit.jsp?id="+id;
	}

	@RequestMapping("/view.do")
	public String view(Integer id){
		return "qualitytest/dictionary/qualitytestmanufacturersdictionary_edit.jsp?id="+id;
	}

	/**
	 * 查询所有QualityTestManufacturersDictionary数据的方法
	 * @param value
	 * @return
	 */
	@GetMapping(value = "/list", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String find(QualityTestManufacturersDictionary value) {
		return qualityTestManufacturersDictionaryService.find(value);
	}
	
	/**
	 * 通过id查询QualityTestManufacturersDictionary数据的方法
	 * @param id
	 * @return
	 */
	@GetMapping(value = "/find/{id}", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String findOne(@PathVariable(name="id") Integer id) {
		return qualityTestManufacturersDictionaryService.findOne(id);
	}
	
	/**
	 * 插入QualityTestManufacturersDictionary属性不为空的数据方法
	 * @param id
	 * @return
	 */
	@PostMapping(value = "/save", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String save(QualityTestManufacturersDictionary value) {
		return qualityTestManufacturersDictionaryService.saveNotNull(value);
	}
	
	/**
	 * 更新QualityTestManufacturersDictionary属性不为空的数据方法
	 * @param id
	 * @return
	 */
	@PostMapping(value = "/update", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String update(QualityTestManufacturersDictionary value) {
		return qualityTestManufacturersDictionaryService.updateNotNullById(value);
	}

	/**
	 * 通过id删除QualityTestManufacturersDictionary数据方法
	 * @param id
	 * @return
	 */
	@DeleteMapping(value = "/delete/{id}", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String delete(@PathVariable(name="id") Integer id) {
		return qualityTestManufacturersDictionaryService.deleteById(id);
	}
}
