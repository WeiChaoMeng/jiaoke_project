//18.06.12 by zgy
//需要调用js的效果有：选项卡、无限级下拉菜单
var basePath  = "";
$(function () {
    basePath  = $("#path").val();
    //查询取样单
    var res = getAllexperimental();
    //编写总数
    getExperimentalCount(res);
    $(".zxf_pagediv").createPage({
        pageNum: Math.ceil(res.length / 10),
        current: 1,
        backfun: function(e) {
            e.pageNum = Math.ceil(res.length / 10);
            echaExperimental(e.current,res);
        }
    });

});



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


/***********************委托单列表start*****************************/
function getAllexperimental() {
	var res ;
    $.ajax({
        type: "GET",
        url: basePath + "/getAllexperimental.do",
        async: false,
        dataType:'json',
        success: function(msg){
            echaExperimental(1,msg);
            res = msg;
        }
    })
	return res;
}



function echaExperimental(currentNum,amplingArray) {
    var arrayStart = (currentNum - 1) * 10;
    var arrayEnd = arrayStart + 10;
    $("#experimentalData").empty();
    for (var i = arrayStart; i < arrayEnd; i++ ){

        var tem =amplingArray[i];
        if (typeof(tem) === "undefined"){
            break;
        }
        var htmlStr = "<tr>"
            + "<td>" + amplingArray[i]["order_ticket_num"] + "</td>"
            + "<td>" + amplingArray[i]["sampling_id"]  + "</td>"
            + "<td>" + amplingArray[i].creat_time  + "</td>"
            + "<td>" + amplingArray[i].manufacturers  + "</td>"
            + "<td>" + amplingArray[i].specification  + "</td>"
            + "<td>" + amplingArray[i].tunnage  + "</td>"
            + "<td>" + (amplingArray[i].status === 1? '已完成':'未完成')  + "</td>"
            + "<td>"
            + "<a href='javascript:;' onclick='getExperimentalById(\""+amplingArray[i].Id +"\")' style='color: rgb(114, 112, 209);padding: 10px;'>查看</a>"
            + "<a href='javascript:;' onclick='getExperimentalItemById(\""+amplingArray[i].Id +"\" ,  \""+amplingArray[i].order_ticket_num +"\")' style='color: rgb(114, 112, 209);'>添加试验</a>"
             + "</td>"
            + "</tr>";
        $("#experimentalData").append(htmlStr);
    }


}

//未完成总数计算
function getExperimentalCount(amplingArray) {

    //未完成总数计算
    var count = 0;
    for (var i = 0;i < amplingArray.length;i++){
        count = amplingArray[i].status === 1? count:++count;
    }
    if (count < 99){
        $("#experimentalCount").empty();
        $("#experimentalCount").text(count);
    }
}

//查看相关委托单
function getExperimentalById(id) {

        $.ajax({
            type: "POST",
            url: basePath + "/getExperimentalMessageById.do",
			data:{"id":id},
            dataType:'json',
            success: function(msg){
                //循环委托单基本信息
                for (var p in msg){
                    $("#" + p).val(msg[p]);
                }
                //查询委托单已选试验信息
                getExperimentalItem(msg.order_ticket_num);

                //弹出层
                layer.open({
                    type: 1,
                    title: false,
                    closeBtn: 1, //不显示关闭按钮
                    anim: 2,
                    area: ['45%', '100%'],
                    content: $("#layer_out")
                });
            }
        })

}

//查询委托单下的项目
function getExperimentalItem(order_num) {
    $.ajax({
        type: "POST",
        url: basePath + "/getExperimentalItemByOrderNum.do",
        data:{"orderNum":order_num},
        dataType:'json',
        async: false,
        success:function (msg) {

            $("#experimentalItem").find('div').remove();

            if ( msg === "undefined" || msg === null || msg === ""|| msg.length == 0){

            }else {
                for (var i = 0; i < msg.length; i++){
                    var htmlStr = '<div style="width: 100%;padding: 10px 25%;"><input type="checkbox"  checked="checked"  style="-webkit-appearance:checkbox;"  disabled="true" /><span>' + msg[i].name + '</span></div>';
                    $("#experimentalItem").append(htmlStr);
                }
            }

        }
    })
}

//点击确认完成按钮时相关逻辑
function confirm_completed(id) {
    $.ajax({
        type: "POST",
        url: basePath + "/confirmCompletedById.do",
        data: {
            "id":id
        },
        dataType:'JSON',
        success: function(msg){
            if (msg.message === 'success'){
                layer.msg("添加成功");
                getAllSamplingPage();
            } else {
                layer.msg("添加失败");
            }
        }
    })
}
/***********************委托单列表end*****************************/


/***********************添加试验项目start*****************************/
//根据委托单ID查询试验项目列表
function getExperimentalItemById(id,orderTicketNum){
debugger
    //查询该项试验委托单下是否已有项目
    var condition;
    $.ajax({
        type: "POST",
        url: basePath + "/getExperimentalItemCount.do",
        async: false,
        data: {
            "orderTicketNum":orderTicketNum
        },
        dataType:'JSON',
        success:function (msg) {
            condition = msg.counts;
        }
    })

    //查询添加试验项目
    if (condition <= 0){
        $.ajax({
            type: "POST",
            url: basePath + "/getExperimentalItemById.do",
            data: {
                "id":id
            },
            dataType:'JSON',
            success: function(msg){
                $("#experimentalItemList").find("div").remove();

                if (msg === "undefined" || msg === null || msg === ""|| msg.length == 0){
                    layer.msg("该材料无试验项目")
                } else {
                    //添加委托单编号
                    $("#experimentalItemList").append('<div style="width: 100%;padding: 10px 35%;"><input type="hidden" value="' + orderTicketNum +'" id="orderTicketNum"  disabled="true" /></div>');

                    for(var i = 0; i < msg.length;i++){
                        var htmlStr = '<div style="width: 100%;padding: 10px 35%;"><input type="checkbox" name="item"  value="' + msg[i].Id +'"   style="-webkit-appearance:checkbox;" /><span>' + msg[i].name + '</span></div>';
                        $("#experimentalItemList").append(htmlStr);
                    }
                    layer.open({
                        type: 1,
                        area: ['420px', '240px'], //宽高
                        content: $("#experimentalItemLayer")
                    });
                }
            }
        })
    } else {
        layer.msg("已选试验项目");
    }

}

//添加试验项目
function addExperimentalItem(){
    var orderTicketNum = $("#orderTicketNum").val();
    var spCodesTemp = "";

    $("input:checkbox[name=item]:checked").each(function (i) {
        if(0==i){
            spCodesTemp = $(this).val();
        }else{
            spCodesTemp += (","+$(this).val());
        }
    });

    debugger
    if (!spCodesTemp.isBlank()){
        $.ajax({
            type: "POST",
            url: basePath + "/addExperimentalItemByOrderTicketNum.do",
            data: {
                "orderTicketNum":orderTicketNum,
                "experimentalItemId":spCodesTemp
            },
            dataType:'JSON',
            success:function (msg) {
                if (msg.messages === 'success'){
                    layer.close(layer.index);
                    layer.msg("添加成功");
                } else {
                    layer.msg("添加失败");
                }
            }
        })
    }else {
        layer.msg("请选择试验项目");
    }
}
/***********************添加试验项目end*****************************/

/***********************其他方法Start*****************************/
Date.prototype.Format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1, //月份
        "d+": this.getDate(), //日
        "H+": this.getHours(), //小时
        "m+": this.getMinutes(), //分
        "s+": this.getSeconds(), //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds() //毫秒
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}

String.prototype.isBlank = function () {
    var s = $.trim(this);
    if (s == "undefined" || s == null || s == "" || s.length == 0) {
        return true;
    }
    return false;
};
/***********************其他方法End*****************************/
