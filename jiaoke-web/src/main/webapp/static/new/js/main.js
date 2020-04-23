//添加用户
function addUser(department, currentPage) {
    window.lar = layer.open({
        title: '添加用户',
        type: 1,
        area: ['25%', '55%'],
        shadeClose: true, //点击遮罩关闭
        content: $("#addUser"),
        offset: "20%"
    });

    //记录用户页面选择的页数
    $('#currentPage').val(currentPage);

    //解析部门list
    var dep = '';
    for (var i = 0; i < department.length; i++) {
        dep += '<option value="' + department[i].departmentKey + '">' + department[i].departmentName + '</option>';
    }
    $('#department').html(dep);
}