$(document).ready(function () {
    var $pages = $(".content li");
    var $page0 = $pages.eq(0).clone();
    var $page3 = $pages.eq(3).clone();
    var $content = $(".content");
    var $btnPre = $(".btn.pre");
    var $btnNext = $(".btn.next");
    var $carousels = $(".carousel li");
    var $wrapper = $(".wrapper");
    var pageIndex = 0;
    var pageWidth = $(".content img").width();
    var stateLock = true; //防止用户重复点击

    //图片自适应模式
    var imgs = $('.content li');

    for (var i = 0, g; g = imgs[i]; i++)
        g.onload = function () {
            if (this.width > 300) {
                this.width = 300
            } else {
                if (this.height > 300) this.height = 300
            }
        }
    //测试
    //添加备用页面
    $content.append($page0);
    $content.prepend($page3);
    $content.css({
        left: "-" + pageWidth + "px"
    });
    //为向前按钮添加事件
    $btnPre.on("click", function () {
        if (!stateLock) return;
        stateLock = false;
        play($content, true);
    });
    //为向后按钮添加事件
    $btnNext.on("click", function () {
        if (!stateLock) return;
        stateLock = false;
        play($content, false)
    });
    //底部长条添加点击事件
    $(".carousel").on("click", "li", function () {
        $(this).siblings().removeClass("active");
        $(this).addClass("active");
        var liIndex = $(this).index();
        if (liIndex > pageIndex) {
            play($content, false, liIndex - pageIndex);
        } else if (liIndex < pageIndex) {
            play($content, true, pageIndex - liIndex);
        }
    });
    //显示按钮
    $wrapper.on({
        mouseover: function () {
            clearInterval(auto1);
            $btnNext.show();
            $btnPre.show();
        },
        mouseout: function () {
            auto1 = setInterval(function () {
                play($content, false);
            }, 3500);
            $btnNext.hide();
            $btnPre.hide();
        }
    });
    //自动播放
    var auto1 = setInterval(function () {
        play($content, false);
    }, 3500);
    //播放函数
    function play($obj, dir, len) {
                    
        //更换轮播图片超链接
         var imgNum = $(".active").attr("id");
         switch(imgNum){
             case "1":
                $("#active_a").text("路驰集团四环维护工作现场工作....");
                break;
             case "2":
                 $("#active_a").text("秋雨过后满是落叶的街道....");
                 break;
             case "3":
                 $("#active_a").text("我公司17年青海机场机场跑道建设现场图....");
                 break;
             case "4":
                 $("#active_a").text("2018年3月18日我司对G104线维护现场.....");
                 break;
         }
        //dir ：true 向前/false 向后
        if (len === undefined || len === null) {
            len = 1;
        }
        var symbol = dir ? "+=" : "-=";
        var backFlag = dir ? -1 : 4;
        var clear = dir ? 3 : 0;
        var backIndex = dir ? 4 : 1;
        $obj.animate({
            left: symbol + len * pageWidth + "px"
        }, function () {
            if (dir) {
                pageIndex -= len;
                console.log(pageIndex);
                if (pageIndex < backFlag + 1) {
                    pageIndex = clear;
                    $obj.css({
                        left: "-" + backIndex * pageWidth + "px"
                    })
                }
            } else {
                pageIndex += len;
                console.log(pageIndex);
                if (pageIndex > backFlag - 1) {
                    pageIndex = clear;
                    $obj.css({
                        left: "-" + backIndex * pageWidth + "px"
                    })
                }
            }

            $carousels.eq(pageIndex).siblings().removeClass("active");
            $carousels.eq(pageIndex).addClass("active");
            stateLock = true;
        })
    }

    //轮播左侧选择

                $(".news01").hover(function () {

                    $(this).addClass("tab_y").removeClass("tab_n").siblings().addClass("tab_n").removeClass("tab_y");
                    $(".news01_x").eq($(this).index()).css({
                        "z-index": "5"
                    }).siblings(".news01_x").css({
                        "z-index": "-5"
                    });
                })

});