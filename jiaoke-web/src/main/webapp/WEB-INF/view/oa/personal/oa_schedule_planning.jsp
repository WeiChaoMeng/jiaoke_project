<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <link href="../../../../static/schedule/css/main.css"
    " rel="stylesheet" type="text/css" />
    <link href="../../../../static/schedule/css/dailog.css" rel="stylesheet" type="text/css"/>
    <link href="../../../../static/schedule/css/calendar.css" rel="stylesheet" type="text/css"/>
    <link href="../../../../static/schedule/css/dp.css" rel="stylesheet" type="text/css"/>
    <link href="../../../../static/schedule/css/alert.css" rel="stylesheet" type="text/css"/>
    <link href="../../../../static/schedule/css/blackbird.css" rel="stylesheet" type="text/css"/>
    <style type="text/css">
        <!--
        a {
            text-decoration: none;
            outline: none;
            color: #666666;
        }

        a:hover {
            text-decoration: none
        }

        img {
            border: 0
        }

        ul {
            list-style: none;
            margin: 0;
        }

        h2 {
            color: #6CBD45;
            font-size: 14px;
            font-weight: bold;
            padding-bottom: 0.5em;
            margin: 0;
        }

        h3 {
            font-size: 13px;
            font-weight: bold;

        }

        #show {
            background: url(images/photo.jpg)
        }

        #meun1 {
            color: #fff;
            padding-left: 10px;
        }

        #meun1 img {
            float: left;
        }

        #submeun1 {
            margin-left: 70px;
            float: left;
        }

        #submeun1 li {
            text-align: center;
            margin-right: 10px;
            float: left;
            display: inline;
        }

        #submeun1 li a {
            color: #fff;
            height: 50px;
            line-height: 50px;
            font-size: 14px;
            font-weight: bold;
            text-align: center;
            padding-left: 15px;
            padding-right: 15px;
            display: block;
        }

        #submeun1 li.cur {
            text-align: center;
            background: #82ce18;
            margin-right: 10px;
            float: left;
            display: inline;
        }

        #top1 {
            background-color: #000;
            margin: 0em 0 10px 0em;
            border-style: solid;
            border-width: 1px;
            border-color: #E5E5E5;
            height: 50px;
            line-height: 50px;
        }

        div.subtitle {
            font-size: 13px;
            float: right;
            color: #6CBD45;
            margin: 0 10px;
            text-align: right;
        }

        h1.title {
            height: 50px;
            font-size: 12px;
            background: url(logo.png) no-repeat;

        }

        h1.title a:link, h1.title a:visited, h1.title a:hover {
            color: #000;
            text-decoration: none;
        }

        -->
    </style>

</head>

<body>

<div>
    <div id="calhead" style="padding-left:1px;padding-right:1px;">
        <div class="cHead">
            <div class="ftitle">我的日程</div>
            <div id="loadingpannel" class="ptogtitle loadicon" style="display: none;">正在加载数据...</div>
            <div id="errorpannel" class="ptogtitle loaderror" style="display: none;">非常抱歉，无法加载您的活动，请稍后再试</div>
        </div>

        <div id="caltoolbar" class="ctoolbar">
            <div id="faddbtn" class="fbutton">
                <div><span title='点击新建日程' class="addcal">
                新建日程            
                </span></div>
            </div>
            <div class="btnseparator"></div>
            <div id="showtodaybtn" class="fbutton">
                <div><span title='点击返回当前日程 ' class="showtoday">
                今天</span></div>
            </div>
            <div class="btnseparator"></div>
            <div id="showdaybtn" class="fbutton">
                <div><span title='日' class="showdayview">日</span></div>
            </div>
            <div id="showweekbtn" class="fbutton fcurrent">
                <div><span title='周' class="showweekview">周</span></div>
            </div>
            <div id="showmonthbtn" class="fbutton">
                <div><span title='月' class="showmonthview">月</span></div>
            </div>
            <div class="btnseparator"></div>
            <div id="showreflashbtn" class="fbutton">
                <div><span title='刷新' class="showdayflash">刷新</span></div>
            </div>
            <div class="btnseparator"></div>
            <div id="sfprevbtn" title="上一个" class="fbutton">
                <span class="fprev"></span>
            </div>
            <div id="sfnextbtn" title="下一个" class="fbutton">
                <span class="fnext"></span>
            </div>
            <div class="fshowdatep fbutton">
                <div>
                    <input type="hidden" name="txtshow" id="hdtxtshow"/>
                    <span id="txtdatetimeshow">Loading</span>
                </div>
            </div>
            <div class="btnseparator"></div>
            <div id="changetochinese" class="fbutton">
                <div><span title='中文' class="chinese">中文</span></div>
            </div>
            <div id="changetoenglish" class="fbutton">
                <div><span title='英文' class="english">英文</span></div>
            </div>
            <div id="changetoenglishau" class="fbutton">
                <div><span title='英文' class="english_au">英文</span></div>
            </div>
            <div class="btnseparator"></div>
            <div class="clear"></div>
        </div>
    </div>
    <div style="padding:1px;">
        <div class="t1 chromeColor">
            &nbsp;
        </div>
        <div class="t2 chromeColor">
            &nbsp;
        </div>
        <div id="dvCalMain" class="calmain printborder">
            <div id="gridcontainer" style="overflow-y: visible;">
            </div>
        </div>
        <div class="t2 chromeColor">
            &nbsp;
        </div>
        <div class="t1 chromeColor">
            &nbsp;
        </div>
    </div>

</div>
<script src="../../../../static/schedule/js/jquery.min.js" type="text/javascript"></script>
<script src="../../../../static/schedule/js/Common.js" type="text/javascript"></script>
<script src="../../../../static/schedule/js/blackbird.js" type="text/javascript"></script>
<script src="../../../../static/schedule/js/datepicker_lang_zh_CN.js" type="text/javascript"></script>
<script src="../../../../static/schedule/js/jquery.datepicker.js" type="text/javascript"></script>
<script src="../../../../static/schedule/js/jquery.alert.js" type="text/javascript"></script>
<script src="../../../../static/schedule/js/jquery.ifrmdailog.js" defer="defer" type="text/javascript"></script>
<script src="../../../../static/schedule/js/xgcalendar_lang_zh_CN.js" type="text/javascript"></script>
<script src="../../../../static/schedule/js/xgcalendar.js?v=1.2.0.4" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        //[id,title,start,end，全天日程，跨日日程,循环日程,theme,'','']
        var view = "week";
        __CURRENTDATA = [['6147', '你好啊', new Date(1338427800000), new Date(1338431400000), 0, 0, 1, 0, 1, '', '']];
        var op = {
            view: view,
            theme: 3,
            showday: new Date(),
            EditCmdhandler: Edit,
            DeleteCmdhandler: Delete,
            ViewCmdhandler: View,
            onWeekOrMonthToDay: wtd,
            onBeforeRequestData: cal_beforerequest,
            onAfterRequestData: cal_afterrequest,
            onRequestDataError: cal_onerror,
            url: "calendar.php?mode=get",
            quickAddUrl: "calendar.php?mode=quickadd",
            quickUpdateUrl: "calendar.php?mode=quickupdate",
            quickDeleteUrl: "calendar.php?mode=quickdelete" //快速删除日程的
            /* timeFormat:" hh:mm t", //t表示上午下午标识,h 表示12小时制的小时，H表示24小时制的小时,m表示分钟
             tgtimeFormat:"ht" //同上 */
        };
        var $dv = $("#calhead");
        var _MH = document.documentElement.clientHeight;
        var dvH = $dv.height() + 2;
        op.height = _MH - dvH;
        op.eventItems = __CURRENTDATA;

        var p = $("#gridcontainer").bcalendar(op).BcalGetOp();
        if (p && p.datestrshow) {
            $("#txtdatetimeshow").text(p.datestrshow);
        }
        $("#caltoolbar").noSelect();

        $("#hdtxtshow").datepicker({
            picker: "#txtdatetimeshow", showtarget: $("#txtdatetimeshow"),
            onReturn: function (r) {
                var p = $("#gridcontainer").BCalGoToday(r).BcalGetOp();
                if (p && p.datestrshow) {
                    $("#txtdatetimeshow").text(p.datestrshow);
                }
            }
        });

        function cal_beforerequest(type) {
            var t = "正在加载数据...";
            switch (type) {
                case 1:
                    t = "正在加载数据...";
                    break;
                case 2:
                case 3:
                case 4:
                    t = "正在处理请求...";
                    break;
            }
            $("#errorpannel").hide();
            $("#loadingpannel").html(t).show();
        }

        function cal_afterrequest(type) {
            switch (type) {
                case 1:
                    $("#loadingpannel").hide();
                    break;
                case 2:
                case 3:
                case 4:
                    $("#loadingpannel").html("操作成功!");
                    window.setTimeout(function () {
                        $("#loadingpannel").hide();
                    }, 2000);
                    break;
            }

        }

        function cal_onerror(type, data) {
            $("#errorpannel").show();
        }

        function Edit(data) {
            var eurl = "";
            if (data) {
                var url = StrFormat(eurl, data);
                OpenModelWindow(url, {
                    width: 600, height: 400, caption: "管理日程", onclose: function () {
                        $("#gridcontainer").BCalReload();
                    }
                });
            }
        }

        function View(data) {
            var vurl = "";
            if (data) {
                var url = StrFormat(vurl, data);
                OpenModelWindow(url, {width: 600, height: 400, caption: "查看日程"});
            }
        }

        function Delete(data, callback) {
            $.alerts.okButton = "确定";
            $.alerts.cancelButton = "取消";
            hiConfirm("是否要删除该日程?", '确认', function (r) {
                r && callback(0);
            });
        }

        function wtd(p) {
            if (p && p.datestrshow) {
                $("#txtdatetimeshow").text(p.datestrshow);
            }
            $("#caltoolbar div.fcurrent").each(function () {
                $(this).removeClass("fcurrent");
            })
            $("#showdaybtn").addClass("fcurrent");
        }

        //显示日视图
        $("#showdaybtn").click(function (e) {
            //document.location.href="#day";
            $("#caltoolbar div.fcurrent").each(function () {
                $(this).removeClass("fcurrent");
            })
            $(this).addClass("fcurrent");
            var p = $("#gridcontainer").BCalSwtichview("day").BcalGetOp();
            if (p && p.datestrshow) {
                $("#txtdatetimeshow").text(p.datestrshow);
            }
        });
        //显示周视图
        $("#showweekbtn").click(function (e) {
            //document.location.href="#week";
            $("#caltoolbar div.fcurrent").each(function () {
                $(this).removeClass("fcurrent");
            })
            $(this).addClass("fcurrent");
            var p = $("#gridcontainer").BCalSwtichview("week").BcalGetOp();
            if (p && p.datestrshow) {
                $("#txtdatetimeshow").text(p.datestrshow);
            }

        });
        //显示月视图
        $("#showmonthbtn").click(function (e) {
            //document.location.href="#month";
            $("#caltoolbar div.fcurrent").each(function () {
                $(this).removeClass("fcurrent");
            })
            $(this).addClass("fcurrent");
            var p = $("#gridcontainer").BCalSwtichview("month").BcalGetOp();
            if (p && p.datestrshow) {
                $("#txtdatetimeshow").text(p.datestrshow);
            }
        });

        $("#showreflashbtn").click(function (e) {
            $("#gridcontainer").BCalReload();
        });

        //点击新增日程
        $("#faddbtn").click(function (e) {
            var url = "";
            OpenModelWindow(url, {width: 500, height: 400, caption: "新增日程"});
        });
        //点击回到今天
        $("#showtodaybtn").click(function (e) {
            var p = $("#gridcontainer").BCalGoToday().BcalGetOp();
            if (p && p.datestrshow) {
                $("#txtdatetimeshow").text(p.datestrshow);
            }


        });
        //上一个
        $("#sfprevbtn").click(function (e) {
            var p = $("#gridcontainer").BCalPrev().BcalGetOp();
            if (p && p.datestrshow) {
                $("#txtdatetimeshow").text(p.datestrshow);
            }

        });
        //下一个
        $("#sfnextbtn").click(function (e) {
            var p = $("#gridcontainer").BCalNext().BcalGetOp();
            if (p && p.datestrshow) {
                $("#txtdatetimeshow").text(p.datestrshow);
            }
        });
        $("#changetochinese").click(function (e) {
            location.href = "?lang=zh-cn";
        });
        $("#changetoenglish").click(function (e) {
            location.href = "?lang=en-us";
        });
        $("#changetoenglishau").click(function (e) {
            location.href = "?lang=en-au";
        });

    });
</script>
</body>
</html>
