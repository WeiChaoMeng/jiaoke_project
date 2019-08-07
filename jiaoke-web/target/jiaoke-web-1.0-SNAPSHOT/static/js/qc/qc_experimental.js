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
        content: basePath + '/getExperimentMessagePage.do'
    });
}

function standing_book() {
    layer.open({
        type: 2,
        title: '实验台账',
        resize: true,
        scrollbar: false,
        maxmin: true, //开启最大化最小化按钮
        area: ['90%', '93%'],
        content: basePath + '/getStandingBookPage.do'
    });
}

function experiment_setting() {
    layer.open({
        type: 2,
        title: '试验设置',
        resize: true,
        scrollbar: false,
        maxmin: true, //开启最大化最小化按钮
        area: ['90%', '93%'],
        content: basePath + '/getExperimentSetting.do'
    });
}


function sample_management_foreign() {
    layer.open({
        type: 2,
        title: '取样管理',
        shadeClose: true,
        shade: 0.3,
        maxmin: true, //开启最大化最小化按钮
        area: ['85%', '97%'],
        content: basePath + '/getSampleManagementPageForeign.do'
    });
}

function experimental_management_foreign() {
    layer.open({
        type: 2,
        title: '实验管理',
        shadeClose: true,
        shade: 0.3,
        maxmin: true, //开启最大化最小化按钮
        area: ['85%', '97%'],
        content: basePath + '/getExperimentalManagementForeign.do'
    });
}

function unfinished_experimental_foreign() {
    layer.open({
        type: 2,
        title: '未完实验',
        resize: true,
        scrollbar: false,
        maxmin: true, //开启最大化最小化按钮
        area: ['90%', '93%'],
        content: basePath + '/getExperimentMessagePageForeign.do'
    });
}

function standing_book_foreign() {
    layer.open({
        type: 2,
        title: '实验台账',
        resize: true,
        scrollbar: false,
        maxmin: true, //开启最大化最小化按钮
        area: ['90%', '93%'],
        content: basePath + '/getStandingBookPageForeign.do'
    });
}

function experiment_setting_foreign() {
    layer.open({
        type: 2,
        title: '试验设置',
        resize: true,
        scrollbar: false,
        maxmin: true, //开启最大化最小化按钮
        area: ['90%', '93%'],
        content: basePath + '/getExperimentSettingForeign.do'
    });
}