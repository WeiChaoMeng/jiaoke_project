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
        '<div style="margin-top: 20px;">'+
        '<div class="return-but-tc"><a href="/logout" style="display: block;width: 100%;height: 100%"></a></div>'+
        '<div class="return-but-yh"><span style="margin-left: 23px;color: #028dff;">'+nickname+'</span></div>'+
        '</div>'+
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
