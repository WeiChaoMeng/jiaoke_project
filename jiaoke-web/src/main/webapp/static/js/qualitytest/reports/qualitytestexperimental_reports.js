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
	console.log("qualitytestexperimental_reports");

	dictionaryFunc.getMaterialsToSelect("materials", "请选择", basePath);

	var myForm = {
		tableId: "mytable",
		exportData: ""
	};
	/**
	 * 粗集料台账
	 */
	myForm.report_CJL = function() {
		table.render({
			elem: '#' + myForm.tableId,
			title: '粗集料台账',
			limit: common.maxLimitValue,
			url: basePath + '/QualityTestReport/ReportCJL.do',
			defaultToolbar: [],
			toolbar: '#toolbarButton',
			cols: [
				[{
						field: 'xuhao',
						title: '序号',
						width: 70,
						type: "numbers",
						rowspan: 2
					}, {
						field: 'createTime',
						title: '试验日期',
						width: 110,
						templet: "<div>{{layui.util.toDateString(d.createTime, 'yyyy-MM-dd')}}</div>",
						rowspan: 2
					},
					{
						field: 'orderTicketNum',
						title: '试验编号',
						width: 160,
						rowspan: 2
					}, {
						field: 'specification',
						title: '试样名称',
						width: 100,
						rowspan: 2
					}, {
						colspan: 20,
						field: '',
						align: 'center',
						title: '试验结果'
					}, {
						field: 'requiredStatus',
						title: '状态',
						width: 80,
						rowspan: 2,
						templet: "#experiment_status"
					}, {
						title: '操作',
						toolbar: '#tableBar',
						rowspan: 2,
						width: 100
					}
				],
				[{
					field: 'sK315',
					title: '31.5',
					width: 70
				}, {
					field: 'sK265',
					title: '26.5',
					width: 70
				}, {
					field: 'sK19',
					title: '19',
					width: 70
				}, {
					field: 'sK16',
					title: '16',
					width: 70
				}, {
					field: 'sK132',
					title: '13.2',
					width: 70
				}, {
					field: 'sK95',
					title: '9.5',
					width: 70
				}, {
					field: 'sK475',
					title: '4.75',
					width: 70
				}, {
					field: 'sK236',
					title: '2.36',
					width: 70
				}, {
					field: 'sK118',
					title: '1.18',
					width: 70
				}, {
					field: 'sK06',
					title: '0.6',
					width: 70
				}, {
					field: 'sK03',
					title: '0.3',
					width: 70
				}, {
					field: 'sK015',
					title: '0.15',
					width: 70
				}, {
					field: 'sK0075',
					title: '0.075',
					width: 70
				}, {
					field: 'bgxdmd1',
					title: '表观相对密度',
					width: 120
				}, {
					field: 'bgxdmd2',
					title: '表干相对密度',
					width: 120
				}, {
					field: 'mtjxdmd',
					title: '毛体积相对密度',
					width: 130
				}, {
					field: 'zpzkl',
					title: '针片状颗粒',
					width: 110
				}, {
					field: 'ysz',
					title: '压碎值',
					width: 80
				}, {
					field: 'rrkl',
					title: '软弱颗粒',
					width: 100
				}, {
					field: 'mh',
					title: '磨耗',
					width: 80
				}]

			],
			done: function(res, curr, count) {
				myForm.exportData = res.data;
				myForm.CJL_COL_Visble(res.data);
			}
		});
	}
	/**
	 * 粗集料字段显示判断
	 * @param {Object} data
	 */
	myForm.CJL_COL_Visble = function(data) {
		myForm.columnHide(data, 'mh', 26, 23);
		myForm.columnHide(data, 'rrkl', 25, 22);
		myForm.columnHide(data, 'ysz', 24, 21);
		myForm.columnHide(data, 'zpzkl', 23, 20);
		myForm.columnHide(data, 'mtjxdmd', 22, 19);
		myForm.columnHide(data, 'bgxdmd2', 21, 18);
		myForm.columnHide(data, 'bgxdmd1', 20, 17);
		myForm.columnHide(data, 'sK0075', 19, 16);
		myForm.columnHide(data, 'sK015', 18, 15);
		myForm.columnHide(data, 'sK03', 17, 14);
		myForm.columnHide(data, 'sK06', 16, 13);
		myForm.columnHide(data, 'sK118', 15, 12);
		myForm.columnHide(data, 'sK236', 14, 11);
		myForm.columnHide(data, 'sK475', 13, 10);
		myForm.columnHide(data, 'sK95', 12, 9);
		myForm.columnHide(data, 'sK132', 11, 8);
		myForm.columnHide(data, 'sK16', 10, 7);
		myForm.columnHide(data, 'sK19', 9, 6);
		myForm.columnHide(data, 'sK265', 8, 5);
		myForm.columnHide(data, 'sK315', 7, 4);
	}


	/**
	 * 无数据列不显示
	 * @param {Object} data
	 * @param {Object} column
	 */
	myForm.checkDataisNull = function(data, column) {
		var result = true;

		var expSelect = $("#experimental").val();
		if (expSelect != '' && expSelect != 'SF') {
			if (column == expSelect) {
				result = false;
			}
		} else {
			for (var i = 0; i < data.length; i++) {
				if (data[i][column] != undefined && data[i][column] != "") {
					result = false;
					break;
				}
			}
		}
		return result;
	}
	/**
	 * 隐藏指定字段
	 * @param {Object} data
	 * @param {Object} column
	 * @param {Object} row
	 * @param {Object} col
	 */
	myForm.columnHide = function(data, column, row, col) {

		if (myForm.checkDataisNull(data, column)) {
			$("td:eq(" + col + ")", $("tr")).hide();
			$('table.layui-table thead tr th:eq(' + row + ')').addClass('layui-hide');
		}
	}
	/**
	 * 细集料台账
	 */
	myForm.report_XJL = function() {
		table.render({
			elem: '#' + myForm.tableId,
			title: '细集料台账',
			limit: common.maxLimitValue,
			url: basePath + '/QualityTestReport/ReportXJL.do',
			defaultToolbar: [],
			toolbar: '#toolbarButton',
			cols: [
				[{
						field: 'xuhao',
						title: '序号',
						width: 70,
						type: "numbers",
						rowspan: 2
					}, {
						field: 'createTime',
						title: '试验日期',
						width: 110,
						templet: "<div>{{layui.util.toDateString(d.createTime, 'yyyy-MM-dd')}}</div>",
						rowspan: 2
					},
					{
						field: 'orderTicketNum',
						title: '试验编号',
						width: 160,
						rowspan: 2
					}, {
						field: 'specification',
						title: '试样名称',
						width: 100,
						rowspan: 2
					}, {
						colspan: 14,
						field: '',
						align: 'center',
						title: '试验结果'
					}, {
						field: 'requiredStatus',
						title: '状态',
						width: 80,
						rowspan: 2,
						templet: "#experiment_status"
					}, {
						title: '操作',
						toolbar: '#tableBar',
						rowspan: 2,
						width: 100
					}
				],
				[{
					field: 'sK132',
					title: '13.2',
					width: 70
				}, {
					field: 'sK95',
					title: '9.5',
					width: 70
				}, {
					field: 'sK475',
					title: '4.75',
					width: 70
				}, {
					field: 'sK236',
					title: '2.36',
					width: 70
				}, {
					field: 'sK118',
					title: '1.18',
					width: 70
				}, {
					field: 'sK06',
					title: '0.6',
					width: 70
				}, {
					field: 'sK03',
					title: '0.3',
					width: 70
				}, {
					field: 'sK015',
					title: '0.15',
					width: 70
				}, {
					field: 'sK0075',
					title: '0.075',
					width: 70
				}, {
					field: 'bgmd',
					title: '表观密度',
					width: 90
				}, {
					field: 'mdjxsl',
					title: '密度及吸水率',
					width: 120
				}, {
					field: 'sdl',
					title: '砂当量',
					width: 80
				}, {
					field: 'lj',
					title: '棱角性',
					width: 80
				}, {
					field: 'yjl',
					title: '亚甲蓝',
					width: 80
				}]

			],
			done: function(res, curr, count) {
				myForm.exportData = res.data;
				myForm.XJL_COL_Visble(res.data);
			}
		});
	}
	/**
	 * 细集料字段显示判断
	 * @param {Object} data
	 */
	myForm.XJL_COL_Visble = function(data) {
		myForm.columnHide(data, 'yjl', 20, 17);
		myForm.columnHide(data, 'lj', 19, 16);
		myForm.columnHide(data, 'sdl', 18, 15);
		myForm.columnHide(data, 'mdjxsl', 17, 14);
		myForm.columnHide(data, 'bgmd', 16, 13);
		myForm.columnHide(data, 'sK0075', 15, 12);
		myForm.columnHide(data, 'sK015', 14, 11);
		myForm.columnHide(data, 'sK03', 13, 10);
		myForm.columnHide(data, 'sK06', 12, 9);
		myForm.columnHide(data, 'sK118', 11, 8);
		myForm.columnHide(data, 'sK236', 10, 7);
		myForm.columnHide(data, 'sK475', 9, 6);
		myForm.columnHide(data, 'sK95', 8, 5);
		myForm.columnHide(data, 'sK132', 7, 4);
	}
	/**
	 * 矿粉台账
	 */
	myForm.report_KF = function() {
		table.render({
			elem: '#' + myForm.tableId,
			title: '矿粉台账',
			limit: common.maxLimitValue,
			url: basePath + '/QualityTestReport/ReportKF.do',
			defaultToolbar: [],
			toolbar: '#toolbarButton',
			cols: [
				[{
						field: 'xuhao',
						title: '序号',
						width: 70,
						type: "numbers",
						rowspan: 2
					}, {
						field: 'createTime',
						title: '试验日期',
						width: 110,
						templet: "<div>{{layui.util.toDateString(d.createTime, 'yyyy-MM-dd')}}</div>",
						rowspan: 2
					},
					{
						field: 'orderTicketNum',
						title: '试验编号',
						width: 160,
						rowspan: 2
					}, {
						field: 'specification',
						title: '试样名称',
						width: 100,
						rowspan: 2
					}, {
						colspan: 7,
						field: '',
						align: 'center',
						title: '试验结果'
					}, {
						field: 'requiredStatus',
						title: '状态',
						width: 80,
						rowspan: 2,
						templet: "#experiment_status"
					}, {
						title: '操作',
						toolbar: '#tableBar',
						rowspan: 2,
						width: 100
					}
				],
				[{
					field: 'md',
					title: '密度',
					width: 70
				}, {
					field: 'qsxs',
					title: '亲水系数',
					width: 100
				}, {
					field: 'jradx',
					title: '加热安定性',
					width: 100
				}, {
					field: 'sK06',
					title: '0.6',
					width: 140
				}, {
					field: 'sK03',
					title: '0.3',
					width: 140
				}, {
					field: 'sK015',
					title: '0.15',
					width: 160
				}, {
					field: 'sK0075',
					title: '0.075',
					width: 160
				}]

			],
			done: function(res, curr, count) {
				myForm.exportData = res.data;
				myForm.KF_COL_Visble(res.data);
			}
		});
	}
	/**
	 * 细集料字段显示判断
	 * @param {Object} data
	 */
	myForm.KF_COL_Visble = function(data) {
		myForm.columnHide(data, 'sK0075', 13, 10);
		myForm.columnHide(data, 'sK015', 12, 9);
		myForm.columnHide(data, 'sK03', 11, 8);
		myForm.columnHide(data, 'sK06', 10, 7);

		myForm.columnHide(data, 'jradx', 9, 6);
		myForm.columnHide(data, 'qsxs', 8, 5);
		myForm.columnHide(data, 'md', 7, 4);
	}

	/**
	 * 增加试验项目
	 * @param {Object} id
	 * @param {Object} value
	 * @param {Object} text
	 */
	myForm.addExprimentItem = function(id, value, text) {
		var htmlStr = "<option value='" + value + "'>" + text + "</option>";
		$("#" + id).append(htmlStr);
	}

	/**
	 * 增加粗集料试验项目
	 */
	myForm.addCjlExprimentItem = function() {
		$("#experimental").html('');
		myForm.addExprimentItem('experimental', '', '请选择');
		myForm.addExprimentItem('experimental', 'SF', '筛分');
		myForm.addExprimentItem('experimental', 'bgxdmd1', '表观相对密度');
		myForm.addExprimentItem('experimental', 'bgxdmd2', '表干相对密度');
		myForm.addExprimentItem('experimental', 'mtjxdmd', '毛体积相对密度');
		myForm.addExprimentItem('experimental', 'zpzkl', '针片状颗粒');
		myForm.addExprimentItem('experimental', 'ysz', '压碎值');
		myForm.addExprimentItem('experimental', 'rrkl', '软弱颗粒');
		myForm.addExprimentItem('experimental', 'mh', '磨耗');

		form.render();
	}
	/**
	 * 增加细集料试验项目
	 */
	myForm.addXjlExprimentItem = function() {
		$("#experimental").html('');
		myForm.addExprimentItem('experimental', '', '请选择');
		myForm.addExprimentItem('experimental', 'SF', '筛分');
		myForm.addExprimentItem('experimental', 'bgmd', '表观密度');
		myForm.addExprimentItem('experimental', 'mdjxsl', '密度及吸水率');
		myForm.addExprimentItem('experimental', 'sdl', '砂当量');
		myForm.addExprimentItem('experimental', 'lj', '棱角性');
		myForm.addExprimentItem('experimental', 'yjl', '亚甲蓝');
		form.render();
	}
	/**
	 * 增加矿粉试验项目
	 */
	myForm.addKFExprimentItem = function() {
		$("#experimental").html('');
		myForm.addExprimentItem('experimental', '', '请选择');
		myForm.addExprimentItem('experimental', 'SF', '筛分');
		myForm.addExprimentItem('experimental', 'jradx', '加热安定性');
		myForm.addExprimentItem('experimental', 'qsxs', '亲水系数');
		myForm.addExprimentItem('experimental', 'md', '密度');
		form.render();
	}

	/**
	 * 点击查询按钮
	 */
	myForm.search = function() {
		console.log('search');

		var queryData = {};
		queryData['manufacturers'] = "";
		queryData['specification'] = "";
		var nowDate = new Date();
		queryData['begindate'] = common.formatDate(nowDate.setDate(nowDate.getDate() - 31),
			'MM/dd/yyyy hh:mm:ss');
		queryData['enddate'] = common.formatDate(new Date(),
			'MM/dd/yyyy hh:mm:ss');
		var muIndex = $("#manufacturers").get(0).selectedIndex;
		var spIndex = $("#specification").get(0).selectedIndex;

		if (muIndex > 0) {
			queryData['manufacturers'] = $("#manufacturers option:selected").text();
		}
		if (spIndex > 0) {
			queryData['specification'] = $("#specification option:selected").text();
		}
		if ($("#begindate").val().length > 0) {
			queryData['begindate'] = common.formatDate($("#begindate").val() + ' 00:00:00',
				'MM/dd/yyyy hh:mm:ss');
		}
		if ($("#enddate").val().length > 0) {
			queryData['enddate'] = common.formatDate($("#enddate").val() + ' 23:59:59',
				'MM/dd/yyyy hh:mm:ss');
		}
		var mvalue = $("#materials").val();
		switch (mvalue) {
			case '1':
				myForm.report_XJL();
				break;
			case '2':
				myForm.report_CJL();
				break;
			case '3':
				myForm.report_KF();
				break;
			case '4':

				break;
			case '5':

				break;
			case '6':

				break;
		}


		table.reload(myForm.tableId, {
			where: queryData,
			limit: common.maxLimitValue,
			page: false,
			done: function(res, curr, count) {
				myForm.exportData = res.data;
				switch (mvalue) {
					case '1':
						myForm.XJL_COL_Visble(res.data);
						break;
					case '2':
						myForm.CJL_COL_Visble(res.data);
						break;
					case '3':
						myForm.KF_COL_Visble(res.data);
						break;
					case '4':

						break;
					case '5':

						break;
					case '6':

						break;
				}
			}
		});
	};

	/**
	 * 试验报告
	 */
	myForm.report = function(num) {
		layer.open({
			type: 2,
			title: "试验报告",
			area: ['1000px', '600'],
			content: '/QualityTestLabReport/detail.do?num=' + num,
			success: function(layero, index) {

			}
		});
	}
	// 搜索按钮点击事件
	$('#btnSearch').click(function() {
		myForm.search();
	});

	//材料下拉框选择
	form.on('select(materials)', function(data) {
		console.log("select(materials)" + data.value);
		dictionaryFunc.getSpecificationToSelect("specification", "请选择", basePath, data.value);
		dictionaryFunc.getFacturersToSelect("manufacturers", "请选择", basePath, data.value);

		switch (data.value) {
			case '1':
				myForm.addXjlExprimentItem();
				break;
			case '2':
				myForm.addCjlExprimentItem();
				break;
			case '3':
				myForm.addKFExprimentItem();
				break;
			case '4':

				break;
			case '5':

				break;
			case '6':

				break;
		}
	});

	//头工具栏事件
	table.on('toolbar(' + myForm.tableId + ')', function(obj) {
		var checkStatus = table.checkStatus(obj.config.id);
		switch (obj.event) {
			case 'btnExcel':
				table.exportFile(obj.config.id, myForm.exportData, 'xls')
				break;
			case 'btnPrint':
				common.print(obj.config.id);
				break;
		};
	});
	//监听行工具事件
	table.on('tool(' + myForm.tableId + ')', function(obj) {
		var data = obj.data;
		if (obj.event === 'btn_report') {
			myForm.report(data.orderTicketNum);
		}
	});

	myForm.report_CJL();

});
