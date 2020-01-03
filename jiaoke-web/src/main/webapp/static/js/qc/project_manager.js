
$(function () {

    $("#text-adaption").onkeyup = function() {
        this.style.height = 'auto';
        this.style.height = this.scrollHeight + "px";
    }
    // //查询所有级配模板集合
    getUserProjectList();
    // //页面初始化时加载第一次数据
    getDateByPageNum(1);
    // //翻页
    $(".zxf_pagediv").createPage({
        pageNum: Math.ceil(jsonList.length / 15),
        current: 1,
        backfun: function(e) {
            e.pageNum = Math.ceil(jsonList.length / 15);
            getDateByPageNum(e.current);
        }
    });

})

/***************页面开始时查询数据******************/
var jsonList;
function getUserProjectList() {
    var basePath = $("#path").val();
    $.ajax({
        url:basePath + "/getUserProjectList.do",
        type:"get",
        async:false,
        dataType:"json",
        success:function (res) {
            if (res.message === 'success'){
                jsonList = res.projectList;
            } else {
                if (res.message === 'empty'){
                    layer.alert("暂无无客户")
                }else {
                    layer.alert("查询失败")
                }

            }
        }
    })
}

/**
 * 渲染到页面
 * @param currentNum
 */
function getDateByPageNum(currentNum){

    var arrayStart = (currentNum - 1) * 15;
    var arrayEnd = arrayStart + 15;
    $("#userProjectList").empty();
    for (var i = arrayStart; i < arrayEnd; i++ ){
        if (jsonList[i]){
            var htmlStr = "<tr>"
                + "<td class='tdnum'><input name='projectId' type='checkbox' value='" + jsonList[i].id   +"'></td>"
                + "<td>" + jsonList[i].clientNum  + "</td>"
                + "<td>" + jsonList[i].projectName  + "</td>"
                + "<td>" + jsonList[i].constructionUnits  + "</td>"
                + "<td>" + jsonList[i].clientName + "</td>"
                + "<td>" + jsonList[i].update  + "</td>"
                + "<td>" + jsonList[i].upUser  + "</td>"
                + "<td>" + jsonList[i].remaker  + "</td>"
                + "<td>"
                + "<a   href='javascript:;'   name='" + jsonList[i].id  +"' onclick='showUserProject(this.name)' style='color: rgb(114, 112, 209);' >查看</a>"
                + "<a   href='javascript:;'   name='" + jsonList[i].id  +"' onclick='showEditUserProject(this.name)' style='color: rgb(114, 112, 209);padding-left: 10px;' >编辑</a>"
                + "</td>"
                + "</tr>"
            $("#userProjectList").append(htmlStr);
        }else {
            break;
        }



    }
}


/**************点击查看客户工程信息*****************/
function showUserProject(id) {
    var basePath = $("#path").val();

    $.ajax({
        url:basePath + "/getUserProjectById.do",
        type: "post",
        data:{
            "id" :id
        },
        dataType:"json",
        success:function (res) {
            if (res.message === 'success') {
                var mes = res.proMsg;
                for (var p in mes){
                    $("#"+p).val(mes[p]);
                }
                layer.open({
                    type: 1,
                    title: '添加用户',
                    area: ['75%', '85%'],
                    anim: 2,
                    content: $("#showtable"), //iframe的url，no代表不显示滚动条
                });
            }else if (res.message === 'fail'){
                layer.alert("无该用户工程");
            }else {
                layer.alert("系统错误");
            }
        }
    })
}
/**************点击删除客户工程信息*****************/
function delectUserProject(){
    var basePath = $("#path").val();
    var gradingId = "";
    $("input:checkbox[name=projectId]:checked").each(function(i){
        //操作
        if(0==i){
            spCodesTemp = $(this).val();
        }else{
            spCodesTemp += (","+$(this).val());
        }
    });

    if(spCodesTemp == null || spCodesTemp == ""){
        closeWindow()
        layer.alert("请选择删除的配比");
    }else {
        $.ajax({
            url: basePath + "/delectUserProject.do",
            type: "post",
            data:{
                "idStr" : spCodesTemp
            },
            dataType:"json",
            success:function (res) {
                debugger
                if(res.message === "success"){
                    layer.msg('删除成功',{icon:0, shade:0.1},function(){
                        location.reload();
                    });
                }else {
                    layer.msg('删除失败',{icon:0, shade:0.1},function(){
                        closeWindow()
                    });
                }
            }


        })
    }
}
//展示级配模板
function showEditUserProject(id) {
    var basePath = $("#path").val();
    $.ajax({
        url:basePath + "/getUserProjectById.do",
        type: "post",
        data:{
            "id" :id
        },
        dataType:"json",
        success:function (res) {
            if (res.message === 'success') {
                var mes = res.proMsg;
                for (var p in mes){
                    $("#"+p + "_edit").val(mes[p]);
                }
                layer.open({
                    type: 1,
                    title: '添加用户',
                    area: ['75%', '85%'],
                    anim: 2,
                    content: $("#editTable"), //iframe的url，no代表不显示滚动条
                });
            }else if (res.message === 'fail'){
                layer.alert("无该用户工程");
            }else {
                layer.alert("系统错误");
            }
        }
    })
}

function editUserProject() {
    $("#upDate_edit").val(getNowFormatDate());
    $("#upUser_edit").val(getUserName());
    var basePath = $("#path").val();
    $.ajax({
        type: "POST",
        url:basePath + "/editProjectItem.do",
        data:$("#eidt").serialize(),// 序列化表单值
        async: false,
        error: function(request) {
            layer.alert("提交出错 error");
        },
        success: function(data) {
            layer.msg("提交成功!",{icon:0, shade:0.1},function(){
                location.reload();
                layer.closeAll();
            });
        }
    })
}

function uploadProject(){
    var basePath = $("#path").val();
    $.ajax({
        type: "POST",
        url:basePath + "/addProjectItem.do",
        data:$("#upload").serialize(),// 序列化表单值
        async: false,
        error: function(request) {
            layer.alert("提交出错 error");
        },
        success: function(data) {
            layer.msg("提交成功!",{icon:0, shade:0.1},function(){
                location.reload();
                layer.closeAll();
            });
        }
    })
}

$('#addPro').click(function () {
    $("#upDate_upload").val(getNowFormatDate());
    $("#upUser_upload").val(getUserName());
    layer.open({
        type: 1,
        title: '添加用户',
        area: ['75%', '85%'],
        anim: 2,
        content: $("#uptable"), //iframe的url，no代表不显示滚动条
    });
});



String.prototype.isBlanks = function () {
    var s = $.trim(this);
    if (s == "undefined" || s == null || s == "" || s.length == 0) {
        return true;
    }
    return false;
};

function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = year + seperator1 + month + seperator1 + strDate;
    return currentdate;
}

function getUserName(){
    var usrInfo = localStorage.getItem("userInfo");
    usrInfo = JSON.parse(usrInfo);
    return usrInfo.nickname;
}