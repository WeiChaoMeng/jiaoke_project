layui.use(['form', 'layedit', 'laydate'], function() {
	console.log("qc_em_sample_management_add");

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
		myform.Save(data.field);
		return false;
	});

	var myform = {
		materialsData: "",
		SpecificationData: "",
		ManufacturersData: ""
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
	 * 更新厂家下拉框
	 * @param {Object} id
	 * @param {Object} defaultMsg
	 * @param {Object} materialsid
	 */
	myform.initFacturersSelect = function(id, defaultMsg, materialsid) {
		$("#" + id).empty();
		$("#" + id).html('<option value="">' + defaultMsg + '</option>');
		if (materialsid == null || materialsid.length <= 0) {
			form.render();
			return;
		}
		myform.ManufacturersData = dictionaryFunc.getManufacturersData(materialsid, basePath);
		if (myform.ManufacturersData == null || myform.ManufacturersData.length == null) {
			form.render();
			return;
		}
		for (var i = 0; i < myform.ManufacturersData.length; i++) {
			var htmlStr = "<option value='" + myform.ManufacturersData[i].id + "'>" + myform.ManufacturersData[
					i].name +
				"</option>";
			$("#" + id).append(htmlStr);
		}
		form.render();
	}

	/**
	 * 数据保存
	 * @param {Object} saveData
	 */
	myform.Save = function(saveData) {
		saveData['materials'] = $("#materials option:selected").text();
		saveData['manufacturers'] = $("#manufacturers option:selected").text();
		saveData['specification'] = $("#specification option:selected").text();
		saveData['status'] = 0;

		$.ajax({
			type: "POST",
			url: basePath + "/QualityTestSamplingpage/save.do",
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
	 * 材料下拉框选择
	 */
	form.on('select(materials)', function(data) {
		console.log("select(materials)" + data.value);
		myform.initSpecificationSelect("specification", "请选择", data.value);
		myform.initFacturersSelect("manufacturers", "请选择", data.value);
	});
	//初始化下拉框
	myform.initMaterialsSelect("materials", "请选择");
});
