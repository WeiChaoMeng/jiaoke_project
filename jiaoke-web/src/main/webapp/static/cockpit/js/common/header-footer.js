/**
 * Created by chenbiao on 2017/7/4.
 */

//*****公共头部样式*****
(function () {
    //当前登录用户
    var nickname = $('#nickname').val();
    var headHtlm=
        '<div class="head-line"></div>'+
        '<div class="headbg">'+
        '<div class="headtit"></div>'+
        '</div>'+
        '<div class="head-line">'+
        // '<div class="floatr">'+
        // '<div id="head-time" class="headright-time"></div>'+
        // '<div id="head-date" class="headright-date"></div>'+
        // '<div style="margin-top: 20px;">'+
        // '<div class="return-but-tc"><a href="/logout" style="display: block;width: 100%;height: 100%"></a></div>'+
        // '<div class="return-but-yh"><span style="margin-left: 23px;color: #028dff;">'+nickname+'</span></div>'+
        // '</div>'+
        '</div>';
    $("#model-top").html(headHtlm);

//*****公共底部样式*****
    var footerHtlm=' <div class="foot-line">'+
        '<div class="foot-logo"></div>'+
        '</div>'+
        '<div class="foot-menu">'+
        '<div class="menu-arrow arrowleft"></div>'+
        '<ul class="menu-bar" id="menu-bar">'+
        '<li class="common-menu"><a href="index.jsp"><span class="mli">主页</span></a></li>'+
        '<li class="common-menu"><a href="/qualityCockpitPage.do"><span class="">质量管控</span></a></li>'+
        '<li class="common-menu"><a href="/experimentCockpitPage.do"><span class="">实验管理</span></a></li>'+
        // '<li class="common-menu"><a href="ssglIndex.html"><span class="">设施管理</span></a></li>'+
        // '<li class="common-menu"><a href="http://console.rnting.com/datacentercf/"><span class="">智慧停车</span></a></li>'+
        '</ul>'+
        '<div class="menu-arrow arrowright"></div>'+
        '</div>'+
        '<div class="foot-line">' +
        '<div class="floatr" style="margin-top: 0;">' +
        '<div id="head-time" class="headright-time"></div>' +
        '<div id="head-date" class="headright-date"></div>' +
        '</div></div>'
    $("#model-foot").html(footerHtlm);


})();
//设施总量、巡查维修、设施管理、智慧停车
/*获取并显示当前日期时间和星期*/
function showTime(){
    var show_day=new Array('星期日','星期一','星期二','星期三','星期四','星期五','星期六');
    var time=new Date();
    var year=time.getFullYear();
    var month=time.getMonth()+1;
    var date=time.getDate();
    var day=time.getDay();
    var hour=time.getHours();
    var minutes=time.getMinutes();
    var second=time.getSeconds();
    /*  month<10?month='0'+month:month;  */
    hour<10?hour='0'+hour:hour;
    minutes<10?minutes='0'+minutes:minutes;
    second<10?second='0'+second:second;
    var now_date=year+'年'+month+'月'+date+'日'+' '+show_day[day];
    var new_time= hour+":"+minutes+":"+second+"";
    document.getElementById("head-time").innerHTML=new_time;
    document.getElementById('head-date').innerHTML=now_date;
    //时时更新
    setTimeout("showTime();",1000);
}
showTime();

$('#titleNode').on('click',function () {
    var path = $('#path').val();
    window.location.href = path + "/homePage.do";

});