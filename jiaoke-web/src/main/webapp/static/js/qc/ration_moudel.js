
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
        closeWindow()
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
    var crew2Id = $("#crew2_num").val();
    var crew1Id = $("#crew1_num").val();

    if(crew2Id == "" || crew1Id == ""){
        layer.alert('请添加配比在机组上的编号', {
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
            url:path + "/addGrading.do",
            type: "post",
            data:{
                "jsonData" : JSON.stringify(jsonData),
                "crew1Id":crew1Id,
                "crew2Id":crew2Id
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