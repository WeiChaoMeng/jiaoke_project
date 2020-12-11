/* layui.define(['form', 'jquery', 'layer', 'table'], function(exports) {
	var form = layui.form;
	var $ = layui.$;
	var layer = layui.layer;
	console.log("common.js");
	var myForm = {
	
	};
	myForm.getUrlParam = function(argname) {
		var url = location.href;
		var arrStr = url.substring(url.indexOf("?") + 1).split("&");
		for (var i = 0; i < arrStr.length; i++) {
			var loc = arrStr[i].indexOf(argname + "=");
	
			if (loc != -1) {
				return arrStr[i].replace(argname + "=", "").replace("?", "");
				break;
			}
	
		}
		return "";
	}
	
	exports('common', myForm)
});
 */

var common = {
	maxLimitValue: 10000000
};
/**
 * @param {Object} name获取网址参数
 */
common.getUrlParam = function(name) {
	console.log("common.getUrlParam.js");
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
	 var url =decodeURI(decodeURI(location.search));
	 var r = url.substr(1).match(reg);
	//var r = window.location.search.substr(1).match(reg);
	if (r != null) {
		return unescape(r[2]);
	} else {
		return null;
	}
};
/**
 * @param {Object} tablelayid打印表单
 */
common.print = function(tablelayid) {
	var v = document.createElement("div");
	var f = ["<head>", "<style>", "body{font-size: 12px; color: #666;}",
		"table{width: 100%; border-collapse: collapse; border-spacing: 0;}",
		"th,td{line-height: 20px; padding: 9px 15px; border: 1px solid #ccc; text-align: left; font-size: 12px; color: #666;}",
		"a{color: #666; text-decoration:none;}", "*.layui-hide{display: none}", "</style>", "</head>"
	].join("");
	$(v).append($(".layui-table-box").find(".layui-table-header").html());
	$(v).find("tr").after($("[lay-id=\"" + tablelayid + "\"] .layui-table-body.layui-table-main table").html());
	$(v).find("th.layui-table-patch").remove();
	$(v).find(".layui-table-col-special").remove();
	var h = window.open("打印窗口", "_blank");
	h.document.write(f + $(v).prop("outerHTML"));
	h.document.close();
	h.print();
	h.close();
};
/**
 * 格式化日期
 * @param {Object} date
 * @param {Object} fmt
 */
common.formatDate = function(date, fmt) {
	var currentDate = new Date(date);
	var o = {
		"M+": currentDate.getMonth() + 1, //月份
		"d+": currentDate.getDate(), //日
		"h+": currentDate.getHours(), //小时
		"m+": currentDate.getMinutes(), //分
		"s+": currentDate.getSeconds(), //秒
		"q+": Math.floor((currentDate.getMonth() + 3) / 3), //季度
		"S": currentDate.getMilliseconds() //毫秒
	};
	if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (currentDate.getFullYear() + "").substr(4 - RegExp.$1.length));
	for (var k in o)
		if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[
			k]).substr(("" + o[k]).length)));
	return fmt;
};
