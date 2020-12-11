layui.use(['form', 'table', 'laydate', 'dictionary'], function() {
	var form = layui.form;
	var table = layui.table;
	var $ = layui.$;
	var basePath = $("#path").val();
	var dictionaryFunc = layui.dictionary;
	console.log("qualitytestsamplingpage.js");

	dictionaryFunc.getMaterialsToSelect("materials", "请选择", basePath);

	var mySampling = {
		tableId: "mytable"
	};
	/**
	 * 初始化表格
	 */
	table.render({
		elem: '#' + mySampling.tableId,
		url: basePath + '/QualityTestSamplingpage/list.do',
		defaultToolbar: [],
		toolbar: '#toolbarButton',
		cols: [
			[{
				field: 'xuhao',
				title: '序号',
				width: 70,
				type: "numbers"
			}, {
				field: 'num',
				title: '取样单编号',
				width: 140
			}, {
				field: 'materials',
				title: '材料',
				width: 120
			}, {
				field: 'specification',
				title: '规格',
				width: 150
			}, {
				field: 'manufacturers',
				title: '所属厂家',
				width: 130
			}, {
				field: 'tunnage',
				title: '代表吨数',
				width: 100
			}, {
				field: 'createUser',
				title: '取样人',
				width: 100
			}, {
				field: 'createTime',
				title: '取样时间',
				width: 180,
				//templet: "<div>{{layui.util.toDateString(d.createTime, 'yyyy-MM-dd HH:mm:ss')}}</div>"
				templet: "#createTime"
			}, {
				field: 'remark',
				title: '备注',
				width: 120
			}, {
				field: 'status_show',
				title: '状态',
				width: 100
			}, {
				fixed: 'right',
				title: '操作',
				toolbar: '#tableBar',
				width: 170
			}]
		],
		page: true
	});

	//头工具栏事件
	table.on('toolbar(' + mySampling.tableId + ')', function(obj) {
		var checkStatus = table.checkStatus(obj.config.id);
		switch (obj.event) {
			case 'btnAdd':
				mySampling.add();
				/* var data = checkStatus.data;
				layer.alert(JSON.stringify(data)); */
				break;
		};
	});
	//监听行工具事件
	table.on('tool(' + mySampling.tableId + ')', function(obj) {
		var data = obj.data;
		if (obj.event === 'btn_delete') {
			mySampling.delete(data.id);
		} else if (obj.event === 'btn_confirm') {
			if (data.status == 1) {
				//layer.msg("已生成取样单");
			} else {
				mySampling.confirm(data.id);
			}
		}
	});


	/**
	 * 点击查询按钮
	 */
	mySampling.search = function() {

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

		table.reload(mySampling.tableId, {
			where: queryData,
			page: {
				curr: 1
			}
		});
	};
	/**
	 * 点击新增按钮
	 */
	mySampling.add = function() {
		//layer.msg('add');
		layer.open({
			type: 2,
			title: "新建取样单",
			area: ['550px', '600px'],
			content: '/QualityTestSamplingpage/add.do',
			success: function(layero, index) {
				var iframe = layero.find('iframe')[0].contentWindow;
				iframe.layui.form.render('select');
			},
			end: function() {
				table.reload(mySampling.tableId);
			}
		});
	}


	/**
	 * 点击删除按钮
	 */
	mySampling.delete = function(id) {
		console.log('btn_delete');
		layer.confirm('您确定删除吗？', {
			btn: ['确定', '取消']
		}, function() {
			console.log('确定');
			$.ajax({
				type: "POST",
				url: basePath + "/QualityTestSamplingpage/delete/" + id + ".do",
				dataType: 'JSON',
				success: function(msg) {
					if (msg.code = 200) {
						layer.msg("删除成功");
						table.reload(mySampling.tableId);
					} else {
						layer.msg("删除失败");
					}
				}
			})

		}, function() {
			console.log('取消');
		});
	};
	/**
	 * 点击确认按钮
	 */
	mySampling.confirm = function(id) {
		console.log('btn_confirm');
		layer.confirm('您确定要生成取样单吗？', {
			btn: ['确定', '取消']
		}, function() {
			$.ajax({
				type: "POST",
				url: basePath + "/QualityTestSamplingpage/confirm/" + id + ".do",
				dataType: 'json',
				success: function(msg) {
					if (msg.code = 200) {
						layer.alert("生成成功");
						table.reload(mySampling.tableId);
					} else {
						layer.alert("生成失败");
					}
				}
			})
		}, function() {

		});
	};
	// 搜索按钮点击事件
	$('#btnSearch').click(function() {
		mySampling.search();
	});

	//材料下拉框选择
	form.on('select(materials)', function(data) {
		console.log("select(materials)" + data.value);
		dictionaryFunc.getSpecificationToSelect("specification", "请选择", basePath, data.value);
		dictionaryFunc.getFacturersToSelect("manufacturers", "请选择", basePath, data.value);
	});


});
