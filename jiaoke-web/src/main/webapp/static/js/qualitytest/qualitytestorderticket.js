layui.use(['form', 'table', 'ax', 'laydate', 'dictionary'], function() {
	var form = layui.form;
	var table = layui.table;
	var $ = layui.$;
	var dictionaryFunc = layui.dictionary;
	var $ax = layui.ax;
	var basePath = $("#path").val();

	dictionaryFunc.getMaterialsToSelect("materials", "请选择", basePath);

	console.log("QualityTestOrderTicket");
	var myForm = {
		tableId: "mytable"
	};
	table.render({
		elem: '#' + myForm.tableId,
		url: basePath + '/QualityTestOrderTicket/list.do',
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
					width: 180
				}, {
					field: 'status_show',
					title: '状态',
					width: 100
				}, {
					fixed: 'right',
					title: '操作',
					toolbar: '#tableBar',
					width: 190
				}
			]
		],
		page: true
	});


	//监听行工具事件
	table.on('tool(' + myForm.tableId + ')', function(obj) {
		var data = obj.data;
		if (obj.event === 'btn_delete') {
			myForm.delete(data.id);
		} else if (obj.event === 'btn_add') {
			if (data.status == 2) {
				//layer.msg("不能在添加试验");
			} else {
				myForm.addExperimental(data.id);
			}
		} else if (obj.event === 'btn_confirm') {
			if (data.status == 1) {
				myForm.updateExperimental(data.id);
			}
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

		table.reload(myForm.tableId, {
			where: queryData,
			page: {
				curr: 1
			}
		});
	};


	/**
	 * 点击添加试验按钮
	 */
	myForm.addExperimental = function(id) {
		layer.open({
			type: 2,
			title: "添加试验",
			area: ['550px', '550px'],
			content: '/QualityTestOrderTicket/add_experimental.do?id=' + id,
			success: function(layero, index) {

			},
			end: function() {
				table.reload(myForm.tableId);
			}
		});
	};
	/**
	 * 点击完成试验按钮
	 */
	myForm.updateExperimental = function(id) {
		var updateData = {
			"id": id,
			"status": 2
		};
		$.ajax({
			type: "POST",
			async: false,
			url: basePath + "/QualityTestOrderTicket/update.do",
			data: updateData,
			dataType: 'JSON',
			success: function(msg) {
				if (msg.code = 200) {
					layer.msg("设置成功");
					table.reload(myForm.tableId);
				} else {
					layer.msg("设置失败");
				}
				console.log(msg);
			}
		});
		return result;
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
