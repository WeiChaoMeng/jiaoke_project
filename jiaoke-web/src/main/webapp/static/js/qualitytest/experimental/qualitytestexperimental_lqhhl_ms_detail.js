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
		detail_Data: [] //筛分数据
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
	 * 筛分数据初始化
	 */
	myform.ini_Detail_Value = function() {
		if (myform.detail_Data.length > 0) {
			return;
		}
		for (var i = 0; i < 6; i++) {
			var data1 = {
				'num': i + 1
			}
			myform.detail_Data.push(data1);
		}
	}


	/**
	 * 自动计算值
	 */
	myform.computeValue = function() {
		//计算
		var mtjxdmdSum = 0,
			mtjxdmdCount = 0;
		for (var i = 0; i < myform.detail_Data.length; i++) {
			var data = myform.detail_Data[i];
			var pjgd = 0;
			var count = 0;
			if (data['sjgd1'] > 0) {
				pjgd = (Number(data['sjgd1']));
				count = count + 1;
			}
			if (data['sjgd2'] > 0) {
				pjgd = pjgd + (Number(data['sjgd2']));
				count = count + 1;
			}
			if (data['sjgd3'] > 0) {
				pjgd = pjgd + (Number(data['sjgd3']));
				count = count + 1;
			}
			if (data['sjgd4'] > 0) {
				pjgd = pjgd + (Number(data['sjgd4']));
				count = count + 1;
			}
			if (count > 1) {
				pjgd = (pjgd / count).toFixed(1);
			}
			if (pjgd > 0) {
				data['sjgdpj'] = pjgd;
			} else {
				data['sjgdpj'] = undefined;
			}
			if (data['kzz'] > 0 && data['szz'] > 0 && data['bhngz'] > 0) {
				var value = (data['kzz'] / (data['bhngz'] - data['szz'])).toFixed(3);
				data['mtjxdmd'] = value;
				mtjxdmdSum += Number(value);
				mtjxdmdCount = mtjxdmdCount + 1;
			} else {
				data['mtjxdmd'] = undefined;
			}
		}
		var value = (mtjxdmdSum / mtjxdmdCount).toFixed(3);
		if (isNaN(value)) {
			$("#value").html("");
		} else {
			$("#value").html(value);
		}
	}

	/**
	 * 筛上重数据更新
	 * @param {Object} sfcc
	 * @param {Object} filed
	 * @param {Object} value
	 */
	myform.modfiyData = function(sfcc, filed, value) {
		for (var i = 0; i < myform.detail_Data.length; i++) {
			var data = myform.detail_Data[i];
			if (data['num'] == sfcc) {
				data[filed] = value;
				break;
			}
		}
		/* myform.computeValue();
		 table.reload(myform.tableId, {
			data: myform.detail_Data
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
		myform.modfiyData(data['num'], field, value);
	});
	/**
	 * 监听方向键
	 */
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

	/**
	 * 计算结果
	 */
	$('#btn_compute').on('click', function() {
		myform.computeValue();
		table.reload(myform.tableId, {
			data: myform.detail_Data
		});
	});
	/**
	 * 保存数据
	 */
	$('#btn_save').on('click', function() {
		myform.computeValue();
		table.reload(myform.tableId, {
			data: myform.detail_Data
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
		var saveData = {
			ID: expID,
			experimentalValue: '[{"result":"' + $("#value").html() + '","name":"毛体积相对密度"}]',
			experimentalValueSf: JSON.stringify(myform.detail_Data),
			status: 2
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
	 * 保存结果
	 */
	myform.savaReport = function() {
		var result = false;
		var saveData = {
			orderTicketNum: expInfo['order_ticket_num'],
			experimentalId: expID,
			experimentalName: expInfo['experimental_name'],
			experimentalType: "毛体积相对密度",
			value: $("#value").html(),
			unit: "-",
			method: "-",
			requirements: ""
		}
		$.ajax({
			type: "POST",
			async: false,
			data: saveData,
			url: basePath + "/QualityTestExperimentalValue/save.do",
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

	var expInfo = myform.getExperimentalInfo(expID);
	if (expInfo != null) {
		if (expInfo['experimental_content'] != null && expInfo['experimental_content'].length > 0) {
			myform.expValue = $.parseJSON(expInfo.experimental_content);
		}
		if (expInfo['experimental_value_sf'] != null && expInfo['experimental_value_sf'].length > 0) {
			myform.detail_Data = $.parseJSON(expInfo.experimental_value_sf);
		}
		if (expInfo['status'] != 3) {
			//myform.editData();
			$("#div_button").hide();
		}
	}

	myform.ini_Detail_Value();
	myform.computeValue();
	/**
	 * TABEL数据更新
	 */
	table.render({
		elem: '#' + myform.tableId,
		data: myform.detail_Data,
		limit: 20,
		defaultToolbar: [],
		cols: [
			[{
				field: 'num',
				title: '编号',
				width: 60,
				type: "numbers",
				rowspan: 2
			}, {
				field: 'ysb',
				title: '油石比（%）',
				width: 84,
				rowspan: 2,
				edit: 'text'
			}, {
				field: '',
				title: '试件高度（cm）',
				width: 73,
				colspan: 5,
			}, {
				field: 'kzz',
				title: '空中重m<span style="font-size: 1px;">a</span>(g)',
				width: 75,
				rowspan: 2,
				edit: 'text'
			}, {
				field: 'szz',
				title: '水中重m<span style="font-size: 1px;">w</span>(g)',
				width: 75,
				rowspan: 2,
				edit: 'text'
			}, {
				field: 'bhngz',
				title: '饱和面干重m<span style="font-size: 1px;">f</span>(g)',
				width: 75,
				rowspan: 2,
				edit: 'text'
			}, {
				field: 'mtjxdmd',
				title: '毛体积相对密度γ<span style="font-size: 1px;">f</span>',
				width: 75,
				rowspan: 2
			}, {
				field: 'wdd',
				title: '稳定度MS(kN)',
				width: 75,
				rowspan: 2,
				edit: 'text'
			}, {
				field: 'lz',
				title: '流值FL(mm)',
				width: 75,
				rowspan: 2,
				edit: 'text'
			}, {
				field: 'remark',
				title: '备注',
				width: 95,
				rowspan: 2,
				edit: 'text'
			}],
			[{
				field: 'sjgd1',
				title: '1',
				width: 70,
				edit: 'text'
			}, {
				field: 'sjgd2',
				title: '2',
				width: 70,
				edit: 'text'
			}, {
				field: 'sjgd3',
				title: '3',
				width: 70,
				edit: 'text'
			}, {
				field: 'sjgd4',
				title: '4',
				width: 70,
				edit: 'text'
			}, {
				field: 'sjgdpj',
				title: '平均值',
				width: 70
			}]


		],
		page: false
	});
});
