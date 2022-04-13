layui.use(['form', 'table', 'laydate'], function () {
    var form = layui.form;
    var dictionary = parent.layui.dictionary;
    var $ax = parent.layui.ax;
    var $ = layui.$;
    var laydate = layui.laydate;
    var table = layui.table;
    var basePath = $("#path").val();
    form.render();
    form.render('checkbox');
    //日期
    laydate.render({
        elem: '#sampling_create_time',
        type: 'datetime',
        format: 'yyyy年MM月dd日'
    });

    laydate.render({
        elem: '#reportDate',
        type: 'datetime',
        format: 'yyyy年MM月dd日'
    });
    console.log("qualitytestlabreport_detail1.js");
    var expID = common.getUrlParam("num");
    var myForm = {
        tableId: "mytable",
        tableId_sf: "mytable_sf",
        expParam: null,
        reportValue: []
    };
    /**
     * 获取试验报告信息
     * @param {Object} id
     */
    myForm.getLabReportInfo = function (num) {
        var result = null;
        $.ajax({
            type: "GET",
            async: false,
            url: basePath + "/QualityTestLabReport/findbyTicketNum/" + num + ".do",
            dataType: 'json',
            success: function (msg) {
                result = msg;
                console.log(msg);
            }
        })
        return result;
    }
    /**
     * 获取登录人员信息
     * @param {Object} id
     */
    myForm.getLabReportUserInfo = function () {
        var result = null;
        $.ajax({
            type: "GET",
            async: false,
            url: basePath + "/QualityTestLabReport/UserInfo.do",
            dataType: 'json',
            success: function (msg) {
                result = msg;
                console.log(msg);
            }
        })
        return result;
    }

    /**
     * 获取试验结果信息
     * @param {Object} id
     */
    myForm.getLabReportInfoValue = function (id) {
        var queryData = {
            orderTicketNum: expID
        };
        table.render({
            elem: '#' + myForm.tableId,
            url: basePath + '/QualityTestExperimentalValue/list.do',
            defaultToolbar: [],
            where: queryData,
            cols: [
                [{
                    field: 'experimentalType',
                    title: '项目',
                    width: 185
                },
                    {
                        field: 'unit',
                        title: '单位',
                        width: 160
                    }, {
                    field: 'value',
                    title: '试验结果',
                    width: 180
                }, {
                    field: 'method1',
                    title: '试验方法',
                    width: 180
                }, {
                    field: 'requirements',
                    title: '技术要求',
                    width: 180
                }

                ]
            ],
            page: false
        });
    }


    /**
     * 获取筛分数据
     * @param {Object} mid
     * @param {Object} num
     */
    myForm.getLabReportInfoValue_SF = function (mid, num) {
        switch (mid) {
            case 1: //细集料
                myForm.getLabReportInfoValue_SF_XJL(num);
                break;
            case 2: //粗集料
                myForm.getLabReportInfoValue_SF_CJL(num);
                break;
            case 3: //矿粉
                myForm.getLabReportInfoValue_SF_KF(num);
                break;
        }
    }
    /**
     * 获取粗集料筛分数据
     * @param {Object} num
     */
    myForm.getLabReportInfoValue_SF_CJL = function (num) {
        var queryData = {
            orderTicketNum: expID
        };
        table.render({
            elem: '#' + myForm.tableId_sf,
            url: basePath + '/QualityTestExperimentalValueCjlSf/list.do',
            defaultToolbar: [],
            where: queryData,
            cols: [
                [{
                    field: '',
                    title: '筛孔',
                    width: 60
                }, {
                    field: 'sK315',
                    title: '31.5',
                    width: 60
                }, {
                    field: 'sK265',
                    title: '26.5',
                    width: 60
                }, {
                    field: 'sK19',
                    title: '19',
                    width: 60
                }, {
                    field: 'sK16',
                    title: '16',
                    width: 60
                }, {
                    field: 'sK132',
                    title: '13.2',
                    width: 60
                }, {
                    field: 'sK95',
                    title: '9.5',
                    width: 60
                }, {
                    field: 'sK475',
                    title: '4.75',
                    width: 60
                }, {
                    field: 'sK236',
                    title: '2.36',
                    width: 60
                }, {
                    field: 'sK118',
                    title: '1.18',
                    width: 60
                }, {
                    field: 'sK06',
                    title: '0.6',
                    width: 60
                }, {
                    field: 'sK03',
                    title: '0.3',
                    width: 60
                }, {
                    field: 'sK015',
                    title: '0.15',
                    width: 60
                }, {
                    field: 'sK0075',
                    title: '0.075',
                    width: 70
                }

                ]
            ],
            page: false,
            done: function (res, curr, count) {
                myForm.showSFTable(res.data);
            }
        });
    }
    /**
     * 获取粗集料筛分数据
     * @param {Object} num
     */
    myForm.getLabReportInfoValue_SF_XJL = function (num) {
        var queryData = {
            orderTicketNum: expID
        };
        table.render({
            elem: '#' + myForm.tableId_sf,
            url: basePath + '/QualityTestExperimentalValueXjlSf/list.do',
            defaultToolbar: [],
            where: queryData,
            cols: [
                [{
                    field: '',
                    title: '筛孔',
                    width: 60
                }, {
                    field: 'sK132',
                    title: '13.2',
                    width: 70
                }, {
                    field: 'sK95',
                    title: '9.5',
                    width: 70
                }, {
                    field: 'sK475',
                    title: '4.75',
                    width: 70
                }, {
                    field: 'sK236',
                    title: '2.36',
                    width: 70
                }, {
                    field: 'sK118',
                    title: '1.18',
                    width: 70
                }, {
                    field: 'sK06',
                    title: '0.6',
                    width: 70
                }, {
                    field: 'sK03',
                    title: '0.3',
                    width: 70
                }, {
                    field: 'sK015',
                    title: '0.15',
                    width: 70
                }, {
                    field: 'sK0075',
                    title: '0.075',
                    width: 70
                }]
            ],
            page: false,
            done: function (res, curr, count) {
                myForm.showSFTable(res.data);
            }
        });
    }
    /**
     * 获取矿粉筛分数据
     * @param {Object} num
     */
    myForm.getLabReportInfoValue_SF_KF = function (num) {
        var queryData = {
            orderTicketNum: expID
        };
        table.render({
            elem: '#' + myForm.tableId_sf,
            url: basePath + '/QualityTestExperimentalValueKfSf/list.do',
            defaultToolbar: [],
            where: queryData,
            cols: [
                [{
                    field: '',
                    title: '筛孔(mm)',
                    width: 170
                }, {
                    field: 'sK06',
                    title: '0.6',
                    width: 170
                }, {
                    field: 'sK03',
                    title: '0.3',
                    width: 170
                }, {
                    field: 'sK015',
                    title: '0.15',
                    width: 170
                }, {
                    field: 'sK0075',
                    title: '0.075',
                    width: 170
                }

                ]
            ],
            page: false,
            done: function (res, curr, count) {
                myForm.showSFTable(res.data);
            }
        });
    }
    /**
     * 显示筛分数据
     * @param {Object} data
     */
    myForm.showSFTable = function (data) {
        if (data.length > 0) {
            $('#div_sf').show();
        } else {
            $('#div_sf').hide();
        }
    }
    /**
     * 显示试验信息
     * @param {Object} data
     */
    myForm.setLabReportIInfo = function (data, loginUserInfo) {
        if (loginUserInfo.position.indexOf("副总经理")>-1 && data.experimentStatus == 21 && data.chargePerson == null) {
            data.chargePerson = loginUserInfo.nickname;
        } else if (loginUserInfo.position.indexOf("部长")>-1 && data.experimentStatus == 2 && data.checkPerson == null) {
            data.checkPerson = loginUserInfo.nickname;
        } else if
        (data.reportPerson == null && (loginUserInfo.position == "试验员" && data.experimentStatus == 1) ||
            (loginUserInfo.position == "实验员" && data.experimentStatus == 1)) {
            data.reportPerson = loginUserInfo.nickname;
            var date = new Date();
            data.reportDate = date.toLocaleDateString();
        }

        form.val('myform', data);
        laydate.render({
            elem: '#sampling_create_time',
            type: 'datetime',
            format: 'yyyy年MM月dd日',
            value: new Date(data['samplingDate'])
        });
        laydate.render({
            elem: '#reportDate',
            type: 'date',
            format: 'yyyy年MM月dd日',
            value: new Date(data['reportDate'])
        });
        $("#Experimental_GC").val("《公路工程沥青及沥青混合料试验规程》JTG E20-2011");


        form.render();
    }

    /**
     * 控制提交按钮和审核按钮是否显示
     * @param {Object} expData
     */
    myForm.buttonVisible = function (expData, loginUserInfo) {
        /* $('#div_check').hide();
         $('#btn_check').disable();
         $('#div_commit').hide();
         if (expData.experimentStatus == undefined || expData.experimentStatus == 0) {
             //$('#div_commit').show();
         } else
              {
                $('#div_check').show();
         }
         */
        $('#div_commit').hide();
        $("#btn_check").hide();
        if (expData.experimentStatus != 3 &&
            (loginUserInfo.position == "试验员" && expData.experimentStatus == 1) ||
            (loginUserInfo.position == "实验员" && expData.experimentStatus == 1)) {
            $('#div_check_zf').show();

        } else {
            $('#div_check_zf').hide();
        }
        if (expData.experimentStatus != 3 &&
            ((loginUserInfo.position.indexOf("副总经理")>-1 && expData.experimentStatus == 21) ||
                (loginUserInfo.position.indexOf("部长")>-1 && expData.experimentStatus == 2) ||
                (loginUserInfo.position == "试验员" && expData.experimentStatus == 1) ||
                (loginUserInfo.position == "实验员" && expData.experimentStatus == 1))) {
            $("#btn_check").show();
        }
    }
    /**
     * 试验报告提交
     */
    myForm.commit = function () {
        var saveData = {
            id: myForm.reportValue.id,
            experimentStatus: 1
        }
        $.ajax({
            type: "POST",
            url: basePath + "/QualityTestLabReport/update.do",
            data: saveData,
            dataType: 'JSON',
            success: function (msg) {
                if (msg.code = 200) {
                    layer.msg("提交成功");
                    parent.layer.closeAll();
                } else {
                    layer.msg("提交失败");
                }
            }
        })
    }

    /**
     * 试验报告确认
     */
    myForm.check = function () {
        var nexperimentStatus = 1;// 1待试验员确认  2 待部长审核 21 待负责人确认  3 已经完成
        if (loginUserInfo.data.position.indexOf("副总经理")>-1 && expInfo.data.experimentStatus == 21) {
            nexperimentStatus = 3;
        } else if (loginUserInfo.data.position.indexOf("部长")>-1 && expInfo.data.experimentStatus == 2) {
            nexperimentStatus = 21;
        } else if (loginUserInfo.data.position == "试验员" && expInfo.data.experimentStatus == 1) {
            nexperimentStatus = 2;
        }
        var noticeDep = "",
            noticeDepStr = "";
        if ($("#send_sc")[0].checked && $("#send_cl")[0].checked) {
            noticeDep = 0;
            noticeDepStr = "发送材料部、生产设备部";
        } else if ($("#send_cl")[0].checked) {
            noticeDep = 1;
            noticeDepStr = "发送材料部";
        } else if ($("#send_sc")[0].checked) {
            noticeDep = 2;
            noticeDepStr = "发送生产设备部";
        }
        var saveData = {
            id: myForm.reportValue.id,
            experimentStatus: nexperimentStatus,
            noticeDep: noticeDep,
            noticeDepStr: noticeDepStr
        }
        $.ajax({
            type: "POST",
            url: basePath + "/QualityTestLabReport/update.do",
            data: saveData,
            dataType: 'JSON',
            success: function (msg) {
                if (msg.code = 200) {
                    layer.msg("确认完成");
                    parent.layer.closeAll();
                } else {
                    layer.msg("确认失败");
                }
            }
        })
    }
    /**
     * 绑定提交按钮
     */
    $('#btn_commit').on('click', function () {
        myForm.commit();
    });
    /**
     * 绑定确认按钮
     */
    $('#btn_check').on('click', function () {
        myForm.check();
    });
    var expInfo = myForm.getLabReportInfo(expID);
    var loginUserInfo = myForm.getLabReportUserInfo();

    if (expInfo != null && expInfo.code == 200) {
        myForm.reportValue = expInfo.data;
        myForm.setLabReportIInfo(expInfo.data, loginUserInfo.data);
        myForm.getLabReportInfoValue(expID);
        myForm.getLabReportInfoValue_SF(expInfo.data.materialsNum, expID);
        myForm.buttonVisible(expInfo.data, loginUserInfo.data);
    }

});
