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
						colspan: 26,
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
					field: 'sK375',
					title: '37.5',
					width: 70
				}, {
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
					field: 'xsl',
					title: '吸水率',
					width: 130
				}, {
					field: 'jgx',
					title: '坚固性',
					width: 130
				}, {
					field: 'zpzkl',
					title: '针片状',
					width: 110
				}, {
					field: 'ysz',
					title: '压碎值',
					width: 80
				}, {
					field: 'rrkl',
					title: '软石含量',
					width: 100
				}, {
					field: 'mh',
					title: '磨耗损失',
					width: 90
				}, {
					field: 'klhl0075',
					title: '＜0.075mm颗粒含量',
					width: 90
				}, {
					field: 'hsl',
					title: '含水率',
					width: 80
				}, {
					field: 'nfx',
					title: '粘附性',
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
		myForm.columnHide(data, 'nfx', 32, 29);
		myForm.columnHide(data, 'hsl', 31, 28);
		myForm.columnHide(data, 'klhl0075', 30, 27);
		myForm.columnHide(data, 'mh', 29, 26);
		myForm.columnHide(data, 'rrkl', 28, 25);
		myForm.columnHide(data, 'ysz', 27, 24);
		myForm.columnHide(data, 'zpzkl', 26, 23);
		myForm.columnHide(data, 'jgx', 25, 22);
		myForm.columnHide(data, 'xsl', 24, 21);
		myForm.columnHide(data, 'mtjxdmd', 23, 20);
		myForm.columnHide(data, 'bgxdmd2', 22, 19);
		myForm.columnHide(data, 'bgxdmd1', 21, 18);
		myForm.columnHide(data, 'sK0075', 20, 17);
		myForm.columnHide(data, 'sK015', 19, 16);
		myForm.columnHide(data, 'sK03', 18, 15);
		myForm.columnHide(data, 'sK06', 17, 14);
		myForm.columnHide(data, 'sK118', 16, 13);
		myForm.columnHide(data, 'sK236', 15, 12);
		myForm.columnHide(data, 'sK475', 14, 11);
		myForm.columnHide(data, 'sK95', 13, 10);
		myForm.columnHide(data, 'sK132', 12, 9);
		myForm.columnHide(data, 'sK16', 11, 8);
		myForm.columnHide(data, 'sK19', 10, 7);
		myForm.columnHide(data, 'sK265', 9, 6);
		myForm.columnHide(data, 'sK315', 8, 5);
		myForm.columnHide(data, 'sK375', 7, 4);
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
						colspan: 16,
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
					title: '表观相对密度',
					width: 90
				}, {
					field: 'mdjxsl',
					title: '吸水率',
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
				}, {
					field: 'jgx',
					title: '坚固性',
					width: 80
				}, {
					field: 'hnl',
					title: '含泥量',
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
		myForm.columnHide(data, 'hnl', 22, 19);
		myForm.columnHide(data, 'jgx', 21, 18);
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
						colspan: 10,
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
					field: 'sK118',
					title: '1.18',
					width: 120
				}, {
					field: 'sK06',
					title: '0.6',
					width: 120
				}, {
					field: 'sK03',
					title: '0.3',
					width: 120
				}, {
					field: 'sK015',
					title: '0.15',
					width: 120
				}, {
					field: 'sK0075',
					title: '0.075',
					width: 120
				}, {
					field: 'bgmd',
					title: '表观密度',
					width: 120
				}, {
					field: 'hsl',
					title: '含水量',
					width: 120
				}, {
					field: 'qsxs',
					title: '亲水系数',
					width: 120
				}, {
					field: 'sxzl',
					title: '塑性指数',
					width: 120
				}, {
					field: 'jradx',
					title: '加热安定性',
					width: 120
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
		myForm.columnHide(data, 'jradx', 16, 13);
		myForm.columnHide(data, 'sxzl', 15, 12);
		myForm.columnHide(data, 'qsxs', 14, 11);
		myForm.columnHide(data, 'hsl', 13, 10);
		myForm.columnHide(data, 'bgmd', 12, 9);

		myForm.columnHide(data, 'sK0075', 11, 8);
		myForm.columnHide(data, 'sK015', 10, 7);
		myForm.columnHide(data, 'sK03', 9, 6);
		myForm.columnHide(data, 'sK06', 8, 5);
		myForm.columnHide(data, 'sK118', 7, 4);
	}
	/**
	 * 沥青台账
	 */
	myForm.report_LQ = function() {
		table.render({
			elem: '#' + myForm.tableId,
			title: '沥青台账',
			limit: common.maxLimitValue,
			url: basePath + '/QualityTestReport/ReportLQ.do',
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
						colspan: 23,
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
					field: 'zrd30',
					title: '针入度（30℃）',
					width: 140
				}, {
					field: 'zrd25',
					title: '针入度（25℃）',
					width: 140
				}, {
					field: 'zrd15',
					title: '针入度（15℃）',
					width: 140
				}, {
					field: 'zrd10',
					title: '针入度（10℃）',
					width: 140
				}, {
					field: 'zrd5',
					title: '针入度（5℃）',
					width: 140
				}, {
					field: 'yd25',
					title: '延度（25℃）',
					width: 120
				}, {
					field: 'yd15',
					title: '延度（15℃）',
					width: 120
				}, {
					field: 'yd10',
					title: '延度（10℃）',
					width: 120
				}, {
					field: 'yd5',
					title: '延度（5℃）',
					width: 120
				}, {
					field: 'rhd',
					title: '软化点',
					width: 120
				}, {
					field: 'sd',
					title: '闪点',
					width: 120
				}, {
					field: 'rjd',
					title: '溶解度',
					width: 120
				}, {
					field: 'dlnd',
					title: '60℃动力粘度',
					width: 120
				}, {
					field: 'md15',
					title: '密度（15℃）',
					width: 120
				}, {
					field: 'xdmd',
					title: '相对密度（25℃）',
					width: 120
				}, {
					field: 'txhf',
					title: '弹性恢复',
					width: 120
				}, {
					field: 'lx',
					title: '离析',
					width: 120
				}, {
					field: 'zlbh',
					title: '质量变化',
					width: 120
				}, {
					field: 'clzrdb',
					title: '残留针入度比',
					width: 120
				}, {
					field: 'clyd25',
					title: '残留延度（25℃）',
					width: 120
				}, {
					field: 'clyd15',
					title: '残留延度（15℃）',
					width: 120
				}, {
					field: 'clyd10',
					title: '残留延度（10℃）',
					width: 120
				}, {
					field: 'clyd5',
					title: '残留延度（5℃）',
					width: 120
				}]

			],
			done: function(res, curr, count) {
				myForm.exportData = res.data;
				myForm.LQ_COL_Visble(res.data);
			}
		});
	}
	/**
	 * 沥青字段显示判断
	 * @param {Object} data
	 */
	myForm.LQ_COL_Visble = function(data) {
		myForm.columnHide(data, 'clyd5', 29, 26);
		myForm.columnHide(data, 'clyd10', 28, 25);
		myForm.columnHide(data, 'clyd15', 27, 24);
		myForm.columnHide(data, 'clyd25', 26, 23);
		myForm.columnHide(data, 'clzrdb', 25, 22);
		myForm.columnHide(data, 'zlbh', 24, 21);
		myForm.columnHide(data, 'lx', 23, 20);
		myForm.columnHide(data, 'txhf', 22, 19);
		myForm.columnHide(data, 'xdmd', 21, 18);
		myForm.columnHide(data, 'md15', 20, 17);
		myForm.columnHide(data, 'dlnd', 19, 16);
		myForm.columnHide(data, 'rjd', 18, 15);
		myForm.columnHide(data, 'sd', 17, 14);
		myForm.columnHide(data, 'rhd', 16, 13);
		myForm.columnHide(data, 'yd5', 15, 12);
		myForm.columnHide(data, 'yd10', 14, 11);
		myForm.columnHide(data, 'yd15', 13, 10);
		myForm.columnHide(data, 'yd25', 12, 9);
		myForm.columnHide(data, 'zrd5', 11, 8);
		myForm.columnHide(data, 'zrd10', 10, 7);
		myForm.columnHide(data, 'zrd15', 9, 6);
		myForm.columnHide(data, 'zrd25', 8, 5);
		myForm.columnHide(data, 'zrd30', 7, 4);
	}
	/**
	 * 乳化沥青台账
	 */
	myForm.report_RHLQ = function() {
		table.render({
			elem: '#' + myForm.tableId,
			title: '乳化沥青台账',
			limit: common.maxLimitValue,
			url: basePath + '/QualityTestReport/ReportRHLQ.do',
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
						colspan: 6,
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
					field: 'zfllwhl',
					title: '蒸发残留物含量',
					width: 150
				}, {
					field: 'bznd',
					title: '标准粘度',
					width: 120
				}, {
					field: 'zrd',
					title: '针入度',
					width: 120
				}, {
					field: 'yd',
					title: '延度',
					width: 120
				}, {
					field: 'ccwdx1',
					title: '1d储存稳定性',
					width: 120
				}, {
					field: 'ccwdx5',
					title: '5d储存稳定性',
					width: 120
				}]

			],
			done: function(res, curr, count) {
				myForm.exportData = res.data;
				myForm.RHLQ_COL_Visble(res.data);
			}
		});
	}
	/**
	 * 乳化沥青字段显示判断
	 * @param {Object} data
	 */
	myForm.RHLQ_COL_Visble = function(data) {
		myForm.columnHide(data, 'ccwdx5', 12, 9);
		myForm.columnHide(data, 'ccwdx1', 11, 8);
		myForm.columnHide(data, 'yd', 10, 7);
		myForm.columnHide(data, 'zrd', 9, 6);
		myForm.columnHide(data, 'bznd', 8, 5);
		myForm.columnHide(data, 'zfllwhl', 7, 4);
	}
	/**
	 * 沥青混合料台账
	 */
	myForm.report_LQHHL = function() {
		table.render({
			elem: '#' + myForm.tableId,
			title: '沥青混合料台账',
			limit: common.maxLimitValue,
			url: basePath + '/QualityTestReport/ReportLQHHL.do',
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
						colspan: 29,
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
					field: 'sK375',
					title: '37.5',
					width: 70
				}, {
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
					field: 'zdlhxdmd',
					title: '最大理论相对密度',
					width: 120
				}, {
					field: 'mtjxdmd',
					title: '毛体积相对密度',
					width: 120
				}, {
					field: 'kxl',
					title: '空隙率',
					width: 130
				}, {
					field: 'lqbhd',
					title: '沥青饱和度',
					width: 130
				}, {
					field: 'kljxl',
					title: '矿料间隙率',
					width: 130
				}, {
					field: 'cjlgjjxl',
					title: '粗集料骨架间隙率',
					width: 110
				}, {
					field: 'wdd',
					title: '稳定度',
					width: 80
				}, {
					field: 'lz',
					title: '流值',
					width: 100
				}, {
					field: 'xl',
					title: '析漏	',
					width: 80
				}, {
					field: 'fs',
					title: '飞散',
					width: 80
				}, {
					field: 'clwdd',
					title: '残留稳定度',
					width: 100
				}, {
					field: 'drplqdb',
					title: '冻融劈裂强度比',
					width: 100
				}, {
					field: 'dwdd',
					title: '动稳定度',
					width: 100
				}, {
					field: 'ssxs',
					title: '渗水系数',
					width: 100
				}, {
					field: 'gzsd',
					title: '构造深度',
					width: 100
				}]

			],
			done: function(res, curr, count) {
				myForm.exportData = res.data;
				myForm.LQHHL_COL_Visble(res.data);
			}
		});
	}
	/**
	 * 沥青混合料字段显示判断
	 * @param {Object} data
	 */
	myForm.LQHHL_COL_Visble = function(data) {
		myForm.columnHide(data, 'gzsd', 35, 32);
		myForm.columnHide(data, 'ssxs', 34, 31);
		myForm.columnHide(data, 'dwdd', 33, 30);
		myForm.columnHide(data, 'drplqdb', 32, 29);
		myForm.columnHide(data, 'clwdd', 31, 28);
		myForm.columnHide(data, 'fs', 30, 27);
		myForm.columnHide(data, 'xl', 29, 26);
		myForm.columnHide(data, 'lz', 28, 25);
		myForm.columnHide(data, 'wdd', 27, 24);
		myForm.columnHide(data, 'cjlgjjxl', 26, 23);
		myForm.columnHide(data, 'kljxl', 25, 22);
		myForm.columnHide(data, 'lqbhd', 24, 21);
		myForm.columnHide(data, 'kxl', 23, 20);
		myForm.columnHide(data, 'mtjxdmd', 22, 19);
		myForm.columnHide(data, 'zdlhxdmd', 21, 18);
		myForm.columnHide(data, 'sK0075', 20, 17);
		myForm.columnHide(data, 'sK015', 19, 16);
		myForm.columnHide(data, 'sK03', 18, 15);
		myForm.columnHide(data, 'sK06', 17, 14);
		myForm.columnHide(data, 'sK118', 16, 13);
		myForm.columnHide(data, 'sK236', 15, 12);
		myForm.columnHide(data, 'sK475', 14, 11);
		myForm.columnHide(data, 'sK95', 13, 10);
		myForm.columnHide(data, 'sK132', 12, 9);
		myForm.columnHide(data, 'sK16', 11, 8);
		myForm.columnHide(data, 'sK19', 10, 7);
		myForm.columnHide(data, 'sK265', 9, 6);
		myForm.columnHide(data, 'sK315', 8, 5);
		myForm.columnHide(data, 'sK375', 7, 4);
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
		myForm.addExprimentItem('experimental', 'xsl', '吸水率');
		myForm.addExprimentItem('experimental', 'zpzkl', '针片状');
		myForm.addExprimentItem('experimental', 'ysz', '压碎值');
		myForm.addExprimentItem('experimental', 'rrkl', '软石含量');
		myForm.addExprimentItem('experimental', 'mh', '磨耗损失');
		myForm.addExprimentItem('experimental', 'jgx', '坚固性');
		myForm.addExprimentItem('experimental', 'klhl0075', '＜0.075mm颗粒含量');
		myForm.addExprimentItem('experimental', 'hsl', '含水率');
		myForm.addExprimentItem('experimental', 'nfx', '粘附性');
		form.render();
	}
	/**
	 * 增加细集料试验项目
	 */
	myForm.addXjlExprimentItem = function() {
		$("#experimental").html('');
		myForm.addExprimentItem('experimental', '', '请选择');
		myForm.addExprimentItem('experimental', 'SF', '筛分');
		myForm.addExprimentItem('experimental', 'bgmd', '表观相对密度');
		myForm.addExprimentItem('experimental', 'mdjxsl', '密度及吸水率');
		myForm.addExprimentItem('experimental', 'sdl', '砂当量');
		myForm.addExprimentItem('experimental', 'lj', '棱角性');
		myForm.addExprimentItem('experimental', 'yjl', '亚甲蓝值	');
		myForm.addExprimentItem('experimental', 'jgx', '坚固性');
		myForm.addExprimentItem('experimental', 'hnl', '含泥量');
		form.render();

	}
	/**
	 * 增加矿粉试验项目
	 */
	myForm.addKFExprimentItem = function() {
		$("#experimental").html('');
		myForm.addExprimentItem('experimental', '', '请选择');
		myForm.addExprimentItem('experimental', 'SF', '筛分');
		myForm.addExprimentItem('experimental', 'bgmd', '表观密度');
		myForm.addExprimentItem('experimental', 'qsxs', '亲水系数');
		myForm.addExprimentItem('experimental', 'sxzl', '塑性指数');
		myForm.addExprimentItem('experimental', 'jradx', '加热安定性');
		form.render();
	}
	/**
	 * 增加沥青试验项目
	 */
	myForm.addLQExprimentItem = function() {
		$("#experimental").html('');
		myForm.addExprimentItem('experimental', '', '请选择');
		myForm.addExprimentItem('experimental', 'zrd30', '针入度（30℃）');
		myForm.addExprimentItem('experimental', 'zrd25', '针入度（25℃）');
		myForm.addExprimentItem('experimental', 'zrd15', '针入度（15℃）');
		myForm.addExprimentItem('experimental', 'zrd10', '针入度（10℃）');
		myForm.addExprimentItem('experimental', 'zrd5', '针入度（5℃）');
		myForm.addExprimentItem('experimental', 'yd25', '延度（25℃）');
		myForm.addExprimentItem('experimental', 'yd15', '延度（15℃）');
		myForm.addExprimentItem('experimental', 'yd10', '延度（10℃）');
		myForm.addExprimentItem('experimental', 'yd5', '延度（5℃）');
		myForm.addExprimentItem('experimental', 'rjd', '软化点');
		myForm.addExprimentItem('experimental', 'sd', '闪点');
		myForm.addExprimentItem('experimental', 'rjd', '溶解度');
		myForm.addExprimentItem('experimental', 'dlnd', '60℃动力粘度');
		myForm.addExprimentItem('experimental', 'md15', '密度（15℃）');
		myForm.addExprimentItem('experimental', 'xdmd25', '相对密度（25℃）');
		myForm.addExprimentItem('experimental', 'txhf', '弹性恢复');
		myForm.addExprimentItem('experimental', 'lx', '离析');
		myForm.addExprimentItem('experimental', 'zlbh', '质量变化');
		myForm.addExprimentItem('experimental', 'clzrdb', '残留针入度比');
		myForm.addExprimentItem('experimental', 'clyd25', '残留延度（25℃）');
		myForm.addExprimentItem('experimental', 'clyd15', '残留延度（15℃）');
		myForm.addExprimentItem('experimental', 'clyd10', '残留延度（10℃）');
		myForm.addExprimentItem('experimental', 'clyd5', '残留延度（5℃）');
		form.render();
	}
	/**
	 * 增加乳化沥青试验项目
	 */
	myForm.addRHLQExprimentItem = function() {
		$("#experimental").html('');
		myForm.addExprimentItem('experimental', '', '请选择');
		myForm.addExprimentItem('experimental', 'zfllwhl', '蒸发残留物含量');
		myForm.addExprimentItem('experimental', 'bznd', '标准粘度');
		myForm.addExprimentItem('experimental', 'zrd', '针入度');
		myForm.addExprimentItem('experimental', 'yd', '延度');
		myForm.addExprimentItem('experimental', 'ccwdx1', '1d储存稳定性');
		myForm.addExprimentItem('experimental', 'ccwdx5', '5d储存稳定性');
		form.render();
	}
	/**
	 * 增加沥青混合料试验项目
	 */
	myForm.addLQHHLExprimentItem = function() {
		$("#experimental").html('');
		myForm.addExprimentItem('experimental', '', '请选择');
		myForm.addExprimentItem('experimental', 'SF', '筛分');
		myForm.addExprimentItem('experimental', 'zdlhxdmd', '最大理论相对密度');
		myForm.addExprimentItem('experimental', 'mtjxdmd', '毛体积相对密度');
		myForm.addExprimentItem('experimental', 'kxl', '空隙率');
		myForm.addExprimentItem('experimental', 'lqbhd', '沥青饱和度');
		myForm.addExprimentItem('experimental', 'kljxl', '矿料间隙率');
		myForm.addExprimentItem('experimental', 'cjlgjjxl', '粗集料骨架间隙率');
		myForm.addExprimentItem('experimental', 'wdd', '稳定度');
		myForm.addExprimentItem('experimental', 'lz', '	流值');
		myForm.addExprimentItem('experimental', 'xl', '	析漏');
		myForm.addExprimentItem('experimental', 'fs', '	飞散	');
		myForm.addExprimentItem('experimental', 'clwdd', '残留稳定度');
		myForm.addExprimentItem('experimental', 'drplqdb', '冻融劈裂强度比');
		myForm.addExprimentItem('experimental', 'dwdd', '动稳定度	');
		myForm.addExprimentItem('experimental', 'ssxs', '渗水系数');
		myForm.addExprimentItem('experimental', 'gzsd', '构造深度');
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
		$("#div_talbe").show();
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
				myForm.report_LQ();
				break;
			case '8':
				myForm.report_RHLQ();
				break;
			case '9':
				myForm.report_LQHHL();
				break;
			default:
				$("#div_talbe").hide();
				break;
		}


		/* table.reload(myForm.tableId, {
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
						myForm.LQ_COL_Visble(res.data);
						break;
					case '8':
						myForm.RHLQ_COL_Visble(res.data);
						break;
					case '9':
						myForm.LQHHL_COL_Visble(res.data);
						break;
				}
			}
		}); */
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
				myForm.addLQExprimentItem();
				break;
			case '8':
				myForm.addRHLQExprimentItem();
				break;
			case '9':
				myForm.addLQHHLExprimentItem();
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
