
$(function () {
    //查询所有级配模板集合
    getGradingList();
    //页面初始化时加载第一次数据
    getDateByPageNum(1);
    //翻页
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
function getGradingList() {
    var basePath = $("#path").val();
    $.ajax({
        url:basePath + "/getGradingList.do",
        type:"get",
        async:false,
        dataType:"json",
        success:function (res) {
            jsonList = res;
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
    $("#gradingList").empty();
    for (var i = arrayStart; i < arrayEnd; i++ ){
        var htmlStr = "<tr>"
            + "<td class='tdnum'><input name='spCodeId' type='checkbox' value='" + jsonList[i].id   +"'></td>"
            + "<td>" + jsonList[i].id  + "</td>"
            + "<td>" + jsonList[i].grading_name + "</td>"
            + "<td>" + jsonList[i].create_time  + "</td>"
            + "<td>" + jsonList[i].grading_remaker  + "</td>"
            + "<td>" + jsonList[i].up_user  + "</td>"
            + "<td>"
            + "<a   href='javascript:;'   name='" + jsonList[i].id  +"' onclick='showGrading(this.name)' style='color: rgb(114, 112, 209);' >查看</a>"
            + "<a   href='javascript:;'   name='" + jsonList[i].id  +"' onclick='showEditGrading(this.name)' style='color: rgb(114, 112, 209);padding-left: 10px;' >编辑</a>"
            + "</td>"
            + "</tr>"

        $("#gradingList").append(htmlStr);
    }
}


/**************点击查看级配信息*****************/
function showGrading(id) {
    var basePath = $("#path").val();
    $("#message").empty();
    $.ajax({
        url:basePath + "/getGrading.do",
        type: "post",
        data:{
            "id" :id
        },
        dataType:"json",
        success:function (res) {

            for (var i = 0 ; i < res.length;i++){
                $('input[name=crew1_num]').val(res[i].crew1_id);
                $('input[name=crew2_num]').val(res[i].crew2_id);
                $('input[name=grading_name]').val(res[i].grading_name);
                $('input[name=up_user]').val(res[i].up_user);
                $('input[name=grading_remaker]').val(res[i].grading_remaker);

                var htmlStr ="<tr class='even'>"
                    +"<td>" + res[i].sieve_diameter_grading + "</td>"
                    +"<td>" + res[i].repertory_six_grading + "</td>"
                    +" <td>" + res[i].repertory_five_grading + "</td>"
                    +"<td>" + res[i].repertory_four_grading + "</td>"
                    +"<td>" + res[i].repertory_three_grading + "</td>"
                    +"<td>" + res[i].repertory_two_grading + "</td>"
                    +"<td>" + res[i].repertory_one_grading + "</td>"
                    +"<td>" + res[i].breeze_grading + "</td>"
                    +"<td>" + res[i].rough_regenerate_grading + "</td>"
                    +"<td>" + res[i].thin_regenerate_grading + "</td>"
                    +"<td>" + res[i].additive_grading + "</td>"
                    +"<td>" + res[i].synthesis_grading + "</td>"
                    +"<td>" + res[i].mid_value + "</td>"
                    +"<td>" + res[i].up_value + "</td>"
                    +"<td>" + res[i].down_value + "</td>"
                    +"</tr>";

                $("#message").append(htmlStr);
            }

            $('#GradingBrk,#Grading').show();
        }
    })
}
/**************点击删除级配信息*****************/
function delectGrading(){
    var basePath = $("#path").val();
    var gradingId = "";
    $("input:checkbox[name=spCodeId]:checked").each(function(i){
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
            url: basePath + "/delectGrading.do",
            type: "post",
            data:{
                "idStr" : spCodesTemp
            },
            dataType:"json",
            success:function (res) {
                if(res.messages == "success"){
                    location.reload();
                    layer.msg('删除成功');
                }else {
                    layer.msg('删除失败');
                    closeWindow()
                }
            }


        })
    }
}
//修改级配模板
function showEditGrading(id) {
    var basePath = $("#path").val();
    $("#editMessage").empty();
    $.ajax({
        url:basePath + "/getGrading.do",
        type: "post",
        data:{
            "id" :id
        },
        dataType:"json",
        success:function (res) {

            for (var i = 0 ; i < res.length;i++){
                $('input[name=crew1_edit_num]').val(res[i].crew1_id);
                $('input[name=crew2_edit_num]').val(res[i].crew2_id);
                $('input[name=grading_edit_name]').val(res[i].grading_name);
                $('input[name=grading_edit_remaker]').val(res[i].grading_remaker);
                $('input[name=id]').val(res[i].id);

                var htmlStr ="<tr class='even'>"
                    +"<td>" + res[i].sieve_diameter_grading + "</td>"
                    +"<td><input type='number'  name='repertory_six_grading' class='my_grading_edit_input'  value='" + res[i].repertory_six_grading + "' ></td>"
                    +" <td><input type='number'  name='repertory_five_grading' class='my_grading_edit_input'  value='" + res[i].repertory_five_grading + "' ></td>"
                    +"<td><input type='number'  name='repertory_four_grading' class='my_grading_edit_input'  value='" + res[i].repertory_four_grading + "' ></td>"
                    +"<td><input type='number'  name='repertory_three_grading' class='my_grading_edit_input'  value='" + res[i].repertory_three_grading + "' ></td>"
                    +"<td><input type='number'  name='repertory_two_grading' class='my_grading_edit_input'  value='" + res[i].repertory_two_grading + "' ></td>"
                    +"<td><input type='number'  name='repertory_one_grading' class='my_grading_edit_input'  value='" + res[i].repertory_one_grading + "' ></td>"
                    +"<td><input type='number'  name='breeze_grading' class='my_grading_edit_input'  value='" + res[i].breeze_grading + "' ></td>"
                    +"<td><input type='number'  name='rough_regenerate_grading' class='my_grading_edit_input'  value='" + res[i].rough_regenerate_grading + "' ></td>"
                    +"<td><input type='number'  name='thin_regenerate_grading' class='my_grading_edit_input'  value='" + res[i].thin_regenerate_grading + "' ></td>"
                    +"<td><input type='number'  name='additive_grading' class='my_grading_edit_input'  value='" + res[i].additive_grading + "' ></td>"
                    +"<td><input type='number'  name='synthesis_grading' class='my_grading_edit_input'  value='" + res[i].synthesis_grading + "' ></td>"
                    +"<td><input type='number'  name='mid_value' class='my_grading_edit_input'  value='" + res[i].mid_value + "' ></td>"
                    +"<td><input type='number'  name='up_value' class='my_grading_edit_input'  value='" + res[i].up_value + "' ></td>"
                    +"<td><input type='number'  name='down_value' class='my_grading_edit_input'  value='" + res[i].down_value + "' ></td>"
                    +"</tr>";

                $("#editMessage").append(htmlStr);
            }

            $('#editGradingBrk,#editGrading').show();
        }
    })
}
//点击 添加 级配图
function closeGrading() {
    $('#showGradingBrk,#showGrading').hide();
}

$('#showBrk').click(function () {
    $('#showGradingBrk,#showGrading').show();
});

//关闭展示
function closeEditGrading() {
    $('#editGradingBrk,#editGrading').hide();
}
//点击弹出删除按钮
function closeWindow() {
    $('.popup_back,.popup_window_first').hide();
}
$('#btn_click').click(function() {
    $('.popup_window_first,.popup_back').show();
});

function closeGradingModel() {
    $('#GradingBrk,#Grading').hide();
}

/***********************  及配图相关逻辑 ********************************/
var jsonData;
$('#excel-file').change(function (e) {
    var files = e.target.files;
    var nameBooler = e.currentTarget.files[0].name.split(".").reverse()[0] == 'xlsx';
    if (nameBooler) {
        var fileReader = new FileReader();
        fileReader.onload = function (ev) {

            try {
                var data = ev.target.result,
                    workbook = XLSX.read(data, {
                        type: 'binary'
                    }), // 以二进制流方式读取得到整份excel表格对象
                    persons = []; // 存储获取到的数据
            } catch (e) {
                layer.msg('文件类型不正确', {
                    time: 5000//20s后自动关闭
                });
                return;
            }

            // 表格的表格范围，可用于判断表头是否数量是否正确
            var fromTo = '';
            // 遍历每张表读取
            for (var sheet in workbook.Sheets) {
                if (workbook.Sheets.hasOwnProperty(sheet)) {
                    fromTo = workbook.Sheets[sheet]['!ref'];
                    console.log(fromTo);
                    persons = persons.concat(XLSX.utils.sheet_to_json(workbook.Sheets[sheet]));
                    break; // 如果只取第一张表，就取消注释这行
                }
            }

            readWorkbook(workbook);

            if(getCharts(workbook,0) != 'A'  || getCharts(workbook,3) != 'O' ){
                layer.alert('Excell格式不对', {
                    skin: 'layui-layer-lan'
                    ,closeBtn: 0
                    ,anim: 4 //动画类型
                });
                return ;
            }
            if(isAllJsonData(getjsonList(workbook))){
                layer.alert('Excell中存在空值', {
                    skin: 'layui-layer-lan'
                    ,closeBtn: 0
                    ,anim: 4 //动画类型
                });
                return ;
            }else {
                jsonData =  getjsonList(workbook);
            }

        };
        // 以二进制方式打开文件
        fileReader.readAsBinaryString(files[0]);


    } else {
        layer.msg('请放入Excel文件');
    }

});



function readWorkbook(workbook) {
    var sheetNames = workbook.SheetNames; // 工作表名称集合
    var worksheet = workbook.Sheets[sheetNames[0]]; // 这里我们只读取第一张sheet
    var csv = XLSX.utils.sheet_to_csv(worksheet);
    var json = XLSX.utils.sheet_to_json(worksheet);
    document.getElementById('result').innerHTML = csv2table(csv);
}

// 将csv转换成表格
function csv2table(csv) {
    var html = '<table class="simpletable">';
    var rows = csv.split('\n');
    rows.pop(); // 最后一行没用的
    rows.forEach(function (row, idx) {
        var columns = row.split(',');
        columns.unshift(idx + 1); // 添加行索引

        html += '<tr class="even">';
        columns.forEach(function (column) {
            html += '<td>' + column + '</td>';
        });
        html += '</tr>';
    });
    html += '</table>';
    return html;
}
//Csv转json
function table2csv(table) {
    var csv = [];
    $(table).find('tr').each(function () {
        var temp = [];
        $(this).find('td').each(function () {
            temp.push($(this).html());
        })
        temp.shift(); // 移除第一个
        csv.push(temp.join(','));
    });
    csv.shift();
    return csv.join('\n');
}

//判断表头个数
function getCharts(workbook, i) {
    var sheetNames = workbook.SheetNames; // 工作表名称集合
    var worksheet = workbook.Sheets[sheetNames[0]]; // 这里我们只读取第一张sheet
    var temStr = worksheet['!ref'];
    return temStr[i];
}
//返回excell
function getjsonList(workbook){
    var sheetNames = workbook.SheetNames; // 工作表名称集合
    var worksheet = workbook.Sheets[sheetNames[0]]; // 这里我们只读取第一张sheet
    var json = XLSX.utils.sheet_to_json(worksheet);
    return json;
}
//判断json中是否存在空对象
function isAllJsonData(jsonStr) {

    var resBoole = false;
    for (var i = 0; i < jsonStr.length;i++) {
        var array = [];
        for (var i in jsonStr[i]) {
            array.push(i);
        }
        if(array.length != 15){
            resBoole = true;
            break;
        }
    }

    return resBoole;
}
//发送数据到后台
function sendGrading(){
    var basePath = $("#path").val();
    var crew2Id = $("#crew2_num").val();
    var crew1Id = $("#crew1_num").val();
    var gradingName = $("#grading_name").val();
    var upUser = $("#up_user").val();
    var gradingRemaker = $("#grading_remaker").val();

    if(crew2Id.isBlanks() || crew1Id.isBlanks() ){
        layer.alert('请添加级配在机组上的编号', {
            skin: 'layui-layer-lan'
            ,closeBtn: 0
            ,anim: 4 //动画类型
        });
        return
    }
    if(gradingName.isBlanks() || upUser.isBlanks() || gradingRemaker.isBlanks()){
        layer.alert('请添加级配相关信息', {
            skin: 'layui-layer-lan'
            ,closeBtn: 0
            ,anim: 4 //动画类型
        });
        return
    }

    if($.isEmptyObject(jsonData)){
        layer.msg('上传错误', {
            time: 5000
        });
    }else{
        $.ajax({
            url:basePath + "/addGrading.do",
            type: "post",
            data:{
                "jsonData" : JSON.stringify(jsonData),
                "crew1Id":crew1Id,
                "crew2Id":crew2Id,
                "gradingName":gradingName,
                "upUser":upUser,
                "gradingRemaker":gradingRemaker
            },
            dataType:"json",
            success:function (res) {

                if (res.messages == 'success' ){
                    layer.alert('添加成功', {
                        skin: 'layui-layer-lan'
                        ,closeBtn: 0
                        ,anim: 4 //动画类型
                    });
                }else if (res.messages == 'error'){
                    layer.alert('添加失败', {
                        skin: 'layui-layer-lan'
                        ,closeBtn: 0
                        ,anim: 4 //动画类型
                    });
                }
                closeGrading();
            }
        })
    }


}
String.prototype.isBlanks = function () {
    var s = $.trim(this);
    if (s == "undefined" || s == null || s == "" || s.length == 0) {
        return true;
    }
    return false;
};