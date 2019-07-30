//18.06.12 by zgy
//需要调用js的效果有：选项卡、无限级下拉菜单
var basePath  = "";
$(function () {
    basePath  = $("#path").val();
    getTestStandingBook();
});



$(document).ready(function(){
    //选项卡tab
    $(".yyui_tab_title , .yyui_tab_title_this ").click(function(){
        $(this).siblings('li').attr('class','yyui_tab_title');
        $(this).attr('class','yyui_tab_title_this');
        //alert($(this).index()); 选项卡序号编号从0开始
        $(this).parent().siblings('div').attr('class','yyui_tab_content');
        $(this).parent().siblings('div').eq($(this).index()).attr('class','yyui_tab_content_this');
    });
    //////////////////////////


    //到底了///////////////////////
});

//用法：
//第一步、运行函数；
//yyui_menu('.yyui_menu1');
//第二步、写css样式；
//<style type="text/css">
//.yyui_menu1 { height:35px; line-height:35px; font-size:15px; background-color:#f2f2f2; }
//.yyui_menu1 li { float:left; position:relative;} /*这一级是导航*/
//.yyui_menu1 li a { display:block; line-height:35px; text-decoration:none; padding:0px 20px; color:#333333;   }
//.yyui_menu1 li a:hover {  background:#EFEFEF; }
//.yyui_menu1 li a.more:after{content:" »";}
//.yyui_menu1 li ul { position:absolute; float:left; width:150px; border:1px solid #D2D2D2; display:none; background-color:#FFFfff; z-index:9999;} /*这是第二级菜单*/
//.yyui_menu1 li ul a { width:110px;text-decoration:none; color:#333333;}
//.yyui_menu1 li ul a:hover { background:#f2f2f2;}
//
//.yyui_menu1 li ul ul{ top:0;left:150px;} /*从第三级菜单开始,所有的子级菜单都相对偏移*/
//</style>
function yyui_menu(ulclass){
    $(document).ready(function(){
        $(ulclass+' li').hover(function(){
            $(this).children("ul").show(); //mouseover
        },function(){
            $(this).children("ul").hide(); //mouseout
        });
    });
}

/**
 * 查询七天内原材料试验数据
 */
function getRawMaterialStandingBook() {
    $.ajax({
        type:"get",
        url: basePath + "getSevenDayRawMaterialStandingBookForeign.do ",
        dataType:'json',
        success:function (res) {
            $(".messageSpan").remove();
            var rawMaterialHtml = '';
           if (res.length === 0){
               rawMaterialHtml = '<span  class="messageSpan">'
               + '近七日并无试验'
               + '</span>';
               $("#rawMaterialTable").remove();
               $("#rawMaterialDiv").append(rawMaterialHtml);

           } else {

               //判断当前是否有表格，没有就添加
               if (!$("#rawMaterialTable").length > 0){
                   $("#rawMaterialDiv").append(returnTableHtml());
               }

               for (var i = 0; i < res.length;i++){
                   //处理筛分
                   if (res[i].testName === '粗集料筛分' || res[i].testName === '细集料筛分'){
                       rawMaterialHtml += '<tr>'
                           +'<td>' + res[i].testDate +'</td>'
                           +'<td>' + res[i].samplingStandard + res[i].materialName +'</td>'
                           +'<td>' + res[i].testName +'</td>'
                           +'<td>' + res[i].testNum +'</td>'
                           +'<td>' + res[i].sievePore37 +'</td>'
                           +'<td>' + res[i].sievePore31 +'</td>'
                           +'<td>' + res[i].sievePore26+'</td>'
                           +'<td>' + res[i].sievePore19 +'</td>'
                           +'<td>' + res[i].sievePore16 +'</td>'
                           +'<td>' + res[i].sievePore13 +'</td>'
                           +'<td>' + res[i].sievePore9 +'</td>'
                           +'<td>' + res[i].sievePore4 +'</td>'
                           +'<td>' + res[i].sievePore2 +'</td>'
                           +'<td>' + res[i].sievePore1 +'</td>'
                           +'<td>' + res[i].sievePore06 +'</td>'
                           +'<td>' + res[i].sievePore03 +'</td>'
                           +'<td>' + res[i].sievePore015 +'</td>'
                           +'<td>' + res[i].sievePore007 +'</td>'
                           +'<td>' + res[i].remark +'</td>'
                           +'</tr>'
                       //处理其他试验
                   }else {
                       //处理result结果为三种筛孔的结果
                       if (res[i].testResult){
                           rawMaterialHtml += '<tr>'
                               +'<td>' + res[i].testDate +'</td>'
                               +'<td>' + res[i].samplingStandard + res[i].materialName +'</td>'
                               +'<td>' + res[i].testName +'</td>'
                               +'<td>' + res[i].testNum +'</td>'
                               +'<td colspan="14">' + res[i].testResult  +'</td>'
                               +'<td>' + res[i].remark +'</td>'
                               +'</tr>'
                       } else {
                           rawMaterialHtml += '<tr>'
                               +'<td>' + res[i].testDate +'</td>'
                               +'<td>' + '10-20mm' + res[i].materialName +'</td>'
                               +'<td>' + res[i].testName +'</td>'
                               +'<td>' + res[i].testNum +'</td>'
                               +'<td colspan="14">' + res[i].testResult10_20  +'</td>'
                               +'<td>' + res[i].remark +'</td>'
                               +'</tr>'
                               +'<tr>'
                               +'<td>' + res[i].testDate +'</td>'
                               +'<td>' + '10-15mm'+ res[i].materialName +'</td>'
                               +'<td>' + res[i].testName +'</td>'
                               +'<td>' + res[i].testNum +'</td>'
                               +'<td colspan="14">' + res[i].testResultt10_15  +'</td>'
                               +'<td>' + res[i].remark +'</td>'
                               +'</tr>'
                               +'<tr>'
                               +'<td>' + res[i].testDate +'</td>'
                               +'<td>' + '5-10mm'+ res[i].materialName +'</td>'
                               +'<td>' + res[i].testName +'</td>'
                               +'<td>' + res[i].testNum +'</td>'
                               +'<td colspan="14">' + res[i].testResult5_10  +'</td>'
                               +'<td>' + res[i].remark +'</td>'
                               +'</tr>';
                       }

                   }

               }
               $('#rawMaterial').empty().append(rawMaterialHtml);
           }


        }
    })
}

/**
 * 根据日期查询原材试验相关
 */
function getRawMaterialStandingBookByDate() {
    var start = $("#rawMaterialStartDate").val();
    var end = $("#rawMaterialEndDate").val();

    if (start.isBlank() || end.isBlank()){
        layer.alert('请选择日期');
    }else {
        $.ajax({
            type:"post",
            url: basePath + "getRawMaterialStandingBookByDateForeign.do ",
            data:{
              'startDate':start,
                'endDate':end
            },
            dataType:'json',
            success:function (res) {

                var rawMaterialHtml = '';
                $(".messageSpan").remove();
                if (res.length === 0){
                    rawMaterialHtml = '<span class="messageSpan">'
                        + '所选日期并无试验'
                        + '</span>';
                    $("#rawMaterialTable").remove();
                    $("#rawMaterialDiv").append(rawMaterialHtml);
                } else {

                    //判断当前是否有表格，没有就添加
                    if (!$("#rawMaterialTable").length > 0){
                        $("#rawMaterialDiv").append(returnTableHtml());
                    }

                    for (var i = 0; i < res.length;i++){
                        //处理筛分
                        if (res[i].testName === '粗集料筛分' || res[i].testName === '细集料筛分'){
                            rawMaterialHtml += '<tr>'
                                +'<td>' + res[i].testDate +'</td>'
                                +'<td>' + res[i].samplingStandard + res[i].materialName +'</td>'
                                +'<td>' + res[i].testName +'</td>'
                                +'<td>' + res[i].testNum +'</td>'
                                +'<td>' + res[i].sievePore37 +'</td>'
                                +'<td>' + res[i].sievePore31 +'</td>'
                                +'<td>' + res[i].sievePore26+'</td>'
                                +'<td>' + res[i].sievePore19 +'</td>'
                                +'<td>' + res[i].sievePore16 +'</td>'
                                +'<td>' + res[i].sievePore13 +'</td>'
                                +'<td>' + res[i].sievePore9 +'</td>'
                                +'<td>' + res[i].sievePore4 +'</td>'
                                +'<td>' + res[i].sievePore2 +'</td>'
                                +'<td>' + res[i].sievePore1 +'</td>'
                                +'<td>' + res[i].sievePore06 +'</td>'
                                +'<td>' + res[i].sievePore03 +'</td>'
                                +'<td>' + res[i].sievePore015 +'</td>'
                                +'<td>' + res[i].sievePore007 +'</td>'
                                +'<td>' + res[i].remark +'</td>'
                                +'</tr>'
                            //处理其他试验
                        }else {
                            //处理result结果为三种筛孔的结果
                            if (res[i].testResult){
                                rawMaterialHtml += '<tr>'
                                    +'<td>' + res[i].testDate +'</td>'
                                    +'<td>' + res[i].samplingStandard + res[i].materialName +'</td>'
                                    +'<td>' + res[i].testName +'</td>'
                                    +'<td>' + res[i].testNum +'</td>'
                                    +'<td colspan="14">' + res[i].testResult  +'</td>'
                                    +'<td>' + res[i].remark +'</td>'
                                    +'</tr>'
                            } else {
                                rawMaterialHtml += '<tr>'
                                    +'<td>' + res[i].testDate +'</td>'
                                    +'<td>' + '10-20mm' + res[i].materialName +'</td>'
                                    +'<td>' + res[i].testName +'</td>'
                                    +'<td>' + res[i].testNum +'</td>'
                                    +'<td colspan="14">' + res[i].testResult10_20  +'</td>'
                                    +'<td>' + res[i].remark +'</td>'
                                    +'</tr>'
                                    +'<tr>'
                                    +'<td>' + res[i].testDate +'</td>'
                                    +'<td>' + '10-15mm'+ res[i].materialName +'</td>'
                                    +'<td>' + res[i].testName +'</td>'
                                    +'<td>' + res[i].testNum +'</td>'
                                    +'<td colspan="14">' + res[i].testResultt10_15  +'</td>'
                                    +'<td>' + res[i].remark +'</td>'
                                    +'</tr>'
                                    +'<tr>'
                                    +'<td>' + res[i].testDate +'</td>'
                                    +'<td>' + '5-10mm'+ res[i].materialName +'</td>'
                                    +'<td>' + res[i].testName +'</td>'
                                    +'<td>' + res[i].testNum +'</td>'
                                    +'<td colspan="14">' + res[i].testResult5_10  +'</td>'
                                    +'<td>' + res[i].remark +'</td>'
                                    +'</tr>';
                            }

                        }

                    }
                    $('#rawMaterial').empty().append(rawMaterialHtml);
                }
            }
        })
    }
}

/**
 * 查询沥青原材料试验数据
 */
function getAsphaltStandingBook() {
    $.ajax({
        type:"get",
        url: basePath + "getAsphaltStandingBookForeign.do ",
        dataType:'json',
        success:function (res) {
            $(".messageSpan").remove();
            var rawMaterialHtml = '';
            if (res.length === 0){
                rawMaterialHtml = '<span  class="messageSpan">'
                    + '近七日并无沥青试验'
                    + '</span>';
                $("#asphaltTable").remove();
                $("#asphaltDiv").append(rawMaterialHtml);

            } else {

                //判断当前是否有表格，没有就添加
                if (!$("#asphaltTable").length > 0){
                    $("#asphaltDiv").append(returnAsphaltHtml());
                }
                for (var i = 0; i < res.length;i++){

                    rawMaterialHtml += '<tr>'
                        +'<td>' + res[i].testDate +'</td>'
                        +'<td>' + res[i].samplingStandard + res[i].materialName +'</td>'
                        +'<td>' + res[i].testName +'</td>'
                        +'<td>' + res[i].testNum +'</td>'
                        +'<td >' + res[i].testResult  +'</td>'
                        +'<td>' + res[i].manufacturersName +'</td>'
                        +'<td>' + res[i].remark +'</td>'
                        +'</tr>';

                }
                $('#asphaltTbody').empty().append(rawMaterialHtml);
            }


        }
    })
}

function getAsphaltStandingBookByDate() {

    var start = $("#asphaltStartDate").val();
    var end = $("#asphaltEndDate").val();

    $.ajax({
        type:"post",
        url: basePath + "getAsphaltStandingBookByDateForeign.do ",
        data:{
            'startDate':start,
            'endDate':end
        },
        dataType:'json',
        success:function (res) {
            $(".messageSpan").remove();
            var rawMaterialHtml = '';
            if (res.length === 0){
                rawMaterialHtml = '<span  class="messageSpan">'
                    + '所选日期并无沥青试验'
                    + '</span>';
                $("#asphaltTable").remove();
                $("#asphaltDiv").append(rawMaterialHtml);

            } else {

                //判断当前是否有表格，没有就添加
                if (!$("#asphaltTable").length > 0){
                    $("#asphaltDiv").append(returnAsphaltHtml());
                }
                for (var i = 0; i < res.length;i++){

                    rawMaterialHtml += '<tr>'
                        +'<td>' + res[i].testDate +'</td>'
                        +'<td>' + res[i].samplingStandard + res[i].materialName +'</td>'
                        +'<td>' + res[i].testName +'</td>'
                        +'<td>' + res[i].testNum +'</td>'
                        +'<td >' + res[i].testResult  +'</td>'
                        +'<td>' + res[i].manufacturersName +'</td>'
                        +'<td>' + res[i].remark +'</td>'
                        +'</tr>';

                }
                $('#asphaltTbody').empty().append(rawMaterialHtml);
            }


        }
    })
}

/**
 * 查询实验检车台账
 */
function getTestStandingBook() {
    $.ajax({
        type:"get",
        url: basePath + "getTestStandingBookForeign.do",
        dataType:'json',
        success:function (res) {
            debugger
            $(".messageSpan").remove();
            var rawMaterialHtml = '';
            if (res.length === 0){
                rawMaterialHtml = '<span  class="messageSpan">'
                    + '近七日并无实验检测'
                    + '</span>';
                $("#testTable").remove();
                $("#testDiv").append(rawMaterialHtml);

            } else {

                //判断当前是否有表格，没有就添加
                if (!$("#testTable").length > 0){
                    $("#testDiv").append(returnTestBookHtml());
                }
                for (var i = 0; i < res.length;i++){

                    rawMaterialHtml += '<tr>'
                        +'<td>' + res[i].testDate +'</td>'
                        +'<td>' + res[i].orderTicketNum +'</td>'
                        +'<td>' + res[i].specificationName + res[i].materialName +'</td>'
                        +'<td>' + res[i].testNum +'</td>'
                        +'<td>' + res[i].testNum +'</td>'
                        +'<td > 检测 </td>'
                        +'<td>' + res[i].requiredExperimental +'</td>'
                        +'<td>' + res[i].remark +'</td>'
                        +'</tr>';

                }
                $('#testTbody').empty().append(rawMaterialHtml);
            }


        }
    })
}

function getTestStandingBookByDate() {
    var start = $("#testStart").val();
    var end = $("#testEnd").val();

    $.ajax({
        type:"post",
        url: basePath + "getTestStandingBookByDateForeign.do",
        data:{
            'startDate':start,
            'endDate':end
        },
        dataType:'json',
        success:function (res) {
            $(".messageSpan").remove();
            var rawMaterialHtml = '';
            if (res.length === 0){
                rawMaterialHtml = '<span  class="messageSpan">'
                    + '所选日期并无试验检测'
                    + '</span>';
                $("#testTable").remove();
                $("#testDiv").append(rawMaterialHtml);

            } else {
                debugger
                //判断当前是否有表格，没有就添加
                if (!$("#testTable").length > 0){
                    $("#testDiv").append(returnTestBookHtml());
                }

                for (var i = 0; i < res.length;i++){

                    rawMaterialHtml += '<tr>'
                        +'<td>' + res[i].testDate +'</td>'
                        +'<td>' + res[i].orderTicketNum +'</td>'
                        +'<td>' + res[i].specificationName + res[i].materialName +'</td>'
                        +'<td>' + res[i].testNum +'</td>'
                        +'<td>' + res[i].testNum +'</td>'
                        +'<td > 检测 </td>'
                        +'<td>' + res[i].requiredExperimental +'</td>'
                        +'<td>' + res[i].remark +'</td>'
                        +'</tr>';

                }
                $('#testTbody').empty().append(rawMaterialHtml);
            }


        }
    })
}

/*
*@tableId: table的Id
*@fileName: 生成excel文件
* ie浏览器无法导出
*/
var idTmr;
function  getExplorer() {
    var explorer = window.navigator.userAgent ;
    //ie
    if (explorer.indexOf("MSIE") >= 0) {
        return 'ie';
    }
    //firefox
    else if (explorer.indexOf("Firefox") >= 0) {
        return 'Firefox';
    }
    //Chrome
    else if(explorer.indexOf("Chrome") >= 0){
        return 'Chrome';
    }
    //Operad
    else if(explorer.indexOf("Opera") >= 0){
        return 'Opera';
    }
    //Safari
    else if(explorer.indexOf("Safari") >= 0){
        return 'Safari';
    }
}
function table2excel(tableid,wsname,name) {//整个表格拷贝到EXCEL中


    if ($("#"+ tableid + "> tbody").is(":empty")){
        layer.alert('当前无数据，无法生产Excel');
        return;
    }
    if(getExplorer()=='ie')
    {
        var curTbl = document.getElementById(tableid);
        var oXL = new ActiveXObject("Excel.Application");

        //创建AX对象excel
        var oWB = oXL.Workbooks.Add();
        //获取workbook对象
        var xlsheet = oWB.Worksheets(1);
        //激活当前sheet
        var sel = document.body.createTextRange();
        sel.moveToElementText(curTbl);
        //把表格中的内容移到TextRange中
        sel.select();
        //全选TextRange中内容
        sel.execCommand("Copy");
        //复制TextRange中内容
        xlsheet.Paste();
        //粘贴到活动的EXCEL中
        oXL.Visible = true;
        //设置excel可见属性

        try {
            var fname = oXL.Application.GetSaveAsFilename("Excel.xls", "Excel Spreadsheets (*.xls), *.xls");
        } catch (e) {
            print("Nested catch caught " + e);
        } finally {
            oWB.SaveAs(fname);

            oWB.Close(savechanges = false);
            //xls.visible = false;
            oXL.Quit();
            oXL = null;
            //结束excel进程，退出完成
            //window.setInterval("Cleanup();",1);
            idTmr = window.setInterval("Cleanup();", 1);

        }
    }
    else
    {
        tableToExcel(tableid,wsname,name)
    }
}
function Cleanup() {
    window.clearInterval(idTmr);
    CollectGarbage();
}
var tableToExcel = (function() {
    var uri = 'data:application/vnd.ms-excel;base64,',
        //格式化导出表格的样式
        template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel"'+
            'xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>'
            +'<x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets>'
            +'</x:ExcelWorkbook></xml><![endif]-->'+
            ' <style type="text/css">'+

            '.excelTable  {'+
            'border:#7e7d68;'+
            '}'+
            '.excelTable  th {'
            + 'width:200px;'
            +'text-align:center;'
                +'background-color: #efebde;'
            +'border-right-width: 1px;'
            +'border-bottom-width: 1px;'
            +'border-right-style: solid;'
            +'border-bottom-style: solid;'
            +'border-right-color: #7e7d68;'
            +'border-bottom-color: #7e7d68;'
            +'font-weight: normal;'
            +'padding-top: 5px;'
            +'}'
            +'.excelTable td {'
                +'text-align:center;'
                +'border-right-width: 1px;'
                +'border-bottom-width: 1px;'
                +'border-top-style: none;'
                +'border-right-style: solid;'
                +'border-bottom-style: solid;'
                +'border-left-style: none;'
                +'border-right-color: #c0c0c0;'
                +'border-bottom-color: #c0c0c0;'
            +'}'
            +'</style>'+
            '</head><body ><table class="excelTable">{table}</table></body></html>',
        base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) },
        format = function(s, c) {
            return s.replace(/{(\w+)}/g,
                function(m, p) { return c[p]; }) }
    //return function(table, name) {
    return function(table, wsname, name) {
        if(name.length == 0){name='导出Excel信息';}
        if (!table.nodeType) table = document.getElementById(table)
        var ctx = {worksheet: wsname || 'Worksheet', table: table.innerHTML}
        //window.location.href = uri + base64(format(template, ctx))
        var downloadLink = document.createElement("A");
        downloadLink.href = uri + base64(format(template, ctx));
        downloadLink.download = name + '_' + formatTime(new Date(new Date()),'yyyy_mm_dd')+'.xls';
        downloadLink.target = '_blank';
        document.body.appendChild(downloadLink);
        downloadLink.click();
        document.body.removeChild(downloadLink);
    }
})()

/**
 * 扩展String对象,添加查找字符串出现的次数
 * @param (String) str 要测试的字符串
 */
String.prototype.findCount =function(str){
    return this.split(str).length - 1;
}

/**
 * 复制字符串
 * @param (String) str 要复制的字符串
 * @param (String) num 要复制的次数
 * @return (Number) 复制后的字符串
 */
function copy(str , num){
    var tmp = '';
    for(var i=0; i<num; i++){
        tmp += str;
    }
    return tmp;
}

/**
 * 格式化时间字符串，支持Date对象
 * @param (Number) time 要格式化的时间串，或者是一个Date对象
 * @param (String) format 格式，如：yyyymmddhhiiss yyyy-mm-dd hh:ii:ss
 * @return (String) 格式化后的时间串
 */
function formatTime(time /* Number */,format /* String */){
    var
        y=format.findCount('y'),
        m=format.findCount('m'),
        d=format.findCount('d'),
        h=format.findCount('h'),
        i=format.findCount('i'),
        s=format.findCount('s');

    time=time || '';
    format = format || '';
    format = format.toLowerCase();
    if(time == '') {return time;}
    if(time.constructor == Date){
        var tmp='' + time.getFullYear() +
            ('00' + (time.getMonth() + 1)).slice(-2) +
            ('00' + time.getDate()).slice(-2) +
            ('00' + time.getHours()).slice(-2) +
            ('00' + time.getMinutes()).slice(-2) +
            ('00' + time.getSeconds()).slice(-2);
        time = tmp;
    }
    /*
    if(time.length <format.length){
        alert('要格式化的时间串与转换格式不一致！');
        return false;
    }
    */

    if(y > 0){
        format = format.replace(copy('y',y),time.substring(0,4).slice(-y));
    }

    if(m > 0){
        format = format.replace(copy('m',m),('00'+time.substring(4,2)).slice(-m));
    }

    if(d > 0){
        format = format.replace(copy('d',d),('00'+time.substring(6,2)).slice(-d));
    }

    if(h > 0){
        format = format.replace(copy('h',h),('00'+time.substring(8,2)).slice(-h));
    }

    if(i > 0){
        format = format.replace(copy('i',i),('00'+time.substring(10,2)).slice(-i));
    }

    if(s > 0){
        format = format.replace(copy('s',s),('00'+time.substring(12,2)).slice(-s));
    }

    return format;
}


String.prototype.isBlank = function () {
    var s = $.trim(this);
    if (s == "undefined" || s == null || s == "" || s.length == 0) {
        return true;
    }
    return false;
};

function returnTableHtml() {
    
    var table = '<table class="standingBookTable" id="rawMaterialTable" border="1" >'
        + '<thead>'
        + '<tr class="firstHead">'
        + '<th colspan="19">原材试验台账</th>'
        + '</tr>'
        +  '<tr class="firstHead">'
        + '<th rowspan="2">实验日期</th>'
        + '<th rowspan="2">试样名称</th>'
        + '<th rowspan="2">试验项目</th>'
        + '<th rowspan="2">试验编号</th>'
        + '<th colspan="14">试验结果</th>'
        + '<th rowspan="2">备注</th>'
        + '</tr>'
        + '<tr class="twoHead">'
        + '<th>37.5</th>'
        + '<th>31.5</th>'
        + '<th>26.5</th>'
        + '<th>19</th>'
        + '<th>16</th>'
        + '<th>13.2</th>'
        + '<th>9.5</th>'
        + '<th>4.75</th>'
        + '<th>2.36</th>'
        + '<th>1.18</th>'
        + '<th>0.6</th>'
        + '<th>0.3</th>'
        + '<th>0.15</th>'
        + '<th>0.075</th>'
        + '</tr>'
        + '</thead>'
        + '<tbody id="rawMaterial">'

        + '</tbody>'
        + '</table>';

    return table;
}

function returnAsphaltHtml() {
    var asphaltHtml = '<table class="standingBookTable" id="asphaltTable" border="1" >'
        +'<thead>'
        +'<tr class="firstHead">'
        +'<th colspan="7">沥青试验台账</th>'
        +'</tr>'
        +'<tr class="twoHead">'
        +'<th>日期</th>'
        +'<th>品种</th>'
        +'<th>试验名称</th>'
        +'<th>试验编号</th>'
        +'<th>试验结果</th>'
        +'<th>产地</th>'
        +'<th>备注</th>'
        +'</tr>'
        +'</thead>'
        +'<tbody id="asphaltTbody">'
        +'</tbody>'
    +'</table>';

    return asphaltHtml;
}

function returnTestBookHtml() {
    var testHtml = '<table class="standingBookTable" id="testTable" border="1" >'
        +'<thead>'
        +'<tr class="firstHead">'
        +'<th colspan="7">试验检测台账</th>'
        +'</tr>'
        +'<tr class="twoHead">'
        +'<th>日期</th>'
        +'<th>委托编号</th>'
        +'<th>样品名称</th>'
        +'<th>试样编号</th>'
        +'<th>试验编号</th>'
        +'<th>工程名称</th>'
        +'<th>实验项目</th>'
        +'<th>备注</th>'
        +'</tr>'
        +'</thead>'
        +'<tbody id="testTbody">'
        +'</tbody>'
        +'</table>';

    return testHtml;
}