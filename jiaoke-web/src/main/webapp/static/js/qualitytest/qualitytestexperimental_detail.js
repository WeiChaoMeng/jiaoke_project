layui.use(['form', 'laydate'], function() {
	var form = layui.form;
	var dictionary = parent.layui.dictionary;
	var $ax = parent.layui.ax;
	var $ = layui.$;
	var laydate = layui.laydate;
	var basePath = $("#path").val();

	//日期
	laydate.render({
		elem: '#sampling_create_time',
		type: 'datetime',
		format: 'yyyy-MM-dd HH:mm:ss'
	});
	console.log("qualitytestexperimental_detail.js");
	var expID = common.getUrlParam("id");

	var myForm = {
		expParam: null,
		expValue: []
	};
	/**
	 * 获取试验信息
	 * @param {Object} id
	 */
	myForm.getExperimentalInfo = function(id) {
		var result = null;
		$.ajax({
			type: "GET",
			async: false,
			url: basePath + "/QualityTestExperimental/find/" + id + ".do",
			dataType: 'json',
			success: function(msg) {
				result = msg;
				console.log(msg);
			}
		})
		return result;
	}
	/**
	 * 获取试验参数信息
	 * @param {Object} id	 
	 */
	myForm.getExperimentalParmInfo = function(id) {
		var result = null;
		$.ajax({
			type: "GET",
			async: false,
			url: basePath + "/QualityTestExperimentalParam/find/" + id + ".do",
			dataType: 'json',
			success: function(msg) {
				console.log(msg);
				if (msg.code = 200) {
					result = msg.data;
				}
			}
		})
		return result;
	}

	/**
	 * 显示试验信息
	 * @param {Object} data
	 */
	myForm.setExperimentalInfo = function(data) {
		if (data['experimental_content'] != null && data['experimental_content'].length > 0) {
			myForm.expValue = $.parseJSON(data.experimental_content); //$.parseJSON(data['experimental_content']);
		}
		if (data['experimental_result'] == -1) {
			data['result_show'] = "不合格";
		}
		if (data['experimental_result'] == 1) {
			data['result_show'] = "合格";
		}
		form.val('experimental', data);
		laydate.render({
			elem: '#sampling_create_time',
			type: 'datetime',
			format: 'yyyy-MM-dd HH:mm:ss',
			value: new Date(data['sampling_create_time'])
		});
		if (data['experimental_value'] != null && data['experimental_value'].length > 0) {
			var experimental_value = $.parseJSON(data.experimental_value);
			var msg = "";
			for (var i = 0; i < experimental_value.length; i++) {
				msg += experimental_value[i]['name'] + " : " + experimental_value[i]['result'] + "     ";
			}
			$('#experimental_value').val(msg);
		} else {
			$('#experimental_value').val('');
		}
	}
	/**
	 * 获取某步存储的数据
	 * @param {Object} id
	 */
	myForm.getStepValue = function(id) {
		var result = null;
		if (myForm.expValue != null && myForm.expValue.length > 0) {
			for (var i = 0; i < myForm.expValue.length; i++) {
				var stepValue = myForm.expValue[i];
				if (stepValue['id'] == id) {
					result = stepValue;
					break;
				}
			}
		}
		return result;
	}
	/**
	 * 显示试验步骤
	 * @param {Object} data
	 */
	myForm.setExperimentalStep = function(data) {
		$("#btn_expStep").html('');
		myForm.expParam = null;
		if (data != null && data.experimen_param != null) {
			myForm.expParam = $.parseJSON(data.experimen_param);
			if (myForm.expParam.length > 0) {
				var msg = "";
				//按钮
				for (var i = 0; i < myForm.expParam.length; i++) {
					var id = myForm.expParam[i]['id'];
					msg +=
						'<button style="width:50px; " type="button" class="layui-btn" name="btn_Step"  id="' +
						id + '">' + (i + 1) +
						'</button>';
				}
				$("#btn_expStep").append(msg);
				//样式/事件
				for (var i = 0; i < myForm.expParam.length; i++) {
					var id = myForm.expParam[i]['id'];
					if (myForm.getStepValue(id) == null) {
						$('#' + id).addClass('layui-btn-disabled');
					} else {
						layui.$('#' + id).on('click', function() {
							var that = $(this);
							myForm.btnStepClick(that);
						});
						$('#' + id).css("border-bottom", "1px solid rgba(255,255,255,.5)")
					}
				}
				myForm.showStepValue(100001);
				return;
			}
		}
		myForm.setExperimentalNull();
	}
	/**
	 * 试验获取错误
	 */
	myForm.setExperimentalNull = function() {
		$("#div_expStepValue").html('');
		$("#div_expStepValue").html('<p style="font-size: 18px;">试验步骤未设置，请联系管理员！</p>');
	}


	/**
	 * 点击步骤
	 */
	myForm.btnStepClick = function(sender) {
		var btn_id = sender[0].id;
		myForm.showStepValue(btn_id);
	}
	/**
	 * 显示步骤值
	 */
	myForm.showStepValue = function(btn_id) {
		$('button[name="btn_Step"]').each(function() {
			$(this).removeClass("layui-btn-danger");
		});
		$("#" + btn_id).addClass("layui-btn-danger");
		if (myForm.expParam != null && myForm.expParam.length > 0) {
			for (var i = 0; i < myForm.expParam.length; i++) {
				var stepInfo = myForm.expParam[i];
				var stepid = stepInfo['id'];
				if (stepid == btn_id) {

					$("#stepvalue_tip").html(stepInfo['tip']);
					//设备
					if (stepInfo['device'] != null && stepInfo['device'] != undefined && stepInfo['device'] != "") {
						$("#div_value_device").show();
					} else {
						$("#div_value_device").hide();
					}
					//选择项
					if (stepInfo['setselectitem'] == 1) {
						$("#div_value_select").show();
						$("#div_value_select_name").html(stepInfo.selectitem['caption']);

					} else {
						$("#div_value_select").hide();
					}
					//输入项
					if (stepInfo['setvalueitem'] == 1) {
						$("#div_value_input").show();
						$("#div_value_input_name").html(stepInfo.valueitem['caption']);

					} else {
						$("#div_value_input").hide();
					}

					$("#div_expStepValue").show();
				}
			}
		} else {
			$("#div_expStepValue").hide();
		}

		//赋值
		var stepValue = myForm.getStepValue(btn_id);
		if (stepValue != null) {
			if (stepValue['title']!=undefined) {
				$("#stepvalue_tip").html(stepValue['title']);
			}
			var deviceValue = stepValue['device'];
			if ((!(deviceValue === undefined)) && deviceValue != null && deviceValue.length > 0) {
				deviceValue = stepValue['device'].replace("/", "、");
			}
			$("#stepvalue_device").val(deviceValue);
			$("#div_value_select_value").val(stepValue['selectitemvalue']);
			$("#div_value_input_value").val(stepValue['valueitemvalue']);
			$("#record_time").html(stepValue['recordstime']);
			$("#record_user").html(stepValue['recordsuser']);
		} else {
			$("#stepvalue_device").val('');
			$("#div_value_select_value").val('');
			$("#div_value_input_value").val('');
			$("#record_time").html("");
			$("#record_user").html("");
		}

		/* var havValue = false;
		if (myForm.expValue != null && myForm.expValue.length > 0) {
			for (var i = 0; i < myForm.expValue.length; i++) {
				var stepValue = myForm.expValue[i];
				if (stepValue['id'] == btn_id) {
					$("#stepvalue_device").val(stepValue['device'].replace("/", "、"));
					$("#div_value_select_value").val(stepValue['selectitemvalue']);
					$("#div_value_input_value").val(stepValue['valueitemvalue']);
					$("#record_time").html(stepValue['recordstime']);
					$("#record_user").html(stepValue['recordsuser']);
					havValue = true;
					break;
				}
			}
		}
		if (havValue == false) {
			$("#stepvalue_device").val('');
			$("#div_value_select_value").val('');
			$("#div_value_input_value").val('');
			$("#record_time").html("");
			$("#record_user").html("");
		} */
	}

	var expInfo = myForm.getExperimentalInfo(expID);

	if (expInfo != null && expInfo.code == 200) {
		myForm.setExperimentalInfo(expInfo.data);

		var mID = expInfo.data['experimental_param_id'];
		var eData = myForm.getExperimentalParmInfo(mID);
		myForm.setExperimentalStep(eData);

	} else {
		myForm.setExperimentalNull();
	}
});
