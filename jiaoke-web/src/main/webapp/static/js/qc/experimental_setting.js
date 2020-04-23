//18.06.12 by zgy
//需要调用js的效果有：选项卡、无限级下拉菜单

$(document).ready(function(){
    //选项卡tab
    $(".yyui_tab_title , .yyui_tab_title_this ").click(function(){
        $(this).siblings('li').attr('class','yyui_tab_title');
        $(this).attr('class','yyui_tab_title_this');
        //alert($(this).index()); 选项卡序号编号从0开始
        $(this).parent().siblings('div').attr('class','yyui_tab_content');
        $(this).parent().siblings('div').eq($(this).index()).attr('class','yyui_tab_content_this');
    });
    //////////////////////////


    //到底了///////////////////////
});

//用法：
//第一步、运行函数；
//yyui_menu('.yyui_menu1');
//第二步、写css样式；
//<style type="text/css">
//.yyui_menu1 { height:35px; line-height:35px; font-size:15px; background-color:#f2f2f2; }
//.yyui_menu1 li { float:left; position:relative;} /*这一级是导航*/
//.yyui_menu1 li a { display:block; line-height:35px; text-decoration:none; padding:0px 20px; color:#333333;   }
//.yyui_menu1 li a:hover {  background:#EFEFEF; }
//.yyui_menu1 li a.more:after{content:" »";}
//.yyui_menu1 li ul { position:absolute; float:left; width:150px; border:1px solid #D2D2D2; display:none; background-color:#FFFfff; z-index:9999;} /*这是第二级菜单*/
//.yyui_menu1 li ul a { width:110px;text-decoration:none; color:#333333;}
//.yyui_menu1 li ul a:hover { background:#f2f2f2;}
//
//.yyui_menu1 li ul ul{ top:0;left:150px;} /*从第三级菜单开始,所有的子级菜单都相对偏移*/
//</style>
function yyui_menu(ulclass){
    $(document).ready(function(){
        $(ulclass+' li').hover(function(){
            $(this).children("ul").show(); //mouseover
        },function(){
            $(this).children("ul").hide(); //mouseout
        });
    });
}

/*******************************************************************************/
(function () {
    //查询厂家与规格信息
    getSpecificationDataAndManufacturersData();
    //查询材料对应厂家信息
    getMaterialsMatchupManufacturers();
    layui.use('from',function () {
        var from = layui.from;

    })
})(jQuery)

/**
 * 弹出新建规格页面
 */
function getSpecificationPage() {
    layui.use('layer',function () {
        var layer = layui.layer;
        layer.open({
            type: 1,
            skin: '规格添加', //加上边框
            area: ['700px', '500px'], //宽高
            shadeClose: true, //开启遮罩关闭
            content: $("#specificationFrom")
        });
    })

}
function getManufacturersPage() {
    layui.use('layer',function () {
        var layer = layui.layer;
        layer.open({
            type: 1,
            skin: '规格添加', //加上边框
            area: ['700px', '500px'], //宽高
            shadeClose: true, //开启遮罩关闭
            content: $("#manufacturersFrom")
        });
    })

}
/**
 * 首页加载时查询规格或厂家
 */
function getSpecificationDataAndManufacturersData() {
    var basePath = $("#path").val();
    $.ajax({
        type:"get",
        url:basePath + "/getSpecificationDataAndManufacturersData.do",
        dataType:"json",
        async: false,
        success:function (res) {
            if (res.length === 0){
                layui.use('layer',function () {
                    var layer = layui.layer;
                    layer.alert("当前并无材料规格与材料厂家信息");
                })

            } else {
                var specificationHtml= '';
                var manufacturersHtml= '';
                for (var i = 0 ; i < res.length; i++) {
                    if (res[i].marks === 'specification'){
                        specificationHtml += '<li>'
                        +'<span class="experiment_from_span">' + res[i].name + '</span>'
                        +'<div>'
                            +'<a href="javascript:void(0)" onclick="deleteSpecificationOrManufacturersById('+ res[i].Id +',\''+res[i].marks+'\');">删除</a>'
                            +'<a href="javascript:void(0)" onclick="updateSpecificationOrManufacturersById('+ res[i].Id +',\''+res[i].marks+'\');">修改</a>'
                            +'</div>'
                        + '</li>'
                    }else {
                        manufacturersHtml += '<li>'
                            +'<span class="experiment_from_span">' + res[i].name + '</span>'
                            +'<div>'
                            +'<a href="javascript:void(0)" onclick="deleteSpecificationOrManufacturersById('+ res[i].Id +',\''+res[i].marks+'\');">删除</a>'
                            +'<a href="javascript:void(0)" onclick="updateSpecificationOrManufacturersById('+ res[i].Id +',\''+res[i].marks+'\');">修改</a>'
                            +'</div>'
                            + '</li>'
                    }
                }

                $("#specificationUl").empty().append(specificationHtml);
                $("#manufacturersUl").empty().append(manufacturersHtml);
            }
        }
    });
}

/**
 * 首页加载时查询材料对应厂家
 */
function getMaterialsMatchupManufacturers() {
    var basePath = $("#path").val();
    $.ajax({
        type:"get",
        url:basePath + "/getMaterialsMatchupManufacturers.do",
        dataType:"json",
        success:function (res) {
            if (res.length === 0){
                layui.use('layer',function () {
                    var layer = layui.layer;
                    layer.alert("当前无材料对应厂家信息");
                });
            } else {
                var manufacturersHtml= '';
                for (var i = 0 ; i < res.length; i++) {
                        manufacturersHtml += '<li>'
                            +'<span class="experiment_from_span">' + res[i].materialName + "               " + res[i].manufacturersName + '</span>'
                            +'<div>'
                            +'<a href="javascript:void(0)" style="margin-left: 30px;" onclick="deleteMaterialAndManufacturersById('+ res[i].Id +');">删除</a>'
                            +'</div>'
                            + '</li>';

                }
                $("#materialsUl").empty().append(manufacturersHtml);
            }
        }
    });
}

/**
 * 根据Id删除材料对应厂家
 */
function deleteMaterialAndManufacturersById(id) {

    var basePath = $("#path").val();
    $.ajax({
        type:"POST",
        url:basePath + "/deleteMaterialAndManufacturersById.do",
        data:{
            "id":id
        },
        dataType:"json",
        success:function (res) {
            if (res.message === "success"){
                layui.use('layer',function () {
                    var layer = layui.layer;
                    getMaterialsMatchupManufacturers();
                    layer.alert("删除成功");
                })
            } else {
                layui.use('layer',function () {
                    var layer = layui.layer;
                    layer.alert("删除失败");
                })
            }
        }
    });
}
/**
 * 展示添加材料对应厂家信息页面
 */
function getMaterialsPage() {
    var basePath = $("#path").val();
    $.ajax({
        type:"get",
        url:basePath + "/getMaterialsAndManufacturersMsg.do",
        dataType:"json",
        async: false,
        success:function (res) {
            if (res.length === 0){
                layui.use('layer',function(){
                    var layer = layui.layer;
                    layer.alert("当前无材料或厂家信息");
                });
            }else {
                $("#materialsSelect").empty();
                $("#checkDiv").empty();
                var materialsArry = JSON.parse(res.materials);
                var manufacturersArry = JSON.parse(res.manufacturers);

                for (var i = 0; i < materialsArry.length;i++){
                    $("#materialsSelect").append('<option value="' + materialsArry[i].Id + '">' + materialsArry[i].name + '</option>')
                }
                for (var i = 0; i < manufacturersArry.length;i++){
                    $("#checkDiv").append('<input type="checkbox" name="check_'+ i +'" value="'+ manufacturersArry[i].Id +'" title="' + manufacturersArry[i].name + '">')
                }
                layui.use('form', function(){
                    var form = layui.form;//高版本建议把括号去掉，有的低版本，需要加()
                    // form.render('select', 'sele');
                    // form.render('checkbox', 'check');
                    form.render();
                });
            }
        }
    });

    layui.use('layer',function () {
        var layer = layui.layer;
        layer.open({
            type: 1,
            skin: '材料厂家', //加上边框
            area: ['700px', '500px'], //宽高
            shadeClose: true, //开启遮罩关闭
            content: $("#materialsFrom")
        });
    })

}
// function  sendMaterialsFrom(){
//     //Materials当前材料值
//
// }
layui.use('form', function() {
    var basePath = $("#path").val();
    var form = layui.form;//高版本建议把括号去掉，有的低版本，需要加()
    form.on('submit(subFrom)', function(data){
        $.ajax({
            type:"POST",
            url:basePath + "/addMaterialsAndManufacturers.do",
            dataType:"json",
            data:{
               'fromData': JSON.stringify(data.field)
            },
            async: false,
            success:function (res) {
                layui.use('layer',function(){
                    var layer = layui.layer;
                    if (res.message === 'error'){
                            layer.alert("当前无材料或厂家信息");
                    } else {
                        layer.closeAll();
                        getMaterialsMatchupManufacturers();
                        layer.alert("添加完成");
                    }
                });
            }
        });
        // console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
        // console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
        // console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
        return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
    });
})
/**
 * 删除方法
 */
function deleteSpecificationOrManufacturersById(id,make) {
    var basePath = $("#path").val();
    layui.use('layer',function () {
        var layer = layui.layer;
        layer.confirm('确认删除？', {
            btn: ['确认','取消'] //按钮
        }, function(){
            $.ajax({
                type:"POST",
                url:basePath + "/deleteSpecificationOrManufacturersById.do",
                dataType:"json",
                data:{
                    'id':id,
                    'make':make
                },
                async: false,
                success:function (res) {
                    if (res.message === 'success'){
                        layer.msg('删除成功');
                        getSpecificationDataAndManufacturersData();
                    } else {
                        layer.msg('删除失败');
                    }
                }
            })

        }, function(){

        });
    })
}


/**
 * 修改方法-回显
 */
function updateSpecificationOrManufacturersById(id,make) {
    var basePath = $("#path").val();
    $.ajax({
        type:"POST",
        url:basePath + "/getSpecificationOrManufacturersById.do",
        dataType:"json",
        data:{
            'id':id,
            'make':make
        },
        success:function (res) {
            if (res.marks){
                $("#id").val(res.Id);
                $("#tableName").val(res.marks);
                $("#newName").val(res.name);
            }else {
                layui.use('layer',function () {
                    var layer = layui.layer;
                    layer.msg('查询相关信息失败');
                })

            }
        }
    })

    layui.use('layer',function () {
        var layer = layui.layer;
        layer.open({
            type: 1,
            skin: '规格添加', //加上边框
            area: ['700px', '500px'], //宽高
            shadeClose: true, //开启遮罩关闭
            content: $("#updateFrom")
        });
    })

}

/**
 * 修改方法-上传
 */

function updateSpecificationOrManufacturers(){
    var id = $("#id").val();
    var make = $("#tableName").val();
    var updateName = $("#newName").val();
    var basePath = $("#path").val();
    if (updateName.isBlank()){
        layui.use('layer',function () {
            var layer = layui.layer;
            layer.msg("请填写更新数据");
        })

    }else {
        $.ajax({
            type:"POST",
            url:basePath + "/updateSpecificationOrManufacturersById.do",
            dataType:"json",
            data:{
                'id':id,
                'make':make,
                'updateName':updateName
            },
            success:function (res) {
                if (res.message === 'success'){
                    layui.use('layer',function () {
                        var layer = layui.layer;
                        layer.close(layer.index);
                        layer.msg('修改成功');
                    })

                    getSpecificationDataAndManufacturersData();
                }else {
                    layui.use('layer',function () {
                        var layer = layui.layer;
                        layer.msg('修改失败');
                    })

                }
            }
        })
    }
}


/**
 * 规格新建方法
 */
function sendSpecificationFrom() {

    var basePath = $("#path").val();
    var specificationName =  $('#specificationInput').val();
    if (specificationName.isBlank()){
        layui.use('layer',function () {
            var layer = layui.layer;
            layer.msg("请填写规格");
        })

    }else {
        $.ajax({
            type:"POST",
            url:basePath + "/sendSpecificationFrom.do",
            dataType:"json",
            data:{
                'specificationName':specificationName
            },
            success:function (res) {
                if (res.message === 'success'){
                    layui.use('layer',function () {
                        var layer = layui.layer;
                        layer.close(layer.index);
                        layer.msg("添加成功");
                    })
                    getSpecificationDataAndManufacturersData();
                }else {
                    layui.use('layer',function () {
                        var layer = layui.layer;
                        layer.msg("添加失败");
                    })

                }
            }
        })
    }
}
/**
 * 厂家新建方法
 */
function sendManufacturersFrom(){
    var basePath = $("#path").val();
    var manufacturersName =  $('#manufacturersInput').val();
    if (manufacturersName.isBlank()){
        layui.use('layer',function () {
            var layer = layui.layer;
            layer.msg("请填写厂家名称");
        })

    }else {
        $.ajax({
            type:"POST",
            url:basePath + "/sendManufacturersFrom.do",
            dataType:"json",
            data:{
                'manufacturersName':manufacturersName
            },
            success:function (res) {
                if (res.message === 'success'){
                    layui.use('layer',function () {
                        var layer = layui.layer;
                        layer.close(layer.index);
                        layer.msg("添加成功");
                    })

                    getSpecificationDataAndManufacturersData();
                }else {
                    layui.use('layer',function () {
                        var layer = layui.layer;
                        layer.msg("添加失败");
                    })

                }
            }
        })
    }
}

String.prototype.isBlank = function () {
    var s = $.trim(this);
    if (s == "undefined" || s == null || s == "" || s.length == 0) {
        return true;
    }
    return false;
};