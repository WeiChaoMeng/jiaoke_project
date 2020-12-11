layui.use(['form', 'layedit', 'laydate'], function() {
	console.log("qualitytestspecificationdictionary_add");

	var form = layui.form,
		layer = layui.layer,
		layedit = layui.layedit,
		laydate = layui.laydate;
		
	form.render();
	var basePath = $("#path").val();
	var dictionaryFunc = parent.layui.dictionary;	

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
	 * 数据保存
	 * @param {Object} saveData
	 */
	myform.Save = function(saveData) {
		saveData['materialName'] = $("#materialId option:selected").text();

		$.ajax({
			type: "POST",
			url: basePath + "/QualityTestSpecificationDictionary/save.do",
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
	//初始化下拉框
	myform.initMaterialsSelect("materialId", "请选择");
});
