// "use strict";
// !function (t, i) {
//     var e = {id: "#cardArea", sid: ".card-item"};
//     i.fn.cardArea = function (t) {
//         var t = i.extend({}, e, t);
//         return this.each(function () {
//             var e = i(t.id), n = e.find(t.sid);
//             n.on("mouseenter", function () {
//                 i(this).addClass("active").siblings().removeClass("active")
//             })
//         })
//     };
// }(window, jQuery);


// $(function() {
//     $("#cardArea").cardArea();
//
// });


var custom = jeDate("#test11",{
    format: "YYYY-MM-DD",
    multiPane:false,
    range:" to "
}).setValue('"' + getNowFormatDate() + "'" + " to " + '"' + getNowFormatDate() + "'" );

//点击材料时发送数据到后台接口
function chengeHref(id){

    var href = $("#"+id).attr('href');
    var path = $("#path").val();
    var date = $("#test11").val();

    if(href == ''){

        $("#"+id).attr("href",path+"/getEcharsDataByMaterialAndDate.do?date="+ date + "&material="+id);
    }

}


//获取当前日期
function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var strDate = date.getDate() - 1 ;
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = year + seperator1 + month + seperator1 + strDate;
    return currentdate;
}