
var dataArray;

$(function () {
    //查询前三天数据
     getThreeDayData();
    //页面初始化时加载第一次数据
    getDateByPageNum(1);
    //翻页
    $(".zxf_pagediv").createPage({
        pageNum: Math.ceil(dataArray.length / 50),
        current: 1,
        backfun: function(e) {
            e.pageNum = Math.ceil(dataArray.length / 50);
            getDateByPageNum(e.current);
        }
    });

})

/**
 * 查询三天前数据
 */
function getThreeDayData() {
    var basePath = $("#path").val();
    $.ajax({
        url:basePath + "/getThreeDayData.do",
        type:"get",
        async:false,
        dataType:"json",
        success:function (res) {
            dataArray = res;
        }
    })
}

/**
 * 渲染到页面
 * @param currentNum
 */
function getDateByPageNum(currentNum){

    var arrayStart = (currentNum - 1) * 50;
    var arrayEnd = arrayStart + 50;
    $("#productData").empty();
    for (var i = arrayStart; i < arrayEnd; i++ ){
        var htmlStr = "<tr>"
            + "<td>" + dataArray[i].produce_date + "</td>"
            + "<td>" + dataArray[i].produce_time  + "</td>"
            + "<td>" + (dataArray[i].crewNums === 'data1'? '机组1':'机组2')  + "</td>"
            + "<td>" + dataArray[i].produce_disc_num  + "</td>"
            + "<td>" + dataArray[i].pro_name  + "</td>"
            + "<td>" + dataArray[i].material_aggregate_6  + "</td>"
            + "<td>" + dataArray[i].material_aggregate_5  + "</td>"
            + "<td>" + dataArray[i].material_aggregate_4  + "</td>"
            + "<td>" + dataArray[i].material_aggregate_3  + "</td>"
            + "<td>" + dataArray[i].material_aggregate_2  + "</td>"
            + "<td>" + dataArray[i].material_aggregate_1  + "</td>"
            + "<td>" + dataArray[i].material_stone_1  + "</td>"
            + "<td>" + dataArray[i].material_stone_2  + "</td>"
            + "<td>" + dataArray[i].material_asphalt  + "</td>"
            + "<td>" + dataArray[i].material_regenerate  + "</td>"
            + "<td>" + dataArray[i].material_additive  + "</td>"
            + "<td>" + dataArray[i].material_total  + "</td>"
            + "<td>" + dataArray[i].temperature_warehouse_1  + "</td>"
            + "<td>" + dataArray[i].temperature_mixture  + "</td>"
            + "<td>" + dataArray[i].temperature_asphalt  + "</td>"
            + "<td>" + dataArray[i].temperature_aggregate  + "</td>"
            + "<td>" + dataArray[i].temperature_duster  + "</td>"
        + "</tr>"

        $("#productData").append(htmlStr);
    }
}


function  getModelByDateTimeAndCrew(rationNum) {
    var path = $("#path").val();
    var start = $("#inpstart").val();
    var end = $("#inpend").val();
    if (start.isBlanks() || end.isBlanks() ){
        layer.alert('请先选择日期');
        return false;
    }
    var crew = $("#crew_num option:selected").val();

    if (crew == "sect") {
        layer.alert("请选择机组");
        return false;
    }
    $.ajax({
        //该接口使用的是动态管理里面的接口，如需修改需自定义
        url: path + "/getRatioListByDateTime.do",
        type: "post",
        dataType:"json",
        data:{"startDateTime":start,"endDateTime":end,"crew":crew},
        success:function (res) {
            if (res.length === 0){
                layer.alert('该日期并无生产');
                $("#pro_message").text("该日期并无生产");
            }else {
                $("#ratio_id").empty();
                for (var i = 0; i < res.length;i++){
                    var modId = res[i].modele_id;
                    if (rationNum != null){
                        if (Number(rationNum) ===  modId ) {
                            $("#ratio_id").append("<option selected = 'selected' value=" + modId + ">" + res[i].pro_name + "</option>");
                        }else {
                            $("#ratio_id").append("<option  value=" + modId + ">" + res[i].pro_name + "</option>");
                        }
                    } else {
                        $("#ratio_id").append("<option value=" + modId + ">" + res[i].pro_name + "</option>");
                    }

                }
            }
        }
    })

}


function selectPromessageByRaionModel(){
    var path = $("#path").val();
    var start = $("#inpstart").val();
    var end = $("#inpend").val();
    if (start.isBlanks() || end.isBlanks() ){
        layer.alert('请先选择日期');
        return false;
    }

    var crew = $("#crew_num option:selected").val();
    var rationId = $("#ratio_id option:selected").val();

    if (crew.isBlanks() || rationId.isBlanks()){
        layer.alert('请选择机组或配比号');
        return false;
    }

    $.ajax({
        url: path + "/getPromessageByRaionModel.do",
        type:"post",
        dataType: "json",
        data:{"startDate":start,"endDate":end,"crew":crew,"rationId":rationId},
        success:function (res) {
            dataArray = res;
            var htmlStr = '<a href="#" id="submits"  onclick="showPromessageSVG()" >更多<i class="iconfont"></i></a>';
            $("#submits").remove();
            $(".boxtitle").append(htmlStr);
            getDateByPageNum(1);
        }
    })

}

function showPromessageSVG(){
    var path = $("#path").val();
    var start = $("#inpstart").val();
    var end = $("#inpend").val();
    var crew = $("#crew_num option:selected").val();
    var rationId = $("#ratio_id option:selected").val();

    layer.open({
        type: 2,
        title: '产品均值信息',
        shadeClose: true,
        maxmin: true,
        shade: 0.8,
        area: ['90%', '90%'],
        content: path + '/getProSvgmessage.do?startDate=' + start + '&endDate=' + end + '&crew=' + crew + '&rationId=' + rationId //iframe的url
    });
}


//到处Excel
//打印表格
var idTmr;

function getExplorer() {
    var explorer = window.navigator.userAgent;
    //ie
    if(explorer.indexOf("MSIE") >= 0) {
        return 'ie';
    }
    //firefox
    else if(explorer.indexOf("Firefox") >= 0) {
        return 'Firefox';
    }
    //Chrome
    else if(explorer.indexOf("Chrome") >= 0) {
        return 'Chrome';
    }
    //Opera
    else if(explorer.indexOf("Opera") >= 0) {
        return 'Opera';
    }
    //Safari
    else if(explorer.indexOf("Safari") >= 0) {
        return 'Safari';
    }
}

function method5(tableid) {
    if(getExplorer() == 'ie') {
        var curTbl = document.getElementById(tableid);
        var oXL = new ActiveXObject("Excel.Application");
        var oWB = oXL.Workbooks.Add();
        var xlsheet = oWB.Worksheets(1);
        var sel = document.body.createTextRange();
        sel.moveToElementText(curTbl);
        sel.select();
        sel.execCommand("Copy");
        xlsheet.Paste();
        oXL.Visible = true;

        try {
            var fname = oXL.Application.GetSaveAsFilename("Excel.xls",
                "Excel Spreadsheets (*.xls), *.xls");
        } catch(e) {
            print("Nested catch caught " + e);
        } finally {
            oWB.SaveAs(fname);
            oWB.Close(savechanges = false);
            oXL.Quit();
            oXL = null;
            idTmr = window.setInterval("Cleanup();", 1);
        }

    } else {
        tableToExcel(tableid)
    }
}

function Cleanup() {
    window.clearInterval(idTmr);
    CollectGarbage();
}
var tableToExcel = (function() {
    var uri = 'data:application/vnd.ms-excel;base64,',
        template = '<html><head><meta charset="UTF-8"></head><body><table  border="1">{table}</table></body></html>',
        base64 = function(
            s) {
            return window.btoa(unescape(encodeURIComponent(s)))
        },
        format = function(s, c) {
            return s.replace(/{(\w+)}/g, function(m, p) {
                return c[p];
            })
        }
    return function(table, name) {
        if(!table.nodeType)
            table = document.getElementById(table)
        var ctx = {
            worksheet: name || 'Worksheet',
            table: table.innerHTML
        }
        // window.location.href = uri + base64(format(template, ctx))
    }
})()

String.prototype.isBlanks = function () {
    var s = $.trim(this);
    if (s == "undefined" || s == null || s == "" || s.length == 0) {
        return true;
    }
    return false;
};