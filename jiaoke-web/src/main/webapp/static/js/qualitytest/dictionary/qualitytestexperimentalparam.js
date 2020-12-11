layui.use(['form', 'table', 'ax', 'laydate', 'dictionary'], function() {
	var form = layui.form;
	var table = layui.table;
	var $ = layui.$;
	var dictionaryFunc = layui.dictionary;
	var $ax = layui.ax;
	var basePath = $("#path").val();

	dictionaryFunc.getMaterialsToSelect("materials", "请选择", basePath);

	console.log("qualitytestexperimentalparam.js");
	var myForm = {
		tableId: "mytable"
	};
	table.render({
		elem: '#' + myForm.tableId,
		url: basePath + '/QualityTestExperimentalParam/list.do',
		defaultToolbar: [],
		toolbar: '#toolbarButton',
		cols: [
			[{
				field: 'xuhao',
				title: '序号',
				width: 55,
				type: "numbers"
			}, {
				field: 'materialName',
				title: '材料',
				width: 200
			}, {
				field: 'experimenName',
				title: '试验名称',
				width: 300
			}, {
				field: 'formula',
				title: '计算公式',
				width: 300
			}, {
				field: 'status_show',
				title: '状态',
				width: 110
			}, {
				fixed: 'right',
				title: '操作',
				toolbar: '#tableBar',
				width: 400
			}]
		],
		page: true
	});


	//监听行工具事件
	table.on('tool(' + myForm.tableId + ')', function(obj) {
		var data = obj.data;
		if (obj.event == 'btn_del') {
			if (data.status == 1) {
				myForm.delete(data.id);
			}
		} else if (obj.event == 'btn_detail') {
			myForm.view(data.id);
		} else if (obj.event == 'btn_edit') {
			myForm.edit(data.id);
		} else if (obj.event == 'btn_use') {
			if (data.status == 0) {
				myForm.use(data);
			}
		} else if (obj.event == 'btn_copy') {
			myForm.copy(data.id);
		}
	});

	//头工具栏事件
	table.on('toolbar(' + myForm.tableId + ')', function(obj) {
		var checkStatus = table.checkStatus(obj.config.id);
		switch (obj.event) {
			case 'btnAdd':
				myForm.add();
				break;
		};
	});
	/**
	 * 检查是否存在应用中的试验
	 * @param {Object} data
	 */
	myForm.existsUseExp = function(data) {
		var isExists = false;
		var data = {
			experimenId: data.experimenId,
			status: 1
		}
		$.ajax({
			type: "GET",
			async: false,
			url: basePath + "/QualityTestExperimentalParam/list.do",
			dataType: 'JSON',
			data: data,
			success: function(msg) {
				if (msg.count > 0) {
					isExists = true;
				}
			}
		})
		return isExists;
	};
	/**
	 * 点击查询按钮
	 */
	myForm.search = function() {
		console.log('search');

		var queryData = {};
		queryData['materialId'] = "";
		var maIndex = $("#materials").get(0).selectedIndex;
		if (maIndex > 0) {
			queryData['materialId'] = $("#materials").val();
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
	 * 新建试验
	 */
	myForm.add = function() {
		layer.open({
			type: 2,
			title: "新增试验过程",
			area: ['1100px', '700px'],
			content: '/QualityTestExperimentalParam/add.do',
			success: function(layero, index) {},
			end: function() {
				table.reload(myForm.tableId);
			}
		});
	}
	/**
	 * 点击查看按钮
	 */
	myForm.view = function(id) {
		layer.open({
			type: 2,
			title: "查试验过程",
			area: ['1100px', '700px'],
			content: '/QualityTestExperimentalParam/view.do?id=' + id + '&view=1',
			success: function(layero, index) {},
			end: function() {
				table.reload(myForm.tableId);
			}
		});
	};
	/**
	 * 点击编辑按钮
	 */
	myForm.edit = function(id) {
		layer.open({
			type: 2,
			title: "配置试验过程",
			area: ['1100px', '700px'],
			content: '/QualityTestExperimentalParam/edit.do?id=' + id + '&view=2',
			success: function(layero, index) {},
			end: function() {
				table.reload(myForm.tableId);
			}
		});
	};
	/**
	 * 点击应用按钮
	 */
	myForm.use = function(data) {
		if (myForm.existsUseExp(data)) {
			layer.msg("此试验过程正在应用中，不能重复设置");
			return;
		}
		var data = {
			updateId: data.id,
			status: 1
		}
		$.ajax({
			type: "POST",
			url: basePath + "/QualityTestExperimentalParam/update.do",
			dataType: 'JSON',
			data: data,
			success: function(msg) {
				if (msg.code = 200) {
					layer.msg("应用成功");
					table.reload(myForm.tableId);
				} else {
					layer.msg("应用失败");
				}
			}
		})
	};
	/**
	 * 点击复制按钮
	 */
	myForm.copy = function(id) {
		$.ajax({
			type: "POST",
			url: basePath + "/QualityTestExperimentalParam/copy/" + id + ".do",
			dataType: 'JSON',
			success: function(msg) {
				if (msg.code = 200) {
					layer.msg("复制成功");
					table.reload(myForm.tableId);
				} else {
					layer.msg("复制失败");
				}
			}
		})
	};
	/**
	 * 点击失效按钮
	 */
	myForm.delete = function(id) {
		console.log('btn_delete');
		layer.confirm('您确定要设置为失效吗？', {
			btn: ['确定', '取消']
		}, function() {
			$.ajax({
				type: "DELETE",
				url: basePath + "/QualityTestExperimentalParam/delete/" + id + ".do",
				dataType: 'JSON',
				success: function(msg) {
					if (msg.code = 200) {
						layer.msg("设置失效成功");
						table.reload(myForm.tableId);
					} else {
						layer.msg("设置失效失败");
					}
				}
			})

		}, function() {
			console.log('取消');
		});
	};
	// 搜索按钮点击事件
	$('#btnSearch').click(function() {
		myForm.search();
	});


});
