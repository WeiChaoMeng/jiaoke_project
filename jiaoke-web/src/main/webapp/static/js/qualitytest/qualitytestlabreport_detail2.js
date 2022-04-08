layui.use(['form', 'table', 'laydate'], function() {
	var form = layui.form;
	var dictionary = parent.layui.dictionary;
	var $ax = parent.layui.ax;
	var $ = layui.$;
	var laydate = layui.laydate;
	var table = layui.table;
	var basePath = $("#path").val();
	form.render();
	form.render('checkbox');
	//日期
	laydate.render({
		elem: '#sampling_create_time',
		type: 'datetime',
		format: 'yyyy年MM月dd日'
	});

	laydate.render({
		elem: '#reportDate',
		type: 'datetime',
		format: 'yyyy年MM月dd日'
	});
	console.log("qualitytestlabreport_detail1.js");
	var expID = common.getUrlParam("num");
	var myForm = {
		tableId: "mytable",
		tableId_sf: "mytable_sf",
		expParam: null,
		reportValue: [],
		StandValue: []
	};
	/**
	 * 获取试验报告信息
	 * @param {Object} id
	 */
	myForm.getLabReportInfo = function(num) {
		var result = null;
		$.ajax({
			type: "GET",
			async: false,
			url: basePath + "/QualityTestLabReport/findbyTicketNum/" + num + ".do",
			dataType: 'json',
			success: function(msg) {
				result = msg;
				console.log(msg);
			}
		})
		return result;
	}
/**
     * 获取登录人员信息
     * @param {Object} id
     */
    myForm.getLabReportUserInfo = function () {
        var result = null;
        $.ajax({
            type: "GET",
            async: false,
            url: basePath + "/QualityTestLabReport/UserInfo.do",
            dataType: 'json',
            success: function (msg) {
                result = msg;
                console.log(msg);
            }
        })
        return result;
    }

	/**
	 * 获取试验结果信息
	 * @param {Object} id	 
	 */
	myForm.getLabReportInfoValue = function(id) {
		var queryData = {
			orderTicketNum: expID
		};
		var dataInfo = null;
		$.ajax({
			type: "GET",
			async: false,
			url: basePath + "/QualityTestExperimentalValue/list.do",
			data: queryData,
			dataType: 'json',
			success: function(msg) {
				if (msg.count = 200) {
					dataInfo = msg.data;
				}
			}
		})

		$("#mytable").html('');
		if (dataInfo.length <= 0) {
			return;
		}
		var msg = "";
		msg = "<thead><tr><th>项目</th>";
		for (var i = 0; i < dataInfo.length; i++) {
			msg += "<th>" + dataInfo[i]['experimentalType'] + "</th>";
		}
		msg += "</tr></thead>";
		msg += "<tbody><tr><td>单位</td>";
		var value = "";
		for (var i = 0; i < dataInfo.length; i++) {
			value = dataInfo[i]['unit1'];
			if (value == undefined) {
				value = "";
			}
			msg += "<td>" + value + "</td>";
		}
		msg += "</tr><td>规范值</td>";
		for (var i = 0; i < dataInfo.length; i++) {
			value = dataInfo[i]['requirements'];
			if (value == undefined) {
				value = "";
			}
			msg += "<td>" + value + "</td>";
		}
		msg += "</tr><td>实测值</td>";
		for (var i = 0; i < dataInfo.length; i++) {
			value = dataInfo[i]['value'];
			if (value == undefined) {
				value = "";
			}
			msg += "<td>" + value + "</td>";
		}
		msg += "</tr></tbody>";
		$("#mytable").append(msg);

	}
	/**
	 * 获取规范值
	 */
	myForm.getLabReport_SF_StandValue = function() {
		myForm.StandValue = [];
		var queryData = {
			experimentalId: 17280350,
			specification: myForm.reportValue.specification
		};
		$.ajax({
			type: "GET",
			async: false,
			url: basePath + "/QualityTestExperimentalStandardvalue/list.do",
			data: queryData,
			dataType: 'json',
			success: function(msg) {
				if (msg.count = 200) {
					myForm.StandValue = msg.data;
				}
			}
		})
	}

	/**
	 * 获取沥青混合料筛分数据
	 * @param {Object} num
	 */
	myForm.getLabReportInfoValue_SF = function(num) {
		var queryData = {
			orderTicketNum: expID
		};
		var dataInfo = null;
		$.ajax({
			type: "GET",
			async: false,
			url: basePath + "/QualityTestExperimentalValueCjlSf/list.do",
			data: queryData,
			dataType: 'json',
			success: function(msg) {
				if (msg.count = 200) {
					dataInfo = msg.data;
				}
			}
		})

		$("div_sf").show();
		$("#mytable_sf").html('');
		var msg = "";
		msg = "<thead><tr><th>筛孔</th>";
		msg +=
			"<th>31.5</th><th>26.5</th><th>19</th><th>16</th><th>13.2</th><th>9.5</th><th>4.75</th><th>2.36</th><th>1.18</th><th>0.6</th><th>0.3</th><th>0.15</th><th>0.075</th>";
		msg += "</tr></thead>";
		msg += "<tbody><tr><td>规范值</td>";

		msg += "<td>" + myForm.getStandValue('31.5', myForm.StandValue) + "</td>";
		msg += "<td>" + myForm.getStandValue('26.5', myForm.StandValue) + "</td>";
		msg += "<td>" + myForm.getStandValue('19', myForm.StandValue) + "</td>";
		msg += "<td>" + myForm.getStandValue('16', myForm.StandValue) + "</td>";
		msg += "<td>" + myForm.getStandValue('13.2', myForm.StandValue) + "</td>";
		msg += "<td>" + myForm.getStandValue('9.5', myForm.StandValue) + "</td>";
		msg += "<td>" + myForm.getStandValue('4.75', myForm.StandValue) + "</td>";
		msg += "<td>" + myForm.getStandValue('2.36', myForm.StandValue) + "</td>";
		msg += "<td>" + myForm.getStandValue('1.18', myForm.StandValue) + "</td>";
		msg += "<td>" + myForm.getStandValue('0.6', myForm.StandValue) + "</td>";
		msg += "<td>" + myForm.getStandValue('0.3', myForm.StandValue) + "</td>";
		msg += "<td>" + myForm.getStandValue('0.15', myForm.StandValue) + "</td>";
		msg += "<td>" + myForm.getStandValue('0.075', myForm.StandValue) + "</td>";

		msg += "</tr><td>实测值</td>";
		msg += "<td>" + myForm.getValue('sK315', dataInfo) + "</td>";
		msg += "<td>" + myForm.getValue('sK265', dataInfo) + "</td>";
		msg += "<td>" + myForm.getValue('sK19', dataInfo) + "</td>";
		msg += "<td>" + myForm.getValue('sK16', dataInfo) + "</td>";
		msg += "<td>" + myForm.getValue('sK132', dataInfo) + "</td>";
		msg += "<td>" + myForm.getValue('sK95', dataInfo) + "</td>";
		msg += "<td>" + myForm.getValue('sK475', dataInfo) + "</td>";
		msg += "<td>" + myForm.getValue('sK236', dataInfo) + "</td>";
		msg += "<td>" + myForm.getValue('sK118', dataInfo) + "</td>";
		msg += "<td>" + myForm.getValue('sK06', dataInfo) + "</td>";
		msg += "<td>" + myForm.getValue('sK03', dataInfo) + "</td>";
		msg += "<td>" + myForm.getValue('sK015', dataInfo) + "</td>";
		msg += "<td>" + myForm.getValue('sK0075', dataInfo) + "</td>";
		msg += "</tr></tbody>";
		$("#mytable_sf").append(msg);

	}
	/**
	 * 获取字段值
	 * @param {Object} column
	 * @param {Object} data
	 */
	myForm.getValue = function(column, data) {
		var value = "";
		if (data != null && data.length > 0) {
			value = data[0][column];
			if (value == undefined) {
				value = "";
			}
		}
		return value;
	}
	/**
	 * 获取规范值
	 * @param {Object} column
	 * @param {Object} data
	 */
	myForm.getStandValue = function(column, data) {
		var standValue = "-";
		for (var i = 0; i < data.length; i++) {
			var dataValue = data[i];
			if (dataValue['experimentalItem'] == column) {
				standValue = dataValue['requirements'];
				if (standValue == undefined || standValue.length == 0) {
					standValue = "-";
				}
				break;
			}

		}
		return standValue;
	}
	/**
	 * 显示筛分数据
	 * @param {Object} data
	 */
	myForm.showSFTable = function(data) {
		if (data.length > 0) {
			$('#div_sf').show();
		} else {
			$('#div_sf').hide();
		}
	}
	/**
	 * 显示试验信息
	 * @param {Object} data
	 */
	myForm.setLabReportIInfo = function(data, loginUserInfo) {
		if (loginUserInfo.position.indexOf("副总经理")>-1 && data.experimentStatus == 21 && data.chargePerson == null) {
		    data.chargePerson = loginUserInfo.nickname;
		} else if (loginUserInfo.position.indexOf("部长")>-1 && data.experimentStatus == 2 && data.checkPerson == null) {
		    data.checkPerson = loginUserInfo.nickname;
		} else if
		(data.reportPerson == null && (loginUserInfo.position == "试验员" && data.experimentStatus == 1) ||
		    (loginUserInfo.position == "实验员" && data.experimentStatus == 1)) {
		    data.reportPerson = loginUserInfo.nickname;
		    var date = new Date();
		    data.reportDate = date.toLocaleDateString();
		}
		
		form.val('myform', data);
		laydate.render({
			elem: '#sampling_create_time',
			type: 'datetime',
			format: 'yyyy年MM月dd日',
			value: new Date(data['samplingDate'])
		});
		laydate.render({
			elem: '#reportDate',
			type: 'date',
			format: 'yyyy年MM月dd日',
			value: new Date(data['reportDate'])
		});
		$("#Experimental_GC").val("《公路工程沥青及沥青混合料试验规程》JTG E20-2011");
		form.render();
	}

	/**
	 * 控制提交按钮和审核按钮是否显示
	 * @param {Object} data
	 */
	myForm.buttonVisible = function(expData,loginUserInfo) {
		/* $('#div_check').hide();
		$('#div_commit').hide();
		if (data.experimentStatus == undefined || data.experimentStatus == 0) {
			//$('#div_commit').show();
		} else if (data.experimentStatus == 1) {
			$('#div_check').show();
		} */
		$('#div_commit').hide();
		$("#btn_check").hide();
		if (expData.experimentStatus != 3 &&
		    (loginUserInfo.position == "试验员" && expData.experimentStatus == 1) ||
		    (loginUserInfo.position == "实验员" && expData.experimentStatus == 1)) {
		    $('#div_check_zf').show();
		
		} else {
		    $('#div_check_zf').hide();
		}
		if (expData.experimentStatus != 3 &&
		    ((loginUserInfo.position.indexOf("副总经理")>-1 && expData.experimentStatus == 21) ||
		        (loginUserInfo.position.indexOf("部长")>-1 && expData.experimentStatus == 2) ||
		        (loginUserInfo.position == "试验员" && expData.experimentStatus == 1) ||
		        (loginUserInfo.position == "实验员" && expData.experimentStatus == 1))) {
		    $("#btn_check").show();
		}
	}
	/**
	 * 试验报告提交
	 */
	myForm.commit = function() {
		var saveData = {
			id: myForm.reportValue.id,
			experimentStatus: 1
		}
		$.ajax({
			type: "POST",
			url: basePath + "/QualityTestLabReport/update.do",
			data: saveData,
			dataType: 'JSON',
			success: function(msg) {
				if (msg.code = 200) {
					layer.msg("提交成功");
					parent.layer.closeAll();
				} else {
					layer.msg("提交失败");
				}
			}
		})
	}

	/**
	 * 试验报告确认
	 */
	myForm.check = function() {
		var nexperimentStatus = 1;// 1待试验员确认  2 待部长审核 21 待负责人确认  3 已经完成
		if (loginUserInfo.data.position.indexOf("副总经理")>-1 && expInfo.data.experimentStatus == 21) {
		    nexperimentStatus = 3;
		} else if (loginUserInfo.data.position.indexOf("部长")>-1 && expInfo.data.experimentStatus == 2) {
		    nexperimentStatus = 21;
		} else if (loginUserInfo.data.position == "试验员" && expInfo.data.experimentStatus == 1) {
		    nexperimentStatus = 2;
		}
		
		var noticeDep = "",
			noticeDepStr = "";
		if ($("#send_sc")[0].checked && $("#send_cl")[0].checked) {
			noticeDep = 0;
			noticeDepStr = "发送材料部、生产设备部";
		} else if ($("#send_cl")[0].checked) {
			noticeDep = 1;
			noticeDepStr = "发送材料部";
		} else if ($("#send_sc")[0].checked) {
			noticeDep = 2;
			noticeDepStr = "发送生产设备部";
		}
		var saveData = {
			id: myForm.reportValue.id,
			experimentStatus: nexperimentStatus,
			noticeDep: noticeDep,
			noticeDepStr: noticeDepStr
		}
		$.ajax({
			type: "POST",
			url: basePath + "/QualityTestLabReport/update.do",
			data: saveData,
			dataType: 'JSON',
			success: function(msg) {
				if (msg.code = 200) {
					layer.msg("确认完成");
					parent.layer.closeAll();
				} else {
					layer.msg("确认失败");
				}
			}
		})
	}
	/**
	 * 绑定提交按钮
	 */
	$('#btn_commit').on('click', function() {
		myForm.commit();
	});
	/**
	 * 绑定确认按钮
	 */
	$('#btn_check').on('click', function() {
		myForm.check();
	});
	var expInfo = myForm.getLabReportInfo(expID);
    var loginUserInfo = myForm.getLabReportUserInfo();
	
	if (expInfo != null && expInfo.code == 200) {
		myForm.reportValue = expInfo.data;
		myForm.setLabReportIInfo(expInfo.data,loginUserInfo.data);
		myForm.getLabReport_SF_StandValue();
		myForm.getLabReportInfoValue(expID);
		myForm.getLabReportInfoValue_SF(expInfo.data.materialsNum, expID);
		myForm.buttonVisible(expInfo.data,loginUserInfo.data);
	}

});
