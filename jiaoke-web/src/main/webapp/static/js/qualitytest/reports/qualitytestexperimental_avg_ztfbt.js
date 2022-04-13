layui.use(['form', 'table', 'laydate', 'dictionary'], function () {
    var form = layui.form;
    var table = layui.table;
    var $ = layui.$;
    var dictionaryFunc = layui.dictionary;
    var $ax = layui.ax;
    var basePath = $("#path").val();
    var laydate = layui.laydate;
    //参数
    var param = common.getUrlParam2("param");
    var begindate = common.getUrlParam2("begindate");
    var enddate = common.getUrlParam2("enddate");


    console.log("qualitytestexperimental_avg_ztfbt.js");
    var myForm = {
        chartData: null,
        sourceData: null,
        processData: null
    };
    /**
     * 获取数据
     */
    myForm.getData = function () {
        var str = param.split('@');
        var materials = str[1];
        var column = str[0];
        var spec = str[2];
        var manufacturers = str[3];
        var queryData = {
            specification: spec,
            begindate: begindate,
            enddate: enddate,
            manufacturers: manufacturers
        };
        var data = [];
        switch (materials) {
            case '1': //细集料
                data = myForm.getXJLData(queryData);
                break;
            case '2': //粗集料
                data = myForm.getCJLData(queryData);
                break;
            case '3': //矿粉
                data = myForm.getKFData(queryData);
                break;
            case '4': //沥青
                data = myForm.getLQData(queryData);
                break;
            case '8': //乳化沥青
                data = myForm.getRHLQData(queryData);
                break;
            case '9': //沥青混合料
                data = myForm.getLQHHLData(queryData);
                break;
        }
        myForm.sourceData = [];
        if (data != undefined && data != null) {
            for (var i = 0; i < data.length; i++) {
                var value = data[i][column];
                if (value > 0) {
                    myForm.sourceData.push(value);
                }
            }
        }
		console.log(myForm.sourceData);
    }
    /**
     * 获取粗集料数据
     */
    myForm.getCJLData = function (searchData) {
        myForm.chartData = null;
        var result = null;
        $.ajax({
            type: "GET",
            async: false,
            url: basePath + "/QualityTestReport/ReportCJL.do",
            data: searchData,
            dataType: 'json',
            success: function (msg) {
                if (msg.count > 0) {
                    result = msg.data;
                }
                console.log(msg);
            }
        })
        return result;
    }
    /**
     * 获取细集料数据
     */
    myForm.getXJLData = function (searchData) {
        myForm.chartData = null;
        var result = null;
        $.ajax({
            type: "GET",
            async: false,
            url: basePath + "/QualityTestReport/ReportXJL.do",
            data: searchData,
            dataType: 'json',
            success: function (msg) {
                if (msg.count > 0) {
                    result = msg.data;
                }
                console.log(msg);
            }
        })
        return result;
    }
    /**
     * 获取矿粉数据
     */
    myForm.getKFData = function (searchData) {
        myForm.chartData = null;
        var result = null;
        $.ajax({
            type: "GET",
            async: false,
            url: basePath + "/QualityTestReport/ReportKF.do",
            data: searchData,
            dataType: 'json',
            success: function (msg) {
                if (msg.count > 0) {
                    result = msg.data;
                }
                console.log(msg);
            }
        })
        return result;
    }
    /**
     * 获取沥青数据
     */
    myForm.getLQData = function (searchData) {
        myForm.chartData = null;
        var result = null;
        $.ajax({
            type: "GET",
            async: false,
            url: basePath + "/QualityTestReport/ReportLQ.do",
            data: searchData,
            dataType: 'json',
            success: function (msg) {
                if (msg.count > 0) {
                    result = msg.data;
                }
                console.log(msg);
            }
        })
        return result;
    }
    /**
     * 获取乳化沥青数据
     */
    myForm.getRHLQData = function (searchData) {
        myForm.chartData = null;
        var result = null;
        $.ajax({
            type: "GET",
            async: false,
            url: basePath + "/QualityTestReport/ReportRHLQ.do",
            data: searchData,
            dataType: 'json',
            success: function (msg) {
                if (msg.count > 0) {
                    result = msg.data;
                }
                console.log(msg);
            }
        })
        return result;
    }
    /**
     * 获取沥青混合料数据
     */
    myForm.getLQHHLData = function (searchData) {
        myForm.chartData = null;
        var result = null;
        $.ajax({
            type: "GET",
            async: false,
            url: basePath + "/QualityTestReport/ReportLQHHL.do",
            data: searchData,
            dataType: 'json',
            success: function (msg) {
                if (msg.count > 0) {
                    result = msg.data;
                }
                console.log(msg);
            }
        })
        return result;
    }
    /**
     * 测试数据
     */
    myForm.getTestData = function () {
        myForm.sourceData = [];
        myForm.sourceData.push(89.5);
        myForm.sourceData.push(90.5);
        myForm.sourceData.push(79.5);
        myForm.sourceData.push(88);
        myForm.sourceData.push(89.5);
        myForm.sourceData.push(84);
        myForm.sourceData.push(82);
        myForm.sourceData.push(92);
        myForm.sourceData.push(98);
        myForm.sourceData.push(70);
        myForm.sourceData.push(77);
        myForm.sourceData.push(92);
        myForm.sourceData.push(92);
        myForm.sourceData.push(89);
        myForm.sourceData.push(86);
        myForm.sourceData.push(85.5);
        myForm.sourceData.push(77.5);
        myForm.sourceData.push(89.5);
        myForm.sourceData.push(94);
        myForm.sourceData.push(95);
        myForm.sourceData.push(88);
        myForm.sourceData.push(73.5);
        myForm.sourceData.push(88);
        myForm.sourceData.push(88);
        myForm.sourceData.push(88.5);
        myForm.sourceData.push(83);
        myForm.sourceData.push(98);
        myForm.sourceData.push(94.5);
        myForm.sourceData.push(86.5);
        myForm.sourceData.push(94);
        myForm.sourceData.push(81);
        myForm.sourceData.push(90.5);
        myForm.sourceData.push(92);
        myForm.sourceData.push(82);
        myForm.sourceData.push(90);
        myForm.sourceData.push(89.5);
        myForm.sourceData.push(92.5);
        myForm.sourceData.push(87.5);
        myForm.sourceData.push(91);
        myForm.sourceData.push(84.5);

    }
    /**
     * 获取平均值
     */
    myForm.getAvgData = function () {
        var avgValue = 0;
        var avgCount = 0;
        for (var i = 0; i < myForm.sourceData.length; i++) {
            if (myForm.sourceData[i] > 0) {
                avgValue = avgValue + Number(myForm.sourceData[i]);
                avgCount++;
            }
        }
        if (avgCount > 0) {
            avgValue = (avgValue / avgCount).toFixed(1);
        }
        return avgValue;
    }
    /**
     * 获取标准差
     */
    myForm.getBzcData = function () {
        var bzcValue = 0;
        var data = 0;
        var avgValue = myForm.getAvgData();
        var avgCount = 0;
        if (myForm.sourceData.length > 0) {
            for (var i = 0; i < myForm.sourceData.length; i++) {
                data = myForm.sourceData[i];
                if (data > 0) {
                    bzcValue = bzcValue + Math.pow((data - avgValue), 2);
                    avgCount++;
                }
            }
            bzcValue = (Math.sqrt(bzcValue / avgCount)).toFixed(1);
        }
        return bzcValue;
    }
    /**
     * 获取最大值
     */
    myForm.getMaxData = function () {
        var maxValue = 0;
        for (var i = 0; i < myForm.sourceData.length; i++) {
            if (myForm.sourceData[i] > maxValue) {
                maxValue = myForm.sourceData[i];
            }
        }
        return maxValue;
    }
    /**
     * 获取最小值
     */
    myForm.getMinData = function () {
        var minValue = 1000000;
        for (var i = 0; i < myForm.sourceData.length; i++) {
            if (myForm.sourceData[i] < minValue) {
                minValue = myForm.sourceData[i];
            }
        }
        return minValue;
    }
    /**
     * 数据计算
     */
    myForm.computeData = function () {
        var avgValue = myForm.getAvgData();
        var bzcValue = myForm.getBzcData();
		if (bzcValue==0)
		{
			bzcValue=(avgValue/myForm.sourceData.length).toFixed(1);
		}
        myForm.processData = [];
        for (var i = 0; i < 11; i++) {
            var obj = {};
            switch (i) {
                case 0:
                    obj['value'] = (avgValue - 5 * bzcValue).toFixed(1);
                    break;
                case 1:
                    obj['value'] = (avgValue - 4 * bzcValue).toFixed(1);
                    break;
                case 2:
                    obj['value'] = (avgValue - 3 * bzcValue).toFixed(1);
                    break;
                case 3:
                    obj['value'] = (avgValue - 2 * bzcValue).toFixed(1);
                    break;
                case 4:
                    obj['value'] = (avgValue - 1 * bzcValue).toFixed(1);
                    break;
                case 5:
                    obj['value'] = avgValue;
                    break;
                case 6:
                    obj['value'] = (Number(avgValue) + Number(1 * bzcValue)).toFixed(1);
                    break;
                case 7:
                    obj['value'] = (Number(avgValue) + Number(2 * bzcValue)).toFixed(1);
                    break;
                case 8:
                    obj['value'] = (Number(avgValue) + Number(3 * bzcValue)).toFixed(1);
                    break;
                case 9:
                    obj['value'] = (Number(avgValue) + Number(4 * bzcValue)).toFixed(1);
                    break;
                case 10:
                    obj['value'] = (Number(avgValue) + Number(5 * bzcValue)).toFixed(1);
                    break;
            }
            obj['count'] = 0;
            myForm.processData.push(obj);
        }
        for (var i = 0; i < myForm.sourceData.length; i++) {
            var value = myForm.sourceData[i];
            for (var j = 0; j < myForm.processData.length - 1; j++) {
                if (value > Number(myForm.processData[j]['value']) && value <= Number(myForm.processData[
                j + 1]['value'])) {
                    var v = myForm.processData[j + 1]['count'];
                    if (v == undefined) {
                        v = 0;
                    }
                    myForm.processData[j + 1]['count'] = v + 1;
                    break;
                }
            }
        }
        myForm.chartData = [];
        for (var j = 0; j < myForm.processData.length; j++) {
            var obj = [];
            obj[0] = myForm.processData[j]['value'];
            obj[1] = myForm.processData[j]['count'];
            myForm.chartData.push(obj);
        }
        //计算σ占比
        var count = myForm.sourceData.length;
        var ratio1 = 0;
        var ratio2 = 0;
        var ratio3 = 0;
        if (count > 0) {
            ratio1 = ((myForm.processData[5]['count'] + myForm.processData[4]['count'] + myForm.processData[6]['count']) * 100 /
                count).toFixed(1);
            ratio2 = ((myForm.processData[5]['count'] + myForm.processData[4]['count'] + myForm.processData[6]['count'] +
                myForm.processData[3]['count'] + myForm.processData[7]['count']) * 100 /
                count).toFixed(1);
            ratio3 = ((myForm.processData[5]['count'] + myForm.processData[4]['count'] + myForm.processData[6]['count'] +
                myForm.processData[3]['count'] + myForm.processData[7]['count'] +
                myForm.processData[2]['count'] + myForm.processData[8]['count']) * 100 /
                count).toFixed(1);
        }
        var ration = "1σ:" + ratio1 + "%&nbsp;&nbsp;2σ:" + ratio2 + "%   3σ:" + ratio3 + "%";
        $("#title_info").html(ration);
    }

    /**
     * 数据计算
     */
    myForm.computeData1 = function () {
        var minvalue = myForm.getMinData();
        var maxvalue = myForm.getMaxData();
        var diffValue = maxvalue - minvalue;
        var offsetValue = (diffValue / 8).toFixed(2);
        myForm.processData = [];
        for (var i = 0; i < 9; i++) {
            var obj = {};
            if (i == 0) {
                obj['value'] = minvalue;
            } else if (i == 8) {
                obj['value'] = maxvalue;
            } else {
                obj['value'] = minvalue + (i * offsetValue);
            }
            obj['count'] = 0;
            myForm.processData.push(obj);
        }
        for (var i = 0; i < myForm.sourceData.length - 1; i++) {
            var value = myForm.sourceData[i];
            for (var j = 0; j < myForm.processData.length; j++) {
                if ((j < myForm.processData.length - 1 && value >= myForm.processData[j]['value'] && value < myForm.processData[
                    j + 1]['value']) ||
                    (j == myForm.processData.length - 1 && value >= myForm.processData[j]['value'])) {
                    var v = myForm.processData[j]['count'];
                    if (v == undefined) {
                        v = 0;
                    }
                    myForm.processData[j]['count'] = v + 1;
                    break;
                }
            }
        }
        myForm.chartData = [];
        for (var j = 0; j < myForm.processData.length; j++) {
            var obj = [];
            obj[0] = myForm.processData[j]['value'];
            obj[1] = myForm.processData[j]['count'];
            myForm.chartData.push(obj);
        }


    }

    /**
     * 刷新图表
     */
    myForm.refreshChart = function () {
        myChart1.setOption(myForm.createOption());
    }
    /**
     * 生成图表
     * @param {Object} title
     * @param {Object} unqualifiedCount
     * @param {Object} qualifiedCount
     */
    myForm.createOption = function () {
        var option = {
            xAxis: {
                type: 'category',
                boundaryGap: false
            },
            yAxis: {
                type: 'value',
                boundaryGap: [0, '50%']
            },
            visualMap: {
                type: 'piecewise',
                show: false,
                dimension: 0,
                seriesIndex: 0,
                pieces: [{
                    gt: 0,
                    lt: 1,
                    color: '#009688'
                }, {
                    gt: 1,
                    lt: 2,
                    color: '#009688'
                }, {
                    gt: 2,
                    lt: 3,
                    color: '#069285'
                }, {
                    gt: 3,
                    lt: 4,
                    color: '#009688'
                }, {
                    gt: 4,
                    lt: 5,
                    color: '#009688'
                }, {
                    gt: 5,
                    lt: 6,
                    color: '#069285'
                }, {
                    gt: 6,
                    lt: 7,
                    color: '#009688'
                }, {
                    gt: 7,
                    lt: 8,
                    color: '#009688'
                }, {
                    gt: 8,
                    lt: 9,
                    color: '#009688'
                }, {
                    gt: 9,
                    lt: 10,
                    color: '#009688'
                }]
            },
            series: [{
                type: 'line',
                smooth: 0.6,
                symbol: 'none',
                lineStyle: {
                    color: '#009688',
                    width: 3
                },
                markLine: {
                    symbol: ['none', 'none'],
                    label: {
                        show: false
                    },
                    data: [{
                        xAxis: 2
                    }, {
                        xAxis: 3
                    },
                        {
                            xAxis: 4
                        },
                        {
                            xAxis: 6
                        }, {
                            xAxis: 7
                        }, {
                            xAxis: 8
                        }
                    ]
                },
                areaStyle: {},
                data: myForm.chartData
            }]
        };
        return option;
    }
    myForm.setTitle = function () {
        var str = param.split('@');
        var materials = str[1];
        var spec = str[2];
        var manufacturers = str[3];
        var columnName = str[4];
        switch (materials) {
            case '1':
                materials = "细集料";
                break;
            case '2':
                materials = "粗集料";
                break;
            case '3':
                materials = "矿粉";
                break;
            case '4':
                materials = "沥青";
                break;
            case '8':
                materials = "乳化沥青";
                break;
            case '9':
                materials = "沥青混合料";
                break;
        }
        if (spec == undefined) {
            $("#title").html(materials + "-" + columnName);
        } else {
            $("#title").html(materials + "-" + spec + "-" + manufacturers + "-" + columnName);
        }
    }
    myForm.setTitle();
    var myChart1 = echarts.init(document.getElementById('echart1'));
    myForm.getData();
    //myForm.getTestData();
    myForm.computeData();
    //测试数据 应用时注释掉

    /* myForm.chartData = [
        ['70', 10],
        ['80', 17],
        ['90', 88],
        ['100', 298],
        ['110', 498],
        ['120', 1029],
        ['130', 454],
        ['140', 221],
        ['150', 81],
        ['160', 11],
        ['170', 8]
    ]; */
    myForm.refreshChart();
});
