//高度自适应
$(window).resize(function (e) {
    $(".loginbox").height($(window).height());
    $(".main").height($(window).height() - $(".header").height() - $(".footer").height() - 1);
    $(".left").height($(".main").height());
    $(".right").height($(".main").height());
    $(".rightdown").height($(".right").height() - 27);
    $("#iframe").height($(window).height() - $(".header").height() - $(".footer").height() - 3);
}).resize();


//顶部菜单显示隐藏
$(".menuup").click(function () {
    $(".headdown").slideUp("fast");
});
$(".nav li").click(function () {
    $(".headdown").slideDown("fast");
});


//IE7下菜单背景BUG
$(".menuson li a").css("width", $(".menuson").width());

//隔行换色
$('.simpletable tbody tr:even').addClass('even');

//删除功能
$('#delete').on('click', function () {
    //未选中
    if ($("tbody input:checked").length <= 0) {
        top.unselected_popup_window();
        return false
    } else {
        //选中
        top.selected_popup_window();
        return false
    }
});

//弹窗背景
function popupBackground() {
    $("<div id='window_background_color'></div>").insertAfter('#flag');
}

//未选中打开弹窗
function unselected_popup_window() {
    popupBackground();
    $(unselectedState).insertAfter('#flag');
}

//选中打开弹窗
function selected_popup_window() {
    popupBackground();
    $(selectedState).insertAfter('#flag');
}

//未选择弹窗
var unselectedState =
    "<div id='unselected_popup_windows' class='popup_windows'>"
    + "<div class='window_head'>"
    + "<div style='height:30px;'>"
    + "<i class='iconfont cursor_hand window_closing' id='unselected_windows_close' onclick='closeAll()'>" + "&#xe68d;" + "</i>"
    + "</div>"
    + "<div style='height:100px;'>"
    + "<span class='window_body'><i class='iconfont hint_icon'>" + "&#xea1d;" + "</i>" + "请选择要删除的协同！" + "</span>"
    + "</div>"
    + "<div class='window_foot'>"
    + "<span>"
    + "<a onclick='closeAll()' class='cursor_hand window_confirmation'>" + "确定" + "</a>"
    + "</span>"
    + "</div>"
    + "</div>"
    + "</div>";

//选中时弹窗
var selectedState =
    "<div id='selected_popup_windows' class='popup_windows'>"
    + "<div class='window_head'>"
    + "<div style='height:30px;'>"
    + "<i class='iconfont cursor_hand window_closing' id='selected_windows_close' onclick='closeAll()'>" + "&#xe68d;" + "</i></div>"
    + "<div style='height:100px;'>"
    + "<span class='window_body'><i class='iconfont hint_icon'>" + "&#xe725;" + "</i>" + "该操作不能恢复，是否进行删除操作?" + "</span>"
    + "</div>"
    + "<div class='window_foot'>"
    + "<span>"
    + "<a class='cursor_hand window_confirmation' onclick='closeAll()'>" + "取消" + "</a>"
    + "<a class='cursor_hand window_confirmation' onclick='deleteSuccess()'>" + "确定" + "</a>"
    + "</span>"
    + "</div>"
    + "</div>"
    + "</div>";

function deleteSuccess() {
    closeAll();
    alert("删除成功");
}

function closeAll() {
    //关闭弹窗背景
    $('#window_background_color').remove();
    //关闭未选择弹窗
    $('#unselected_popup_windows').remove();
    //关闭选中弹窗
    $('#selected_popup_windows').remove();
    //关闭日志窗口
    $('#log_window').remove();

}

//日志弹窗
function journal(){
    top.popupBackground();
    top.$(logWindow).insertAfter('#flag');
}
/*$('#journal').on('click', function () {

});*/

//日志窗口
var logWindow =
    "<div id='log_window' class='log_popup'>"
    + "<div class='window_head log_popup_width'>"
    + "<div class='log_popup_window_head'>"
    + "<span>查看明细日志</span>"
    + "<i class='iconfont cursor_hand window_closing' id='unselected_windows_close' onclick='closeAll()'>&#xe68d;</i></div>"
    + "<div class='log_window_son'>"
    + "<iframe src='process_log/main.jsp' id='' name='right' width='100%' height='100%' frameborder='0' scrolling='auto'></iframe>"
    + "</div>"
    + "<div class='window_foot'>"
    + "<span>"
    + "<a onclick='closeAll()' class='cursor_hand window_confirmation'>确定</a>"
    + "</span>"
    + "</div>"
    + "</div>"
    + "</div>";

    
    
   
    

    
    
    
    
    
    
   
   
   