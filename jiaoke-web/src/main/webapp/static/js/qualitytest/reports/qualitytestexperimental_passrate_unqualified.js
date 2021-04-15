layui.use(['form', 'table', 'ax', 'laydate', 'dictionary'], function() {
	var form = layui.form;
	var table = layui.table;
	var $ = layui.$;
	var dictionaryFunc = layui.dictionary;
	var $ax = layui.ax;
	var basePath = $("#path").val();

	console.log("qualitytestexperimental_passrate_unqualified.js");
	var myForm = {
		tableId: "mytable",
		exportData: "",
		legendData: [],
		chartData: []
	};



	var queryData = {};
	queryData['materials'] = common.getUrlParam("materials");
	queryData['manufacturers'] = common.getUrlParam("manufacturers");
	queryData['specification'] = common.getUrlParam("specification");
	queryData['experimentalId'] = common.getUrlParam("experimentalId");
	queryData['begindate'] = common.getUrlParam("begindate");
	queryData['enddate'] = common.getUrlParam("enddate");
	queryData['experimentalResult'] = common.getUrlParam("experimental_result");


	console.log(queryData);
	/*table.render({
		elem: '#' + myForm.tableId,
		title: '不合格试验',
		limit: common.maxLimitValue,
		url: basePath + '/QualityTestExperimental/list.do',
		defaultToolbar: [],
		where: queryData,
		toolbar: '#toolbarButton',
		cols: [
			[{
				field: 'xuhao',
				title: '序号',
				width: 55,
				type: "numbers"
			}, {
				field: 'experimentalNum',
				title: '试验编号',
				width: 170
			}, {
				field: 'experimentalName',
				title: '试验名称',
				width: 230
			}, {
				field: 'num',
				title: '取样单编号',
				width: 140
			}, {
				field: 'materials',
				title: '材料',
				width: 100
			}, {
				field: 'specification',
				title: '规格',
				width: 130
			}, {
				field: 'manufacturers',
				title: '所属厂家',
				width: 130
			}, {
				field: 'samplingcreateTime',
				title: '取样时间',
				width: 160,
				templet: "<div>{{layui.util.toDateString(d.samplingcreateTime, 'yyyy-MM-dd HH:mm:ss')}}</div>"
			}, {
				field: 'result_show',
				title: '试验结果',
				width: 90
			}]
		],
		page: false,
		done: function(res, curr, count) {
			myForm.exportData = res.data;
		}
	});
*/
	var queryData = {};
	queryData['materials'] = common.getUrlParam("materials");
	queryData['manufacturers'] = common.getUrlParam("manufacturers");
	queryData['specification'] = common.getUrlParam("specification");

	queryData['begindate'] = common.getUrlParam("begindate");
	queryData['enddate'] = common.getUrlParam("enddate");
	queryData['experimentResult'] = -1;
	queryData['experimentStatus'] = 3;

	table.render({
		elem: '#' + myForm.tableId,
		url: basePath + '/QualityTestOrderTicket/list.do',
		defaultToolbar: [],
		where: queryData,
		limit: common.maxLimitValue,
		toolbar: '#toolbarButton',
		cols: [
			[{
					field: 'xuhao',
					title: '序号',
					width: 70,
					type: "numbers"
				},
				{
					field: 'orderTicketNum',
					title: '委托单编号',
					width: 160
				}, {
					field: 'num',
					title: '取样单编号',
					width: 130
				}, {
					field: 'materials',
					title: '材料',
					width: 90
				}, {
					field: 'specification',
					title: '规格',
					width: 100
				}, {
					field: 'manufacturers',
					title: '所属厂家',
					width: 100
				}, {
					field: 'tunnage',
					title: '代表吨数',
					width: 70
				}, {
					field: 'samplingcreateTime',
					title: '取样时间',
					width: 160,
					templet: "<div>{{layui.util.toDateString(d.samplingcreateTime, 'yyyy-MM-dd HH:mm:ss')}}</div>"
				}, {
					field: 'requiredExperimental',
					title: '试验项目',
					width: 150
				}, {
					field: '',
					title: '试验结果',
					width: 95,
					templet: "<div>不合格</div>"
				}, {
					title: '操作',
					toolbar: '#tableBar',
					rowspan: 2,
					width: 100
				}
			]
		],
		page: false,
		done: function(res, curr, count) {
			myForm.exportData = res.data;
		}
	});


	//头工具栏事件
	table.on('toolbar(' + myForm.tableId + ')', function(obj) {
		var checkStatus = table.checkStatus(obj.config.id);
		switch (obj.event) {
			case 'btnExcel':
				table.exportFile(obj.config.id, myForm.exportData, 'xls');
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
	/**
	 * 试验报告
	 */
	myForm.report = function(num) {
		layer.open({
			type: 2,
			title: "试验报告",
			area: ['1200px', '600'],
			content: '/QualityTestLabReport/detail.do?num=' + num,
			success: function(layero, index) {
	
			}
		});
	}
	/**
	 * 得到图表数据
	 */
	myForm.getChartData = function() {
		var dataInfo = null;
		$.ajax({
			type: "GET",
			async: false,
			url: basePath + "/QualityTestExperimentalPassRate/Experiment_list.do",
			data: queryData,
			dataType: 'json',
			success: function(msg) {
				if (msg.count = 200) {
					dataInfo = msg.data;
					console.log(dataInfo);
				}
			}
		})
		if (dataInfo == null || dataInfo.length == 0) {
			return;
		}
		for (var i = 0; i < dataInfo.length; i++) {
			var name = dataInfo[i]['experimental_name'];
			var count = dataInfo[i]['count'];
			var obj = {
				value: count,
				name: name
			}
			myForm.legendData.push(name);
			myForm.chartData.push(obj);
		}
	}
	/**
	 * 生成饼图
	 */
	myForm.createChart = function() {
		var option = {
			tooltip: {
				trigger: 'item',
				formatter: '{a} <br/>{b}: {c} ({d}%)'
			},
			legend: {
				orient: 'vertical',
				left: 10,
				data: myForm.legendData
			},
			series: [{
				name: '不合格试验',
				type: 'pie',
				radius: ['40%', '55%'],
				label: {
					formatter: '{a|{a}}{abg|}\n{hr|}\n  {b|{b}：}{c}  {per|{d}%}  ',
					backgroundColor: '#eee',
					borderColor: '#aaa',
					borderWidth: 1,
					borderRadius: 4,
					rich: {
						a: {
							color: '#999',
							lineHeight: 22,
							align: 'center'
						},
						hr: {
							borderColor: '#aaa',
							width: '100%',
							borderWidth: 0.5,
							height: 0
						},
						b: {
							fontSize: 16,
							lineHeight: 33
						},
						per: {
							color: '#eee',
							backgroundColor: '#334455',
							padding: [2, 4],
							borderRadius: 2
						}
					}
				},
				data: myForm.chartData
			}]
		};

		var myChart1 = echarts.init(document.getElementById('echart1'));
		myChart1.setOption(option);
	}
	myForm.getChartData();
	/* myForm.legendData = ['试验1', '试验2', '试验3', '试验4', '试验5'];
	myForm.chartData = [{
			value: 335,
			name: '试验1'
		},
		{
			value: 310,
			name: '试验2'
		},
		{
			value: 234,
			name: '试验3'
		},
		{
			value: 135,
			name: '试验4'
		},
		{
			value: 108,
			name: '试验5'
		}
	]; */
	myForm.createChart();

});
