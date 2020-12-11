layui.use(['form', 'table', 'laydate', 'dictionary'], function() {
	var form = layui.form;
	var table = layui.table;
	var $ = layui.$;
	var dictionaryFunc = layui.dictionary;
	var $ax = layui.ax;
	var basePath = $("#path").val();
	var laydate = layui.laydate;
	laydate.render({
		elem: '#begindate'
	});
	laydate.render({
		elem: '#enddate'
	});

	dictionaryFunc.getMaterialsToSelect("materials", "请选择", basePath);

	console.log("qualitytestexperimental_passrate.js");
	var myForm = {
		CJL_Data: null,
		XJL_Data: null,
		KF_Data: null
	};
	/**
	 * 获取粗集料数据
	 */
	myForm.getCJLData = function(searchData) {
		myForm.chartData = null;
		var result = null;
		$.ajax({
			type: "GET",
			async: false,
			url: basePath + "/QualityTestReportAvg/CJL.do",
			data: searchData,
			dataType: 'json',
			success: function(msg) {
				if (msg.code == 200) {
					result = msg.data;
					myForm.CJL_Data = msg.data;
				}
				console.log(msg);
			}
		})
		return result;
	}
	/**
	 * 获取细集料数据
	 */
	myForm.getXJLData = function(searchData) {
		myForm.chartData = null;
		var result = null;
		$.ajax({
			type: "GET",
			async: false,
			url: basePath + "/QualityTestReportAvg/XJL.do",
			data: searchData,
			dataType: 'json',
			success: function(msg) {
				if (msg.code == 200) {
					result = msg.data;
					myForm.XJL_Data = msg.data;
				}
				console.log(msg);
			}
		})
		return result;
	}
	/**
	 * 获取矿粉数据
	 */
	myForm.getKFData = function(searchData) {
		myForm.chartData = null;
		var result = null;
		$.ajax({
			type: "GET",
			async: false,
			url: basePath + "/QualityTestReportAvg/KF.do",
			data: searchData,
			dataType: 'json',
			success: function(msg) {
				if (msg.code == 200) {
					result = msg.data;
					myForm.KF_Data = msg.data;
				}
				console.log(msg);
			}
		})
		return result;
	}
	myForm.display_title = function(title) {
		var msg =
			'<div class="layui-form-item" style="margin:0 auto;"><label class="layui-form-label" style="width: 100%;text-align: center;font-size: 18px;">' +
			title + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></div>' +
			'<div class="layui-form-item" style=" width:80%;margin:0 auto;">' +
			'<label class="layui-form-label" style="text-align: left; margin-left: 1px;font-size: 14px;">试验项目</label>' +
			'<label class="layui-form-label" style="text-align: left; margin-left: 85px;font-size: 14px;">平均值</label>' +
			'</div>';
		return msg;
	}
	myForm.display_item1 = function(id, div_name, colum, value) {
		if (value == undefined) {
			value = 0;
		}
		var msg =
			'<div id="' + id +
			'" class="layui-form-item" name="' + div_name +
			'" style=" width:80%;margin:0 auto;margin-bottom: 5px; text-align:center; border:1px solid #e6e6e6; border-radius:5px;">' +
			'<label class="layui-form-label" style="width:0px;margin-top: 4px;"><span class="layui-badge-dot layui-bg-green"' +
			'style="width:12px;height:12px"></span></label>' +
			'<label class="layui-form-label" style="text-align: left; margin-left: 1px;font-size: 15px; width:25%">' + colum +
			'</label>' +
			'<label class="layui-form-label" style="text-align: left; margin-left: 50px;font-size: 15px;">' + value +
			'</label>' +
			'</div>';
		return msg;
	}
	myForm.display_item = function(id, div_name, colum, value) {
		if (value == undefined) {
			value = 0;
		}
		var msg =
			'<div id="' + id +
			'" class="layui-form-item" name="' + div_name +
			'" style=" width:80%;margin:0 auto;margin-bottom: 5px; text-align:center; border:1px solid #e6e6e6; border-radius:5px;">' +
			'<label class="layui-form-label" style="width:0px;margin-top: 4px;"><span class="layui-badge-dot layui-bg-green"' +
			'style="width:12px;height:12px"></span></label>' +
			'<label class="layui-form-label" style="width:25%;text-align: left; margin-left: 1px;font-size: 15px; ">' + colum +
			'</label>' +
			'<label class="layui-form-label" style="width:10%;text-align: left; margin-left: 50px;font-size: 15px;">' + value +
			'</label>' +
			'</div>';
		return msg;
	}
	/**
	 * 显示粗集料信息
	 */
	myForm.display_CJLData = function() {
		if (myForm.CJL_Data == null) {
			return;
		}
		var msg = '';
		$("#div_avg_value").append('<div id="div_cjl" class="layui-row"></div>');
		var div_name = "";
		for (var i = 0; i < myForm.CJL_Data.length; i++) {
			var spec = myForm.CJL_Data[i]['specification'];
			msg +=
				'<div class="layui-col-sm3 layui-col-space10" style=" border:1px solid #e6e6e6; border-radius:5px;box-shadow: 1px 1px 5px #e6e6e6;">';
			if (i == 0) {
				msg += myForm.display_title("粗集料");
			} else {
				msg += myForm.display_title("粗集料（" + spec + "）");
			}
			div_name = "pro_item_cjl" + i;

			msg += myForm.display_item('sK315@2@' + spec, div_name, '31.5', myForm.CJL_Data[i]['sk315']);
			msg += myForm.display_item('sK265@2@' + spec, div_name, '26.5', myForm.CJL_Data[i]['sk265']);
			msg += myForm.display_item('sK19@2@' + spec, div_name, '19', myForm.CJL_Data[i]['sk19']);
			msg += myForm.display_item('sK16@2@' + spec, div_name, '16', myForm.CJL_Data[i]['sk16']);
			msg += myForm.display_item('sK132@2@' + spec, div_name, '13.2', myForm.CJL_Data[i]['sk132']);
			msg += myForm.display_item('sK95@2@' + spec, div_name, '9.5', myForm.CJL_Data[i]['sk95']);
			msg += myForm.display_item('sK475@2@' + spec, div_name, '4.75', myForm.CJL_Data[i]['sk475']);
			msg += myForm.display_item('sK236@2@' + spec, div_name, '2.36', myForm.CJL_Data[i]['sk236']);
			msg += myForm.display_item('sK118@2@' + spec, div_name, '1.18', myForm.CJL_Data[i]['sk118']);
			msg += myForm.display_item('sK06@2@' + spec, div_name, '0.6', myForm.CJL_Data[i]['sk06']);
			msg += myForm.display_item('sK03@2@' + spec, div_name, '0.3', myForm.CJL_Data[i]['sk03']);
			msg += myForm.display_item('sK015@2@' + spec, div_name, '0.15', myForm.CJL_Data[i]['sk015']);
			msg += myForm.display_item('sK0075@2@' + spec, div_name, '0.075', myForm.CJL_Data[i]['sk0075']);
			msg += myForm.display_item('bgxdmd1@2@' + spec, div_name, '表观相对密度', myForm.CJL_Data[i]['bgxdmd1']);
			msg += myForm.display_item('bgxdmd2@2@' + spec, div_name, '表干相对密度', myForm.CJL_Data[i]['bgxdmd2']);
			msg += myForm.display_item('mtjxdmd@2@' + spec, div_name, '毛体积相对密度', myForm.CJL_Data[i]['mtjxdmd']);
			msg += myForm.display_item('zpzkl@2@' + spec, div_name, '针片状颗粒', myForm.CJL_Data[i]['zpzkl']);
			msg += myForm.display_item('ysz@2@' + spec, div_name, '压碎值', myForm.CJL_Data[i]['ysz']);
			msg += myForm.display_item('rrkl@2@' + spec, div_name, '软弱颗粒', myForm.CJL_Data[i]['rrkl']);
			msg += myForm.display_item('mh@2@' + spec, div_name, '磨耗', myForm.CJL_Data[i]['mh']);
			msg += '</div>';

			$("#div_cjl").append(msg);
			$('div[name=' + div_name + ']').each(function() {
				var that = $(this);
				that.bind("click", function() {
					myForm.openZTPBTPage(that[0].id);
				})

			});
			msg = "";
		}
	}
	/**
	 * 显示细集料信息
	 */
	myForm.display_XJLData = function() {
		if (myForm.XJL_Data == null) {
			return;
		}
		var msg = "";;
		$("#div_avg_value").append('<div id="div_xjl" class="layui-row"></div>');
		var div_name = "";
		for (var i = 0; i < myForm.XJL_Data.length; i++) {
			var spec = myForm.XJL_Data[i]['specification'];
			msg +=
				'<div class="layui-col-sm3 layui-col-space10" style=" border:1px solid #e6e6e6; border-radius:5px;box-shadow: 1px 1px 5px #e6e6e6;">';
			if (i == 0) {
				msg += myForm.display_title("细集料");
			} else {
				msg += myForm.display_title("细集料（" + spec + "）");
			}
			div_name = "pro_item_xjl" + i;
			msg += myForm.display_item('sK132@1@' + spec, div_name, '13.2', myForm.XJL_Data[i]['sk132']);
			msg += myForm.display_item('sK95@1@' + spec, div_name, '9.5', myForm.XJL_Data[i]['sk95']);
			msg += myForm.display_item('sK475@1@' + spec, div_name, '4.75', myForm.XJL_Data[i]['sk475']);
			msg += myForm.display_item('sK236@1@' + spec, div_name, '2.36', myForm.XJL_Data[i]['sk236']);
			msg += myForm.display_item('sK118@1@' + spec, div_name, '1.18', myForm.XJL_Data[i]['sk118']);
			msg += myForm.display_item('sK06@1@' + spec, div_name, '0.6', myForm.XJL_Data[i]['sk06']);
			msg += myForm.display_item('sK03@1@' + spec, div_name, '0.3', myForm.XJL_Data[i]['sk03']);
			msg += myForm.display_item('sK015@1@' + spec, div_name, '0.15', myForm.XJL_Data[i]['sk015']);
			msg += myForm.display_item('sK0075@1@' + spec, div_name, '0.075', myForm.XJL_Data[i]['sk0075']);
			msg += myForm.display_item('bgmd@1@' + spec, div_name, '表观密度', myForm.XJL_Data[i]['bgmd']);
			msg += myForm.display_item('mdjxsl@1@' + spec, div_name, '密度及吸水率', myForm.XJL_Data[i]['mdjxsl']);
			msg += myForm.display_item('sdl@1@' + spec, div_name, '砂当量', myForm.XJL_Data[i]['sdl']);
			msg += myForm.display_item('lj@1@' + spec, div_name, '棱角性', myForm.XJL_Data[i]['lj']);
			msg += myForm.display_item('yjl@1@' + spec, div_name, '亚甲蓝', myForm.XJL_Data[i]['yjl']);
			msg += '</div>';

			$("#div_xjl").append(msg);
			$('div[name=' + div_name + ']').each(function() {
				var that = $(this);
				that.bind("click", function() {
					myForm.openZTPBTPage(that[0].id);
				})

			});
			msg = "";
		}
	}
	/**
	 * 显示矿粉信息
	 */
	myForm.display_KFData = function() {
		if (myForm.KF_Data == null) {
			return;
		}
		var msg = "";;
		$("#div_avg_value").append('<div id="div_kf" class="layui-row"></div>');
		var div_name = "";
		for (var i = 0; i < myForm.KF_Data.length; i++) {
			var spec = myForm.KF_Data[i]['specification'];
			msg +=
				'<div class="layui-col-sm3 layui-col-space10" style=" border:1px solid #e6e6e6; border-radius:5px;box-shadow: 1px 1px 5px #e6e6e6;">';
			if (i == 0) {
				msg += myForm.display_title("矿粉");
			} else {
				msg += myForm.display_title("矿粉（" + spec + "）");
			}
			div_name = "pro_item_kf" + i;
			msg += myForm.display_item('sK06@3@' + spec, div_name, '0.6', myForm.KF_Data[i]['sk06']);
			msg += myForm.display_item('sK03@3@' + spec, div_name, '0.3', myForm.KF_Data[i]['sk03']);
			msg += myForm.display_item('sK015@3@' + spec, div_name, '0.15', myForm.KF_Data[i]['sk015']);
			msg += myForm.display_item('sK0075@3@' + spec, div_name, '0.075', myForm.KF_Data[i]['sk0075']);
			msg += myForm.display_item('md@3@' + spec, div_name, '密度', myForm.KF_Data[i]['md']);
			msg += myForm.display_item('qsxs@3@' + spec, div_name, '亲水系数', myForm.KF_Data[i]['qsxs']);
			msg += myForm.display_item('jradx@3@' + spec, div_name, '加热安定性', myForm.KF_Data[i]['jradx']);
			msg += '</div>';

			$("#div_kf").append(msg);
			$('div[name=' + div_name + ']').each(function() {
				var that = $(this);
				that.bind("click", function() {
					myForm.openZTPBTPage(that[0].id);
				})

			});
			msg = "";
		}
	}
	/**
	 * 获取查询条件
	 */
	myForm.getQueryData = function() {
		var queryData = {};

		var nowDate = new Date();
		queryData['begindate'] = common.formatDate(nowDate.setDate(nowDate.getDate() - 31),
			'MM/dd/yyyy hh:mm:ss');
		queryData['enddate'] = common.formatDate(new Date(),
			'MM/dd/yyyy hh:mm:ss');


		if ($("#begindate").val().length > 0) {
			queryData['begindate'] = common.formatDate($("#begindate").val() + ' 00:00:00',
				'MM/dd/yyyy hh:mm:ss');
		}
		if ($("#enddate").val().length > 0) {
			queryData['enddate'] = common.formatDate($("#enddate").val() + ' 23:59:59',
				'MM/dd/yyyy hh:mm:ss');
		}
		return queryData;
	}
	/**
	 * 点击查询按钮
	 */
	myForm.search = function() {
		console.log('search');
		var queryData = myForm.getQueryData();
		myForm.CJL_Data = null;
		myForm.XJL_Data = null;
		myForm.KF_Data = null;
		myForm.getCJLData(queryData);
		myForm.getXJLData(queryData);
		myForm.getKFData(queryData);
		$("#div_avg_value").html('');
		myForm.display_CJLData();
		myForm.display_XJLData();
		myForm.display_KFData();
	};


	// 搜索按钮点击事件
	$('#btnSearch').click(function() {
		myForm.search();
	});


	myForm.getParam = function(data) {
		let url = '';
		for (var k in data) {
			let value = data[k] !== undefined ? data[k] : '';
			url += `&${k}=${encodeURIComponent(value)}`
		}
		return url ? url.substring(1) : ''
	}

	myForm.newUrl = function(url, data) {
		return url += (url.indexOf('?') < 0 ? '?' : '') + myForm.getParam(data);
	}
	/**
	 * 打开正态分布图界面
	 * @param {Object} materials
	 */
	myForm.openZTPBTPage = function(id) {
		//获取时间参数
		var begindate, enddate;
		var nowDate = new Date();
		begindate = common.formatDate(nowDate.setDate(nowDate.getDate() - 31),
			'MM/dd/yyyy hh:mm:ss');
		enddate = common.formatDate(new Date(),
			'MM/dd/yyyy hh:mm:ss');
		if ($("#begindate").val().length > 0) {
			begindate = common.formatDate($("#begindate").val() + ' 00:00:00',
				'MM/dd/yyyy hh:mm:ss');
		}
		if ($("#enddate").val().length > 0) {
			enddate = common.formatDate($("#enddate").val() + ' 23:59:59',
				'MM/dd/yyyy hh:mm:ss');
		}

		layer.open({
			type: 2,
			title: "查看正态分布图",
			area: ['700px', '450px'],
			content: '/QualityTestReportAvg/ztfbt_page.do?param=' +
				id + '&begindate=' + begindate + '&enddate=' + enddate,
			success: function(layero, index) {

			}
		});
	}

	//材料下拉框选择
	form.on('select(materials)', function(data) {
		console.log("select(materials)" + data.value);
	});

	myForm.CJL_Data = null;
	myForm.XJL_Data = null;
	myForm.KF_Data = null;
	myForm.getCJLData(null);
	myForm.getXJLData(null);
	myForm.getKFData(null);
	$("#div_avg_value").html('');
	myForm.display_CJLData();
	myForm.display_XJLData();
	myForm.display_KFData();
});
