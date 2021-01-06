layui.use(['form', 'layedit', 'laydate'], function() {
	console.log("qualitytestexperimentalstandardvalue_add");

	var form = layui.form,
		layer = layui.layer,
		layedit = layui.layedit,
		laydate = layui.laydate;
	var basePath = $("#path").val();
	//日期
	laydate.render({
		elem: '#tasktime',
		type: 'datetime',
		format: 'yyyy-MM-dd HH:mm:ss',
		value: new Date()
	});
	var dictionaryFunc = parent.layui.dictionary;

	//查看或编辑
	var ID = common.getUrlParam("id");
	var viewType = common.getUrlParam("view");

	//验证规则
	form.verify({
		title: function(value) {
			if (value.length < 5) {
				return '标题至少得5个字符啊';
			}
		},
		pass: [
			/^[\S]{6,12}$/, '密码必须6到12位，且不能出现空格'
		],
		content: function(value) {
			layedit.sync(editIndex);
		}
	});


	//监听提交
	form.on('submit(btnSubmit)', function(data) {
		if (viewType == 2) {
			myform.Update(data.field);
		} else {
			myform.Add(data.field);
		}

		return false;
	});

	var myform = {
		materialsData: "",
		SpecificationData: "",
		ExperimentalData: "",
		ExperimentalItemData: ""
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
	 * 更新规格下拉框
	 * @param {Object} id
	 * @param {Object} defaultMsg
	 * @param {Object} materialsid
	 */
	myform.initSpecificationSelect = function(id, defaultMsg, materialsid) {
		$("#" + id).empty();
		$("#" + id).html('<option value="">' + defaultMsg + '</option>');
		if (materialsid == null || materialsid.length <= 0) {
			form.render();
			return;
		}
		myform.SpecificationData = dictionaryFunc.getSpecificationData(materialsid, basePath);
		if (myform.SpecificationData == null || myform.SpecificationData.length == null) {
			form.render();
			return;
		}
		for (var i = 0; i < myform.SpecificationData.length; i++) {
			var htmlStr = "<option value='" + myform.SpecificationData[i].id + "'>" + myform.SpecificationData[i].name +
				"</option>";
			$("#" + id).append(htmlStr);
		}
		form.render();
	}
	/**
	 * 更新试验下拉框
	 * @param {Object} id
	 * @param {Object} defaultMsg
	 * @param {Object} materialsid
	 */
	myform.initExperimentalSelect = function(id, defaultMsg, materialsid) {
		$("#" + id).empty();
		$("#" + id).html('<option value="">' + defaultMsg + '</option>');
		if (materialsid == null || materialsid.length <= 0) {
			form.render();
			return;
		}
		myform.ExperimentalData = dictionaryFunc.getExperimentalData(materialsid, basePath);
		if (myform.ExperimentalData == null || myform.ExperimentalData.length == null) {
			form.render();
			return;
		}
		for (var i = 0; i < myform.ExperimentalData.length; i++) {
			var htmlStr = "<option value='" + myform.ExperimentalData[i].id + "'>" + myform.ExperimentalData[
					i].name +
				"</option>";
			$("#" + id).append(htmlStr);
		}
		form.render();
	}
	/**
	 * 试验项
	 * @param {Object} id
	 * @param {Object} defaultMsg
	 * @param {Object} expid
	 */
	myform.initExperimentalItemSelect = function(id, defaultMsg, expid) {
		$("#" + id).html('<option value="">' + defaultMsg + '</option>');
		if (expid == null || expid.length <= 0) {
			form.render();
			return;
		}
		myform.ExperimentalItemData = dictionaryFunc.getExperimentalItemData(expid, basePath);
		if (myform.ExperimentalItemData == null || myform.ExperimentalItemData.length == null) {
			form.render();
			return;
		}
		for (var i = 0; i < myform.ExperimentalItemData.length; i++) {
			var htmlStr = "<option value='" + myform.ExperimentalItemData[i].experimentalItem + "'>" + myform.ExperimentalItemData[
					i].experimentalItem +
				"</option>";
			$("#" + id).append(htmlStr);
		}
		form.render();
	}


	/**
	 * 数据保存
	 * @param {Object} saveData
	 */
	myform.Add = function(saveData) {
		saveData['materials'] = $("#materials option:selected").text();
		if ($("#specification").get(0).selectedIndex > 0) {
			saveData['specification'] = $("#specification option:selected").text();
		}
		saveData['experimentalName'] = $("#experimental option:selected").text();
		if ($("#experimentalItem").get(0).selectedIndex > 0) {
			saveData['experimentalItem'] = $("#experimentalItem option:selected").text();
		}
		$.ajax({
			type: "POST",
			url: basePath + "/QualityTestExperimentalStandardvalue/save.do",
			data: saveData,
			dataType: 'JSON',
			success: function(msg) {
				if (msg.code = 200) {
					parent.layer.closeAll();
				} else {
					layer.alert("添加失败");
				}
			}
		})

	}
	/**
	 * 数据保存
	 * @param {Object} saveData
	 */
	myform.Update = function(saveData) {
		saveData['id'] = ID;
		saveData['materials'] = $("#materials option:selected").text();
		if ($("#specification").get(0).selectedIndex > 0) {
			saveData['specification'] = $("#specification option:selected").text();
		} else {
			saveData['specification'] = "";
			saveData['specificationId'] = "";
		}
		saveData['experimentalName'] = $("#experimental option:selected").text();

		$.ajax({
			type: "POST",
			url: basePath + "/QualityTestExperimentalStandardvalue/update.do",
			data: saveData,
			dataType: 'JSON',
			success: function(msg) {
				if (msg.code = 200) {
					parent.layer.closeAll();
				} else {
					layer.alert("添加失败");
				}
			}
		})

	}
	/**
	 * 获取信息
	 * @param {Object} id
	 */
	myform.getStandardValueInfo = function(id) {
		var result = null;
		$.ajax({
			type: "GET",
			async: false,
			url: basePath + "/QualityTestExperimentalStandardvalue/find/" + id + ".do",
			dataType: 'json',
			success: function(msg) {
				result = msg;
				console.log(msg);
			}
		})
		return result;
	}
	/**
	 * 显示信息
	 * @param {Object} data
	 */
	myform.setStandardValueInfo = function(data) {
		myform.initSpecificationSelect("specification", "请选择", data.materialsId);
		myform.initExperimentalSelect("experimental", "请选择", data.materialsId);
		myform.initExperimentalItemSelect("experimentalItem", "请选择", data.experimentalId);
		form.val('myform', data);

		if (data.comparemethod == '-') {
			$("#minvalue_title").html('最小值');
			$("#maxvalue_item").show();
		} else {
			$("#minvalue_title").html('比较值');
			$("#maxvalue_item").hide();
			$("#maxValue").val('0');

		}

		form.render();
	}
	/**
	 * 材料下拉框选择
	 */
	form.on('select(materials)', function(data) {
		console.log("select(materials)" + data.value);
		myform.initSpecificationSelect("specification", "请选择", data.value);
		myform.initExperimentalSelect("experimental", "请选择", data.value);
	});
	/**
	 * 试验下拉框
	 */
	form.on('select(experimental)', function(data) {
		myform.initExperimentalItemSelect("experimentalItem", "请选择", data.value);
		/* if (myform.ExperimentalItemData.length ==1) {
			//$("#experimentalItem").get(0).selectedIndex = 1;
			//$("#experimentalItem").get(0).option[1].selected=true;
		} */
	});

	/**
	 * 比较方法下拉框选择
	 */
	form.on('select(comparemethod)', function(data) {
		console.log("select(comparemethod)" + data.value);
		if (data.value == '-') {
			$("#minvalue_title").html('最小值');
			$("#maxvalue_item").show();
		} else {
			$("#minvalue_title").html('比较值');
			$("#maxvalue_item").hide();
			$("#maxValue").val('0');

		}

	});
	//初始化下拉框
	myform.initMaterialsSelect("materials", "请选择");
	$("#maxvalue_item").hide();

	//查看或编辑获取数据
	if (viewType == 1 || viewType == 2) {
		var expInfo = myform.getStandardValueInfo(ID);
		if (expInfo != null && expInfo.code == 200) {
			myform.setStandardValueInfo(expInfo.data);
		}
	}
	//查看-不可编辑
	if (viewType == 1) {
		$('input[class="layui-input"]').each(function() {
			$(this).attr('disabled', true);
		});
		$('input[type="radio"]').each(function() {
			$(this).attr('disabled', true);
		});
		$('textarea[class="layui-textarea"]').each(function() {
			$(this).attr('disabled', true);
		});
		$("#materials").attr('disabled', 'disabled');
		$("#specification").attr('disabled', 'disabled');
		$("#experimental").attr('disabled', 'disabled');
		$("#experimentalItem").attr('disabled', 'disabled');
		$("#comparemethod").attr('disabled', 'disabled');

		$("#div_button").hide();

		form.render();
	}

});
