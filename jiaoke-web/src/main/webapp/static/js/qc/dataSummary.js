
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
    var index = layer.load(3, {
        shade: [0.1,'#fff'] //0.1透明度的白色背景
    });
    $.ajax({
        url:basePath + "/getThreeDayData.do",
        type:"get",
        async:false,
        dataType:"json",
        success:function (res) {
            dataArray = res;
        }
    })
    layer.close(index);
}

/**
 * 渲染到页面
 * @param currentNum
 */
function getDateByPageNum(currentNum){

    var arrayStart = (currentNum - 1) * 50;
    var arrayEnd = arrayStart + 50;
    var htmlStr;
    for (var i = arrayStart; i < arrayEnd; i++ ){
        if (dataArray[i]){
            htmlStr += "<tr>"
                + "<td title=" + dataArray[i].produce_date + " >" + dataArray[i].produce_date + "</td>"
                + "<td>" + dataArray[i].produce_time  + "</td>"
                + "<td>" + (dataArray[i].crewNums === 'data1'? '机组1':'机组2')  + "</td>"
                + "<td>" + dataArray[i].produce_disc_num  + "</td>"
                + "<td title=" + dataArray[i].project_name + ">" + dataArray[i].project_name  + "</td>"
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
                + "</tr>";
        }

    }
    $("#productData").empty().append(htmlStr);
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
            var rationArry = res.rationList;
            var projectArry = res.projectList;
            debugger
            if (rationArry.length === 0){
                layer.alert('该日期并无生产');
                $("#pro_message").text("该日期并无生产");
            }else {
                $("#ratio_id").empty().append('<option value="select" >请选择</option>');
                for (var i = 0; i < rationArry.length;i++){
                    var modId = rationArry[i].modele_id;
                    if (modId === 0 || modId === '0'){
                        continue
                    }
                    if (rationNum != null){
                        if (Number(rationNum) ===  modId ) {
                            $("#ratio_id").append("<option selected = 'selected' value=" + modId + ">" + rationArry[i].pro_name + "</option>");
                        }else {
                            $("#ratio_id").append("<option  value=" + modId + ">" + rationArry[i].pro_name + "</option>");
                        }
                    } else {
                        $("#ratio_id").append("<option value=" + modId + ">" + rationArry[i].pro_name + "</option>");
                    }

                }

                //渲染工程
                if (projectArry.length > 0){
                    $("#project_id").empty();
                    for (var j = 0; j < projectArry.length;j++ ){
                        $("#project_id").append("<option value=" +  projectArry[j].project_name + ">" + projectArry[j].project_name + "</option>");
                    }
                }
            }
        }
    })

}

// document.getElementById("inpend").addEventListener("click",
//     function(event) {
//         event.stopPropagation();
//     },
//     false);

// function getProjectNameByData() {
//     var path = $("#path").val();
//     var start = $("#inpstart").val();
//     var end = $("#inpend").val();
//     if (start.isBlanks() || end.isBlanks() ){
//         layer.alert('请先选择先日期');
//         return false;
//     }
//     $("#project_id").empty();
//     $.ajax({
//         url: path + "/getProjectNameByDate.do",
//         type:"post",
//         dataType: "json",
//         data:{"startDate":start,"endDate":end},
//         success:function (res) {
//             //判断后台是否出错
//             if (res.message === "error"){
//                 layer.alert("查询工程错误");
//                 return false;
//             }
//             var proNameList = res.projectList;
//             //判断该日期内是否有工程
//             if (proNameList.length === 0){
//                 layer.alert("该日期范围内无工程");
//                 return false;
//             }
//             //渲染selcet
//             for (var i = 0; i < proNameList.length;i++){
//                 $("#project_id").append("<option selected = 'selected' value=" + proNameList[i].project_name + ">" + proNameList[i].project_name + "</option>")
//             }
//         }
//     })
// }


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
    var projectName = $("#project_id option:selected").val();

    //判断机组号和配比是否存在。弃用的逻辑，必选项
    // if (crew.isBlanks() || rationId.isBlanks()){
    //     layer.alert('请选择机组或配比号');
    //     return false;
    // }

    $.ajax({
        url: path + "/getPromessageByRaionModel.do",
        type:"post",
        dataType: "json",
        data:{"startDate":start,
                "endDate":end,
                "crew":crew,
                "rationId":rationId,
                "projectName":projectName},
        success:function (res) {
            dataArray = res;
            var htmlStr = '<a href="#" id="submits"  onclick="showPromessageSVG()" >更多<i class="iconfont"></i></a>';
            $("#submits").remove();
            $(".boxtitle").append(htmlStr);

            //计算平均值
            // var proDate = "";
            var crew = "";
            var proName = "";
            var aggregate6 = 0;
            var aggregate5 = 0;
            var aggregate4 = 0;
            var aggregate3 = 0;
            var aggregate2 = 0;
            var aggregate1 = 0;
            var stone1 = 0;
            var stone2 = 0;
            var asphalt = 0;
            var regenerate = 0;
            var additive = 0;
            var total = 0;
            var warehouse1 = 0;
            var mixture = 0;
            var temasphalt = 0;
            var aggregate = 0;
            var duster = 0;
            for (var i = 0; i < res.length;i++){
                crew = res[i].crewNums === 'data1'? '机组1':'机组2';
                proName = res[i].pro_name;
                aggregate6 += res[i].material_aggregate_6;
                aggregate5 += res[i].material_aggregate_5;
                aggregate4 += res[i].material_aggregate_4;
                aggregate3 += res[i].material_aggregate_3;
                aggregate2 += res[i].material_aggregate_2;
                aggregate1 += res[i].material_aggregate_1;
                stone1 += res[i].material_stone_1;
                stone2 += res[i].material_stone_2;
                asphalt += res[i].material_asphalt;
                regenerate += res[i].material_regenerate;
                additive += res[i].material_additive;
                total += res[i].material_total;
                warehouse1 += res[i].temperature_warehouse_1;
                mixture += res[i].temperature_mixture;
                temasphalt += res[i].temperature_asphalt;
                aggregate += res[i].temperature_aggregate;
                duster += res[i].temperature_duster;
            }
            var svgHtmlStr = "<tr>"
                + "<td>" + "平均值" + "</td>"
                + "<td>" +  " " + "</td>"
                + "<td>" + crew + "</td>"
                + "<td>" +  " " + "</td>"
                + "<td>" + proName  + "</td>"
                + "<td>" +( aggregate6/res.length).toFixed(2) + "</td>"
                + "<td>" + ( aggregate5/res.length).toFixed(2)+ "</td>"
                + "<td>" + ( aggregate4/res.length).toFixed(2) + "</td>"
                + "<td>" + ( aggregate3/res.length).toFixed(2) + "</td>"
                + "<td>" + ( aggregate2/res.length).toFixed(2)  + "</td>"
                + "<td>" + ( aggregate1/res.length).toFixed(2)  + "</td>"
                + "<td>" + ( stone1/res.length).toFixed(2)  + "</td>"
                + "<td>" + ( stone2/res.length).toFixed(2) + "</td>"
                + "<td>" + ( asphalt/res.length).toFixed(2)  + "</td>"
                + "<td>" +  ( regenerate/res.length).toFixed(2) + "</td>"
                + "<td>" +  ( additive/res.length).toFixed(2) + "</td>"
                + "<td>" + ( total/res.length).toFixed(2)  + "</td>"
                + "<td>" + ( warehouse1/res.length).toFixed(2) + "</td>"
                + "<td>" +  ( mixture/res.length).toFixed(2) + "</td>"
                + "<td>" + ( temasphalt/res.length).toFixed(2)  + "</td>"
                + "<td>" + ( aggregate/res.length).toFixed(2) + "</td>"
                + "<td>" +  ( duster/res.length).toFixed(2) + "</td>"
                + "</tr>";
            getDateByPageNum(1);
            $("#productData").append(svgHtmlStr);
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
    if(getExplorer() === 'ie') {
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
         window.location.href = uri + base64(format(template, ctx))
    }
})()

String.prototype.isBlanks = function () {
    var s = $.trim(this);
    if (s == "undefined" || s == null || s == "" || s.length == 0) {
        return true;
    }
    return false;
};