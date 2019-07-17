var basePath  = "";
$(function(){
    basePath  = $("#path").val();
});

function sample_management() {
    layer.open({
        type: 2,
        title: '取样管理',
        shadeClose: true,
        shade: 0.3,
        maxmin: true, //开启最大化最小化按钮
        area: ['85%', '97%'],
        content: basePath + '/getSampleManagementPage.do'
    });
}

function experimental_management() {
    layer.open({
        type: 2,
        title: '实验管理',
        shadeClose: true,
        shade: 0.3,
        maxmin: true, //开启最大化最小化按钮
        area: ['85%', '97%'],
        content: basePath + '/getExperimentalManagement.do'
    });
}

function unfinished_experimental() {
    layer.open({
        type: 2,
        title: '未完实验',
        resize: true,
        scrollbar: false,
        maxmin: true, //开启最大化最小化按钮
        area: ['90%', '93%'],
        content: [basePath + '/getExperimentMessagePage.do','no']
    });
}