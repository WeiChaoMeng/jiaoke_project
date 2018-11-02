$(function(){
    basePath  = $("#path").val();
    getMonthStatementToEchars();
});


function getMonthStatementToEchars() {
    $.ajax({
        url:basePath + "/getMonthStatementToEchars.do",
        // url:"http://47.105.114.70/getRealTimeData.do",
        type:"get",
        dataType:"json",
        success:function (res) {
            
        },
        fall: function () {
            layer.alert('获取失败')
        }
    })
}
function getMonthStatementData() {
    $.ajax({
        url:basePath + "/getMonthStatementToData.do",
        // url:"http://47.105.114.70/getRealTimeData.do",
        type:"get",
        dataType:"json",
        success:function (res) {

        },
        fall: function () {
            layer.alert('获取失败')
        }
    })
}