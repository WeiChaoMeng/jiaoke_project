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

	console.log("qualitytestexperimental_avg.js");
	var myForm = {
		CJL_Data: null,
		XJL_Data: null,
		KF_Data: null,
		LQ_Data: null,
		RHLQ_Data: null,
		LQHHL_Data: null
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
	/**
	 * 获取沥青数据
	 */
	myForm.getLQData = function(searchData) {
		myForm.chartData = null;
		var result = null;
		$.ajax({
			type: "GET",
			async: false,
			url: basePath + "/QualityTestReportAvg/LQ.do",
			data: searchData,
			dataType: 'json',
			success: function(msg) {
				if (msg.code == 200) {
					result = msg.data;
					myForm.LQ_Data = msg.data;
				}
				console.log(msg);
			}
		})
		return result;
	}
	/**
	 * 乳化沥青数据
	 */
	myForm.getRHLQData = function(searchData) {
		myForm.chartData = null;
		var result = null;
		$.ajax({
			type: "GET",
			async: false,
			url: basePath + "/QualityTestReportAvg/RHLQ.do",
			data: searchData,
			dataType: 'json',
			success: function(msg) {
				if (msg.code == 200) {
					result = msg.data;
					myForm.RHLQ_Data = msg.data;
				}
				console.log(msg);
			}
		})
		return result;
	}
	/**
	 * 获取沥青混合料数据
	 */
	myForm.getLQHHLData = function(searchData) {
		myForm.chartData = null;
		var result = null;
		$.ajax({
			type: "GET",
			async: false,
			url: basePath + "/QualityTestReportAvg/LQHHL.do",
			data: searchData,
			dataType: 'json',
			success: function(msg) {
				if (msg.code == 200) {
					result = msg.data;
					myForm.LQHHL_Data = msg.data;
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
			'<label class="layui-form-label" style="text-align: left; margin-left: 10px;font-size: 14px;">试验项目</label>' +
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
			'<label class="layui-form-label" style="text-align: left; margin-left: 1px;font-size: 15px; width:30%">' + colum +
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
			'<label class="layui-form-label" style="width:35%;text-align: left; margin-left: 1px;font-size: 15px; ">' + colum +
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
			msg += myForm.display_item('sK375@2@' + spec, div_name, '37.5', myForm.CJL_Data[i]['sk375']);
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
			msg += myForm.display_item('xsl@2@' + spec, div_name, '吸水率', myForm.CJL_Data[i]['xsl']);
			msg += myForm.display_item('zpzkl@2@' + spec, div_name, '针片状', myForm.CJL_Data[i]['zpzkl']);
			msg += myForm.display_item('ysz@2@' + spec, div_name, '压碎值', myForm.CJL_Data[i]['ysz']);
			msg += myForm.display_item('rrkl@2@' + spec, div_name, '软石含量', myForm.CJL_Data[i]['rrkl']);
			msg += myForm.display_item('mh@2@' + spec, div_name, '磨耗损失', myForm.CJL_Data[i]['mh']);
			msg += myForm.display_item('jgx@2@' + spec, div_name, '坚固性', myForm.CJL_Data[i]['jgx']);
			msg += myForm.display_item('klhl0075@2@' + spec, div_name, '＜0.075mm颗粒含量', myForm.CJL_Data[i]['klhl0075']);
			msg += myForm.display_item('hsl@2@' + spec, div_name, '含水率', myForm.CJL_Data[i]['hsl']);
			msg += myForm.display_item('nfx@2@' + spec, div_name, '粘附性', myForm.CJL_Data[i]['nfx']);
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
			msg += myForm.display_item('bgmd@1@' + spec, div_name, '表观相对密度', myForm.XJL_Data[i]['bgmd']);
			msg += myForm.display_item('mdjxsl@1@' + spec, div_name, '密度及吸水率', myForm.XJL_Data[i]['mdjxsl']);
			msg += myForm.display_item('sdl@1@' + spec, div_name, '砂当量', myForm.XJL_Data[i]['sdl']);
			msg += myForm.display_item('lj@1@' + spec, div_name, '棱角性', myForm.XJL_Data[i]['lj']);
			msg += myForm.display_item('yjl@1@' + spec, div_name, '亚甲蓝值', myForm.XJL_Data[i]['yjl']);
			msg += myForm.display_item('hnl@1@' + spec, div_name, '含泥量', myForm.XJL_Data[i]['hnl']);
			msg += myForm.display_item('jgx@1@' + spec, div_name, '坚固性', myForm.XJL_Data[i]['jgx']);
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
			msg += myForm.display_item('sK118@3@' + spec, div_name, '1.18', myForm.KF_Data[i]['sk118']);
			msg += myForm.display_item('sK06@3@' + spec, div_name, '0.6', myForm.KF_Data[i]['sk06']);
			msg += myForm.display_item('sK03@3@' + spec, div_name, '0.3', myForm.KF_Data[i]['sk03']);
			msg += myForm.display_item('sK015@3@' + spec, div_name, '0.15', myForm.KF_Data[i]['sk015']);
			msg += myForm.display_item('sK0075@3@' + spec, div_name, '0.075', myForm.KF_Data[i]['sk0075']);
			msg += myForm.display_item('bgmd@3@' + spec, div_name, '表观密度', myForm.KF_Data[i]['bgmd']);
			msg += myForm.display_item('qsxs@3@' + spec, div_name, '亲水系数', myForm.KF_Data[i]['qsxs']);
			msg += myForm.display_item('jradx@3@' + spec, div_name, '加热安定性', myForm.KF_Data[i]['jradx']);
			msg += myForm.display_item('sxzl@3@' + spec, div_name, '塑性指数', myForm.KF_Data[i]['sxzl']);
			msg += myForm.display_item('hsl@3@' + spec, div_name, '含水量', myForm.KF_Data[i]['hsl']);
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
	 * 显示沥青信息
	 */
	myForm.display_LQData = function() {
		if (myForm.LQ_Data == null) {
			return;
		}
		var msg = "";;
		$("#div_avg_value").append('<div id="div_lq" class="layui-row"></div>');
		var div_name = "";
		for (var i = 0; i < myForm.LQ_Data.length; i++) {
			var spec = myForm.LQ_Data[i]['specification'];
			msg +=
				'<div class="layui-col-sm3 layui-col-space10" style=" border:1px solid #e6e6e6; border-radius:5px;box-shadow: 1px 1px 5px #e6e6e6;">';
			if (i == 0) {
				msg += myForm.display_title("沥青");
			} else {
				msg += myForm.display_title("沥青（" + spec + "）");
			}
			div_name = "pro_item_lq" + i;
			msg += myForm.display_item('zrd30@4@' + spec, div_name, '针入度（30℃）', myForm.LQ_Data[i]['zrd30']);
			msg += myForm.display_item('zrd25@4@' + spec, div_name, '针入度（25℃）', myForm.LQ_Data[i]['zrd25']);
			msg += myForm.display_item('zrd15@4@' + spec, div_name, '针入度（15℃）', myForm.LQ_Data[i]['zrd15']);
			msg += myForm.display_item('zrd10@4@' + spec, div_name, '针入度（10℃）', myForm.LQ_Data[i]['zrd10']);
			msg += myForm.display_item('zrd5@4@' + spec, div_name, '针入度（5℃）', myForm.LQ_Data[i]['zrd5']);
			msg += myForm.display_item('yd25@4@' + spec, div_name, '延度（25℃）', myForm.LQ_Data[i]['yd25']);
			msg += myForm.display_item('yd15@4@' + spec, div_name, '延度（15℃）', myForm.LQ_Data[i]['yd15']);
			msg += myForm.display_item('yd10@4@' + spec, div_name, '延度（10℃）', myForm.LQ_Data[i]['yd10']);
			msg += myForm.display_item('yd5@4@' + spec, div_name, '延度（5℃）', myForm.LQ_Data[i]['yd5']);
			msg += myForm.display_item('rhd@4@' + spec, div_name, '软化点', myForm.LQ_Data[i]['rhd']);
			msg += myForm.display_item('sd@4@' + spec, div_name, '闪点', myForm.LQ_Data[i]['sd']);
			msg += myForm.display_item('rjd@4@' + spec, div_name, '溶解度', myForm.LQ_Data[i]['rjd']);
			msg += myForm.display_item('dlnd@4@' + spec, div_name, '60℃动力粘度', myForm.LQ_Data[i]['dlnd']);
			msg += myForm.display_item('md15@4@' + spec, div_name, '密度（15℃）', myForm.LQ_Data[i]['md15']);
			msg += myForm.display_item('xdmd25@4@' + spec, div_name, '相对密度（25℃）', myForm.LQ_Data[i]['xdmd25']);
			msg += myForm.display_item('txhf@4@' + spec, div_name, '弹性恢复', myForm.LQ_Data[i]['txhf']);
			msg += myForm.display_item('lx@4@' + spec, div_name, '离析', myForm.LQ_Data[i]['lx']);
			msg += myForm.display_item('zlbh@4@' + spec, div_name, '质量变化', myForm.LQ_Data[i]['zlbh']);
			msg += myForm.display_item('clzrdb@4@' + spec, div_name, '残留针入度比', myForm.LQ_Data[i]['clzrdb']);
			msg += myForm.display_item('clyd25@4@' + spec, div_name, '残留延度（25℃）', myForm.LQ_Data[i]['clyd25']);
			msg += myForm.display_item('clyd15@4@' + spec, div_name, '残留延度（15℃）', myForm.LQ_Data[i]['clyd15']);
			msg += myForm.display_item('clyd10@4@' + spec, div_name, '残留延度（10℃）', myForm.LQ_Data[i]['clyd10']);
			msg += myForm.display_item('clyd5@4@' + spec, div_name, '残留延度（5℃）', myForm.LQ_Data[i]['clyd5']);
			msg += '</div>';
	
			$("#div_lq").append(msg);
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
	 * 显示乳化沥青信息
	 */
	myForm.display_RHLQData = function() {
		if (myForm.RHLQ_Data == null) {
			return;
		}
		var msg = "";;
		$("#div_avg_value").append('<div id="div_rhlq" class="layui-row"></div>');
		var div_name = "";
		for (var i = 0; i < myForm.RHLQ_Data.length; i++) {
			var spec = myForm.RHLQ_Data[i]['specification'];
			msg +=
				'<div class="layui-col-sm3 layui-col-space10" style=" border:1px solid #e6e6e6; border-radius:5px;box-shadow: 1px 1px 5px #e6e6e6;">';
			if (i == 0) {
				msg += myForm.display_title("乳化沥青");
			} else {
				msg += myForm.display_title("乳化沥青（" + spec + "）");
			}
			div_name = "pro_item_rhlq" + i;
			msg += myForm.display_item('zfllwhl@8@' + spec, div_name, '蒸发残留物含量', myForm.RHLQ_Data[i]['zfllwhl']);
			msg += myForm.display_item('bznd@8@' + spec, div_name, '标准粘度', myForm.RHLQ_Data[i]['bznd']);
			msg += myForm.display_item('zrd@8@' + spec, div_name, '针入度', myForm.RHLQ_Data[i]['zrd']);
			msg += myForm.display_item('yd@8@' + spec, div_name, '延度', myForm.RHLQ_Data[i]['yd']);
			msg += myForm.display_item('ccwdx1@8@' + spec, div_name, '1d储存稳定性', myForm.RHLQ_Data[i]['ccwdx1']);
			msg += myForm.display_item('ccwdx5@8@' + spec, div_name, '5d储存稳定性', myForm.RHLQ_Data[i]['ccwdx5']);
				msg += '</div>';
	
			$("#div_rhlq").append(msg);
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
	 * 显示沥青混合料信息
	 */
	myForm.display_LQHHLData = function() {
		if (myForm.LQHHL_Data == null) {
			return;
		}
		var msg = '';
		$("#div_avg_value").append('<div id="div_lqhhl" class="layui-row"></div>');
		var div_name = "";
		for (var i = 0; i < myForm.LQHHL_Data.length; i++) {
			var spec = myForm.LQHHL_Data[i]['specification'];
			msg +=
				'<div class="layui-col-sm3 layui-col-space10" style=" border:1px solid #e6e6e6; border-radius:5px;box-shadow: 1px 1px 5px #e6e6e6;">';
			if (i == 0) {
				msg += myForm.display_title("沥青混合料");
			} else {
				msg += myForm.display_title("沥青混合料（" + spec + "）");
			}
			div_name = "pro_item_lqhhl" + i;
			msg += myForm.display_item('sK375@9@' + spec, div_name, '37.5', myForm.LQHHL_Data[i]['sk375']);
			msg += myForm.display_item('sK315@9@' + spec, div_name, '31.5', myForm.LQHHL_Data[i]['sk315']);
			msg += myForm.display_item('sK265@9@' + spec, div_name, '26.5', myForm.LQHHL_Data[i]['sk265']);
			msg += myForm.display_item('sK19@9@' + spec, div_name, '19', myForm.LQHHL_Data[i]['sk19']);
			msg += myForm.display_item('sK16@9@' + spec, div_name, '16', myForm.LQHHL_Data[i]['sk16']);
			msg += myForm.display_item('sK132@9@' + spec, div_name, '13.2', myForm.LQHHL_Data[i]['sk132']);
			msg += myForm.display_item('sK95@9@' + spec, div_name, '9.5', myForm.LQHHL_Data[i]['sk95']);
			msg += myForm.display_item('sK475@9@' + spec, div_name, '4.75', myForm.LQHHL_Data[i]['sk475']);
			msg += myForm.display_item('sK236@9@' + spec, div_name, '2.36', myForm.LQHHL_Data[i]['sk236']);
			msg += myForm.display_item('sK118@9@' + spec, div_name, '1.18', myForm.LQHHL_Data[i]['sk118']);
			msg += myForm.display_item('sK06@9@' + spec, div_name, '0.6', myForm.LQHHL_Data[i]['sk06']);
			msg += myForm.display_item('sK03@9@' + spec, div_name, '0.3', myForm.LQHHL_Data[i]['sk03']);
			msg += myForm.display_item('sK015@9@' + spec, div_name, '0.15', myForm.LQHHL_Data[i]['sk015']);
			msg += myForm.display_item('sK0075@9@' + spec, div_name, '0.075', myForm.LQHHL_Data[i]['sk0075']);
			msg += myForm.display_item('zdlhxdmd@9@' + spec, div_name, '最大理论相对密度', myForm.LQHHL_Data[i]['zdlhxdmd']);
			msg += myForm.display_item('mtjxdmd@9@' + spec, div_name, '毛体积相对密度', myForm.LQHHL_Data[i]['mtjxdmd']);
			msg += myForm.display_item('kxl@9@' + spec, div_name, '空隙率', myForm.LQHHL_Data[i]['kxl']);
			msg += myForm.display_item('lqbhd@9@' + spec, div_name, '沥青饱和度', myForm.LQHHL_Data[i]['lqbhd']);
			msg += myForm.display_item('kljxl@9@' + spec, div_name, '矿料间隙率', myForm.LQHHL_Data[i]['kljxl']);
			msg += myForm.display_item('cjlgjjxl@9@' + spec, div_name, '粗集料骨架间隙率', myForm.LQHHL_Data[i]['cjlgjjxl']);
			msg += myForm.display_item('wdd@9@' + spec, div_name, '稳定度', myForm.LQHHL_Data[i]['wdd']);
			msg += myForm.display_item('lz@9@' + spec, div_name, '流值', myForm.LQHHL_Data[i]['lz']);
			msg += myForm.display_item('xl@9@' + spec, div_name, '析漏', myForm.LQHHL_Data[i]['xl']);
			msg += myForm.display_item('fs@9@' + spec, div_name, '飞散', myForm.LQHHL_Data[i]['fs']);
			msg += myForm.display_item('clwdd@9@' + spec, div_name, '残留稳定度', myForm.LQHHL_Data[i]['clwdd']);
			msg += myForm.display_item('drplqdb@9@' + spec, div_name, '冻融劈裂强度比', myForm.LQHHL_Data[i]['drplqdb']);
			msg += myForm.display_item('dwdd@9@' + spec, div_name, '动稳定度', myForm.LQHHL_Data[i]['dwdd']);
			msg += myForm.display_item('ssxs@9@' + spec, div_name, '渗水系数', myForm.LQHHL_Data[i]['ssxs']);
			msg += myForm.display_item('gzsd@9@' + spec, div_name, '构造深度', myForm.LQHHL_Data[i]['gzsd']);
			
			msg += '</div>';
	
			$("#div_lqhhl").append(msg);
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

		myForm.CJL_Data = null;
		myForm.XJL_Data = null;
		myForm.KF_Data = null;
		$("#div_avg_value").html('');

		var queryData = myForm.getQueryData();
		var mvalue = $("#materials").val();
		switch (mvalue) {
			case '1':
				myForm.getXJLData(queryData);
				myForm.display_XJLData();
				break;
			case '2':
				myForm.getCJLData(queryData);
				myForm.display_CJLData();
				break;
			case '3':
				myForm.getKFData(queryData);
				myForm.display_KFData();
				break;
			case '4':
				myForm.getLQData(queryData);
				myForm.display_LQData();
				break;
			case '8':
				myForm.getRHLQData(queryData);
				myForm.display_RHLQData();
				break;
			case '9':
				myForm.getLQHHLData(queryData);
				myForm.display_LQHHLData();
				break;
		}
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
	$("#div_avg_value").html('');
	myForm.getCJLData(null);
	myForm.display_CJLData();
});
