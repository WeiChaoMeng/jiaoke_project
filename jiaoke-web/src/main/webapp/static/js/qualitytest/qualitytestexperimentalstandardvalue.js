layui.use(['form', 'table', 'laydate', 'dictionary'], function() {
	var form = layui.form;
	var table = layui.table;
	var $ = layui.$;
	var basePath = $("#path").val();
	var dictionaryFunc = layui.dictionary;
	console.log("qualitytestexperimentalstandardvalue.js");

	dictionaryFunc.getMaterialsToSelect("materials", "请选择", basePath);

	var myForm = {
		tableId: "mytable"
	};
	/**
	 * 初始化表格
	 */
	table.render({
		elem: '#' + myForm.tableId,
		url: basePath + '/QualityTestExperimentalStandardvalue/list.do',
		defaultToolbar: [],
		toolbar: '#toolbarButton',
		cols: [
			[{
				field: 'xuhao',
				title: '序号',
				width: 70,
				type: "numbers"
			},  {
				field: 'materials',
				title: '材料',
				width: 120
			}, {
				field: 'specification',
				title: '规格',
				width: 150
			}, /* {
				field: 'specificationLevel',
				title: '等级',
				width: 130
			}, */ {
				field: 'experimentalName',
				title: '试验名称',
				width: 250
			}, {
				field: 'experimentalItem',
				title: '试验项',
				width: 140
			}, {
				field: 'requirements',
				title: '技术要求',
				width: 180
			}, {
				fixed: 'right',
				title: '操作',
				toolbar: '#tableBar',
				width: 200
			}]
		],
		page: true
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
	//监听行工具事件
	table.on('tool(' + myForm.tableId + ')', function(obj) {
		var data = obj.data;
		if (obj.event === 'btn_del') {
			myForm.delete(data.id);
		} else if (obj.event === 'btn_detail') {
			myForm.view(data.id);
		} else if (obj.event === 'btn_edit') {
			myForm.edit(data.id);
		}
	});


	/**
	 * 点击查询按钮
	 */
	myForm.search = function() {

		console.log('search');

		var queryData = {};
		queryData['materials'] = "";
		queryData['experimentalName'] = "";
		queryData['specification'] = "";
		var maIndex = $("#materials").get(0).selectedIndex;
		var muIndex = $("#experimental").get(0).selectedIndex;
		var spIndex = $("#specification").get(0).selectedIndex;
		if (maIndex > 0) {
			queryData['materials'] = $("#materials option:selected").text();
		}
		if (muIndex > 0) {
			queryData['experimentalName'] = $("#experimental option:selected").text();
		}
		if (spIndex > 0) {
			queryData['specification'] = $("#specification option:selected").text();
		}

		table.reload(myForm.tableId, {
			where: queryData,
			page: {
				curr: 1
			}
		});
	};
	/**
	 * 点击新增按钮
	 */
	myForm.add = function() {
		layer.open({
			type: 2,
			title: "新建试验标准值",
			area: ['550px', '600px'],
			content: '/QualityTestExperimentalStandardvalue/add.do',
			success: function(layero, index) {
				var iframe = layero.find('iframe')[0].contentWindow;
				iframe.layui.form.render('select');
			},
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
			title: "查看试验标准值",
			area: ['550px', '600px'],
			content: '/QualityTestExperimentalStandardvalue/view.do?id=' + id+'&view=1',
			success: function(layero, index) {},
			end: function() {
				//table.reload(myForm.tableId);
			}
		});
	};
	/**
	 * 点击编辑按钮
	 */
	myForm.edit = function(id) {
		layer.open({
			type: 2,
			title: "编辑试验标准值",
			area: ['550px', '600px'],
			content: '/QualityTestExperimentalStandardvalue/edit.do?view=2&id=' + id,
			success: function(layero, index) {},
			end: function() {
				table.reload(myForm.tableId);
			}
		});
	};
	/**
	 * 点击删除按钮
	 */
	myForm.delete = function(id) {
		console.log('btn_delete');
		layer.confirm('您确定删除吗？', {
			btn: ['确定', '取消']
		}, function() {
			console.log('确定');
			$.ajax({
				type: "DELETE",
				url: basePath + "/QualityTestExperimentalStandardvalue/delete/" + id + ".do",
				dataType: 'JSON',
				success: function(msg) {
					if (msg.code = 200) {
						layer.msg("删除成功");
						table.reload(myForm.tableId);
					} else {
						layer.msg("删除失败");
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

	//材料下拉框选择
	form.on('select(materials)', function(data) {
		console.log("select(materials)" + data.value);
		dictionaryFunc.getSpecificationToSelect("specification", "请选择", basePath, data.value);
		dictionaryFunc.getExperimentalToSelect("experimental", "请选择", basePath, data.value);
	});


});
