//选择颜色改变
$('#div>ul>li').on('click', function () {
    $('#div>ul>li').removeClass();
    $(this).addClass("current");
});

//处理细节
$('#processing_detail').on('click',function () {
   document.getElementById('iframe').src = 'processing_detail.jsp';
});

//流程日志
$('#process_log').on('click',function () {
   document.getElementById('iframe').src = 'process_log.jsp';
});

//分析图表
$('#nalysis_chart').on('click',function () {
   document.getElementById('iframe').src = 'analysis_diagram.jsp';
});

//隔行换色
$('.simpletable tbody tr:even').addClass('even');




