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
	console.log("qualitytestorderticket_reports");

	dictionaryFunc.getMaterialsToSelect("materials", "请选择", basePath);

	var myForm = {
		tableId: "mytable",
		exportData: ""
	};

	table.render({
		elem: '#' + myForm.tableId,
		title: '委托单台账',
		limit: common.maxLimitValue,
		url: basePath + '/QualityTestReport/ReportWTD.do',
		defaultToolbar: [],
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
					field: 'tunnage',
					title: '代表吨数',
					width: 90
				}, {
					field: 'requiredExperimental',
					title: '试验项目',
					width: 380
				}, {
					field: 'samplingremark',
					title: '备注',
					width: 100
				}, {
					field: 'status',
					title: '状态',
					width: 100,
					templet: "#t_status"
				}
			]
		],
		done: function(res, curr, count) {
			myForm.exportData = res.data;
		}
	});



	/**
	 * 点击查询按钮
	 */
	myForm.search = function() {
		console.log('search');

		var queryData = {};
		queryData['materials'] = "";
		queryData['manufacturers'] = "";
		queryData['specification'] = "";
		queryData['status'] = "";		
		var nowDate = new Date();
		queryData['begindate'] = common.formatDate(nowDate.setDate(nowDate.getDate() - 31),
			'MM/dd/yyyy hh:mm:ss');
		queryData['enddate'] = common.formatDate(new Date(),
			'MM/dd/yyyy hh:mm:ss');
			
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
		queryData['status'] = $("#status").val();
		if ($("#begindate").val().length > 0) {
			queryData['begindate'] = common.formatDate($("#begindate").val() + ' 00:00:00',
				'MM/dd/yyyy hh:mm:ss');
		}
		if ($("#enddate").val().length > 0) {
			queryData['enddate'] = common.formatDate($("#enddate").val() + ' 23:59:59',
				'MM/dd/yyyy hh:mm:ss');
		}

		table.reload(myForm.tableId, {
			where: queryData,
			limit: common.maxLimitValue,
			page: false,
			done: function(res, curr, count) {
				myForm.exportData = res.data;
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


});
