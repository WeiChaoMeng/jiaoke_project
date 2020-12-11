layui.use(['form', 'layedit', 'laydate', 'tree', 'util', 'element'], function() {
	console.log("qualitytestexperimentalparam_add");

	var form = layui.form,
		layer = layui.layer,
		layedit = layui.layedit,
		tree = layui.tree,
		util = layui.util,
		laydate = layui.laydate,
		element = layui.element;

	form.render();
	var basePath = $("#path").val();
	var dictionaryFunc = parent.layui.dictionary;

	//查看或编辑
	var expID = common.getUrlParam("id");
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

	var myform = {
		treeData: [],
		selectTreeInfo: null,
		parmConext: [],
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
	 * 根据材料更新试验下拉框
	 * @param {Object} id
	 * @param {Object} defaultMsg
	 */
	myform.initExperimentalSelect = function(id, defaultMsg, mid) {
		var eData = dictionaryFunc.getExperimentalData(mid, basePath);
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
	 * 初始化VIEW
	 */
	myform.initView = function() {
		$("#div_context_right").hide();
		$("#nextimes_value").hide();
		$("#div_selectitem").hide();
		$("#div_valueitem").hide();
		$("#valueitem_value").hide();
		$("#selectitem_value").hide();

		$("#id").val('');
		$("#caption").val('');
		$("#tip").val('');
		$("#device").val('');
		$("#choosedevice").val('');
		$("input:radio[name='nextimes'][value='0']").attr('checked', 'checked');
		$("#nextimes_value").val('');

		$("input:radio[name='setselectitem'][value='0']").attr('checked', 'checked');
		$("#selectitem_caption").val('');
		$("input:radio[name='selectitem_type'][value='0']").attr('checked', 'checked');
		$("#selectitem_value").val('');

		$("input:radio[name='setvalueitem'][value='0']").attr('checked', 'checked');
		$("#valueitem_caption").val('');
		$("input:radio[name='valueitem_type'][value='0']").attr('checked', 'checked');
		$("#valueitem_value").val('');
	}

	/**
	 * 获取试验参数数据
	 */
	myform.getExperimentalParamInfo = function(id) {
		var result = null;
		$.ajax({
			type: "GET",
			async: false,
			url: basePath + "/QualityTestExperimentalParam/find/" + id + ".do",
			dataType: 'json',
			success: function(msg) {
				result = msg;
				console.log(msg);
			}
		})
		return result;
	}
	/**
	 * 显示试验参数数据
	 */
	myform.setExperimentalParamInfo = function(data) {
		form.val('myform', data);
		$("#materialId").val(data['material_id']);
		myform.initExperimentalSelect("experimental", "请选择", data['material_id']);
		$("#experimental").val(data['experimen_id']);
		myform.parmConext = $.parseJSON(data['experimen_param']);
		myform.updateTreeNode();

		myform.selectTreeNode(0);
		form.render();
	}
	/**
	 * 初始化树形
	 */
	myform.initTreeData = function() {
		tree.render({
			elem: '#mytree',
			data: myform.treeData,
			showCheckbox: false,
			id: 'mytree',
			isJump: false,
			edit: ['del'],
			click: function(obj) {
				myform.selectTreeInfo = obj;
				myform.clickStep(obj.data.data);
				//layer.msg('状态：' + obj.state + '<br>节点数据：' + JSON.stringify(data));
			},
			operate: function(obj) {
				var type = obj.type;
				var data = obj.data;
				var elem = obj.elem;
				var id = data.id;
				if (type === 'del') {
					myform.delStep(data);
				}
			}

		});
	}
	/**
	 * @param {Object} num 树形选中
	 */
	myform.selectTreeNode = function(num) {
		var obj = myform.treeData[num];
		if (obj != null) {
			myform.selectTreeInfo = obj;
			myform.clickStep(myform.selectTreeInfo.data);
		}
	}

	myform.getStepID = function() {
		return myform.parmConext.length + 1;
	}

	/**
	 * 刷新树结构
	 */
	myform.updateTreeNode = function() {
		myform.treeData.splice(0, myform.treeData.length);

		for (var i = myform.parmConext.length - 1; i >= 0; i--) {
			var obj = myform.parmConext[i];
			if (obj != null) {
				var treeInfo = {
					title: obj['caption'] + "(" + obj['id'] + ")",
					id: obj['id'],
					num: i,
					data: obj
				}
				myform.treeData.splice(0, 0, treeInfo);
			} else {
				myform.parmConext.splice(i, 1);
			}
		}

		tree.reload('mytree', {
			data: myform.treeData
		});
	}
	/**
	 * 步骤点击事件
	 * @param {Object} data
	 */
	myform.clickStep = function(data) {
		if (myform.selectTreeInfo == null) {
			return;
		}
		myform.initView();

		$("#div_context_right").show();
		$("#id").val(data['id']);
		$("#caption").val(data['caption']);
		$("#tip").val(data['tip']);
		$("#device").val(data['device']);
		$("#choosedevice").val(data['choosedevice']);
		//下一步时间
		var times = data['nextimes'];
		if (times > 0) {
			$("#nextimes_value").show();
			$("input:radio[name='nextimes'][value='1']").attr('checked', 'checked');
			$("#nextimes_value").val(times);
		} else {
			$("input:radio[name='nextimes'][value='0']").attr('checked', 'checked');
		}

		//设置选择项
		var selectItem = data['setselectitem'];
		if (selectItem > 0) {
			$("#div_selectitem").show();
			$("input:radio[name='setselectitem'][value='1']").attr('checked', 'checked');
			$("#selectitem_caption").val(data['selectitem']['caption']);
			$("input:radio[name='selectitem_type'][value='" + data['selectitem']['valuetype'] + "']").attr('checked', 'true');
			if (data['selectitem']['valuetype'] == '1' || data['selectitem']['valuetype'] == '2') {
				$("#selectitem_value").show();
			}
			$("#selectitem_value").val(data['selectitem']['selectvalue']);
		} else {
			$("input:radio[name='setselectitem'][value='0']").attr('checked', 'checked');
		}
		//设置输入项
		var valueItem = data['setvalueitem'];
		if (valueItem > 0) {
			$("#div_valueitem").show();
			$("input:radio[name='setvalueitem'][value='1']").attr('checked', 'checked');
			$("#valueitem_caption").val(data['valueitem']['caption']);
			$("input:radio[name='valueitem_type'][value='" + data['valueitem']['valuetype'] + "']").attr('checked', 'true');
			if (data['valueitem']['valuetype'] == '1' || data['valueitem']['valuetype'] == '2') {
				$("#valueitem_value").show();
			}
			$("#valueitem_value").val(data['valueitem']['selectvalue']);
		} else {
			$("input:radio[name='setvalueitem'][value='0']").attr('checked', 'checked');
		}
		form.render();
	}

	function PrefixInteger(num, n) {
		return (Array(n).join(0) + num).slice(-n);
	}
	/**
	 * 增加步骤
	 */
	myform.addStep = function() {
		var id = myform.getStepID();
		var stepInfo = {
			caption: "第" + id + "步",
			id: '1' + PrefixInteger(id, 5),
			tip: id + "."
		}
		myform.parmConext.push(stepInfo);
		myform.updateTreeNode();
		myform.selectTreeNode(myform.parmConext.length - 1);
	}
	/**
	 * 增加步骤
	 */
	myform.insertStep = function() {
		if (myform.selectTreeInfo == null) {
			layer.msg('请先选择插入步骤位置');
			return;
		}
		var id = myform.getStepID();
		var stepInfo = {
			caption: "第" + id + "步",
			id: '1' + PrefixInteger(id, 5),
			tip: id + "."
		}
		myform.parmConext.splice(myform.selectTreeInfo.data.num, 0, stepInfo);
		myform.updateTreeNode();
		myform.selectTreeNode(myform.selectTreeInfo.data.num);
	}

	/**
	 * 删除步骤
	 */
	myform.delStep = function(data) {
		if (myform.parmConext.length > data.num) {
			myform.parmConext.splice(data.num, 1);
			myform.selectTreeNode(data.num - 1);
		}
	}

	/**
	 * 数据保存
	 */
	myform.Save = function(data) {
		if (myform.selectTreeInfo == null) {
			return;
		}
		var selectItem = $('input[name="setselectitem"]:checked').val();
		var type = $('input[name="selectitem_type"]:checked').val();
		if (selectItem > 0 && (type == '1' || type == '2')) {
			if ($("#selectitem_value").val().length <= 0) {
				layer.msg('请输入设置项选择值');
				return;
			}
		}
		var valueItem = $('input[name="setvalueitem"]:checked').val();
		var type = $('input[name="valueitem_type"]:checked').val();
		if (valueItem > 0 && (type == '1' || type == '2')) {
			if ($("#valueitem_value").val().length <= 0) {
				layer.msg('请输入输入项选择值');
				return;
			}
		}

		var saveData = {};
		saveData['id'] = $("#id").val();
		saveData['caption'] = $("#caption").val();
		saveData['tip'] = $(
			"#tip").val();
		saveData['device'] = $("#device").val();
		saveData['choosedevice'] = $("#choosedevice").val();
		//下一步时间
		var times = $('input[name="nextimes"]:checked').val();
		if (times > 0) {
			var time_Value = $("#nextimes_value").val();
			if (time_Value.length > 0) {
				saveData['nextimes'] = $("#nextimes_value").val();
			} else {
				layer.msg("请输入下一步时间");
				return;
			}
		} else {
			saveData['nextimes'] = 0
		}
		//设置选择项
		var selectItem = $('input[name="setselectitem"]:checked').val();
		if (selectItem > 0) {
			saveData['setselectitem'] = 1;
			saveData['selectitem'] = {
				caption: $("#selectitem_caption").val(),
				valuetype: $('input[name="selectitem_type"]:checked').val(),
				selectvalue: $("#selectitem_value").val()
			}
		} else {
			saveData['setselectitem'] = 0;
		}
		//设置输入项
		var valueItem = $('input[name="setvalueitem"]:checked').val();
		if (valueItem > 0) {

			saveData['setvalueitem'] = 1;
			saveData['valueitem'] = {
				caption: $("#valueitem_caption").val(),
				valuetype: $('input[name="valueitem_type"]:checked').val(),
				selectvalue: $("#valueitem_value").val()
			}
		} else {
			saveData['setvalueitem'] = 0;
		}
		myform.parmConext[myform.selectTreeInfo.data.num] = saveData;
		myform.updateTreeNode();
		layer.msg("保存成功");
		//layer.msg(JSON.stringify(saveData));
	}
	/**
	 * 数据提交
	 * @param {Object} saveData
	 */
	myform.Commit = function(data) {
		var saveData = {
			id: expID,
			materialId: data.materialId,
			materialName: $("#materialId option:selected").text(),
			experimenId: data.experimental,
			experimenName: $("#experimental option:selected").text(),
			formula: data.formula,
			experimenParam: JSON.stringify(myform.parmConext)
		}

		if (viewType == 2) { //编辑
			saveData['updateId'] = expID;
			$.ajax({
				type: "POST",
				async: false,
				url: basePath + "/QualityTestExperimentalParam/update.do",
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
		} else { //新增
			saveData['status'] = 0;
			$.ajax({
				type: "POST",
				url: basePath + "/QualityTestExperimentalParam/save.do",
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
	}

	//材料下拉框选择
	form.on('select(materials)', function(data) {
		console.log("select(materials)" + data.value);
		myform.initExperimentalSelect("experimental", "请选择", data.value);

	});
	//增加步骤
	$('#btn_addStep').on('click', function() {
		myform.addStep();
	});
	//增加步骤
	$('#btn_insertStep').on('click', function() {
		myform.insertStep();
	});

	//删除步骤
	$('#btn_delStep').on('click', function() {
		myform.delStep();
	});
	//保存
	$('#btn_Save').on('click', function() {
		myform.Save();
	});
	//提交
	form.on('submit(btnSubmit)', function(data) {
		myform.Commit(data.field);
		return false;
	});
	// radio 下一步时间点击事件
	form.on("radio(nextimes)", function(data) {
		var value = data.value
		if (value == "1") {
			$("#nextimes_value").show();
		} else {
			$("#nextimes_value").hide();
		}
	});
	// radio 设置选择项点击事件
	form.on("radio(setselectitem)", function(data) {
		var value = data.value;
		if (value == 1) {
			$("#div_selectitem").show();
		} else {
			$("#div_selectitem").hide();
		}
	});
	// radio 设置输入值点击事件
	form.on("radio(setvalueitem)", function(data) {
		var value = data.value;
		if (value == 1) {
			$("#div_valueitem").show();
		} else {
			$("#div_valueitem").hide();
		}
	});
	//值类型
	form.on("radio(selectitem_type)", function(data) {
		var value = data.value;
		if (value == 1 || value == 2) {
			$("#selectitem_value").show();
		} else {
			$("#selectitem_value").hide();
		}
	});
	//值类型
	form.on("radio(valueitem_type)", function(data) {
		var value = data.value;
		if (value == 1 || value == 2) {
			$("#valueitem_value").show();
		} else {
			$("#valueitem_value").hide();
		}
	});

	//初始化材料下拉框
	myform.initMaterialsSelect("materialId", "请选择");
	//初始化树形步骤
	myform.initTreeData();
	//初始化控件
	myform.initView();

	//查看或编辑获取数据
	if (viewType == 1 || viewType == 2) {
		var expInfo = myform.getExperimentalParamInfo(expID);
		if (expInfo != null && expInfo.code == 200) {
			myform.setExperimentalParamInfo(expInfo.data);
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
		$("#materialId").attr('disabled', 'disabled');
		$("#experimental").attr('disabled', 'disabled');
		$("#div_button").hide();

		tree.reload('mytree', {
			data: myform.treeData,
			edit: []
		});
		form.render();
	}


});
