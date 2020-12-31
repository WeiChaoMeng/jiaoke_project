layui.use(['form', 'table', 'laydate', 'element'], function() {
	var form = layui.form;
	var table = layui.table;
	var $ = layui.$;
	var element = layui.element;
	var dictionaryFunc = parent.layui.dictionary;
	var basePath = $("#path").val();
	console.log("qualitytestexperimental_cjl_sf_detail.js");
	form.render();
	var expID = common.getUrlParam("id");

	var myform = {
		tableId: "mytable",
		expValue: [], //试验信息
		CJL_SF_Data: [] ,//筛分数据
		StandValue: []//规范值
	}
	/**
	 * 根据ID获取试验输入值
	 * @param {Object} id
	 */
	myform.getItemValue = function(id) {
		var result = 0;
		for (var i = 0; i < myform.expValue.length; i++) {
			var obj = myform.expValue[i];
			if (obj.id == id) {
				result = obj.valueitemvalue;
				break;
			}
		}
		return result;
	}

	/**
	 * 筛分表头干燥值等数据
	 */
	var CLL_SF_GZ_Value = {
		gzsyzl_value1: 0,
		gzsyzl_value2: 0
	}

	/**
	 * 初始化干燥值
	 */
	myform.init_GZSY_Value = function() {
		//干燥试样总量/水洗后筛上总量
		CLL_SF_GZ_Value.gzsyzl_value1 = myform.getItemValue('100001');
		CLL_SF_GZ_Value.gzsyzl_value2 = myform.getItemValue('100005');
		//干燥试样总量/水洗后筛上总量 
		$("#gzsyzl_value1").html(CLL_SF_GZ_Value.gzsyzl_value1);
		$("#gzsyzl_value2").html(CLL_SF_GZ_Value.gzsyzl_value2);
	}

	/**
	 * 筛分数据初始化
	 */
	myform.ini_SFZ_Value = function() {
		if (myform.CJL_SF_Data.length > 0) {
			return;
		}
		var data = [];
		data.push('37.5');
		data.push('31.5');
		data.push('26.5');
		data.push('19');
		data.push('16');
		data.push('13.2');
		data.push('9.5');
		data.push('4.75');
		data.push('2.36');
		data.push('1.18');
		data.push('0.6');
		data.push('0.3');
		data.push('0.15');
		data.push('0.075');
		data.push('筛底');
		for (var i = 0; i <= data.length; i++) {
			var data1 = {
				'skcc': data[i]
			}
			myform.CJL_SF_Data.push(data1);
		}
	}

	/**
	 * 得到累计筛分1
	 * @param {Object} order
	 */
	myform.getljsf1 = function(order) {
		var result = 0;
		for (var i = 0; i <= myform.CJL_SF_Data.length; i++) {
			if (i <= order) {
				var data = myform.CJL_SF_Data[i];

				if (data['fjsy_value1'] > 0) {
					result = (Number(result) + Number(data['fjsy_value1'])).toFixed(1);
				}
			} else {
				break;
			}
		}
		return result;
	}

	/**
	 * 得到累计筛分2
	 * @param {Object} order
	 */
	myform.getljsf2 = function(order) {
		var result = 0;
		for (var i = 0; i < myform.CJL_SF_Data.length; i++) {
			if (i <= order) {
				var data = myform.CJL_SF_Data[i];
				if (data['fjsy_value2'] > 0) {
					result = (Number(result) + Number(data['fjsy_value2'])).toFixed(1);
				}
			} else {
				break;
			}
		}
		return result;
	}

	/**
	 * 得到平均通过百分比
	 * @param {Object} order
	 */
	myform.getPJTGBFB = function(sfRule) {
		var result = 0;
		for (var i = 0; i < myform.CJL_SF_Data.length; i++) {
			var data = myform.CJL_SF_Data[i];
			if (data['skcc'] == sfRule) {
				result = data['pjtgbfb_value'];
				break;
			}
		}
		return result;
	}
	/**
	 * 自动计算值
	 */
	myform.computeValue = function() {
		//计算筛孔尺寸
		for (var i = 0; i < myform.CJL_SF_Data.length; i++) {
			var data = myform.CJL_SF_Data[i];
			if (data['ssz_value1'] != undefined) {
				data['fjsy_value1'] = ((data['ssz_value1'] / CLL_SF_GZ_Value.gzsyzl_value1)*100).toFixed(1);
				data['ljsy_value1'] = myform.getljsf1(i);
				data['tgbfb_value1'] = Number(100 - data['ljsy_value1']).toFixed(1);
			} else {
				data['fjsy_value1'] = undefined;
				data['ljsy_value1'] = undefined;
				data['tgbfb_value1'] = undefined;
			}

			if (data['ssz_value2'] != undefined) {
				data['fjsy_value2'] = ((data['ssz_value2'] / CLL_SF_GZ_Value.gzsyzl_value2)*100).toFixed(1);
				data['ljsy_value2'] = myform.getljsf2(i);
				data['tgbfb_value2'] = Number(100 - data['ljsy_value2']).toFixed(1);
				
			} else {
				data['fjsy_value2'] = undefined;
				data['ljsy_value2'] = undefined;
				data['tgbfb_value2'] = undefined;
			}

			if (data['tgbfb_value1'] > 0 && data['tgbfb_value2'] > 0) {
				data['pjtgbfb_value'] = ((Number(data['tgbfb_value1']) + Number(data['tgbfb_value2'])) / 2).toFixed(1);;
			} else if (data['tgbfb_value1'] > 0) {
				data['pjtgbfb_value'] = data['tgbfb_value1'];
			} else {
				data['pjtgbfb_value'] = data['tgbfb_value2'];
			}
		}

		//计算干筛后总量
		var gshzz_value1 = 0;
		for (var i = 0; i < myform.CJL_SF_Data.length; i++) {
			var data = myform.CJL_SF_Data[i];
			if (data['ssz_value1'] > 0) {
				gshzz_value1 = (Number(gshzz_value1) + Number(data['ssz_value1'])).toFixed(1);
			}
		}
		$("#gshzz_value1").html(gshzz_value1);
		var gshzz_value2 = 0;
		for (var i = 0; i < myform.CJL_SF_Data.length; i++) {
			var data = myform.CJL_SF_Data[i];
			if (data['ssz_value2'] > 0) {
				gshzz_value2 = (Number(gshzz_value2) + Number(data['ssz_value2'])).toFixed(1);
			}
		}
		$("#gshzz_value2").html(gshzz_value2);
		/* //计算损耗
		var sh_value1 = CLL_SF_GZ_Value.sxhsyzl_value1 - gshzz_value1;
		$("#sh_value1").html(sh_value1);
		var sh_value2 = CLL_SF_GZ_Value.sxhsyzl_value2 - gshzz_value2;
		$("#sh_value2").html(sh_value2);
		//计算损耗率
		var shl_value1 = (sh_value1 / CLL_SF_GZ_Value.sxhsyzl_value1).toFixed(1);
		$("#shl_value1").html(shl_value1);
		var shl_value2 = (sh_value2 / CLL_SF_GZ_Value.sxhsyzl_value2).toFixed(1);
		$("#shl_value2").html(shl_value2); */
	}


	/**
	 * 筛上重数据更新
	 * @param {Object} sfcc
	 * @param {Object} filed
	 * @param {Object} value
	 */
	myform.modfiyData = function(sfcc, filed, value) {
		for (var i = 0; i < myform.CJL_SF_Data.length; i++) {
			var data = myform.CJL_SF_Data[i];
			if (data['skcc'] == sfcc) {
				data[filed] = value;
				break;
			}
		}
		/* myform.computeValue();
		 table.reload(myform.tableId, {
			data: myform.CJL_SF_Data
		}); */
	}

	/**
	 * 单元格编辑
	 */
	table.on('edit(' + myform.tableId + ')', function(obj) {
		var value = obj.value,
			data = obj.data,
			field = obj.field;
		//layer.msg('[ID: ' + data.id + '] ' + field + ' 字段更改为：' + value);
		myform.modfiyData(data['skcc'], field, value);
	});
	/**
	 * 监听方向键
	 */
	myform.editData = function() {
		$(document).on('keydown', '.layui-input', function(e) {
			var td = $(this).parent('td'),
				tr = td.parent('tr'),
				trs = tr.parent().parent().find("tr"),
				tr_index = tr.index(),
				td_index = td.index(),
				td_last_index = tr.find('[data-edid="text"]:last').index(),
				td_first_index = tr.find('[data-edid="text"]:first').index();
			switch (e.keyCode) {
				case 13:
				case 39:
					td.nextAll('[data-edit="text"]:first').click();
					if (td_index == td_last_index) {
						tr.next().find('td').eq(td_first_index).click();
						if (tr_index == trs.length - 1) {
							trs.eq(0).find('td').eq(td_first_index).click()
						}
					}
					setTimeout(function() {
						$('.last-table-edit').select()
					}, 0);
					break;
				case 37:
					td.prevAll('[data-edit="text"]:first').click();
					setTimeout(function() {
						$('.last-table-edit').select()
					}, 0);
					break;
				case 38:
					tr.prev().find('td').eq(td_index).click();
					setTimeout(function() {
						$('.last-table-edit').select()
					}, 0);
					break;
				case 40:
					tr.next().find('td').eq(td_index).click();
					setTimeout(function() {
						$('.last-table-edit').select()
					}, 0);
					break;
			}
		});
	}
	/**
	 * 计算结果
	 */
	$('#btn_compute').on('click', function() {
		myform.computeValue();
		table.reload(myform.tableId, {
			data: myform.CJL_SF_Data
		});
	});
	/**
	 * 保存数据
	 */
	$('#btn_save').on('click', function() {
		myform.computeValue();
		table.reload(myform.tableId, {
			data: myform.CJL_SF_Data
		});
		if (myform.savaDetail() && myform.savaReport()) {
			layer.msg("保存成功");
		} else {
			layer.msg("保存失败，请重新保存");
		}
	});
	/**
	 * 保存筛分详情数据
	 */
	myform.savaDetail = function() {
		var result = false;
		var expResult = myform.checkExpResult();
		var saveData = {
			ID: expID,			
			experimentalValueSf: JSON.stringify(myform.CJL_SF_Data),
			status: 2, 
			experimentalResult: expResult
		}
		$.ajax({
			type: "POST",
			async: false,
			data: saveData,
			url: basePath + "/QualityTestExperimental/update.do",
			dataType: 'json',
			success: function(msg) {
				if (msg.code == 200) {
					result = true;
				}

				console.log(msg);
			}
		})
		return result;
	}
	/**
	 * 保存筛分台账
	 */
	myform.savaReport = function() {
		var result = false;
		var saveData = {
			orderTicketNum: expInfo['order_ticket_num'],
			experimentalId: expID,
			experimentalName: expInfo['experimental_name'],
			sK315: myform.getPJTGBFB("31.5"),
			sK265: myform.getPJTGBFB("26.5"),
			sK19: myform.getPJTGBFB("19"),
			sK16: myform.getPJTGBFB("16"),
			sK132: myform.getPJTGBFB("13.2"),
			sK95: myform.getPJTGBFB("9.5"),
			sK475: myform.getPJTGBFB("4.75"),
			sK236: myform.getPJTGBFB("2.36"),
			sK118: myform.getPJTGBFB("1.18"),
			sK06: myform.getPJTGBFB("0.6"),
			sK03: myform.getPJTGBFB("0.3"),
			sK015: myform.getPJTGBFB("0.15"),
			sK0075: myform.getPJTGBFB("0.075"),
			sD: myform.getPJTGBFB("筛底"),
		}
		$.ajax({
			type: "POST",
			async: false,
			data: saveData,
			url: basePath + "/QualityTestExperimentalValueCjlSf/save.do",
			dataType: 'json',
			success: function(msg) {
				if (msg.code == 200) {
					result = true;
				}
				console.log(msg);
			}
		})
		return result;
	}
	/**
	 * 获取某项标准值配置
	 * @param {Object} column
	 */
	myform.getOneStandValue = function(column) {
		var standValue = null;
		for (var i = 0; i < myform.StandValue.length; i++) {
			var data = myform.StandValue[i];
			if (data['experimentalItem'] == column) {
				standValue = data;
				break;
			}
	
		}
		return standValue;
	}
	/**
	 * 判断试验是否合格
	 */
	myform.checkExpResult = function() {
		var result = 1;
		for (var i = 0; i < myform.CJL_SF_Data.length; i++) {
			var data = myform.CJL_SF_Data[i];
			var value = data['pjtgbfb_value'];
			if (value == undefined) {
				continue;
			}
			var standValueObj = myform.getOneStandValue(data['skcc']);
			if (standValueObj != undefined && standValueObj != null) {
				if (common.diffValue(value, standValueObj.minValue, standValueObj.maxValue, standValueObj.comparemethod) ==
					false) {
					{
						result = -1;
						break;
					}
				}
			}			
		}
		return result;
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
			url: basePath + "/QualityTestExperimental/find/" + id + ".do",
			dataType: 'json',
			success: function(msg) {
				if (msg.code == 200) {
					result = msg.data;
				}
				console.log(msg);
			}
		});
		return result;
	}

/**
	 * 获取规范值
	 */
	myform.getStandValue = function() {
		myform.StandValue = [];
		var queryData = {
			experimentalId: expInfo['experimental_id'],
			specification: expInfo['specification']
		};
		$.ajax({
			type: "GET",
			async: false,
			url: basePath + "/QualityTestExperimentalStandardvalue/list.do",
			data: queryData,
			dataType: 'json',
			success: function(msg) {
				if (msg.count = 200) {
					myform.StandValue = msg.data;
				}
			}
		})
	}
	var expInfo = myform.getExperimentalInfo(expID);
	if (expInfo != null) {
		if (expInfo['experimental_content'] != null && expInfo['experimental_content'].length > 0) {
			myform.expValue = $.parseJSON(expInfo.experimental_content);
		}
		if (expInfo['experimental_value_sf'] != null && expInfo['experimental_value_sf'].length > 0) {
			myform.CJL_SF_Data = $.parseJSON(expInfo.experimental_value_sf);
		}
		myform.editData();
		if (expInfo['status'] == 3) {
			$("#div_button").show();
		} else {
			$("#div_button").hide();
		}
	}
	myform.init_GZSY_Value();
	myform.ini_SFZ_Value();
	myform.computeValue();	
	myform.getStandValue();
	/**
	 * TABEL数据更新
	 */
	table.render({
		elem: '#' + myform.tableId,
		data: myform.CJL_SF_Data,
		limit: 14,
		defaultToolbar: [],
		cols: [
			[{
					field: 'skcc',
					title: '筛孔尺寸(mm)',
					width: 118
				}, {
					field: 'ssz_value1',
					title: '筛上重mi(g)',
					width: 73,
					edit: 'text'
				}, {
					field: 'fjsy_value1',
					title: '分计筛余(%)',
					width: 73
				}, {
					field: 'ljsy_value1',
					title: '累计筛余(%)',
					width: 73
				}, {
					field: 'tgbfb_value1',
					title: '通过百分率(%)',
					width: 93
				}

				, {
					field: 'ssz_value2',
					title: '筛上重mi(g)',
					width: 73,
					edit: 'text'
				}, {
					field: 'fjsy_value2',
					title: '分计筛余(%)',
					width: 73
				}, {
					field: 'ljsy_value2',
					title: '累计筛余(%)',
					width: 73
				}, {
					field: 'tgbfb_value2',
					title: '通过百分率(%)',
					width: 95
				}, {
					field: 'pjtgbfb_value',
					title: '通过百分率(%)',
					width: 95
				}
			]
		],
		page: false
	});
});
