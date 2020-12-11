layui.use(['form', 'table', 'ax', 'laydate', 'dictionary'], function() {
	var form = layui.form;
	var table = layui.table;
	var $ = layui.$;
	var dictionaryFunc = layui.dictionary;
	var $ax = layui.ax;
	var basePath = $("#path").val();

	dictionaryFunc.getMaterialsToSelect("materials", "请选择", basePath);

	console.log("QualityTestLabReport");
	var myForm = {
		tableId: "mytable"
	};
	table.render({
		elem: '#' + myForm.tableId,
		url: basePath + '/QualityTestLabReport/list.do',
		defaultToolbar: [],
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
					width: 100
				}, {
					field: 'specification',
					title: '规格',
					width: 130
				}, {
					field: 'manufacturers',
					title: '所属厂家',
					width: 100
				}, {
					field: 'samplingDate',
					title: '取样时间',
					width: 160,
					templet: "<div>{{layui.util.toDateString(d.samplingDate, 'yyyy-MM-dd HH:mm:ss')}}</div>"
				}, {
					field: 'requiredExperimental',
					title: '试验项目',
					width: 300
				}, {
					field: 'experimentResult',
					title: '试验结果',
					width: 100,
					templet: "#experiment_result"
				}, {
					field: 'experimentResult',
					title: '状态',
					width: 100,
					templet: "#experiment_status"
				}, {
					field: 'noticeDepStr',
					title: '发送部门',
					width: 170
				}, {

					title: '操作',
					toolbar: '#tableBar',
					width: 100
				}
			]
		],
		page: true
	});


	//监听行工具事件
	table.on('tool(' + myForm.tableId + ')', function(obj) {
		var data = obj.data;
		if (obj.event === 'btn_view') {
			myForm.openReport(data.orderTicketNum);
		}
	});
	/**
	 *查看试验报告
	 */
	myForm.openReport = function(id) {
		layer.open({
			type: 2,
			title: "生成试验报告",
			area: ['1000px', '600'],
			content: '/QualityTestLabReport/detail.do?num=' + id,
			success: function(layero, index) {

			},
			end: function() {
				table.reload(myForm.tableId);
			}
		});
	};

	/**
	 * 点击查询按钮
	 */
	myForm.search = function() {

		console.log('search');

		var queryData = {};
		queryData['materials'] = "";
		queryData['manufacturers'] = "";
		queryData['specification'] = "";
		queryData['experimentResult'] = "";
		queryData['experimentStatus'] = "";

		var maIndex = $("#materials").get(0).selectedIndex;
		var muIndex = $("#manufacturers").get(0).selectedIndex;
		var spIndex = $("#specification").get(0).selectedIndex;
		if (maIndex > 0) {
			queryData['materials'] = $("#materials option:selected").text();
		}
		if (muIndex > 0) {
			queryData['manufacturers'] = $("#manufacturers option:selected").text();
		}
		if (spIndex > 0) {
			queryData['specification'] = $("#specification option:selected").text();
		}
		queryData['experimentResult'] = $("#experimentResult").val();
		queryData['experimentStatus'] = $("#experimentStatus").val();
		table.reload(myForm.tableId, {
			where: queryData,
			page: {
				curr: 1
			}
		});
	};



	// 搜索按钮点击事件
	$('#btnSearch').click(function() {
		myForm.search();
	});

	//材料下拉框选择
	form.on('select(materials)', function(data) {
		console.log("select(materials)" + data.value);
		dictionaryFunc.getSpecificationToSelect("specification", "请选择", basePath, data.value);
		dictionaryFunc.getFacturersToSelect("manufacturers", "请选择", basePath, data.value);
	});


});
