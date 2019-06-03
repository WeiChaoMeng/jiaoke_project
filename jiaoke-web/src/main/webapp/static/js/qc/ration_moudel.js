
$("#start").datepicker({
    "language": "zh-CN",
    "format": 'yyyy-mm-dd'
})
$("#end").datepicker({
    "language": "zh-CN",
    "format": 'yyyy-mm-dd'
})
$(".date .iconfont").click(function() {
    $(this).prev().trigger("focus");
});

$('select.select').select();

var path = $("#path").val();
//点击弹出删除按钮
function closeWindow() {
    $('.popup_back,.popup_window_first').hide();
}
$('#btn_click').click(function() {
    $('.popup_window_first,.popup_back').show();
});



//点击弹出 添加 模板
function closefrom() {
    $('#addRatioBrk,#addRatio').hide();
}

$('#from_click').click(function () {
    $('#addRatioBrk,#addRatio').show();
});

//点击 查看 模板
function closeShowRatio() {
    $('#showRatioBrk,#showRatio').hide();
}

//点击 添加 级配图
function closeGrading() {
    $('#showGradingBrk,#showGrading').hide();
}

$('#showBrk').click(function () {
    $('#showGradingBrk,#showGrading').show();
});

//点击编辑关闭
function closeEditRatio() {
    $('#editRatioBrk,#editRatio').hide();
}


//修改方法
function editRatio(ratioId) {
    $.ajax({
        url:path + "/showRatioById.do",
        type: "post",
        data:{
            "idStr" : ratioId
        },
        dataType:"json",
        success:function (res) {

            if (res == null || res == "") {
                layer.msg('获取模板失败');

            }

            for (var k in res){
                $("input[data-value='" +k + "']").val(res[k])
            }

            $('#editRatioBrk,#editRatio').show();
        }
    })
}

//删除方法
function delectRatio() {

    var spCodesTemp = "";
    $('input:checkbox[name=spCodeId]:checked').each(function(i){
        if(0==i){
            spCodesTemp = $(this).val();
        }else{
            spCodesTemp += (","+$(this).val());
        }

    });

    if(spCodesTemp == null || spCodesTemp == ""){
        layer.alert("请选择要删除的级配");
        closeWindow();
    }else {
        $.ajax({
            url: path + "/delectRation.do",
            type: "post",
            data:{
                "idStr" : spCodesTemp
            },
            dataType:"json",
            success:function (res) {
                if(res.messages == "success"){
                    location.reload();
                }else {
                    layer.msg('删除失败');
                    closeWindow()
                }
            }


        })
    }
}

function showRatio( ratioId ) {

    $.ajax({
        url:path + "/showRatioById.do",
        type: "post",
        data:{
            "idStr" : ratioId
        },
        dataType:"json",
        success:function (res) {

            if (res == null || res == "") {
                layer.msg('获取模板失败');

            }

            for (var k in res){
                $("input[data-value='" +k + "']").val(res[k])
            }
        }
    })

    $('#showRatioBrk,#showRatio').show();
}

