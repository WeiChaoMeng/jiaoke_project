/**
 * Created by mac on 17/7/3.
 */

/**
 * Created by mac on 17/5/8.
 */

sysComm = {
    sysCode: '1001',//系统编码
    cityId:91,//市id
    provId:5,//省id
    point_lng:118.917132,//赤峰市万达广场经度
    point_lat:42.255586,//赤峰市万达广场纬度(118.917132,42.255586)
    grantType: 'PASSWORD',//授权模式
    clientType: 'WEB'//客户端类型
}



DateUtil = {
    dataFormat: function (longTime, formatStr) {
        //格式化时间
        //longTime 要进行格式化的long类型的时间
        //formatStr 要格式化成的字符串类型
        var data = new Date(longTime);
        return data.Format(formatStr);
    },
    isLongTime: function (longTime) {
        //判断是否是longTime时间类型

    }
}

//cookie操作工具类
CkUtil = {
    //获取cookie
    getCookie: function (name) {
        var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
        if (arr = document.cookie.match(reg))
            return unescape(arr[2]);
        else
            return null;
    },
    //删除cookie
    delCookie: function (name) {
        var exp = new Date();
        exp.setTime(exp.getTime() - 1);
        var cval = CkUtil.getCookie(name);
        if (cval != null)
            document.cookie = name + "=" + cval + ";expires=" + exp.toUTCString();
    },
    //设置cookie，time单位毫秒
    setCookie: function (name, value, time) {
        var exp = new Date();
        exp.setTime(exp.getTime() + time);
        document.cookie = name + "=" + escape(value) + ";expires=" + exp.toUTCString();
    },
    //获取毫秒数  1s的毫秒数为 getSec('s1') 1小时为 getSec('h1')
    getSec: function (str) {
        var str1 = str.substring(1, str.length) * 1;
        var str2 = str.substring(0, 1);
        if (str2 == "s") {
            return str1 * 1000;
        }
        else if (str2 == "h") {
            return str1 * 60 * 60 * 1000;
        }
        else if (str2 == "d") {
            return str1 * 24 * 60 * 60 * 1000;
        }
    }

}


StrUtil = {
    isEmpty: function (str) {
        if (str == undefined || null == str || StrUtil.trim(str).length == 0) {
            return true;
        }
        return false;
    },
    isNotEmpty: function (str) {
        return !StrUtil.isEmpty(str);
    },
    trim: function (str) {
        //删除左右两端的空格
        return str.replace(/(^\s*)|(\s*$)/g, "");
    },
    ltrim: function (str) {
        //删除左边的空格
        return str.replace(/(^\s*)/g, "");
    },
    rtrim: function (str) {
        //删除右边的空格
        return str.replace(/(\s*$)/g, "");
    }
}


// 对Date的扩展，将 Date 转化为指定格式的String
// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
// 例子：
// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
// (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18
Date.prototype.Format = function (fmt) { //author: meizz
    var o = {
        "M+": this.getMonth() + 1, //月份
        "d+": this.getDate(), //日
        "h+": this.getHours(), //小时
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

//公用接口调用
/*
function sysAjax(opts) {
    //校验token
//	if(!token){
//      window.location.href=""
//  }

    //一.设置默认参数
    var defaults = {
        method: 'GET',
        url: '',
        dataType: 'json',
        data: '',
        async: true,
        cache: false,
        contentType: 'application/json; charset=utf-8',
        success: function () {
        },
        error: function () {
        }
    };


    //二.用户参数覆盖默认参数
    for (var key in opts) {
        defaults[key] = opts[key];
    }
    console.log("请求相关参数：");
    console.log(defaults)
    $.ajax({
        type: defaults.method,
        url: defaults.url,
        dataType: defaults.dataType,
        contentType: defaults.contentType,
        data: defaults.data,
        async: defaults.async,
        beforeSend: function (xhr) {
            //设置请求头
            //xhr.setRequestHeader("User-Agent", "headertest");
            //console.log(JSON.stringify(sysComm));
            xhr.setRequestHeader("x-auth-token", fn.getAuthToken());
            xhr.setRequestHeader("Authorization", fn.getToken());
        },
        success: function (res, status, xhr) {
            //console.log('获取header:'+xhr.getAllResponseHeaders());
            console.log("服务器响应信息：");
            console.log(res)
            var msg = (typeof res.msg == 'string') && (res.msg.constructor == String) ? res.msg : res.errMsg;
            //成功
            if (res.code == "2003") {
                //授权令牌不存在或已失效，请重新登录后在尝试
                alert(res.errMsg);
            } else if (res.code == "2004") {
                //授权令牌不合法,请重新登录收尝试
                alert(res.errMsg);
            } else if (res.code == "2005") {
                //无此权限
                alert(msg);
            } else {
                defaults.success(res, status, xhr);
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            if (textStatus == "timeout") {
                alert('请求超时，请重试');
            } else {
                // alert("请求报错")
                console.log(errorThrown);
            }

        }
    });
}*/


/*function ajaxCommon(opts) {
    //一.设置默认参数
    var defaults = {
        method: 'GET',
        url: '',
        data: '',
        async: true,
        cache: false,
        contentType: 'application/json; charset=utf-8',
        success: function () {
        },
        error: function () {
        }
    };

    //二.用户参数覆盖默认参数
    for (var key in opts) {
        defaults[key] = opts[key];
    }

    defaults.method = defaults.method.toUpperCase();    //处理 method

    //三.对数据进行处理
    //如果数据是对象，并且 方法为 get方法时，将data拼接到url后面
    if (typeof defaults.data === 'object' && defaults.method === 'GET') {    //处理 data
        var str = '';
        for (var key in defaults.data) {
            str += key + '=' + defaults.data[key] + '&';
        }
        defaults.data = str.substring(0, str.length - 1);
    }

    defaults.cache = defaults.cache ? '' : '&' + new Date().getTime();//处理 cache

    if (defaults.method === 'GET' && (defaults.data || defaults.cache)) defaults.url += '?' + defaults.data + defaults.cache;    //处理 url

    //四.开始编写ajax
    //1.创建ajax对象
    var oXhr = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
    //2.和服务器建立联系，告诉服务器你要取什么文件
    oXhr.open(defaults.method, defaults.url, defaults.async);
    //3.发送请求
    if (defaults.method === 'GET')
        oXhr.send(null);
    else {
        oXhr.setRequestHeader("Content-type", defaults.contentType);
        oXhr.send(defaults.data);
    }
    //4.等待服务器回应
    oXhr.onreadystatechange = function () {
        if (oXhr.readyState === 4) {
            if (oXhr.status === 200)
                defaults.success.call(oXhr, oXhr.responseText);
            else {
                defaults.error();
            }
        }
    };
}*/


