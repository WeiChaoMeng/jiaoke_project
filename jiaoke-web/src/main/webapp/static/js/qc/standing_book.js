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
        var tem = 0;
        if ($(this).index() > 0 && $(this).index() < 4){
            tem = 1
        }else if($(this).index() === 4){
            tem = 2
        }else if($(this).index() === 5) {
            tem = 3
        }
        $(this).parent().siblings('div').eq(tem).attr('class','yyui_tab_content_this');
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
 * 查询七天内原材料试验数据（弃用）
 */
function getRawMaterialStandingBook() {
    $.ajax({
        type:"get",
        url: basePath + "/getSevenDayRawMaterialStandingBook.do ",
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
 * 查询近七日粗集料
 */
function getCoarseStandingBook(id)  {

    $.ajax({
        type:"get",
        url: basePath + "/getSevenDayCoarseStandingBook.do",
        dataType:'json',
        success:function (res) {
            $(".messageSpan").remove();
            var rawMaterialHtml = '';
            if (res === null){
                rawMaterialHtml = '<span  class="messageSpan">'
                    + '近七日无粗料试验'
                    + '</span>';
                $("#rawMaterialTable").remove();
                $("#rawMaterialDiv").append(rawMaterialHtml);

            } else {
                //根据材料生成台账表格
                    $("#rawMaterialDiv").empty().append(returnTableHtml(id));
                   //处理筛分
                    for(var i = 0; i < res.length;i++){

                            rawMaterialHtml += '<tr>'
                                +'<td>' + res[i].testDate +'</td>'
                                +'<td>' + res[i].samplingStandard + res[i].materialName +'</td>'
                                +'<td>' + res[i].testNum +'</td>'
                                +'<td>' + (blank(res[i].sievePore37) ? " ":res[i].sievePore37) +'</td>'
                                +'<td>' + (blank(res[i].sievePore31) ? " ":res[i].sievePore31) +'</td>'
                                +'<td>' + (blank(res[i].sievePore26) ? " ":res[i].sievePore26)+'</td>'
                                +'<td>' + (blank(res[i].sievePore19) ? " ":res[i].sievePore19) +'</td>'
                                +'<td>' + (blank(res[i].sievePore16) ? " ": res[i].sievePore16)+'</td>'
                                +'<td>' + (blank(res[i].sievePore13) ? " ":res[i].sievePore13) +'</td>'
                                +'<td>' +  (blank(res[i].sievePore9) ? " ": res[i].sievePore9) +'</td>'
                                +'<td>' + (blank(res[i].sievePore4) ? " ": res[i].sievePore4)+'</td>'
                                +'<td>' + (blank(res[i].sievePore2) ? " ": res[i].sievePore2) +'</td>'
                                +'<td>' + (blank(res[i].sievePore1) ? " ": res[i].sievePore1)+'</td>'
                                +'<td>' + (blank(res[i].sievePore06) ? " ": res[i].sievePore06)+'</td>'
                                +'<td>' + (blank(res[i].sievePore03) ? " ": res[i].sievePore03) +'</td>'
                                +'<td>' + (blank(res[i].sievePore015) ? " ": res[i].sievePore015) +'</td>'
                                +'<td>' + (blank(res[i].sievePore007) ? " " : res[i].sievePore007)+'</td>'
                                +'<td>' + (blank(res[i].coarse_MHSS) ? " " : res[i].coarse_MHSS) +'</td>'
                                +'<td>' + (blank(res[i].coarse_YSZ)  ? " "  : res[i].coarse_YSZ)+'</td>'
                                +'<td>' + (blank(res[i].coarse_BGMD) ? " "  : res[i].coarse_BGMD)+'</td>'
                                +'<td>' + (blank(res[i].coarse_MTJMD )? " "  : res[i].coarse_MTJMD) +'</td>'
                                +'<td>' + (blank( res[i].coarse_XSL)  ? " "  : res[i].coarse_XSL)+'</td>'
                                +'<td>' + (blank(res[i].coarse_ZPZ)  ? " "  : res[i].coarse_ZPZ)+'</td>'
                                +'<td>' + res[i].remark+'</td>'
                                +'</tr>';

                    }
            }
            $('#rawMaterial').empty().append(rawMaterialHtml);
        }
    })

}

/**
 * 查询矿粉
 */
function getBreezeStandingBook(id) {
    $.ajax({
        type:"get",
        url: basePath + "/getSevenDayBreezeStandingBook.do",
        dataType:'json',
        success:function (res) {
            $(".messageSpan").remove();
            var rawMaterialHtml = '';

            if (res === null){
                rawMaterialHtml = '<span  class="messageSpan">'
                    + '近七日无矿粉试验'
                    + '</span>';
                $("#rawMaterialTable").remove();
                $("#rawMaterialDiv").append(rawMaterialHtml);

            } else {
                //根据材料生成台账表格
                $("#rawMaterialDiv").empty().append(returnTableHtml(id));
                //处理筛分
                for(var i = 0; i < res.length;i++){
                    rawMaterialHtml += '<tr>'
                        +'<td>' + res[i].testDate +'</td>'
                        +'<td>' + res[i].samplingStandard + res[i].materialName +'</td>'
                        +'<td>' + res[i].testNum +'</td>'
                        +'<td>' + (blank(res[i].breeze_BGMD) ? " " : res[i].breeze_BGMD) +'</td>'
                        +'<td>' + (blank(res[i].breeze_MTJ) ? " " : res[i].breeze_MTJ) +'</td>'
                        +'<td>' + (blank(res[i].breeze_HSL) ? " " : res[i].breeze_HSL) +'</td>'
                        +'<td>' + (blank(res[i].breeze_QSXS) ? " " : res[i].breeze_QSXS) +'</td>'
                        +'<td>' + (blank(res[i].breeze_SXZS) ? " " : res[i].breeze_SXZS) +'</td>'
                        +'<td>' + (blank(res[i].breeze_LDFW06) ? " " : res[i].breeze_LDFW06) +'</td>'
                        +'<td>' + (blank(res[i].breeze_LDFW03)  ? " "  : res[i].breeze_LDFW03)+'</td>'
                        +'<td>' + (blank(res[i].breeze_LDFW015) ? " " : res[i].breeze_LDFW015) +'</td>'
                        +'<td>' + (blank(res[i].breeze_LDFW075)  ? " "  : res[i].breeze_LDFW075)+'</td>'
                        +'<td>' + res[i].remark+'</td>'
                        +'</tr>';

                }
            }
            $('#rawMaterial').empty().append(rawMaterialHtml);

        }
    })
}

/**
 * 查询细集料
 */
function getFineStandingBook(id) {
    $.ajax({
        type:"get",
        url: basePath + "/getSevenDayFineStandingBook.do",
        dataType:'json',
        success:function (res) {
            $(".messageSpan").remove();
            var rawMaterialHtml = '';

            if (res === null){
                rawMaterialHtml = '<span  class="messageSpan">'
                    + '近七日无细料试验'
                    + '</span>';
                $("#rawMaterialTable").remove();
                $("#rawMaterialDiv").append(rawMaterialHtml);

            } else {
                //根据材料生成台账表格
                $("#rawMaterialDiv").empty().append(returnTableHtml(id));
                //处理筛分
                for(var i = 0; i < res.length;i++){

                    rawMaterialHtml += '<tr>'
                        +'<td>' + res[i].testDate +'</td>'
                        +'<td>' + res[i].samplingStandard + res[i].materialName +'</td>'
                        +'<td>' + res[i].testNum +'</td>'
                        +'<td>' + (blank(res[i].sievePore37) ? " ":res[i].sievePore37) +'</td>'
                        +'<td>' + (blank(res[i].sievePore31) ? " ":res[i].sievePore31) +'</td>'
                        +'<td>' + (blank(res[i].sievePore26) ? " ":res[i].sievePore26)+'</td>'
                        +'<td>' + (blank(res[i].sievePore19) ? " ":res[i].sievePore19) +'</td>'
                        +'<td>' + (blank(res[i].sievePore16) ? " ": res[i].sievePore16)+'</td>'
                        +'<td>' + (blank(res[i].sievePore13) ? " ":res[i].sievePore13) +'</td>'
                        +'<td>' +  (blank(res[i].sievePore9) ? " ": res[i].sievePore9) +'</td>'
                        +'<td>' + (blank(res[i].sievePore4) ? " ": res[i].sievePore4)+'</td>'
                        +'<td>' + (blank(res[i].sievePore2) ? " ": res[i].sievePore2) +'</td>'
                        +'<td>' + (blank(res[i].sievePore1) ? " ": res[i].sievePore1)+'</td>'
                        +'<td>' + (blank(res[i].sievePore06) ? " ": res[i].sievePore06)+'</td>'
                        +'<td>' + (blank(res[i].sievePore03) ? " ": res[i].sievePore03) +'</td>'
                        +'<td>' + (blank(res[i].sievePore015) ? " ": res[i].sievePore015) +'</td>'
                        +'<td>' + (blank(res[i].sievePore007) ? " " : res[i].sievePore007)+'</td>'
                        +'<td>' + (blank(res[i].fine_BGMD) ? " " : res[i].fine_BGMD) +'</td>'
                        +'<td>' + (blank(res[i].fine_SDL)  ? " "  : res[i].fine_SDL)+'</td>'
                        +'<td>' + (blank(res[i].fine_MTJ)  ? " "  : res[i].fine_MTJ)+'</td>'
                        +'<td>' + (blank(res[i].fine_XSL)  ? " "  : res[i].fine_XSL)+'</td>'
                        +'<td>' + res[i].remark+'</td>'
                        +'</tr>';

                }
            }
            $('#rawMaterial').empty().append(rawMaterialHtml);

        }
    })
}

/**
 * 查询沥青原材料试验数据
 */
function getAsphaltStandingBook(id) {
    $.ajax({
        type:"get",
        url: basePath + "/getSevenDayAsphaltStandingBook.do",
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
                //根据材料生成台账表格
                $("#asphaltDiv").empty().append(returnTableHtml(id));
                //判断当前是否有表格，没有就添加
                if (!$("#asphaltTable").length > 0){
                    $("#asphaltDiv").append(returnAsphaltHtml());
                }
                for (var i = 0; i < res.length;i++){
                    rawMaterialHtml += '<tr>'
                        +'<td>' + res[i].testDate +'</td>'
                        +'<td>' + res[i].samplingStandard + res[i].materialName +'</td>'
                        +'<td>' + res[i].testNum +'</td>'
                        +'<td>' + (blank(res[i].asphalt_ZRD) ? " " : res[i].asphalt_ZRD) +'</td>'
                        +'<td>' + (blank(res[i].asphalt_YD10)  ? " "  : res[i].asphalt_YD10)+'</td>'
                        +'<td>' + (blank(res[i].asphalt_YD15) ? " " : res[i].asphalt_YD15) +'</td>'
                        +'<td>' + (blank(res[i].asphalt_RHD)  ? " "  : res[i].asphalt_RHD)+'</td>'
                        +'<td>' + (blank(res[i].asphalt_ZLBH) ? " " : res[i].asphalt_ZLBH) +'</td>'
                        +'<td>' + (blank(res[i].asphalt_CLZRD10)  ? " "  : res[i].asphalt_CLZRD10)+'</td>'
                        +'<td>' + (blank(res[i].asphalt_CLZRD16) ? " " : res[i].asphalt_CLZRD16) +'</td>'
                        +'<td>' + (blank(res[i].asphalt_CLZRD25)  ? " "  : res[i].asphalt_CLZRD25)+'</td>'
                        +'<td>' + res[i].remark+'</td>'
                        +'</tr>';
                }
                $('#asphaltTbody').empty().append(rawMaterialHtml);
            }


        }
    })
}

/**
 * 条件检索
 */
function searchStandingBook() {
    $.ajax({
        type: "GET",
        url: basePath + "/getSamplingPageFromData.do",
        dataType:'json',
        success: function(msg){
            for(p in msg){
                $("#" + p).empty();
                for (var i=0; i < msg[p].length;i++){
                    var htmlStr = "<option value='" + msg[p][i].Id +"'>" + msg[p][i].name + "</option>";
                    $("#" + p).append(htmlStr);
                }
            }

            $("#searchStart").val(fun_date(-7));
            $("#searchEnd").val(fun_date(0));
        }
    })
}

/**
 * 根据条件查询
 * @param num
 * @returns {string}
 */
function searchFrom(){
    $("#searchFrom").submit(function (e) {
        var param = $("#searchFrom").serializeArray();
        $.ajax({
            type:"post",
            url: basePath + "/searchStandingBook.do",
            data:{
                "fromData":JSON.stringify(param)
            },
            dataType:'json',
            success:function (res) {
                var rawMaterialHtml = '';
                $(".messageSpan").remove();
                debugger
                if (res.length === 0){
                    rawMaterialHtml = '<span class="messageSpan">'
                        + '所选日期并无试验'
                        + '</span>';
                    $("#searchTable").empty();
                    $("#searchDiv").append(rawMaterialHtml);
                } else {
                    var tem = $("#materials").val();
                    $("#searchTable").empty().append(searchTableHtml(tem));
                    $("#searchTbody").empty().append(eachArrayToHtml(res,tem));
                }
            }
        })
        return false;
    })
}



function fun_date(num) {
    var date1 = new Date();
    //今天时间
    var time1 = date1.getFullYear() + "-" + (date1.getMonth() + 1) + "-" + date1.getDate()
    console.log(time1);
    var date2 = new Date(date1);
    date2.setDate(date1.getDate() + num);
    //num是正数表示之后的时间，num负数表示之前的时间，0表示今天
    var time2 = date2.getFullYear() + "-" + (date2.getMonth() + 1) + "-" + date2.getDate();
    console.log(time2);
    return time2;
}
function blank(s) {

    if (s == "undefined" || s == null || s == "" || s.length == 0) {
        return true;
    }
    return false;
}
function showRawMaterialStandingBookById(id) {
    var materialName;
    switch (id) {
        case 1:
            materialName = "fine"
            break
        case 2:
            materialName = "coarse"
            break
        case 3:
            materialName = "breeze"
            break
        // case 4:
        //     materialName = "fine"
        //     break
        default:
            materialName = "fine"
            break
    }


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
            url: basePath + "/getRawMaterialStandingBookByDate.do ",
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



function getAsphaltStandingBookByDate() {

    var start = $("#asphaltStartDate").val();
    var end = $("#asphaltEndDate").val();

    $.ajax({
        type:"post",
        url: basePath + "/getAsphaltStandingBookByDate.do ",
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
        url: basePath + "/getTestStandingBook.do",
        dataType:'json',
        success:function (res) {
            
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
        url: basePath + "/getTestStandingBookByDate.do",
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
                if ($("#asphaltTable").length === 0){
                    $("#testDiv").append(rawMaterialHtml);
                }
            } else {
                debugger
                //判断当前是否有表格，没有就添加
                $("#testTable").remove();
                $("#testDiv").append(returnTestBookHtml());
                // if ($("#testTable").length === 0){
                //     $("#testDiv").append(returnAsphaltHtml());
                // }

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

function returnTableHtml(id) {
    var table;

    switch (id) {
        case "1":
            table = '<div class="jeitem">'
                + '<button style="width: 160px;height: 36px;" onclick="table2excel(\'rawMaterialTable\',\'sheet1\',\'细集料台账\')" >生成Excel</button>'
                +'</div>'
                +'<table class="standingBookTable" id="rawMaterialTable" border="1" >'
                + '<thead>'
                + '<tr class="firstHead">'
                + '<th colspan="22">细集料试验台账</th>'
                + '</tr>'
                + '<tr class="firstHead">'
                + '<th rowspan="2">实验日期</th>'
                + '<th rowspan="2">试样名称</th>'
                + '<th rowspan="2">试验编号</th>'
                + '<th colspan="18">试验结果</th>'
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
                + '<th>表观密度</th>'
                + '<th>砂当量 </th>'
                + '<th>毛体积相对密度 </th>'
                + '<th>吸水率 </th>'
                + '</tr>'
                + '</thead>'
                + '<tbody id="rawMaterial">'

                + '</tbody>'
                + '</table>';
            break
        case "2":
            table =
                '<div class="jeitem">'
                + '<button style="width: 160px;height: 36px;" onclick="table2excel(\'rawMaterialTable\',\'sheet1\',\'粗集料台账\')" >生成Excel</button>'
                +'</div>'
                + '<table class="standingBookTable" id="rawMaterialTable" border="1" >'
                + '<thead>'
                + '<tr class="firstHead">'
                + '<th colspan="24">粗集料试验台账</th>'
                + '</tr>'
                +  '<tr class="firstHead">'
                + '<th rowspan="2">实验日期</th>'
                + '<th rowspan="2">试样名称</th>'
                + '<th rowspan="2">试验编号</th>'
                + '<th colspan="20">试验结果</th>'
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
                + '<th >磨耗损失</th>'
                + '<th >压碎值</th>'
                + '<th >表观相对密度 </th>'
                + '<th >毛体积相对密度</th>'
                + '<th >吸水率</th>'
                + '<th>针片状颗粒含量</th>'
                + '</tr>'
                + '</thead>'
                + '<tbody id="rawMaterial">'

                + '</tbody>'
                + '</table>';
            break
        case "3":
            table =
                  '<div class="jeitem">'
                + '<button style="width: 160px;height: 36px;" onclick="table2excel(\'rawMaterialTable\',\'sheet1\',\'矿粉台账\')" >生成Excel</button>'
                +'</div>'
                + '<table class="standingBookTable" id="rawMaterialTable" border="1" >'
                + '<thead>'
                + '<tr class="firstHead">'
                + '<th colspan="13">矿料试验台账</th>'
                + '</tr>'
                +  '<tr class="firstHead">'
                + '<th rowspan="2">实验日期</th>'
                + '<th rowspan="2">试样名称</th>'
                + '<th rowspan="2">试验编号</th>'
                + '<th colspan="9">试验结果</th>'
                + '<th rowspan="2">备注</th>'
                + '</tr>'
                + '<tr class="twoHead">'
                + '<th>表观相对密度 </th>'
                + '<th>毛体积密度 </th>'
                + '<th>吸水率 </th>'
                + '<th>亲水系数 </th>'
                + '<th>塑性指数 </th>'
                + '<th>粒度范围 < 0.6mm</th>'
                + '<th>粒度范围 < 0.3mm</th>'
                + '<th>粒度范围 < 0.15mm</th>'
                + '<th>粒度范围 < 0.075mm</th>'
                + '</tr>'
                + '</thead>'
                + '<tbody id="rawMaterial">'

                + '</tbody>'
                + '</table>';
            break
        case "4":
            table =
                '<div class="jeitem">'
                + '<button style="width: 160px;height: 36px;" onclick="table2excel(\'asphaltTable\',\'sheet1\',\'沥青原材试验台账\')" >生成Excel</button>'
                +'</div>'
                + '<table class="standingBookTable" id="asphaltTable" border="1" >'
                + '<thead>'
                + '<tr class="firstHead">'
                + '<th colspan="12">沥青实验台账</th>'
                + '</tr>'
                +  '<tr class="firstHead">'
                + '<th rowspan="2">实验日期</th>'
                + '<th rowspan="2">试样名称</th>'
                + '<th rowspan="2">试验编号</th>'
                + '<th colspan="8">试验结果</th>'
                + '<th rowspan="2">备注</th>'
                + '</tr>'
                + '<tr class="twoHead">'
                + '<th>针入度(100g,5s,25℃)</th>'
                + '<th>10℃延度</th>'
                + '<th>15℃延度</th>'
                + '<th>软化点 R&B</th>'
                + '<th>质量变化</th>'
                + '<th>残留针入度比(10℃)</th>'
                + '<th>残留针入度比(16℃)</th>'
                + '<th>残留针入度比(25℃)</th>'
                + '</tr>'
                + '</thead>'
                + '<tbody id="asphaltTbody">'

                + '</tbody>'
                + '</table>';
            break
        default:
            break

    }
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
        +'<th colspan="8">试验检测台账</th>'
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

function searchTableHtml(id) {
    var table;

    switch (id) {
        case "1":
            table = '<thead>'
                + '<tr class="firstHead">'
                + '<th colspan="22">细集料试验台账</th>'
                + '</tr>'
                + '<tr class="firstHead">'
                + '<th rowspan="2">实验日期</th>'
                + '<th rowspan="2">试样名称</th>'
                + '<th rowspan="2">试验编号</th>'
                + '<th colspan="18">试验结果</th>'
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
                + '<th>表观密度</th>'
                + '<th>砂当量 </th>'
                + '<th>毛体积相对密度 </th>'
                + '<th>吸水率 </th>'
                + '</tr>'
                + '</thead>'
                + '<tbody id="searchTbody">'

                + '</tbody>';
            break
        case "2":
            table = '<thead>'
                + '<tr class="firstHead">'
                + '<th colspan="24">粗集料试验台账</th>'
                + '</tr>'
                +  '<tr class="firstHead">'
                + '<th rowspan="2">实验日期</th>'
                + '<th rowspan="2">试样名称</th>'
                + '<th rowspan="2">试验编号</th>'
                + '<th colspan="20">试验结果</th>'
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
                + '<th >磨耗损失</th>'
                + '<th >压碎值</th>'
                + '<th >表观相对密度 </th>'
                + '<th >毛体积相对密度</th>'
                + '<th >吸水率</th>'
                + '<th>针片状颗粒含量</th>'
                + '</tr>'
                + '</thead>'
                + '<tbody id="searchTbody">'

                + '</tbody>';
            break
        case "3":
            table = '<thead>'
                + '<tr class="firstHead">'
                + '<th colspan="13">矿料试验台账</th>'
                + '</tr>'
                +  '<tr class="firstHead">'
                + '<th rowspan="2">实验日期</th>'
                + '<th rowspan="2">试样名称</th>'
                + '<th rowspan="2">试验编号</th>'
                + '<th colspan="9">试验结果</th>'
                + '<th rowspan="2">备注</th>'
                + '</tr>'
                + '<tr class="twoHead">'
                + '<th>表观密度 </th>'
                + '<th>毛体积密度 </th>'
                + '<th>含水量 </th>'
                + '<th>亲水系数 </th>'
                + '<th>塑性指数 </th>'
                + '<th>粒度范围 < 0.6mm</th>'
                + '<th>粒度范围 < 0.3mm</th>'
                + '<th>粒度范围 < 0.15mm</th>'
                + '<th>粒度范围 < 0.075mm</th>'
                + '</tr>'
                + '</thead>'
                + '<tbody id="searchTbody">'

                + '</tbody>';
            break
        case "4":
            table = '<thead>'
                + '<tr class="firstHead">'
                + '<th colspan="12">沥青实验台账</th>'
                + '</tr>'
                +  '<tr class="firstHead">'
                + '<th rowspan="2">实验日期</th>'
                + '<th rowspan="2">试样名称</th>'
                + '<th rowspan="2">试验编号</th>'
                + '<th colspan="8">试验结果</th>'
                + '<th rowspan="2">备注</th>'
                + '</tr>'
                + '<tr class="twoHead">'
                + '<th>针入度(100g,5s,25℃)</th>'
                + '<th>10℃延度</th>'
                + '<th>15℃延度</th>'
                + '<th>软化点 R&B</th>'
                + '<th>质量变化</th>'
                + '<th>残留针入度比(10℃)</th>'
                + '<th>残留针入度比(16℃)</th>'
                + '<th>残留针入度比(25℃)</th>'
                + '</tr>'
                + '</thead>'
                + '<tbody id="searchTbody">'

                + '</tbody>';
            break;
        case "5":
            table = '<thead>'
                + '<tr class="firstHead">'
                + '<th colspan="24">粗刨铣料试验台账</th>'
                + '</tr>'
                +  '<tr class="firstHead">'
                + '<th rowspan="2">实验日期</th>'
                + '<th rowspan="2">试样名称</th>'
                + '<th rowspan="2">试验编号</th>'
                + '<th colspan="20">试验结果</th>'
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
                + '<th >含量</th>'
                + '<th >表观相对密度</th>'
                + '<th >毛体积密度 </th>'
                + '<th >吸水率</th>'
                + '<th >针片状</th>'
                + '<th>压碎值</th>'
                + '</tr>'
                + '</thead>'
                + '<tbody id="searchTbody">'

                + '</tbody>';
            break;
        case "6":
            table = '<thead>'
                + '<tr class="firstHead">'
                + '<th colspan="23">岩沥青试验台账</th>'
                + '</tr>'
                +  '<tr class="firstHead">'
                + '<th rowspan="2">实验日期</th>'
                + '<th rowspan="2">试样名称</th>'
                + '<th rowspan="2">试验编号</th>'
                + '<th colspan="18">试验结果</th>'
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
                + '<th>油石比</th>'
                + '<th>石料表观相对密度</th>'
                + '<th>石料毛体积相对密度</th>'
                + '<th>沥青密度</th>'
                + '</tr>'
                + '</thead>'
                + '<tbody id="searchTbody">'

                + '</tbody>';
            break;
        case "7":
            table = '<thead>'
                + '<tr class="firstHead">'
                + '<th colspan="12">纤维实验台账</th>'
                + '</tr>'
                +  '<tr class="firstHead">'
                + '<th rowspan="2">实验日期</th>'
                + '<th rowspan="2">试样名称</th>'
                + '<th rowspan="2">试验编号</th>'
                + '<th colspan="5">试验结果</th>'
                + '<th rowspan="2">备注</th>'
                + '</tr>'
                + '<tr class="twoHead">'
                + '<th>纤维长度</th>'
                + '<th>灰分含量</th>'
                + '<th>PH值</th>'
                + '<th>吸油率</th>'
                + '<th>含水率</th>'
                + '</tr>'
                + '</thead>'
                + '<tbody id="searchTbody">'

                + '</tbody>';
            break;
        case "8":
            table = '<thead>'
                + '<tr class="firstHead">'
                + '<th colspan="12">乳化沥青实验台账</th>'
                + '</tr>'
                +  '<tr class="firstHead">'
                + '<th rowspan="2">实验日期</th>'
                + '<th rowspan="2">试样名称</th>'
                + '<th rowspan="2">试验编号</th>'
                + '<th colspan="4">试验结果</th>'
                + '<th rowspan="2">备注</th>'
                + '</tr>'
                + '<tr class="twoHead">'
                + '<th>粘度</th>'
                + '<th>蒸发残留物含量</th>'
                + '<th>针入度</th>'
                + '<th>延度</th>'
                + '</tr>'
                + '</thead>'
                + '<tbody id="searchTbody">'

                + '</tbody>';
            break;
        case "9":
            table = '<thead>'
                + '<tr class="firstHead">'
                + '<th colspan="30">沥青混合料试验台账</th>'
                + '</tr>'
                +  '<tr class="firstHead">'
                + '<th rowspan="2">实验日期</th>'
                + '<th rowspan="2">试样名称</th>'
                + '<th rowspan="2">试验编号</th>'
                + '<th colspan="26">试验结果</th>'
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
                + '<th >油石比</th>'
                + '<th >最大理论密度</th>'
                + '<th >稳定度 </th>'
                + '<th >流值</th>'
                + '<th >残留</th>'
                + '<th>冻融</th>'
                + '<th >动稳定度 </th>'
                + '<th >渗水系数</th>'
                + '<th >构造深度</th>'
                + '<th>飞散</th>'
                + '<th >析漏 </th>'
                + '<th >毛体积相对密度</th>'
                + '</tr>'
                + '</thead>'
                + '<tbody id="searchTbody">'

                + '</tbody>';
            break
        case "10":
            table = '<thead>'
                + '<tr class="firstHead">'
                + '<th colspan="24">细铣刨料试验台账</th>'
                + '</tr>'
                +  '<tr class="firstHead">'
                + '<th rowspan="2">实验日期</th>'
                + '<th rowspan="2">试样名称</th>'
                + '<th rowspan="2">试验编号</th>'
                + '<th colspan="19">试验结果</th>'
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
                + '<th >含量</th>'
                + '<th >表观相对密度</th>'
                + '<th >毛体积相对密度 </th>'
                + '<th >吸水率</th>'
                + '<th >砂当量</th>'
                + '</tr>'
                + '</thead>'
                + '<tbody id="searchTbody">'

                + '</tbody>';
            break
        default:
            break

    }
    return table;
}

function eachArrayToHtml(res,id) {
    var bodyHtml = '';
    switch (id) {
        case "1":

            for(var i = 0; i < res.length;i++){
                bodyHtml += '<tr>'
                    +'<td>' + res[i].testDate +'</td>'
                    +'<td>' + res[i].samplingStandard + res[i].materialName +'</td>'
                    +'<td>' + res[i].testNum +'</td>'
                    +'<td>' + (blank(res[i].sievePore37) ? " ":res[i].sievePore37 ) +'</td>'
                    +'<td>' + (blank(res[i].sievePore31) ? " ":res[i].sievePore31) +'</td>'
                    +'<td>' + (blank(res[i].sievePore26) ? " ":res[i].sievePore26)+'</td>'
                    +'<td>' + (blank(res[i].sievePore19) ? " ":res[i].sievePore19) +'</td>'
                    +'<td>' + (blank(res[i].sievePore16) ? " ": res[i].sievePore16)+'</td>'
                    +'<td>' + (blank(res[i].sievePore13) ? " ":res[i].sievePore13) +'</td>'
                    +'<td>' +  (blank(res[i].sievePore9) ? " ": res[i].sievePore9) +'</td>'
                    +'<td>' + (blank(res[i].sievePore4) ? " ": res[i].sievePore4)+'</td>'
                    +'<td>' + (blank(res[i].sievePore2) ? " ": res[i].sievePore2) +'</td>'
                    +'<td>' + (blank(res[i].sievePore1) ? " ": res[i].sievePore1)+'</td>'
                    +'<td>' + (blank(res[i].sievePore06) ? " ": res[i].sievePore06)+'</td>'
                    +'<td>' + (blank(res[i].sievePore03) ? " ": res[i].sievePore03) +'</td>'
                    +'<td>' + (blank(res[i].sievePore015) ? " ": res[i].sievePore015) +'</td>'
                    +'<td>' + (blank(res[i].sievePore007) ? " " : res[i].sievePore007)+'</td>'
                    +'<td>' + (blank(res[i].fine_BGMD) ? " " : res[i].fine_BGMD) +'</td>'
                    +'<td>' + (blank(res[i].fine_SDL)  ? " "  : res[i].fine_SDL)+'</td>'
                    +'<td>' + (blank(res[i].fine_MTJ)  ? " "  : res[i].fine_MTJ)+'</td>'
                    +'<td>' + (blank(res[i].fine_XSL)  ? " "  : res[i].fine_XSL)+'</td>'
                    +'<td>' + res[i].remark+'</td>'
                    +'</tr>';

            }

            break;
        case "2":
            for(var i = 0; i < res.length;i++){
                bodyHtml += '<tr>'
                    +'<td>' + res[i].testDate +'</td>'
                    +'<td>' + res[i].samplingStandard + res[i].materialName +'</td>'
                    +'<td>' + res[i].testNum +'</td>'
                    +'<td>' + (blank(res[i].sievePore37) ? " ":res[i].sievePore37) +'</td>'
                    +'<td>' + (blank(res[i].sievePore31) ? " ":res[i].sievePore31) +'</td>'
                    +'<td>' + (blank(res[i].sievePore26) ? " ":res[i].sievePore26)+'</td>'
                    +'<td>' + (blank(res[i].sievePore19) ? " ":res[i].sievePore19) +'</td>'
                    +'<td>' + (blank(res[i].sievePore16) ? " ": res[i].sievePore16)+'</td>'
                    +'<td>' + (blank(res[i].sievePore13) ? " ":res[i].sievePore13) +'</td>'
                    +'<td>' +  (blank(res[i].sievePore9) ? " ": res[i].sievePore9) +'</td>'
                    +'<td>' + (blank(res[i].sievePore4) ? " ": res[i].sievePore4)+'</td>'
                    +'<td>' + (blank(res[i].sievePore2) ? " ": res[i].sievePore2) +'</td>'
                    +'<td>' + (blank(res[i].sievePore1) ? " ": res[i].sievePore1)+'</td>'
                    +'<td>' + (blank(res[i].sievePore06) ? " ": res[i].sievePore06)+'</td>'
                    +'<td>' + (blank(res[i].sievePore03) ? " ": res[i].sievePore03) +'</td>'
                    +'<td>' + (blank(res[i].sievePore015) ? " ": res[i].sievePore015) +'</td>'
                    +'<td>' + (blank(res[i].sievePore007) ? " " : res[i].sievePore007)+'</td>'
                    +'<td>' + (blank(res[i].coarse_MHSS) ? " " : res[i].coarse_MHSS) +'</td>'
                    +'<td>' + (blank(res[i].coarse_YSZ)  ? " "  : res[i].coarse_YSZ)+'</td>'
                    +'<td>' + (blank(res[i].coarse_BGMD) ? " "  : res[i].coarse_BGMD)+'</td>'
                    +'<td>' + (blank(res[i].coarse_MTJMD )? " "  : res[i].coarse_MTJMD) +'</td>'
                    +'<td>' + (blank( res[i].coarse_XSL)  ? " "  : res[i].coarse_XSL)+'</td>'
                    +'<td>' + (blank(res[i].coarse_ZPZ)  ? " "  : res[i].coarse_ZPZ)+'</td>'
                    +'<td>' + res[i].remark+'</td>'
                    +'</tr>';
                
            }
            break;
        case "3":
            for(var i = 0; i < res.length;i++){
                bodyHtml += '<tr>'
                    +'<td>' + res[i].testDate +'</td>'
                    +'<td>' + res[i].samplingStandard + res[i].materialName +'</td>'
                    +'<td>' + res[i].testNum +'</td>'
                    +'<td>' + (blank(res[i].breeze_BGMD) ? " " : res[i].breeze_BGMD) +'</td>'
                    +'<td>' + (blank(res[i].breeze_MTJ) ? " " : res[i].breeze_MTJ) +'</td>'
                    +'<td>' + (blank(res[i].breeze_HSL) ? " " : res[i].breeze_HSL) +'</td>'
                    +'<td>' + (blank(res[i].breeze_QSXS) ? " " : res[i].breeze_QSXS) +'</td>'
                    +'<td>' + (blank(res[i].breeze_SXZS) ? " " : res[i].breeze_SXZS) +'</td>'
                    +'<td>' + (blank(res[i].breeze_LDFW06) ? " " : res[i].breeze_LDFW06) +'</td>'
                    +'<td>' + (blank(res[i].breeze_LDFW03) ? " " : res[i].breeze_LDFW03) +'</td>'
                    +'<td>' + (blank(res[i].breeze_LDFW015) ? " " : res[i].breeze_LDFW015) +'</td>'
                    +'<td>' + (blank(res[i].breeze_LDFW075)  ? " "  : res[i].breeze_LDFW075)+'</td>'
                    +'<td>' + res[i].remark+'</td>'
                    +'</tr>';
            }
            break;
        case "4":
            for (var i = 0; i < res.length;i++){
                bodyHtml += '<tr>'
                    +'<td>' + res[i].testDate +'</td>'
                    +'<td>' + res[i].samplingStandard + res[i].materialName +'</td>'
                    +'<td>' + res[i].testNum +'</td>'
                    +'<td>' + (blank(res[i].asphalt_ZRD) ? " " : res[i].asphalt_ZRD) +'</td>'
                    +'<td>' + (blank(res[i].asphalt_YD10)  ? " "  : res[i].asphalt_YD10)+'</td>'
                    +'<td>' + (blank(res[i].asphalt_YD15) ? " " : res[i].asphalt_YD15) +'</td>'
                    +'<td>' + (blank(res[i].asphalt_RHD)  ? " "  : res[i].asphalt_RHD)+'</td>'
                    +'<td>' + (blank(res[i].asphalt_ZLBH) ? " " : res[i].asphalt_ZLBH) +'</td>'
                    +'<td>' + (blank(res[i].asphalt_CLZRD10)  ? " "  : res[i].asphalt_CLZRD10)+'</td>'
                    +'<td>' + (blank(res[i].asphalt_CLZRD16) ? " " : res[i].asphalt_CLZRD16) +'</td>'
                    +'<td>' + (blank(res[i].asphalt_CLZRD25)  ? " "  : res[i].asphalt_CLZRD25)+'</td>'
                    +'<td>' + res[i].remark+'</td>'
                    +'</tr>';
            }
            break;
        case "5":
            for(var i = 0; i < res.length;i++){
                bodyHtml += '<tr>'
                    +'<td>' + res[i].testDate +'</td>'
                    +'<td>' + res[i].samplingStandard + res[i].materialName +'</td>'
                    +'<td>' + res[i].testNum +'</td>'
                    +'<td>' + (blank(res[i].sievePore37) ? " ":res[i].sievePore37) +'</td>'
                    +'<td>' + (blank(res[i].sievePore31) ? " ":res[i].sievePore31) +'</td>'
                    +'<td>' + (blank(res[i].sievePore26) ? " ":res[i].sievePore26)+'</td>'
                    +'<td>' + (blank(res[i].sievePore19) ? " ":res[i].sievePore19) +'</td>'
                    +'<td>' + (blank(res[i].sievePore16) ? " ": res[i].sievePore16)+'</td>'
                    +'<td>' + (blank(res[i].sievePore13) ? " ":res[i].sievePore13) +'</td>'
                    +'<td>' +  (blank(res[i].sievePore9) ? " ": res[i].sievePore9) +'</td>'
                    +'<td>' + (blank(res[i].sievePore4) ? " ": res[i].sievePore4)+'</td>'
                    +'<td>' + (blank(res[i].sievePore2) ? " ": res[i].sievePore2) +'</td>'
                    +'<td>' + (blank(res[i].sievePore1) ? " ": res[i].sievePore1)+'</td>'
                    +'<td>' + (blank(res[i].sievePore06) ? " ": res[i].sievePore06)+'</td>'
                    +'<td>' + (blank(res[i].sievePore03) ? " ": res[i].sievePore03) +'</td>'
                    +'<td>' + (blank(res[i].sievePore015) ? " ": res[i].sievePore015) +'</td>'
                    +'<td>' + (blank(res[i].sievePore007) ? " " : res[i].sievePore007)+'</td>'
                    +'<td>' + (blank(res[i].mill_HL) ? " " : res[i].mill_HL) +'</td>'
                    +'<td>' + (blank(res[i].mill_BGXDMD)  ? " "  : res[i].mill_BGXDMD)+'</td>'
                    +'<td>' + (blank(res[i].mill_MTJMD) ? " "  : res[i].mill_MTJMD)+'</td>'
                    +'<td>' + (blank(res[i].mill_XSL )? " "  : res[i].mill_XSL) +'</td>'
                    +'<td>' + (blank( res[i].mill_ZPZ)  ? " "  : res[i].mill_ZPZ)+'</td>'
                    +'<td>' + (blank(res[i].mill_YSZ)  ? " "  : res[i].mill_YSZ)+'</td>'
                    +'<td>' + res[i].remark+'</td>'
                    +'</tr>';

            }
            break;
        case "6":
            for(var i = 0; i < res.length;i++){
                bodyHtml += '<tr>'
                    +'<td>' + res[i].testDate +'</td>'
                    +'<td>' + res[i].samplingStandard + res[i].materialName +'</td>'
                    +'<td>' + res[i].testNum +'</td>'
                    +'<td>' + (blank(res[i].sievePore37) ? " ":res[i].sievePore37) +'</td>'
                    +'<td>' + (blank(res[i].sievePore31) ? " ":res[i].sievePore31) +'</td>'
                    +'<td>' + (blank(res[i].sievePore26) ? " ":res[i].sievePore26)+'</td>'
                    +'<td>' + (blank(res[i].sievePore19) ? " ":res[i].sievePore19) +'</td>'
                    +'<td>' + (blank(res[i].sievePore16) ? " ": res[i].sievePore16)+'</td>'
                    +'<td>' + (blank(res[i].sievePore13) ? " ":res[i].sievePore13) +'</td>'
                    +'<td>' +  (blank(res[i].sievePore9) ? " ": res[i].sievePore9) +'</td>'
                    +'<td>' + (blank(res[i].sievePore4) ? " ": res[i].sievePore4)+'</td>'
                    +'<td>' + (blank(res[i].sievePore2) ? " ": res[i].sievePore2) +'</td>'
                    +'<td>' + (blank(res[i].sievePore1) ? " ": res[i].sievePore1)+'</td>'
                    +'<td>' + (blank(res[i].sievePore06) ? " ": res[i].sievePore06)+'</td>'
                    +'<td>' + (blank(res[i].sievePore03) ? " ": res[i].sievePore03) +'</td>'
                    +'<td>' + (blank(res[i].sievePore015) ? " ": res[i].sievePore015) +'</td>'
                    +'<td>' + (blank(res[i].sievePore007) ? " " : res[i].sievePore007)+'</td>'
                    +'<td>' + (blank(res[i].rock_YSB) ? " " : res[i].rock_YSB) +'</td>'
                    +'<td>' + (blank(res[i].rock_BGXDMD)  ? " "  : res[i].rock_BGXDMD)+'</td>'
                    +'<td>' + (blank(res[i].rock_MTJMD) ? " "  : res[i].rock_MTJMD)+'</td>'
                    +'<td>' + (blank( res[i].rock_LQMD)  ? " "  : res[i].rock_LQMD)+'</td>'
                    +'<td>' +  (blank( res[i].remark)  ? " "  : res[i].remark) +'</td>'
                    +'</tr>';
            }
            break;
        case "7":
            for(var i = 0; i < res.length;i++){
                bodyHtml += '<tr>'
                    +'<td>' + res[i].testDate +'</td>'
                    +'<td>' + res[i].samplingStandard + res[i].materialName +'</td>'
                    +'<td>' + res[i].testNum +'</td>'
                    +'<td>' + (blank(res[i].fibre_XWCD) ? " " : res[i].fibre_XWCD) +'</td>'
                    +'<td>' + (blank(res[i].fibre_HFHL) ? " " : res[i].fibre_HFHL) +'</td>'
                    +'<td>' + (blank(res[i].fibre_PHZ) ? " " : res[i].fibre_PHZ) +'</td>'
                    +'<td>' + (blank(res[i].fibre_XYL) ? " " : res[i].fibre_XYL) +'</td>'
                    +'<td>' + (blank(res[i].fibre_HSL) ? " " : res[i].fibre_HSL) +'</td>'
                    +'<td>' + res[i].remark+'</td>'
                    +'</tr>';
            }
            break;
        case "8":
            for(var i = 0; i < res.length;i++){
                bodyHtml += '<tr>'
                    +'<td>' + res[i].testDate +'</td>'
                    +'<td>' + res[i].samplingStandard + res[i].materialName +'</td>'
                    +'<td>' + res[i].testNum +'</td>'
                    +'<td>' + (blank(res[i].emulsified_ZD) ? " " : res[i].emulsified_ZD) +'</td>'
                    +'<td>' + (blank(res[i].emulsified_ZFCLW) ? " " : res[i].emulsified_ZFCLW) +'</td>'
                    +'<td>' + (blank(res[i].emulsified_ZRD) ? " " : res[i].emulsified_ZRD) +'</td>'
                    +'<td>' + (blank(res[i].emulsified_YD) ? " " : res[i].emulsified_YD) +'</td>'
                    +'<td>' + res[i].remark+'</td>'
                    +'</tr>';
            }
            break;
        case "9":
            for(var i = 0; i < res.length;i++){
                bodyHtml += '<tr>'
                    +'<td>' + res[i].testDate +'</td>'
                    +'<td>' + res[i].samplingStandard + res[i].materialName +'</td>'
                    +'<td>' + res[i].testNum +'</td>'
                    +'<td>' + (blank(res[i].sievePore37) ? " ":res[i].sievePore37) +'</td>'
                    +'<td>' + (blank(res[i].sievePore31) ? " ":res[i].sievePore31) +'</td>'
                    +'<td>' + (blank(res[i].sievePore26) ? " ":res[i].sievePore26)+'</td>'
                    +'<td>' + (blank(res[i].sievePore19) ? " ":res[i].sievePore19) +'</td>'
                    +'<td>' + (blank(res[i].sievePore16) ? " ": res[i].sievePore16)+'</td>'
                    +'<td>' + (blank(res[i].sievePore13) ? " ":res[i].sievePore13) +'</td>'
                    +'<td>' +  (blank(res[i].sievePore9) ? " ": res[i].sievePore9) +'</td>'
                    +'<td>' + (blank(res[i].sievePore4) ? " ": res[i].sievePore4)+'</td>'
                    +'<td>' + (blank(res[i].sievePore2) ? " ": res[i].sievePore2) +'</td>'
                    +'<td>' + (blank(res[i].sievePore1) ? " ": res[i].sievePore1)+'</td>'
                    +'<td>' + (blank(res[i].sievePore06) ? " ": res[i].sievePore06)+'</td>'
                    +'<td>' + (blank(res[i].sievePore03) ? " ": res[i].sievePore03) +'</td>'
                    +'<td>' + (blank(res[i].sievePore015) ? " ": res[i].sievePore015) +'</td>'
                    +'<td>' + (blank(res[i].sievePore007) ? " " : res[i].sievePore007)+'</td>'
                    +'<td>' + (blank(res[i].mixture_HL) ? " " : res[i].mixture_HL) +'</td>'
                    +'<td>' + (blank(res[i].mixture_ZDLLMD)  ? " "  : res[i].mixture_ZDLLMD)+'</td>'
                    +'<td>' + (blank(res[i].mixture_WDD) ? " "  : res[i].mixture_WDD)+'</td>'
                    +'<td>' + (blank(res[i].mixture_LZ )? " "  : res[i].mixture_LZ) +'</td>'
                    +'<td>' + (blank( res[i].mixture_CL)  ? " "  : res[i].mixture_CL)+'</td>'
                    +'<td>' + (blank(res[i].mixture_DW)  ? " "  : res[i].mixture_DW)+'</td>'
                    +'<td>' + (blank(res[i].mixture_DWDD)  ? " "  : res[i].mixture_DWDD)+'</td>'
                    +'<td>' + (blank(res[i].mixture_SSXS) ? " "  : res[i].mixture_SSXS)+'</td>'
                    +'<td>' + (blank(res[i].mixture_GZSD )? " "  : res[i].mixture_GZSD) +'</td>'
                    +'<td>' + (blank( res[i].mixture_FS)  ? " "  : res[i].mixture_FS)+'</td>'
                    +'<td>' + (blank(res[i].mixture_XL)  ? " "  : res[i].mixture_XL)+'</td>'
                    +'<td>' + (blank(res[i].mixture_MTJXDMD)  ? " "  : res[i].mixture_MTJXDMD)+'</td>'
                    +'<td>' + res[i].remark+'</td>'
                    +'</tr>';

            }
            break;
        case "10":
            for(var i = 0; i < res.length;i++){
                bodyHtml += '<tr>'
                    +'<td>' + res[i].testDate +'</td>'
                    +'<td>' + res[i].samplingStandard + res[i].materialName +'</td>'
                    +'<td>' + res[i].testNum +'</td>'
                    +'<td>' + (blank(res[i].sievePore37) ? " ":res[i].sievePore37) +'</td>'
                    +'<td>' + (blank(res[i].sievePore31) ? " ":res[i].sievePore31) +'</td>'
                    +'<td>' + (blank(res[i].sievePore26) ? " ":res[i].sievePore26)+'</td>'
                    +'<td>' + (blank(res[i].sievePore19) ? " ":res[i].sievePore19) +'</td>'
                    +'<td>' + (blank(res[i].sievePore16) ? " ": res[i].sievePore16)+'</td>'
                    +'<td>' + (blank(res[i].sievePore13) ? " ":res[i].sievePore13) +'</td>'
                    +'<td>' +  (blank(res[i].sievePore9) ? " ": res[i].sievePore9) +'</td>'
                    +'<td>' + (blank(res[i].sievePore4) ? " ": res[i].sievePore4)+'</td>'
                    +'<td>' + (blank(res[i].sievePore2) ? " ": res[i].sievePore2) +'</td>'
                    +'<td>' + (blank(res[i].sievePore1) ? " ": res[i].sievePore1)+'</td>'
                    +'<td>' + (blank(res[i].sievePore06) ? " ": res[i].sievePore06)+'</td>'
                    +'<td>' + (blank(res[i].sievePore03) ? " ": res[i].sievePore03) +'</td>'
                    +'<td>' + (blank(res[i].sievePore015) ? " ": res[i].sievePore015) +'</td>'
                    +'<td>' + (blank(res[i].sievePore007) ? " " : res[i].sievePore007)+'</td>'
                    +'<td>' + (blank(res[i].millfine_HL) ? " " : res[i].millfine_HL) +'</td>'
                    +'<td>' + (blank(res[i].millfine_BGXDMD)  ? " "  : res[i].millfine_BGXDMD)+'</td>'
                    +'<td>' + (blank(res[i].millfine_MTJMD) ? " "  : res[i].millfine_MTJMD)+'</td>'
                    +'<td>' + (blank(res[i].millfine_XSL )? " "  : res[i].millfine_XSL) +'</td>'
                    +'<td>' + (blank(res[i].millfine_ZPZ )? " "  : res[i].millfine_ZPZ) +'</td>'
                    +'<td>' + res[i].remark+'</td>'
                    +'</tr>';

            }
            break;
    }
    var tem = returnSvgHtml(id,res);
    return bodyHtml += tem;
}


function returnSvgHtml(id,res) {
    var temHtml = "";
    var sievePore37Count = 0,
        sievePore31Count= 0,
        sievePore26Count= 0,
        sievePore19Count= 0,
        sievePore16Count= 0,
        sievePore13Count= 0,
        sievePore9Count= 0,
        sievePore4Count= 0,
        sievePore2Count= 0,
        sievePore1Count= 0,
        sievePore06Count= 0,
        sievePore03Count= 0,
        sievePore015Count= 0,
        sievePore007Count= 0,
        res1Count= 0,
        res2Count= 0,
        res3Count= 0,
        res4Count= 0,
        res5Count= 0,
        res6Count= 0;

    var sievePore37Sum= 0,
        sievePore31Sum= 0,
        sievePore26Sum= 0,
        sievePore19Sum= 0,
        sievePore16Sum= 0,
        sievePore13Sum= 0,
        sievePore9Sum= 0,
        sievePore4Sum= 0,
        sievePore2Sum= 0,
        sievePore1Sum= 0,
        sievePore06Sum= 0,
        sievePore03Sum= 0,
        sievePore015Sum= 0,
        sievePore007Sum= 0,
        res1Sum= 0,
        res2Sum= 0,
        res3Sum= 0,
        res4Sum= 0,
        res5Sum= 0,
        res6Sum= 0;
    switch (id) {
        case "1":
        case "2":
        case "5":
        case "6":
        case "9":
        case "10":
            for(var i = 0; i < res.length;i++) {
                if (!blank(res[i].sievePore37))  sievePore37Count++;sievePore37Sum +=Number($.trim(res[i].sievePore37));
                if (!blank(res[i].sievePore31)) sievePore31Count++;sievePore31Sum += Number($.trim(res[i].sievePore31));
                if (!blank(res[i].sievePore26)) sievePore26Count++;sievePore26Sum += Number($.trim(res[i].sievePore26));
                if (!blank(res[i].sievePore19)) sievePore19Count++;sievePore19Sum += Number($.trim(res[i].sievePore19));
                if (!blank(res[i].sievePore16)) sievePore16Count++;sievePore16Sum += Number($.trim(res[i].sievePore16));
                if (!blank(res[i].sievePore13)) sievePore13Count++;sievePore13Sum += Number($.trim(res[i].sievePore13));
                if (!blank(res[i].sievePore9)) sievePore9Count++;sievePore9Sum += Number($.trim(res[i].sievePore9));
                if (!blank(res[i].sievePore4)) sievePore4Count++;sievePore4Sum += Number($.trim(res[i].sievePore4));
                if (!blank(res[i].sievePore2)) sievePore2Count++;sievePore2Sum += Number($.trim(res[i].sievePore2));
                if (!blank(res[i].sievePore1)) sievePore1Count++;sievePore1Sum += Number($.trim(res[i].sievePore1));
                if (!blank(res[i].sievePore06)) sievePore06Count++;sievePore06Sum += Number($.trim(res[i].sievePore06));
                if (!blank(res[i].sievePore03)) sievePore03Count++;sievePore03Sum += Number($.trim(res[i].sievePore03));
                if (!blank(res[i].sievePore015)) sievePore015Count++;sievePore015Sum += Number($.trim(res[i].sievePore015));
                if (!blank(res[i].sievePore007)) sievePore007Count++;sievePore007Sum += Number($.trim(res[i].sievePore007));
            }
            temHtml += '<tr>'
                +'<td></td>'
                +'<td>平均值</td>'
                +'<td></td>'
                +'<td>' + (isNaN((sievePore37Sum/sievePore37Count)) ? "":(sievePore37Sum/sievePore37Count).toFixed(2)) +'</td>'
                +'<td>' + (isNaN((sievePore31Sum/sievePore31Count)) ? "" : (sievePore31Sum/sievePore31Count).toFixed(2))  +'</td>'
                +'<td>' + (isNaN((sievePore26Sum/sievePore26Count)) ? "" : (sievePore26Sum/sievePore26Count).toFixed(2)) +'</td>'
                +'<td>' + (isNaN((sievePore19Sum/sievePore19Count)) ? "" : (sievePore19Sum/sievePore19Count).toFixed(2) )+'</td>'
                +'<td>' + (isNaN((sievePore16Sum/sievePore16Count)) ? "" : (sievePore16Sum/sievePore16Count).toFixed(2)) +'</td>'
                +'<td>' + (isNaN((sievePore13Sum/sievePore13Count)) ? "" : (sievePore13Sum/sievePore13Count).toFixed(2))  +'</td>'
                +'<td>' + (isNaN((sievePore9Sum/sievePore9Count)) ? "" :(sievePore9Sum/sievePore9Count).toFixed(2)) +'</td>'
                +'<td>' +( isNaN((sievePore4Sum/sievePore4Count)) ? "" : (sievePore4Sum/sievePore4Count).toFixed(2))+'</td>'
                +'<td>' +(isNaN((sievePore2Sum/sievePore2Count)) ? "" : (sievePore2Sum/sievePore2Count).toFixed(2)) +'</td>'
                +'<td>' + (isNaN((sievePore1Sum/sievePore1Count)) ? "" : (sievePore1Sum/sievePore1Count).toFixed(2) )+'</td>'
                +'<td>' + (isNaN((sievePore06Sum/sievePore06Count)) ? "":(sievePore06Sum/sievePore06Count).toFixed(2)) +'</td>'
                +'<td>' + (isNaN((sievePore03Sum/sievePore03Count)) ? "":(sievePore03Sum/sievePore03Count).toFixed(2))  +'</td>'
                +'<td>' + (isNaN((sievePore015Sum/sievePore015Count)) ? "":(sievePore015Sum/sievePore015Count).toFixed(2))  +'</td>'
                +'<td>' +  (isNaN((sievePore007Sum/sievePore007Count)) ? "":(sievePore007Sum/sievePore007Count).toFixed(2)) +'</td>';
            break;
        default:
            break;
    }
    switch (id) {
        case "1":
            for(var i = 0; i < res.length;i++) {
                if (!blank(res[i].fine_BGMD)) res1Count++;res1Sum += Number($.trim(res[i].fine_BGMD));
                if (!blank(res[i].fine_SDL)) res2Count++;res2Sum += Number($.trim(res[i].fine_SDL));
                if (!blank(res[i].fine_MTJ)) res3Count++;res3Sum += Number($.trim(res[i].fine_MTJ));
                if (!blank(res[i].fine_XSL)) res4Count++;res4Sum += Number($.trim(res[i].fine_XSL));
            }
            temHtml +='<td>' +  (isNaN((res1Sum/res1Count)) ? "":(res1Sum/res1Count).toFixed(2)) +'</td>'
                     + '<td>' +  (isNaN((res2Sum/res2Count)) ? "":(res2Sum/res2Count).toFixed(2)) +'</td>'
                    + '<td>' +  (isNaN((res3Sum/res3Count)) ? "":(res3Sum/res3Count).toFixed(2)) +'</td>'
                    + '<td>' +  (isNaN((res4Sum/res4Count)) ? "":(res4Sum/res4Count).toFixed(2)) +'</td>'
                    + '<td></td>'
                    + '</tr>';
            break;
        case "2":
            for(var i = 0; i < res.length;i++) {
                if (!blank(res[i].coarse_MHSS)) res1Count++;res1Sum += Number($.trim(res[i].coarse_MHSS));
                if (!blank(res[i].coarse_YSZ)) res2Count++;res2Sum += Number($.trim(res[i].coarse_YSZ));
                if (!blank(res[i].coarse_BGMD)) res3Count++;res3Sum += Number($.trim(res[i].coarse_BGMD));
                if (!blank(res[i].coarse_MTJMD)) res4Count++;res4Sum += Number($.trim(res[i].coarse_MTJMD));
                if (!blank(res[i].coarse_XSL)) res5Count++;res5Sum += Number($.trim(res[i].coarse_XSL));
                if (!blank(res[i].coarse_ZPZ)) res6Count++;res6Sum += Number($.trim(res[i].coarse_ZPZ));
            }
            temHtml +='<td>' +  (isNaN((res1Sum/res1Count)) ? "":(res1Sum/res1Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res2Sum/res2Count)) ? "":(res2Sum/res2Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res3Sum/res3Count)) ? "":(res3Sum/res3Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res4Sum/res4Count)) ? "":(res4Sum/res4Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res5Sum/res5Count)) ? "":(res5Sum/res5Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res6Sum/res6Count)) ? "":(res6Sum/res6Count).toFixed(2)) +'</td>'
                + '<td></td>'
                + '</tr>';
            break;
        case "5":
            for(var i = 0; i < res.length;i++) {
                if (!blank(res[i].mill_HL)) res1Count++;res1Sum += Number($.trim(res[i].mill_HL));
                if (!blank(res[i].mill_BGXDMD)) res2Count++;res2Sum += Number($.trim(res[i].mill_BGXDMD));
                if (!blank(res[i].mill_MTJMD)) res3Count++;res3Sum += Number($.trim(res[i].mill_MTJMD));
                if (!blank(res[i].mill_XSL)) res4Count++;res4Sum += Number($.trim(res[i].mill_XSL));
                if (!blank(res[i].mill_ZPZ)) res5Count++;res5Sum += Number($.trim(res[i].mill_ZPZ));
                if (!blank(res[i].mill_YSZ)) res6Count++;res6Sum += Number($.trim(res[i].mill_YSZ));
            }
            temHtml +='<td>' +  (isNaN((res1Sum/res1Count)) ? "":(res1Sum/res1Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res2Sum/res2Count)) ? "":(res2Sum/res2Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res3Sum/res3Count)) ? "":(res3Sum/res3Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res4Sum/res4Count)) ? "":(res4Sum/res4Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res5Sum/res5Count)) ? "":(res5Sum/res5Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res6Sum/res6Count)) ? "":(res6Sum/res6Count).toFixed(2)) +'</td>'
                + '<td></td>'
                + '</tr>';
            break;
        case "6":
            for(var i = 0; i < res.length;i++) {
                if (!blank(res[i].rock_YSB)) res1Count++;res1Sum += Number($.trim(res[i].rock_YSB));
                if (!blank(res[i].rock_BGXDMD)) res2Count++;res2Sum += Number($.trim(res[i].rock_BGXDMD));
                if (!blank(res[i].rock_MTJMD)) res3Count++;res3Sum += Number($.trim(res[i].rock_MTJMD));
                if (!blank(res[i].rock_LQMD)) res4Count++;res4Sum += Number($.trim(res[i].rock_LQMD));
            }
            temHtml +='<td>' +  (isNaN((res1Sum/res1Count)) ? "":(res1Sum/res1Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res2Sum/res2Count)) ? "":(res2Sum/res2Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res3Sum/res3Count)) ? "":(res3Sum/res3Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res4Sum/res4Count)) ? "":(res4Sum/res4Count).toFixed(2)) +'</td>'
                + '<td></td>'
                + '</tr>';
            break;
        case "9":
            var res7Sum= 0, res7Count= 0,res8Sum= 0, res8Count= 0,res9Sum= 0, res9Count= 0,res10Sum= 0, res10Count= 0,res11Sum= 0, res11Count= 0,res12Sum= 0, res12Count= 0;
            for(var i = 0; i < res.length;i++) {
                if (!blank(res[i].mixture_HL)) res1Count++;res1Sum += Number($.trim(res[i].mixture_HL));
                if (!blank(res[i].mixture_ZDLLMD)) res2Count++;res2Sum += Number($.trim(res[i].mixture_ZDLLMD));
                if (!blank(res[i].mixture_WDD)) res3Count++;res3Sum += Number($.trim(res[i].mixture_WDD));
                if (!blank(res[i].mixture_LZ)) res4Count++;res4Sum += Number($.trim(res[i].mixture_LZ));
                if (!blank(res[i].mixture_CL)) res5Count++;res5Sum += Number($.trim(res[i].mixture_CL));
                if (!blank(res[i].mixture_DW)) res6Count++;res6Sum += Number($.trim(res[i].mixture_DW));
                if (!blank(res[i].mixture_DWDD)) res7Count++;res7Sum += Number($.trim(res[i].mixture_DWDD));
                if (!blank(res[i].mixture_SSXS)) res8Count++;res8Sum += Number($.trim(res[i].mixture_SSXS));
                if (!blank(res[i].mixture_GZSD)) res9Count++;res9Sum += Number($.trim(res[i].mixture_GZSD));
                if (!blank(res[i].mixture_FS)) res10Count++;res10Sum += Number($.trim(res[i].mixture_FS));
                if (!blank(res[i].mixture_XL)) res11Count++;res11Sum += Number($.trim(res[i].mixture_XL));
                if (!blank(res[i].mixture_MTJXDMD)) res12Count++;res12Sum += Number($.trim(res[i].mixture_MTJXDMD));
            }
            temHtml +='<td>' +  (isNaN((res1Sum/res1Count)) ? "":(res1Sum/res1Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res2Sum/res2Count)) ? "":(res2Sum/res2Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res3Sum/res3Count)) ? "":(res3Sum/res3Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res4Sum/res4Count)) ? "":(res4Sum/res4Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res5Sum/res5Count)) ? "":(res5Sum/res5Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res6Sum/res6Count)) ? "":(res6Sum/res6Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res7Sum/res7Count)) ? "":(res7Sum/res7Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res8Sum/res8Count)) ? "":(res8Sum/res8Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res9Sum/res9Count)) ? "":(res9Sum/res9Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res10Sum/res10Count)) ? "":(res10Sum/res10Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res11Sum/res11Count)) ? "":(res11Sum/res11Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res12Sum/res12Count)) ? "":(res12Sum/res12Count).toFixed(2)) +'</td>'
                + '<td></td>'
                + '</tr>';
            break;
        case "10":
            for(var i = 0; i < res.length;i++) {
                if (!blank(res[i].millfine_HL)) res1Count++;res1Sum += Number($.trim(res[i].millfine_HL));
                if (!blank(res[i].millfine_BGXDMD)) res2Count++;res2Sum += Number($.trim(res[i].millfine_BGXDMD));
                if (!blank(res[i].millfine_MTJMD)) res3Count++;res3Sum += Number($.trim(res[i].millfine_MTJMD));
                if (!blank(res[i].millfine_XSL)) res4Count++;res4Sum += Number($.trim(res[i].millfine_XSL));
                if (!blank(res[i].millfine_ZPZ)) res5Count++;res5Sum += Number($.trim(res[i].millfine_ZPZ));
            }
            temHtml +='<td>' +  (isNaN((res1Sum/res1Count)) ? "":(res1Sum/res1Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res2Sum/res2Count)) ? "":(res2Sum/res2Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res3Sum/res3Count)) ? "":(res3Sum/res3Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res4Sum/res4Count)) ? "":(res4Sum/res4Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res5Sum/res5Count)) ? "":(res5Sum/res5Count).toFixed(2)) +'</td>'
                + '<td></td>'
                + '</tr>';
            break;
        case "3":
            var res7Sum= 0, res7Count= 0,res8Sum= 0, res8Count= 0,res9Sum= 0, res9Count= 0;
            for(var i = 0; i < res.length;i++) {
                if (!blank(res[i].breeze_BGMD)) res1Count++;res1Sum += Number($.trim(res[i].breeze_BGMD));
                if (!blank(res[i].breeze_MTJ)) res2Count++;res2Sum += Number($.trim(res[i].breeze_MTJ));
                if (!blank(res[i].breeze_HSL)) res3Count++;res3Sum += Number($.trim(res[i].breeze_HSL));
                if (!blank(res[i].breeze_QSXS)) res4Count++;res4Sum += Number($.trim(res[i].breeze_QSXS));
                if (!blank(res[i].breeze_SXZS)) res5Count++;res5Sum += Number($.trim(res[i].breeze_SXZS));
                if (!blank(res[i].breeze_LDFW06)) res6Count++;res6Sum += Number($.trim(res[i].breeze_LDFW06));
                if (!blank(res[i].breeze_LDFW03)) res7Count++;res7Sum += Number($.trim(res[i].breeze_LDFW03));
                if (!blank(res[i].breeze_LDFW015)) res8Count++;res8Sum += Number($.trim(res[i].breeze_LDFW015));
                if (!blank(res[i].breeze_LDFW075)) res9Count++;res9Sum += Number($.trim(res[i].breeze_LDFW075));
            }
            temHtml += '<tr>'
                +'<td></td>'
                +'<td>平均值</td>'
                +'<td></td>'
                + '<td>' +  (isNaN((res1Sum/res1Count)) ? "":(res1Sum/res1Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res2Sum/res2Count)) ? "":(res2Sum/res2Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res3Sum/res3Count)) ? "":(res3Sum/res3Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res4Sum/res4Count)) ? "":(res4Sum/res4Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res5Sum/res5Count)) ? "":(res5Sum/res5Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res6Sum/res6Count)) ? "":(res6Sum/res6Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res7Sum/res7Count)) ? "":(res7Sum/res7Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res8Sum/res8Count)) ? "":(res8Sum/res8Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res9Sum/res9Count)) ? "":(res9Sum/res9Count).toFixed(2)) +'</td>'
                + '<td></td>'
                + '</tr>';
            break;
        case "4":
            var res7Count = 0,res7Sum = 0,res6Count = 0,res6Sum = 0,res8Count = 0,res8Sum = 0;
            for(var i = 0; i < res.length;i++) {
                if (!blank(res[i].asphalt_ZRD)) res1Count++;res1Sum += Number($.trim(res[i].asphalt_ZRD));
                if (!blank(res[i].asphalt_YD10)) res2Count++;res2Sum += Number($.trim(res[i].asphalt_YD10));
                if (!blank(res[i].asphalt_YD15)) res3Count++;res3Sum += Number($.trim(res[i].asphalt_YD15));
                if (!blank(res[i].asphalt_RHD)) res4Count++;res4Sum += Number($.trim(res[i].asphalt_RHD));
                if (!blank(res[i].asphalt_ZLBH)) res5Count++;res5Sum += Number($.trim(res[i].asphalt_ZLBH));
                if (!blank(res[i].asphalt_CLZRD10)) res6Count++;res6Sum += Number($.trim(res[i].asphalt_CLZRD10));
                if (!blank(res[i].asphalt_CLZRD16)) res7Count++;res7Sum += Number($.trim(res[i].asphalt_CLZRD16));
                if (!blank(res[i].asphalt_CLZRD25)) res8Count++;res8Sum += Number($.trim(res[i].asphalt_CLZRD25));
            }
            temHtml += '<tr>'
                +'<td></td>'
                +'<td>平均值</td>'
                +'<td></td>'
                + '<td>' +  (isNaN((res1Sum/res1Count)) ? "":(res1Sum/res1Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res2Sum/res2Count)) ? "":(res2Sum/res2Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res3Sum/res3Count)) ? "":(res3Sum/res3Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res4Sum/res4Count)) ? "":(res4Sum/res4Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res5Sum/res5Count)) ? "":(res5Sum/res5Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res6Sum/res6Count)) ? "":(res6Sum/res6Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res7Sum/res7Count)) ? "":(res7Sum/res7Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res8Sum/res8Count)) ? "":(res8Sum/res8Count).toFixed(2)) +'</td>'
                + '<td></td>'
                + '</tr>';
            break;
        case "7":
            for(var i = 0; i < res.length;i++) {
                if (!blank(res[i].fibre_XWCD)) res1Count++;res1Sum += Number($.trim(res[i].fibre_XWCD));
                if (!blank(res[i].fibre_HFHL)) res2Count++;res2Sum += Number($.trim(res[i].fibre_HFHL));
                if (!blank(res[i].fibre_PHZ)) res3Count++;res3Sum += Number($.trim(res[i].fibre_PHZ));
                if (!blank(res[i].fibre_XYL)) res4Count++;res4Sum += Number($.trim(res[i].fibre_XYL));
                if (!blank(res[i].fibre_HSL)) res5Count++;res5Sum += Number($.trim(res[i].fibre_HSL));
            }
            temHtml += '<tr>'
                +'<td></td>'
                +'<td>平均值</td>'
                +'<td></td>'
                + '<td>' +  (isNaN((res1Sum/res1Count)) ? "":(res1Sum/res1Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res2Sum/res2Count)) ? "":(res2Sum/res2Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res3Sum/res3Count)) ? "":(res3Sum/res3Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res4Sum/res4Count)) ? "":(res4Sum/res4Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res5Sum/res5Count)) ? "":(res5Sum/res5Count).toFixed(2)) +'</td>'
                + '<td></td>'
                + '</tr>';
            break;
        case "8":
            for(var i = 0; i < res.length;i++) {
                if (!blank(res[i].emulsified_ZD)) res1Count++;res1Sum += Number($.trim(res[i].emulsified_ZD));
                if (!blank(res[i].emulsified_ZFCLW)) res2Count++;res2Sum += Number($.trim(res[i].emulsified_ZFCLW));
                if (!blank(res[i].emulsified_ZRD)) res3Count++;res3Sum += Number($.trim(res[i].emulsified_ZRD));
                if (!blank(res[i].emulsified_YD)) res4Count++;res4Sum += Number($.trim(res[i].emulsified_YD));
            }
            temHtml += '<tr>'
                +'<td></td>'
                +'<td>平均值</td>'
                +'<td></td>'
                + '<td>' +  (isNaN((res1Sum/res1Count)) ? "":(res1Sum/res1Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res2Sum/res2Count)) ? "":(res2Sum/res2Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res3Sum/res3Count)) ? "":(res3Sum/res3Count).toFixed(2)) +'</td>'
                + '<td>' +  (isNaN((res4Sum/res4Count)) ? "":(res4Sum/res4Count).toFixed(2)) +'</td>'
                + '<td></td>'
                + '</tr>';
            break;
        default:
            break;
    }

    return temHtml;

}