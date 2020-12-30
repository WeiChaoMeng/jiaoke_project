layui.use(['form', 'table', 'ax', 'laydate', 'dictionary'], function() {
	var form = layui.form;
	var table = layui.table;
	var $ = layui.$;
	var dictionaryFunc = layui.dictionary;
	var $ax = layui.ax;
	var basePath = $("#path").val();

	dictionaryFunc.getMaterialsToSelect("materials", "请选择", basePath);

	console.log("qualitytestmanufacturersdictionary.js");
	var myForm = {
		tableId: "mytable"
	};
	table.render({
		elem: '#' + myForm.tableId,
		url: basePath + '/QualityTestManufacturersDictionary/list.do',
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
				field: 'name',
				title: '厂家',
				width: 300
			}, {
				fixed: 'right',
				title: '操作',
				toolbar: '#tableBar',
				width: 300
			}]
		],
		page: true

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
		table.reload(myForm.tableId, {
			where: queryData,
			page: {
				curr: 1
			}
		});
	};


	/**
	 * 点击添加查看试验过程
	 */
	myForm.openDetail = function(id) {
		layer.open({
			type: 2,
			title: "查看材料厂家",
			area: ['1200px', '500px'],
			content: '/QualityTestManufacturersDictionary/detail.do?id=' + id,
			success: function(layero, index) {

			}
		});
	};
	/**
	 * 新建试验
	 */
	myForm.add = function() {
		layer.open({
			type: 2,
			title: "新建材料厂家",
			area: ['550px', '500px'],
			content: '/QualityTestManufacturersDictionary/add.do',
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
			title: "查看材料厂家",
			area: ['550px', '500px'],
			content: '/QualityTestManufacturersDictionary/view.do?id=' + id+'&view=1',
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
			title: "编辑材料厂家",
			area: ['550px', '500px'],
			content: '/QualityTestManufacturersDictionary/edit.do?id=' + id,
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
				url: basePath + "/QualityTestManufacturersDictionary/delete/" + id + ".do",
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


});
