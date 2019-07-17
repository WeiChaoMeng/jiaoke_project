//18.06.12 by zgy
//需要调用js的效果有：选项卡、无限级下拉菜单
var basePath  = "";
$(function () {
    basePath  = $("#path").val();
    //查询取样单
    var res = getAllSamplingPage();
    $(".zxf_pagediv").createPage({
        pageNum: Math.ceil(res.length / 10),
        current: 1,
        backfun: function(e) {
            e.pageNum = Math.ceil(res.length / 10);
            echaSamplingPage(e.current,res);
        }
    });
	//编写总数
    getCount(res);
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


/***********************取样单列表start*****************************/
function getAllSamplingPage() {
	var res ;
    $.ajax({
        type: "GET",
        url: basePath + "/getAllSamplingPage.do",
        async: false,
        dataType:'json',
        success: function(msg){
            echaSamplingPage(1,msg);
            res = msg;
        }
    })
	return res;
}



function echaSamplingPage(currentNum,amplingArray) {
    var arrayStart = (currentNum - 1) * 10;
    var arrayEnd = arrayStart + 10;
    $("#samplingData").empty();
    for (var i = arrayStart; i < arrayEnd; i++ ){
        var htmlStr = "<tr>"
            + "<td>" + amplingArray[i].Id + "</td>"
            + "<td>" + amplingArray[i].material  + "</td>"
            + "<td>" + amplingArray[i].creat_time  + "</td>"
            + "<td>" + amplingArray[i].manufacturers  + "</td>"
            + "<td>" + amplingArray[i].specification  + "</td>"
            + "<td>" + amplingArray[i].tunnage  + "</td>"
            + "<td title= '"+ amplingArray[i].remark + "'style='overflow: hidden; white-space: nowrap; text-overflow: ellipsis;-moz-text-overflow: ellipsis;'>" + amplingArray[i].remark  + "</td>"
            + "<td>" + (amplingArray[i].status === 1? '已完成':'未完成')  + "</td>"
            + "<td>"
            + "<a href='javascript:;' onclick='removeSample(\""+amplingArray[i].Id +"\")' style='color: rgb(114, 112, 209);padding: 10px;'>删除</a>"
            + "<a href='javascript:;' onclick='confirm_completed(\""+amplingArray[i].Id +"\")' style='color: rgb(114, 112, 209);'>确认完成</a>"
             + "</td>"
            + "</tr>";
        $("#samplingData").append(htmlStr);
    }


}

//未完成总数计算
function getCount(amplingArray) {
    //未完成总数计算
    var count = 0;
    for (var i = 0;i < amplingArray.length;i++){
        count = amplingArray[i].status === 1? count:++count;
    }
    if (count < 99){
        $("#sampleCount").empty();
        $("#sampleCount").text(count);
    }
}

//删除相关取样单
function removeSample(id) {

    layer.confirm('您确定删除么？', {
        btn: ['确定','取消'] //按钮
    }, function(){
        $.ajax({
            type: "POST",
            url: basePath + "/removeSampleById.do",
			data:{"id":id},
            dataType:'json',
            success: function(msg){
				if (msg.message === 'success'){
					layer.alert("删除成功");
                    var res = getAllSamplingPage();
                    getCount(res);
                }else {
                    layer.alert("删除失败");
				}
            }
        })
    }, function(){

    });
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
/***********************取样单列表end*****************************/


/***********************from表单相关函数start*****************************/
function getFromData() {
	$.ajax({
        type: "GET",
        url: basePath + "/getSamplingPageFromData.do",
        dataType:'json',
        success: function(msg){
            for(p in msg){
                $("#" + p).empty();
            	for (var i=0; i < msg[p].length;i++){
            		var htmlStr = "<option value='" + msg[p][i].Id +"'>" + msg[p][i].name + "</option>";
                    $("#" + p).append(htmlStr);
				}
			}

			//加载时间
            var time2 = new Date().Format("yyyy-MM-dd HH:mm:ss");
            $("#creat_time").val(time2);
        }
	})
}

//提交取样单
function addSample(){
	var materials = $("#materials").val();
    var manufacturers = $("#manufacturers").val();
    var specification = $("#specification").val();
    var tunnage = $("#tunnage").val();
    var creat_time = $("#creat_time").val();
    var remark = $("#remark").val();

    if (tunnage.isBlank()){
		layer.msg('请填充代表吨数');
		return false;
	} else {
        $.ajax({
            type: "POST",
            url: basePath + "/addSample.do",
            data: {
                "materials":materials,
                "manufacturers":manufacturers,
                "specification":specification,
                "tunnage":tunnage,
                "creat_time":creat_time,
                "remark":remark
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

}
/***********************from表单相关函数end*****************************/

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
