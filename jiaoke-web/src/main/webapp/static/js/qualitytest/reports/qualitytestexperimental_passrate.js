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

	dictionaryFunc.getMaterialsToSelect("materials", "请选择", basePath);

	console.log("qualitytestexperimental_passrate.js");
	var myForm = {
		chartData: null
	};
	/**
	 * 获取规格字典
	 */
	myForm.getData = function(searchData) {
		myForm.chartData = null;
		var result = null;
		$.ajax({
			type: "GET",
			async: false,
			url: basePath + "/QualityTestExperimentalPassRate/list.do",
			data: searchData,
			dataType: 'json',
			success: function(msg) {
				if (msg.code == 200) {
					result = msg.data;
					myForm.chartData = msg.data;
				}
				console.log(msg);
			}
		})
		return result;
	}
	/**
	 * 获取查询条件
	 */
	myForm.getQueryData = function() {
		var queryData = {};
		queryData['materials'] = "";
		queryData['manufacturers'] = "";
		queryData['specification'] = "";
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

		queryData['experimentalId'] = $("#experimental").val();
		if ($("#begindate").val().length > 0) {
			queryData['begindate'] = common.formatDate($("#begindate").val() + ' 00:00:00',
				'MM/dd/yyyy hh:mm:ss');
		}
		if ($("#enddate").val().length > 0) {
			queryData['enddate'] = common.formatDate($("#enddate").val() + ' 23:59:59',
				'MM/dd/yyyy hh:mm:ss');
		}
		return queryData;
	}
	/**
	 * 点击查询按钮
	 */
	myForm.search = function() {
		console.log('search');
		var queryData = myForm.getQueryData();
		myForm.getData(queryData);
		myForm.refreshChart();
	};


	// 搜索按钮点击事件
	$('#btnSearch').click(function() {
		myForm.search();
	});


	myForm.getParam = function(data) {
		let url = '';
		for (var k in data) {
			let value = data[k] !== undefined ? data[k] : '';
			url += `&${k}=${encodeURIComponent(value)}`
		}
		return url ? url.substring(1) : ''
	}

	myForm.newUrl = function(url, data) {
		return url += (url.indexOf('?') < 0 ? '?' : '') + myForm.getParam(data);
	}
	/**
	 * 打开不合格记录界面
	 * @param {Object} materials
	 */
	myForm.openUnqualifiedPage = function(materials) {
		var queryData = myForm.getQueryData();
		queryData['materials'] = materials;
		queryData['experimental_result'] = -1;
		layer.open({
			type: 2,
			title: "查看不合格试验",
			area: ['1300px', '700px'],
			//content: '/QualityTestExperimentalPassRate/unqualified_page.do?queryData=' + param,
			content: myForm.newUrl('/QualityTestExperimentalPassRate/unqualified_page.do', queryData),
			success: function(layero, index) {

			}
		});
	}

	//材料下拉框选择
	form.on('select(materials)', function(data) {
		console.log("select(materials)" + data.value);
		dictionaryFunc.getSpecificationToSelect("specification", "请选择", basePath, data.value);
		dictionaryFunc.getFacturersToSelect("manufacturers", "请选择", basePath, data.value);
		dictionaryFunc.getExperimentalToSelect("experimental", "请选择", basePath, data.value);
	});

	/**
	 * 根据材料ID获取不合格数量
	 * @param {Object} materials_id
	 */
	myForm.getUnqualifiedCount = function(materials_id) {
		var result = 0;
		if (myForm.chartData != null) {
			for (var i = 0; i < myForm.chartData.length; i++) {
				if (myForm.chartData[i]['materials_num'] == materials_id &&
					myForm.chartData[i]['experimental_result'] == -1) {
					result = myForm.chartData[i]['count'];
					break;
				}
			}
		}
		return result;
	}
	/**
	 * 根据材料ID获取合格数量
	 * @param {Object} materials_id
	 */
	myForm.getqualifiedCount = function(materials_id) {
		var result = 0;
		if (myForm.chartData != null) {
			for (var i = 0; i < myForm.chartData.length; i++) {
				if (myForm.chartData[i]['materials_num'] == materials_id &&
					myForm.chartData[i]['experimental_result'] == 1) {
					result = myForm.chartData[i]['count'];
					break;
				}
			}
		}
		return result;
	}
	/**
	 * 刷新图表
	 */
	myForm.refreshChart = function() {
		if ($("#materials").val() > 0) {
			$("#echart1").hide();
			$("#echart2").hide();
			$("#echart3").hide();
			$("#echart4").hide();
			$("#echart5").hide();
			$("#echart6").hide();
			$("#echart7").hide();
			$("#echart8").hide();
			$("#echart9").hide();
			$("#echart10").hide();
			switch ($("#materials").val()) {
				case '1':
					$("#echart2").show();
					break;
				case '2':
					$("#echart1").show();
					break;
				case '3':
					$("#echart3").show();
					break;
				case '4':
					$("#echart4").show();
					break;
				case '5':
					$("#echart9").show();
					break;
				case '6':
					$("#echart8").show();
					break;
				case '7':
					$("#echart10").show();
					break;
				case '8':
					$("#echart5").show();
					break;
				case '9':
					$("#echart6").show();
					break;
				case '10':
					$("#echart7").show();
					break;
			}
		} else {
			$("#echart1").show();
			$("#echart2").show();
			$("#echart3").show();
			$("#echart4").show();
			$("#echart5").show();
			$("#echart6").show();
			$("#echart7").show();
			$("#echart8").show();
			$("#echart9").show();
			$("#echart10").show();
		}
		myChart1.setOption(myForm.createOption('粗集料合格率', myForm.getUnqualifiedCount(2), myForm.getqualifiedCount(2)));
		myChart2.setOption(myForm.createOption('细集料合格率', myForm.getUnqualifiedCount(1), myForm.getqualifiedCount(1)));
		myChart3.setOption(myForm.createOption('矿粉合格率', myForm.getUnqualifiedCount(3), myForm.getqualifiedCount(3)));
		myChart4.setOption(myForm.createOption('沥青合格率', myForm.getUnqualifiedCount(4), myForm.getqualifiedCount(4)));
		myChart5.setOption(myForm.createOption('沥青混合料合格率', myForm.getUnqualifiedCount(9), myForm.getqualifiedCount(9)));
		myChart6.setOption(myForm.createOption('乳化沥青合格率', myForm.getUnqualifiedCount(8), myForm.getqualifiedCount(8)));
		myChart7.setOption(myForm.createOption('细铣刨料合格率', myForm.getUnqualifiedCount(10), myForm.getqualifiedCount(10)));
		myChart8.setOption(myForm.createOption('粗铣刨料合格率', myForm.getUnqualifiedCount(5), myForm.getqualifiedCount(5)));
		myChart9.setOption(myForm.createOption('岩沥青合格率', myForm.getUnqualifiedCount(6), myForm.getqualifiedCount(6)));
		myChart10.setOption(myForm.createOption('纤维合格率', myForm.getUnqualifiedCount(7), myForm.getqualifiedCount(7)));
	}
	/**
	 * 生成图表
	 * @param {Object} title
	 * @param {Object} unqualifiedCount
	 * @param {Object} qualifiedCount
	 */
	myForm.createOption = function(title, unqualifiedCount, qualifiedCount) {
		var option = {
			title: {
				text: title,
				subtext: '',
				left: 'center'
			},
			tooltip: {
				trigger: 'item',
				formatter: '{a} <br/>{b}: {c} ({d}%)'
			},
			legend: {
				orient: 'vertical',
				left: 20,
				data: ['合格', '不合格']
			},
			graphic: {
				type: 'text',
				left: 'center',
				top: 'center',
				style: {
					text: '共计' + (unqualifiedCount + qualifiedCount) + '次',
					textAlign: 'center',
					fill: '#000',
					width: 50,
					height: 50
				}
			},
			series: [{
				name: title,
				type: 'pie',
				radius: ['40%', '55%'],
				color: ['#61A0A8', '#D48265', ],
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
				data: [{
						value: Number(qualifiedCount),
						name: '合格'
					},
					{
						value: Number(unqualifiedCount),
						name: '不合格'
					}

				]
			}]
		};
		return option;
	}
	var myChart1 = echarts.init(document.getElementById('echart1'));
	var myChart2 = echarts.init(document.getElementById('echart2'));
	var myChart3 = echarts.init(document.getElementById('echart3'));
	var myChart4 = echarts.init(document.getElementById('echart4'));
	var myChart5 = echarts.init(document.getElementById('echart5'));
	var myChart6 = echarts.init(document.getElementById('echart6'));
	var myChart7 = echarts.init(document.getElementById('echart7'));
	var myChart8 = echarts.init(document.getElementById('echart8'));
	var myChart9 = echarts.init(document.getElementById('echart9'));
	var myChart10 = echarts.init(document.getElementById('echart10'));
	myForm.getData(null);
	myForm.refreshChart();

	myChart1.on('click', function(params) {
		if (params.name == '不合格' && params.value > 0) {
			myForm.openUnqualifiedPage('粗集料');
		}
	});
	myChart2.on('click', function(params) {
		if (params.name == '不合格' && params.value > 0) {
			myForm.openUnqualifiedPage('细集料');
		}
	});
	myChart3.on('click', function(params) {
		if (params.name == '不合格' && params.value > 0) {
			myForm.openUnqualifiedPage('矿粉');
		}
	});
	myChart4.on('click', function(params) {
		if (params.name == '不合格' && params.value > 0) {
			myForm.openUnqualifiedPage('沥青');
		}
	});
	myChart5.on('click', function(params) {
		if (params.name == '不合格' && params.value > 0) {
			myForm.openUnqualifiedPage('沥青混合料');
		}
	});
	myChart6.on('click', function(params) {
		if (params.name == '不合格' && params.value > 0) {
			myForm.openUnqualifiedPage('乳化沥青');
		}
	});
	myChart7.on('click', function(params) {
		if (params.name == '不合格' && params.value > 0) {
			myForm.openUnqualifiedPage('细铣刨料');
		}
	});
	myChart8.on('click', function(params) {
		if (params.name == '不合格' && params.value > 0) {
			myForm.openUnqualifiedPage('粗铣刨料');
		}
	});
	myChart9.on('click', function(params) {
		if (params.name == '不合格' && params.value > 0) {
			myForm.openUnqualifiedPage('岩沥青');
		}
	});
	myChart10.on('click', function(params) {
		if (params.name == '不合格' && params.value > 0) {
			myForm.openUnqualifiedPage('纤维');
		}
	});

});
