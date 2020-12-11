layui.use(['form', 'layedit', 'laydate'], function() {
	console.log("qualitytestspecificationdictionary_edit");

	var form = layui.form,
		layer = layui.layer,
		layedit = layui.layedit,
		laydate = layui.laydate;
	form.render();

	var basePath = $("#path").val();
	var dictionaryFunc = parent.layui.dictionary;
	var expID = common.getUrlParam("id");
	var viewType = common.getUrlParam("view");

	//监听提交
	form.on('submit(btnSubmit)', function(data) {
		myform.Save(data.field);
		return false;
	});

	var myform = {
		materialsData: ""
	};

	/**
	 * 初始化材料下拉框
	 * @param {Object} id
	 * @param {Object} defaultMsg
	 */
	myform.initMaterialsSelect = function(id, defaultMsg) {
		if (myform.materialsData == "") {
			myform.materialsData = dictionaryFunc.getMaterialsData(basePath);
		}
		$("#" + id).empty();
		$("#" + id).html('<option value="">' + defaultMsg + '</option>');
		if (myform.materialsData != null && myform.materialsData.length > 0) {
			for (var i = 0; i < myform.materialsData.length; i++) {
				var htmlStr = "<option value='" + myform.materialsData[i].Id + "'>" + myform.materialsData[i].name +
					"</option>";
				$("#" + id).append(htmlStr);
			}
		}
		form.render();
	}
	/**
	 * 获取试验信息
	 * @param {Object} id
	 */
	myform.getExperimentalInfo = function(id) {
		var result = null;
		$.ajax({
			type: "GET",
			async: false,
			url: basePath + "/QualityTestSpecificationDictionary/find/" + id + ".do",
			dataType: 'json',
			success: function(msg) {
				result = msg;
				console.log(msg);
			}
		})
		return result;
	}
	/**
	 * 显示试验信息
	 * @param {Object} data
	 */
	myform.setExperimentalInfo = function(data) {
		form.val('myform', data);
		$("#materialId").val(data['material_id']);
		form.render();
	}
	/**
	 * 数据保存
	 * @param {Object} saveData
	 */
	myform.Save = function(saveData) {
		saveData['materialName'] = $("#materialId option:selected").text();
		saveData['id'] = expID;
		$.ajax({
			type: "POST",
			async: false,
			url: basePath + "/QualityTestSpecificationDictionary/update.do",
			data: saveData,
			dataType: 'JSON',
			success: function(msg) {
				if (msg.code = 200) {
					parent.layer.closeAll();
				} else {
					layer.alert("更新失败");
				}
			}
		})
	}
	//初始化下拉框
	myform.initMaterialsSelect("materialId", "请选择");
	//赋值
	var expInfo = myform.getExperimentalInfo(expID);
	if (expInfo != null && expInfo.code == 200) {
		myform.setExperimentalInfo(expInfo.data);
	}
	//查看
	if (viewType == 1) {
		$('input[class="layui-input"]').each(function() {
			$(this).attr('disabled',true);
		});
		$('textarea[class="layui-textarea"]').each(function() {
			$(this).attr('disabled',true);
		});
		$("#materialId").attr('disabled','disabled');
		$("#div_button").hide();
		form.render();
	} else {
		$("#btn_reset").hide();
	}
});
