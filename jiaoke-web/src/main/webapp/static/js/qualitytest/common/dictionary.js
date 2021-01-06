layui.define(['form', 'jquery', 'layer', 'table'], function(exports) {
	var form = layui.form;
	var $ = layui.$;
	var layer = layui.layer;
	//材料数据
	var materialsData = null;
	//规格数据
	var SpecificationData = null;
	//厂家数据
	var ManufacturersData = null;

	console.log("dictionary.js");

	var dictionaryFunc = {

	}

	/**
	 * 测试
	 */
	dictionaryFunc.initData = function(id, defaultMsg) {
		console.log("func initData");
		$("#" + id).html('<option value="">' + defaultMsg + '</option>');
		$("#" + id).append('<option value="">' + defaultMsg + '111</option>');
		layer.msg(id);
		form.render();
	}
	/**
	 * 材料数据加入Select
	 */
	dictionaryFunc.getMaterialsToSelect = function(id, defaultMsg, basePath) {
		console.log("getMaterialstoSelect");
		if (materialsData == null) {
			materialsData = dictionaryFunc.getMaterialsData(basePath);
		}
		$("#" + id).html('<option value="">' + defaultMsg + '</option>');

		if (materialsData != null && materialsData.length > 0) {
			for (var i = 0; i < materialsData.length; i++) {
				var htmlStr = "<option value='" + materialsData[i].Id + "'>" + materialsData[i].name + "</option>";
				$("#" + id).append(htmlStr);
			}
		}
		form.render();
	}
	/**
	 * 材料规格数据加入Select
	 */
	dictionaryFunc.getSpecificationToSelect = function(id, defaultMsg, basePath, materialsid) {
		console.log("getMaterialstoSelect");
		SpecificationData = dictionaryFunc.getSpecificationData(materialsid, basePath);

		$("#" + id).html('<option value="">' + defaultMsg + '</option>');

		if (SpecificationData != null && SpecificationData.length > 0) {
			for (var i = 0; i < SpecificationData.length; i++) {
				var htmlStr = "<option value='" + SpecificationData[i].id + "'>" + SpecificationData[i].name + "</option>";
				$("#" + id).append(htmlStr);
			}
		}
		form.render();
	}


	/**
	 * 厂家数据加入Select
	 */
	dictionaryFunc.getFacturersToSelect = function(id, defaultMsg, basePath, materialsid) {
		console.log("getMaterialstoSelect");

		$("#" + id).empty();
		$("#" + id).html('<option value="">' + defaultMsg + '</option>');
		if (materialsid == null || materialsid.length <= 0) {
			form.render();
			return;
		}
		ManufacturersData = dictionaryFunc.getManufacturersData(materialsid, basePath);
		if (ManufacturersData == null || ManufacturersData.length == null) {
			form.render();
			return;
		}
		for (var i = 0; i < ManufacturersData.length; i++) {
			var htmlStr = "<option value='" + ManufacturersData[i].id + "'>" + ManufacturersData[i].name +
				"</option>";
			$("#" + id).append(htmlStr);
		}
		form.render();
	}

	/**
	 * 根据材料更新试验下拉框
	 * @param {Object} id
	 * @param {Object} defaultMsg
	 */
	dictionaryFunc.getExperimentalToSelect = function(id, defaultMsg, basePath, mid) {
		var eData = dictionaryFunc.getExperimentalData(mid,basePath);
		$("#" + id).empty();
		$("#" + id).html('<option value="">' + defaultMsg + '</option>');
		if (eData != null && eData.length > 0) {
			for (var i = 0; i < eData.length; i++) {
				var htmlStr = "<option value='" + eData[i].id + "'>" + eData[i].name +
					"</option>";
				$("#" + id).append(htmlStr);
			}
		}
		form.render();
	}


	/**
	 * 获取材料字典
	 */
	dictionaryFunc.getMaterialsData = function(basePath) {
		var result = null;
		$.ajax({
			type: "GET",
			async: false,
			url: basePath + "/QualityTestMaterialDictionary/list.do",
			dataType: 'json',
			success: function(msg) {
				if (msg.code == 200) {
					result = msg.data;
				}
				console.log(msg);
			}
		})
		return result;
	}
	/**
	 * 获取规格字典
	 */
	dictionaryFunc.getSpecificationData = function(id, basePath) {
		var queryData = {
			"materialId": id
		};
		var result = null;
		$.ajax({
			type: "GET",
			async: false,
			url: basePath + "/QualityTestSpecificationDictionary/list.do",
			data: queryData,
			dataType: 'json',
			success: function(msg) {
				if (msg.code == 0) {
					result = msg.data;
				}
				console.log(msg);
			}
		})
		return result;
	}

	/**
	 * 获取厂家字典
	 * @param id
	 */
	dictionaryFunc.getManufacturersData = function(id, basePath) {
		var result = null;
		var queryData = {
			"materialId": id
		};
		$.ajax({
			type: "GET",
			async: false,
			url: basePath + "/QualityTestManufacturersDictionary/list.do",
			data: queryData,
			dataType: 'JSON',
			success: function(msg) {
				if (msg.code == 0) {
					result = msg.data;
				}
				console.log(msg);
			}
		});
		return result;
	}
	/**
	 * 根据材料ID获取试验字典
	 */
	dictionaryFunc.getExperimentalData = function(id,basePath) {
		var result = null;

		var queryData = {
			"materialId": id
		};
		$.ajax({
			type: "GET",
			async: false,
			url: basePath + "/QualityTestExperimentDictionary/list.do",
			dataType: 'JSON',
			data: queryData,
			success: function(msg) {
				if (msg.code == 0) {
					result = msg.data;
				}
				console.log(msg);
			}
		})
		return result;
	}
/**
	 * 根据试验ID获取试验项字典
	 */
	dictionaryFunc.getExperimentalItemData = function(id,basePath) {
		var result = null;

		var queryData = {
			"experimentalId": id
		};
		$.ajax({
			type: "GET",
			async: false,
			url: basePath + "/QualityTestExperimentalStandardvalueItem/list.do",
			dataType: 'JSON',
			data: queryData,
			success: function(msg) {
				if (msg.code == 0) {
					result = msg.data;
				}
				console.log(msg);
			}
		})
		return result;
	}


	exports('dictionary', dictionaryFunc)
});
