
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

    layer.open({
        type: 1,
        skin: '添加配比', //加上边框
        area: ['90%', '90%'], //宽高
        content: $('#addRatio')
    })
});

//点击 查看 模板
function closeShowRatio() {
    $('#showRatioBrk,#showRatio').hide();
    $('#showGradingBrk,#showGrading').attr("z-index","999")
}

//点击 添加 级配图
function closeGrading() {
    $('#showGradingBrk,#showGrading').hide();
    // $('#showGradingBrk,#showGrading').attr("z-index","999")
}

$('#showBrk').click(function () {
    $('#showGradingBrk,#showGrading').show();
});

//点击编辑关闭
function closeEditRatio() {
    $('#editRatioBrk,#editRatio').hide();
}

function showOldRaio() {

    $.ajax({
        url:path + "/getOldRation.do",
        type: "get",
        async:false,
        dataType:"json",
        success:function (res) {

            if (res.message === 'error' || res === null){
                layer.msg("无往年配比")
                return
            }

            //取出年份数组与全部配比数组
            var years = JSON.parse(res.rationYear);
            var rationArr =  JSON.parse(res.rationList);

            for(var i = 0;i < years.length;i++){

                var tem = '<a class="matching_p" href="javascript:;" name="'+ years[i]["year"] +'" onclick="showRationDiv(this.name)"><i class="toolico iconfont"></i>' + years[i]["year"] + '年配比通知单</a>'
                            + '<div class="tablebox" id="' + years[i]["year"]  + '_div" style="display: none">'
                            + '<table>'
                            + '<thead>'
                            + '<th class="num"></th>'
                            + '<th>一号机组编号</th>'
                            + '<th>二号机组编号</th>'
                            + '<th>模板名称</th>'
                            + '<th>上传时间</th>'
                            + '<th>备注信息</th>'
                            + '<th>上传人</th>'
                            + '<th>操作</th>'
                            + '</thead>'
                            + '<tbody id="' +years[i]["year"] + '_body">'
                            + '</tbody>'
                            + '</table>'
                            + '</div>';

                $("#showOldRation").append(tem);
            }

            var year;
            var temH;
            for (var j = 0; j < rationArr.length;j++){

                year = rationArr[j]['createTime'].split("-")[0];

                temH = '<tr>'
                    + '<td class="tdnum"></td>'
                    + '<td>' + rationArr[j].crew1Id + '</td>'
                    + '<td>' + rationArr[j].crew2Id + '</td>'
                    +'<td>' + rationArr[j].modelName + '</td>'
                    +'<td>' + rationArr[j].createTime + '</td>'
                    +'<td>' + rationArr[j].remaker + '</td>'
                    +'<td>' + rationArr[j].createUser + '</td>'
                    +'<td>'
                    +'<a  href="javascript:;"   name="'+ rationArr[j].messageId + '" onclick="showRatio(this.name)" class="selected"  id=""><i class="toolico iconfont">&#xe649;</i>查看</a>'
                    +'</td>'
                    +'</tr>';

                $("#" + year +"_body").append(temH)
            }
        }
    });

    layui.use('layer', function(){
        var layer = layui.layer;
        layer.open({
            type: 1,
            skin: '历史配比', //加上边框
            area: ['90%', '90%'], //宽高
            content: $("#showOldRation")
        });
    });

}

function showRationDiv(id) {
    var jqeryId = "#" + id + "_div";
    if ($(jqeryId).is(":hidden") ){
        $(jqeryId).attr("style","display:block");
    }else {
        $(jqeryId).attr("style","display:none");
    }
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
debugger
            if (res == null || res == "") {
                layer.msg('获取模板失败');

            }

            for (var k in res){
                $("input[data-value='" +k + "']").val(res[k])
            }
            layer.open({
                type: 1,
                skin: '编辑信息', //加上边框
                area: ['90%', '90%'], //宽高
                content: $('#editRatio')
            })

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

    layer.open({
        type: 1,
        skin: '详细信息', //加上边框
        area: ['90%', '90%'], //宽高
        content: $('#showRatio')
    })
}

