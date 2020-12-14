layui.use(['form', 'table', 'ax', 'laydate', 'dictionary'], function() {
	var form = layui.form;
	var table = layui.table;
	var $ = layui.$;
	var dictionaryFunc = layui.dictionary;
	var $ax = layui.ax;
	var basePath = $("#path").val();

	dictionaryFunc.getMaterialsToSelect("materials", "请选择", basePath);

	console.log("QualityTestExperimental.js");
	var myForm = {
		tableId: "mytable"
	};
	table.render({
		elem: '#' + myForm.tableId,
		url: basePath + '/QualityTestExperimental/list.do',
		defaultToolbar: [],
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
				width: 300
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
				width: 90,
				hide: true
			}, {
				field: 'status_show',
				title: '状态',
				width: 80
			}, {
				fixed: 'right',
				title: '操作',
				toolbar: '#tableBar',
				width: 150
			}]
		],
		page: true
		/* 	,done: function(res, curr, count) {
				currPage = curr;
				var that = this.elem.next();
				$.each(res.data, function(index, obj) {
					if (obj['experimentalResult']==-1) {
						that.find(".layui-table-box tbody tr[data-index='" + index + "']").css("color", "#FF5722");
					}

				})
			} */

	});


	//监听行工具事件
	table.on('tool(' + myForm.tableId + ')', function(obj) {
		var data = obj.data;
		if (obj.event === 'btn_del') {
			myForm.delete(data.id);
		} else if (obj.event === 'btn_detail') {
			if (data.status == 0) {
				//layer.msg("未试验，不能查看");
				myForm.openDetail(data.id);
			} else {
				//layer.msg("查看试验详情");
				myForm.openDetail(data.id);
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
	 * 点击添加查看试验过程
	 */
	myForm.openDetail = function(id) {
		layer.open({
			type: 2,
			title: "查看试验",
			area: ['1100px', '650px'],
			content: '/QualityTestExperimental/detail.do?id=' + id,
			success: function(layero, index) {

			},
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
				type: "POST",
				url: basePath + "/QualityTestExperimental/delete/" + id + ".do",
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
		dictionaryFunc.getFacturersToSelect("manufacturers", "请选择", basePath, data.value);
	});


});
