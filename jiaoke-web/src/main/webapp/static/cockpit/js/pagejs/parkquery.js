/**
 * Created by chenbiao on 2017/7/10.
 */



// 停车场查询
$("#park-query").on("click", function () {
    $(".park-query").addClass("park-active");
    $(".parkquery-cont").css("display", "block");
});

//下拉框
var clear_flag = false;
(function ($) {
    var ser_object2;
    var ser_object2_img;
    var radius_v;
    jQuery.fn.extend({
        "M_select": function (options) {
            var ojc_arr = this;
            var ojc;
            // select下拉框
            for (i = 0; i < ojc_arr.length; i++) {
                var ser_object = $(ojc_arr[i]);
                $(ser_object).parent().addClass("select-con");
                $(ser_object).parent().css("z-index", "1");
                $(ser_object).wrap("<section class='sel-hide'></section>");
                $(ser_object).parent().parent().append('<section class="sel-box"><div class="sel-title-box"><span class="sel-title"></span><span class="sel-sign"></span></div><section class="sel-float-box"></section></section>');
                var w = $(ser_object).parent().parent().width();
                $(ser_object).parent().parent().find(".sel-float-box").css("width", w);
                var ojc = $(ser_object).children();
                for (a = 0; a < ojc.length; a++) {
                    var t = $(ojc[a]).text();
                    var v = $(ojc[a]).attr("value");
                    $(ser_object).parent().parent().find(".sel-float-box").append('<div class="sel-float-div sel-Hcolor" value=' + v + '>' + t + '</div>');
                }
                ;

                for (a = 0; a < ojc.length; a++) {

                    var sel_disabled = $(ojc[a]).attr("disabled");

                    if (sel_disabled == "disabled" || sel_disabled == "true") {
                        var div_ojc = $(ser_object).parent().parent().find('.sel-float-box').children();
                        $(div_ojc[a]).removeClass("sel-float-div");
                        $(div_ojc[a]).addClass("sel-float-div-disabled");

                    }
                }
                ;

                var sel_textFirst = $(ser_object).parent().parent().find(".sel-float-box").children().eq(0).text();


                // 默认参数
                var defaultOption = {

                    ico: 1,
                    Img: "",
                    Img2: "",
                    Title: "",
                    inputName: "sel_v",
                    selected: "0",
                    radius: "0",
                    Succee: function () {
                    }

                };
                // 合并自定义参数和默认参数，出现相同属性名时自定义参数会覆盖默认参数
                options = $.extend({}, defaultOption, options);

                // 判断Test是否为空
                if (options.Title) {
                    sel_textFirst = options.Title;

                }
                ;
                $(ser_object).parent().parent().find(".sel-title").text(sel_textFirst);

                // 判断使用哪种ico样式
                var Img, Img2;
                if (!(options.Img) && !(options.Img2)) {

                    if (options.ico == 1) {
                        Img = "./js/M_select/down1.png";
                        Img2 = "./js/M_select/up1.png";
                    }
                    if (options.ico == 2) {
                        Img = "./js/M_select/down2.png";
                        Img2 = "./js/M_select/up2.png";
                    }
                    if (options.ico == 3) {
                        Img = "./js/M_select/down3.png";
                        Img2 = "./js/M_select/up3.png";
                    }
                    if (options.ico == 4) {
                        Img = "./js/M_select/down4.png";
                        Img2 = "./js/M_select/up4.png";
                    }
                    if (options.ico == 5) {
                        Img = "./js/M_select/down5.png";
                        Img2 = "./js/M_select/up5.png";
                    }
                } else if (!(options.Img) && (options.Img2 != null)) {
                    Img = options.Img2;
                    Img2 = options.Img2;
                } else if (!(options.Img2) && (options.Img != null)) {
                    Img = options.Img;
                    Img2 = options.Img;
                } else if ((options.Img != null) && (options.Img2 != null)) {
                    Img = options.Img;
                    Img2 = options.Img2;
                }

                // 可传参css
//              $(ser_object).parent().parent().find(".sel-sign").css("background","url("+Img+")");
//              $(ser_object).parent().parent().find(".sel-sign").css("background-size","100% 100%");
                $(ser_object).parent().parent().find(".sel-box").append('<input type="hidden" name="' + options.inputName + '" value="' + options.selected + '" class="inputHidden">');
                //$(ser_object).parent().parent().find(".sel-box").css("border-radius",options.radius);
                //$(ser_object).parent().parent().find(".sel-float-box").css("border-radius","0 0 "+options.radius +" "+options.radius+" ");

                // 获取图片的高
                var ico_h = $(ser_object).parent().parent().find(".sel-title-box").height();
                // 设置图片的宽高
//              $(ser_object).parent().parent().find(".sel-sign").css({'width':+ico_h+'px','height':+ico_h+'px'});
                $(ser_object).parent().parent().find(".sel-title-box").css("padding-right", "10px");

                // 获取有多少个选项
                var selLength = $(ser_object).parent().parent().find(".sel-float-box").children().length;
                var selListHeight = $(ser_object).parent().parent().find(".sel-float-box").children().height();
                // 获取选项的高度

                var selHeight = selListHeight * 10;
                // 隐藏下拉框
                $(".sel-float-box").hide();
                if (selLength > 10) {
                    $(ser_object).parent().parent().find(".sel-float-box").css("height", selHeight);
                    $(ser_object).parent().parent().find(".sel-float-box").css("overflow-y", "scroll");
                }

                // 根据selected 的值选中(即input value)
                var input_val = $(ser_object).parent().parent().find(".inputHidden").attr("value");
                var div_objoct = $(ser_object).parent().parent().find(".sel-float-div");
                for (a = 0; a < div_objoct.length; a++) {

                    var div_val = $(div_objoct[a]).attr("value");
                    if (div_val == input_val) {
                        var div_text = $(div_objoct[a]).text();
                        $(ser_object).parent().parent().find(".sel-title").text(div_text);
                    }
                    ;
                }
                ;


                // 点击事件
                $(ser_object).parent().parent().find(".sel-title-box").on("click", function () {
                    // 切换图片
//                  $(ser_object2).parent().parent().find(".sel-sign").css("background","url("+ser_object2_img+")");
//                  $(ser_object2).parent().parent().find(".sel-sign").css("background-size","100% 100%");
                    //$(ser_object2).parent().css("border-radius",radius_v);
                    $('.sel-box').removeClass("on");
                    ser_object2 = this;
                    ser_object2_img = Img;
                    // 圆角值
                    radius_v = options.radius;

                    var floatAttr = $(this).parent().find(".sel-float-box").css("display");
                    if (floatAttr == "block") {
                        $(".sel-float-box").hide();
                        $(this).parent().find(".sel-float-box").hide();

                        $(this).parent().removeClass("on");
                        $(this).parent().find(".sel-float-box").removeClass("on");

                        //$(this).parent().css("border-radius",options.radius);
                        // 切换图片
//                      $(this).parent().parent().find(".sel-sign").css("background","url("+Img+")");
//                      $(this).parent().parent().find(".sel-sign").css("background-size","100% 100%");
                    } else if (floatAttr == "none") {
                        // 切换图片
//                      $(this).parent().parent().find(".sel-sign").css("background","url("+Img2+")");
//                      $(this).parent().parent().find(".sel-sign").css("background-size","100% 100%");
                        $(".sel-float-box").hide();
                        $(this).parent().find(".sel-float-box").show();

                        $(this).parent().addClass("on");
                        $(this).parent().find(".sel-float-box").addClass("on");

                        //$(this).parent().css("border-radius",options.radius+" "+options.radius+"  0 0");
                    }

                });

                // 选项点击事件
                $(ser_object).parent().parent().find(".sel-float-div").on("click", function () {
                    var sel_text = $(this).text();
                    var sel_value = $(this).attr("value");
                    // 切换图片
//                  $(this).parent().parent().find(".sel-sign").css("background","url("+Img+")");
//                  $(this).parent().parent().find(".sel-sign").css("background-size","100% 100%");

                    $(this).parent().hide();
                    $(this).parent().parent().find(".sel-title").text(sel_text);
                    //$(this).parent().parent().css("border-radius",options.radius);

                    $(this).parent().parent().find(".sel-title").attr("value", sel_value);
                    var selected_value = $(this).parent().parent().find(".sel-title").attr("value");
                    $(this).parent().parent().find(".inputHidden").attr("value", selected_value);
                    var v;
                    var ojc_option = $(this).parent().parent().parent().find("option");
                    for (a = 0; a < ojc_option.length; a++) {

                        v = $(ojc_option[a]).attr("value");

                        if (v == selected_value) {
                            $(ojc_option).attr("selected", false);
                            $(ojc_option[a]).attr("selected", true);

                        }
                    }
                    ;
                    // 判断函数是否为空
                    if (options.Succee != null) {
                        options.Succee(selected_value);
                    }


                });
            }// for循环语句结束

        },

    });
    // 点击其他位置下拉消失

    $(document).on('click', function (e) {
        var parent = $(e.target).parents('.select-con').length;
        if (!parent) {
            // // 切换图片
//          $(ser_object2).parent().parent().find(".sel-sign").css("background","url("+ser_object2_img+")");
//          $(ser_object2).parent().parent().find(".sel-sign").css("background-size","100% 100%");
            //$(ser_object2).parent().css("border-radius",radius_v);
            // console.log(ser_object2);
            $('.sel-float-box').hide();
            $('.sel-box').removeClass("on");
        }
        ;

    });

})(jQuery);
//分页
(function ($) {
    $.fn.extendPagination = function (options) {
        var defaults = {
            //pageId:'',
            totalCount: '',
            showPage: '3',
            limit: '5',
            callback: function () {
                return false;
            }
        };
        $.extend(defaults, options || {});
        if (defaults.totalCount == '') {
            //alert('鎬绘暟涓嶈兘涓虹┖!');
            $(this).empty();
            return false;
        } else if (Number(defaults.totalCount) <= 0) {
            //alert('鎬绘暟瑕佸ぇ浜�0!');
            $(this).empty();
            return false;
        }
        if (defaults.showPage == '') {
            defaults.showPage = '10';
        } else if (Number(defaults.showPage) <= 0) defaults.showPage = '10';
        if (defaults.limit == '') {
            defaults.limit = '5';
        } else if (Number(defaults.limit) <= 0) defaults.limit = '5';
        var totalCount = Number(defaults.totalCount), showPage = Number(defaults.showPage),
            limit = Number(defaults.limit), totalPage = Math.ceil(totalCount / limit);
        if (totalPage > 0) {
            var html = [];
            html.push(' <ul class="pagination">');
            html.push(' <li class="previous"><a href="#"><</a></li>');
            html.push('<li class="disabled hidden"><a href="#">...</a></li>');
            if (totalPage <= showPage) {
                for (var i = 1; i <= totalPage; i++) {
                    if (i == 1) html.push(' <li class="active"><a href="#">' + i + '</a></li>');
                    else html.push(' <li><a href="#">' + i + '</a></li>');
                }
            } else {
                for (var j = 1; j <= showPage; j++) {
                    if (j == 1) html.push(' <li class="active"><a href="#">' + j + '</a></li>');
                    else html.push(' <li><a href="#">' + j + '</a></li>');
                }
            }
            html.push('<li class="disabled hidden"><a href="#">...</a></li>');
            html.push('<li class="next"><a href="#">></a></li></ul>');
            $(this).html(html.join(''));
            if (totalPage > showPage) $(this).find('ul.pagination li.next').prev().removeClass('hidden');

            var pageObj = $(this).find('ul.pagination'), preObj = pageObj.find('li.previous'),
                currentObj = pageObj.find('li').not('.previous,.disabled,.next'),
                nextObj = pageObj.find('li.next');

            function loopPageElement(minPage, maxPage) {
                var tempObj = preObj.next();
                for (var i = minPage; i <= maxPage; i++) {
                    if (minPage == 1 && (preObj.next().attr('class').indexOf('hidden')) < 0)
                        preObj.next().addClass('hidden');
                    else if (minPage > 1 && (preObj.next().attr('class').indexOf('hidden')) > 0)
                        preObj.next().removeClass('hidden');
                    if (maxPage == totalPage && (nextObj.prev().attr('class').indexOf('hidden')) < 0)
                        nextObj.prev().addClass('hidden');
                    else if (maxPage < totalPage && (nextObj.prev().attr('class').indexOf('hidden')) > 0)
                        nextObj.prev().removeClass('hidden');
                    var obj = tempObj.next().find('a');
                    if (!isNaN(obj.html())) obj.html(i);
                    tempObj = tempObj.next();
                }
            }

            function callBack(curr) {
                defaults.callback(curr, defaults.limit, totalCount);
            }

            currentObj.click(function (event) {
                event.preventDefault();
                var currPage = Number($(this).find('a').html()), activeObj = pageObj.find('li[class="active"]'),
                    activePage = Number(activeObj.find('a').html());
                if (currPage == activePage) return false;
                if (totalPage > showPage && currPage > 1) {
                    var maxPage = currPage, minPage = 1;
                    if (($(this).prev().attr('class'))
                        && ($(this).prev().attr('class').indexOf('disabled')) >= 0) {
                        minPage = currPage - 1;
                        maxPage = minPage + showPage - 1;
                        loopPageElement(minPage, maxPage);
                    } else if (($(this).next().attr('class'))
                        && ($(this).next().attr('class').indexOf('disabled')) >= 0) {
                        if (totalPage - currPage >= 1) maxPage = currPage + 1;
                        else  maxPage = totalPage;
                        if (maxPage - showPage > 0) minPage = (maxPage - showPage) + 1;
                        loopPageElement(minPage, maxPage)
                    }
                }
                activeObj.removeClass('active');
                $.each(currentObj, function (index, thiz) {
                    if ($(thiz).find('a').html() == currPage) {
                        $(thiz).addClass('active');
                        callBack(currPage);
                    }
                });
            });
            preObj.click(function (event) {
                event.preventDefault();
                var activeObj = pageObj.find('li[class="active"]'), activePage = Number(activeObj.find('a').html());
                if (activePage <= 1) return false;
                if (totalPage > showPage) {
                    var maxPage = activePage, minPage = 1;
                    if ((activeObj.prev().prev().attr('class'))
                        && (activeObj.prev().prev().attr('class').indexOf('disabled')) >= 0) {
                        minPage = activePage - 1;
                        if (minPage > 1) minPage = minPage - 1;
                        maxPage = minPage + showPage - 1;
                        loopPageElement(minPage, maxPage);
                    }
                }
                $.each(currentObj, function (index, thiz) {
                    if ($(thiz).find('a').html() == (activePage - 1)) {
                        activeObj.removeClass('active');
                        $(thiz).addClass('active');
                        callBack(activePage - 1);
                    }
                });
            });
            nextObj.click(function (event) {
                event.preventDefault();
                var activeObj = pageObj.find('li[class="active"]'), activePage = Number(activeObj.find('a').html());
                if (activePage >= totalPage) return false;
                if (totalPage > showPage) {
                    var maxPage = activePage, minPage = 1;
                    if ((activeObj.next().next().attr('class'))
                        && (activeObj.next().next().attr('class').indexOf('disabled')) >= 0) {
                        maxPage = activePage + 2;
                        if (maxPage > totalPage) maxPage = totalPage;
                        minPage = maxPage - showPage + 1;
                        loopPageElement(minPage, maxPage);
                    }
                }
                $.each(currentObj, function (index, thiz) {
                    if ($(thiz).find('a').html() == (activePage + 1)) {
                        activeObj.removeClass('active');
                        $(thiz).addClass('active');
                        callBack(activePage + 1);
                    }
                });
            });
        }
    };
})(jQuery);
var parkData = [
    // {
    //     parkNo: "001",
    //     pointX: "118.970907",
    //     pointY: "42.27894",
    //     allnum: "270",
    //     free: "0"
    // },
    // {
    //     parkNo: "002",
    //     pointX: "118.963558",
    //     pointY: "42.278059",
    //     allnum: "260",
    //     free: "5"
    // },
    // {
    //     parkNo: "003",
    //     pointX: "118.951988",
    //     pointY: "42.276645",
    //     allnum: "300",
    //     free: "150"
    // }
];
$(function () {
    var checktext;
    var checkText;
    var fun = {
        init: function () {
            areapartition:{
                // var data = ['1','2','3','4']

                // $('#select01').empty();
                // $.each(data,function(i,item){
                //     $('#select01').append('<option value="'+item+'">'+item+'</option>')
                // });

                var req = {
                    sysCode: sysComm.sysCode,
                    cityId: sysComm.cityId
                };
                var queryNextLowerLeverById = {
                    method: "post",
                    url: dataUrl.util.queryNextLowerLeverById(),
                    data: JSON.stringify(req),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (res) {
                        if (res.code == '8888') {
                            var result = res.data;
                            console.log(result);

                            $('#select01').empty();
                            $.each(result, function (i, item) {
                                for (var key in item) {
                                    console.log(key)
                                    $('#select01').append('<option value="' + key + '">' + item[key] + '</option>')
                                }
                            });
                            $("#select01").M_select({

                                "Title": "行政区划",
                                "inputName": "selected1_value",
                                // 默认选中的值（参数值写需要选中的select的value值）
                                "selected": "923",
                                Succee: function () {
                                    console.log($("input[name='selected1_value']").attr('value'));
                                    checkText = $(".sel-title").eq(0).text();
                                    if (checkText == "全部") {
                                        checktext = "赤峰市"
                                    } else if (checkText == "其他") {
                                        //map.clearOverlays();
                                        checktext = "赤峰市";
                                    } else {
                                        checktext = "赤峰市" + checkText;
                                    }
                                    getBoundary(checktext);
                                    serfun();
                                }
                            });
                            getBoundary("赤峰市红山区");
                            serfun();


                        }
                    }
                };
                sysAjax(queryNextLowerLeverById);


            }
            ;

            leadlevel:{

                // $('#select02').empty();
                // $.each(data,function(i,item){
                //     $('#select02').append('<option value="'+item+'">'+item+'</option>')
                // });

                $("#select02").M_select({
                    "Title": "诱导级别",
                    "inputName": "selected2_value",
                    // 默认选中的值（参数值写需要选中的select的value值）
                    "selected": "",
                    Succee: function () {
                        console.log($("input[name='selected2_value']").attr('value'));
                        serfun();
                    }
                });
                //alert($("input[name='selected_value']").attr('value'))
            }

        },
    }
    fun.init();
    //动态计算高度
    function list_wrap_height() {
        var topHeight = $("#list_wrap").offset().top;
        var clientHeight = $(window).height();
        // console.log(clientHeight - topHeight);
        var list_wrap_height = clientHeight - topHeight - 100 + 'px'
        $("#list_wrap").css('height', list_wrap_height);
        $('#list_wrap').perfectScrollbar();

    };
    window.onresize = function () {
        if ($('#list_con > li').length > 2) {
            list_wrap_height();
        }
    };
    //创建搜索html
    function createHtml(data) {

        //存在行政区划才会有诱导出现

        $('#guide_con').show();

        $('#list_wrap').show();
        //计算 $('#list_wrap')自适应高度
        if ($('#list_con >li').length > 2) {

            list_wrap_height();
        } else {
            $('#list_wrap').css('height', 'auto');
        }

        // console.log('请求数据ajax');
    }

    //默认加载数据
    //serfun();
    //搜索
    //调接口后删除str
    // list_wrap_height();
    //调接口后删除end
    function serfun() {
        var total = 0;
        $("#guide_total_number").html(total);
        var ser_text = $.trim($('#ser_text').val());
        var area_text = $("input[name='selected1_value']").attr('value');
        // var level_text = $("input[name='selected2_value']").attr('value');
        if (ser_text || area_text) {
            var countryId = [];

            if (area_text) {
                countryId = area_text.split(',');
            }
            //绘制地图上的点
            initMapPoint();
            var req = {
                sysCode: sysComm.sysCode,
                cityId: sysComm.cityId,
                parkNameOrAddress: ser_text,
                countryId: countryId,
                baseRequest: {
                    pageNum: 1,
                    pageSize: 10
                }
            }
            var opt = {
                method: "post",
                data: JSON.stringify(req),
                url: dataUrl.util.queryParkLotByCountryAndParkName(),
                success: function (res, xhr, status) {
                    console.log(res)
                    //清空内容
                    $("#list_con").html('');
                    if (res.code == '8888') {

                        initParkListHtml(res.data);

                        total = res.data.pageTotals == undefined || null == res.data.pageTotals ? 0 : res.data.pageTotals;
                        createHtml();
                        //分页插件
                        $('#callBackPager').extendPagination({
                            totalCount: total,
                            limit: 10,
                            callback: function (curr, limit, totalCount) {
                                queryParkLotByCountryAndParkName(curr, limit, area_text, ser_text);
                                createHtml()

                            }
                        });


                    }
                }
            }
            sysAjax(opt);
            createHtml();
        }
    }


    function initMapPoint() {
        parkData = [];
        var ser_text = $.trim($('#ser_text').val());
        var area_text = $("input[name='selected1_value']").attr('value');
        // var level_text = $("input[name='selected2_value']").attr('value');
        if (ser_text || area_text) {
            var countryId = [];

            if (area_text) {
                countryId = area_text.split(',');
            }

            var req = {
                sysCode: sysComm.sysCode,
                parkNameOrAddress: ser_text,
                countryId: countryId,
            }

            var opt = {
                method: "post",
                data: JSON.stringify(req),
                url: dataUrl.util.queryParkingLotGeoByCountryAndParkName(),
                success: function (res, xhr, status) {

                    if (res.code == '8888') {
                        var list = res.data;
                        if (null == list || list.length == 0) {
                            list = [];
                        }

                        $.each(list, function (index, item) {
                            var point = {};
                            point.parkNo = item.plNo;
                            point.pointX = item.lonId;
                            point.pointY = item.latId;
                            point.allnum = item.plBerthNum;
                            point.free = item.freeBrethNum;
                            point.parkName = item.plName;
                            parkData.push(point);
                        });
                        drawMarker();


                    }


                }

            }

            sysAjax(opt)

        }
    }


    //根据区县名称及搜索框查询停车场信息
    function queryParkLotByCountryAndParkName(pageNum, pageSize, countryIds, searchText) {
        pageNum = pageNum == undefined || null == pageNum ? 1 : pageNum;
        pageSize = pageSize == undefined || null == pageSize ? 10 : pageSize;
        var req = {
            sysCode: sysComm.sysCode,
            cityId: sysComm.cityId,
            parkNameOrAddress: searchText,
            countryId: countryIds.split(','),
            baseRequest: {
                pageNum: pageNum,
                pageSize: pageSize
            }
        }

        var opt = {
            method: "post",
            data: JSON.stringify(req),
            url: dataUrl.util.queryParkLotByCountryAndParkName(),
            success: function (res, xhr, status) {
                if (res.code == '8888') {
                    initParkListHtml(res.data);
                }
            }
        }
        sysAjax(opt);
    }

    function initParkListHtml(data) {
        //清空列表内容
        $("#list_con").html('');
        //清空详细信息内容
        $(".parkquery-cont").find(".detail-cont").remove();
        var total = data.pageTotals == undefined || null == data.pageTotals ? 0 : data.pageTotals;
        var list = data.dataList == undefined || data.dataList == null ? [] : data.dataList;
        $("#guide_total_number").html(total);

        $('#guide_total').show();
        //隐藏未查询到检索数据提示
        $('#nodataInfo').hide();
        $('#callBackPager').css({'border-top': '1px solid #1c83f6'})
        if (0 == total) {
            if (clear_flag) {
                markerClusterer.clearMarkers();         //此步骤需要
            }
            //展示未查询到检索数据提示
            $('#nodataInfo').show();
            $('#guide_total').hide();
            $('#callBackPager').css({'border-top': '0'})
        }


        var html = '';
        var detailHtml = ''
        $.each(list, function (index, item) {
            var parkType;
            if (1 == item.plType) {
                parkType = '路内'
            } else if (2 == item.plType) {
                parkType = '路外'
            } else {
                parkType = '未知'
            }
            var plRate = parsePlRate(item.plRate);
            html += '<li>' +
                '<span class="coordinate_x" style="display: none">' + item.lonId + '</span>' +
                '<span class="coordinate_y" style="display: none">' + item.latId + '</span>' +
                '<span class="coordinate_plNo" style="display: none">' + item.plNo + '</span>' +
                '<ul class="fl list_item_ul">' +
                '<li><span class="space_span">' + (index + 1) + '.</span>' + item.plName + '</li>' +
                '<li><span class="space_span"></span>类型:' + parkType + '</li>' +
                '<li><span class="space_span"></span>车位总数:' + item.plBerthNum + '</li>' +
                '</ul></li>';

            detailHtml += '<div id="detail-cont_' + item.plNo + '" class="detail-cont">' +
                '<div class="detail-main">' +
                '<div class="datail-common">' +
                '<span class="park-cont">名称</span><span  class="park-tit cont-style">' + item.plName + '</span>' +
                '<span  class="cont-callback">返回</span>' +
                '</div>' +
                '<div class="datail-common">' +
                '<span class="park-cont">类型</span><span  class="park-style cont-style">' + parkType + '</span>' +
                '</div>' +
                '<div class="datail-common">' +
                '<span class="park-cont">车位总数</span><span  class = "parknum-total cont-style" >' + item.plBerthNum + '</span >' +
                '</div>' +
                '<div class="datail-common">' +
                '<span class="park-cont">商圈属性</span><span  class="park-attr attr-' + item.busiCircle + '"></span>' +
                '</div>' +
                '<div class="datail-common">' +
                '<span class="park-cont">使用设备</span><span class="park-device cont-style">道闸、地磁</span>' +
                '</div>' +
                '<div class="datail-common">' +
                '<span class="park-cont">出入口数</span><span  class="park-exit cont-style">' + item.plExitNum + '出' + item.plEntranceNum + '入</span>' +
                '</div>' +
                '</div>' +
                '<div class="scale-tit">收费标准</div>' +
                '<table class="scale-cont">' +
                '<tr class="scale-tr">' +
                '<td>车型</td>' +
                '<td>小型车</td>' +
                '<td>大型车</td>' +
                '</tr>' +
                '<tr class="scale-tr">' +
                '<td>首小时</td>' +
                '<td>' + plRate[0].first + '元</td>' +
                '<td>' + plRate[1].first + '元</td>' +
                '</tr>' +
                '<tr class="scale-tr">' +
                '<td>1小时以上</td>' +
                '<td>' + plRate[0].second + '元/半小时</td>' +
                '<td>' + plRate[1].second + '元/半小时</td>' +
                '</tr>' +
                '<tr class="scale-tr">' +
                '<td>24小时最高</td>' +
                '<td>' + plRate[0].four + '元</td>' +
                '<td>' + plRate[1].four + '元</td>' +
                '</tr>'


            detailHtml += '</table></div>';


        })
        $("#list_con").append(html);
        $(".parkquery-cont").append(detailHtml);
        createHtml();
    }


    function parsePlRate(plRate) {
        if (null == plRate) {
            return [];
        }
        var plRateData = JSON.parse(plRate);
        var result = [];
        var patrn = /\d+(\.\d+)?/g;
        $.each(plRateData, function (index, item) {
            var temp = item.standard;
            var data = {};
            data.carType = temp.substring(0, temp.indexOf("："));
            var nums = temp.match(patrn);
            data.first = nums[0];//第一小时10元
            data.second = nums[1];//后1.5元/半小时
            temp = item.standardInfo;
            nums = temp.match(patrn);
            data.third = nums[0];//24小时
            data.four = nums[1];//60元
            result.push(data);
        })


        return result;
    }

    $('#ser_btn').on('click', function () {
        /*checkText = $(".sel-title").eq(0).text();
        if (checkText == "全部") {
            checktext = "赤峰市"
        } else if (checkText == "其他") {
            //map.clearOverlays();
            checktext = "赤峰市";
        } else {
            checktext = "赤峰市" + checkText;
        }
        getBoundary(checktext);*/
        serfun();
    })


    /*
     * 初始化加载页面-默认展示红山区的信息。
     */
    //加载查询条件
    $(".park-query").addClass("park-active");
    $(".parkquery-cont").css("display", "block");
    //加载查询
    serfun();

});


$(document).on('click', '.cont-callback', function () {
    $('.detail-cont').hide();
    $('#list_wrap').show();
})
//地图调用部分
var map; //Map实例
//后台传过来
var currentLat = 118.922316;
var currentLon = 42.25953;

map = new BMap.Map('allmap', {enableMapClick: false});
//第1步：设置地图中心点，当前城市
var point = new BMap.Point(currentLat, currentLon);
//第2步：初始化地图,设置中心点坐标和地图级别。
map.centerAndZoom(point, 13);
map.setCurrentCity("赤峰");  // 设置地图显示的城市 此项是必须设置的
//第3步：启用滚轮放大缩小
map.enableScrollWheelZoom(true);
//第4步：向地图中添加缩放控件
var ctrlNav = new window.BMap.NavigationControl({
    // 靠右上角位置
    anchor: BMAP_ANCHOR_TOP_RIGHT,
    // LARGE类型
    type: BMAP_NAVIGATION_CONTROL_ZOOM,
    //偏离值
    offset: new BMap.Size(25, 80)
});
map.addControl(ctrlNav);
//第5步：设置地图风格
//第5步：设置地图风格
map.setMapStyle({
    styleJson: [
        {
            "featureType": "background",
            "elementType": "geometry",
            "stylers": {
                "color": "#0a0906"
            }
        },
        {
            "featureType": "building",
            "elementType": "geometry",
            "stylers": {
                "color": "#444444"
            }
        },
        {
            "featureType": "local",
            "elementType": "geometry",
            "stylers": {
                "color": "#ff9900",
                "weight": "0.1"
            }
        },
        {
            "featureType": "road",
            "elementType": "all",
            "stylers": {
                "color": "#9b780e",
                "weight": "0.1",
                "saturation": -21,
                "visibility": "on"
            }
        },
        {
            "featureType": "green",
            "elementType": "geometry",
            "stylers": {
                "color": "#344222",
                "saturation": -20
            }
        },
        {
            "featureType": "water",
            "elementType": "geometry",
            "stylers": {
                "color": "#163e5a"
            }
        },
        {
            "featureType": "subway",
            "elementType": "all",
            "stylers": {
                "color": "#ff9900",
                "saturation": -39
            }
        },
        {
            "featureType": "railway",
            "elementType": "geometry",
            "stylers": {
                "color": "#ff9900"
            }
        },
        {
            "featureType": "all",
            "elementType": "labels.text.stroke",
            "stylers": {
                "color": "#313131"
            }
        },
        {
            "featureType": "all",
            "elementType": "labels.text.fill",
            "stylers": {
                "color": "#8b8787"
            }
        },
        {
            "featureType": "manmade",
            "elementType": "geometry",
            "stylers": {
                "color": "#1b1b1b"
            }
        },
        {
            "featureType": "highway",
            "elementType": "geometry",
            "stylers": {
                "lightness": -75,
                "saturation": -91
            }
        },
        {
            "featureType": "subway",
            "elementType": "geometry",
            "stylers": {
                "lightness": -65
            }
        },
        {
            "featureType": "railway",
            "elementType": "geometry",
            "stylers": {
                "color": "#000000",
                "weight": "1",
                "lightness": -40,
                "saturation": 1
            }
        }
    ]
});

//第6步：检测浏览器兼容
function checkhHtml5() {
    if (typeof(Worker) === "undefined") {
        if (navigator.userAgent.indexOf("MSIE 9.0") <= 0) {
            alert("定制个性地图示例：IE9以下不兼容，推荐使用百度浏览器、chrome、firefox、safari、IE10");
        }

    }
}
checkhHtml5();


function drawMarker() {
    //清除以前的点位
    map.clearOverlays();
    //第7步：绘制点
    var marker = [];
    var newpoiX = null;//坐标
    var newpoiY = null;
    var parkNo = null;//编号
    var popAllnum = null;//停车场车位总数
    var popFree = null;//空闲车位
    var parkName = null;//停车场名称

    for (var i = 0; i < parkData.length; i++) {
        newpoiX = parkData[i].pointX;
        newpoiY = parkData[i].pointY;
        parkNo = parkData[i].parkNo;
        popAllnum = parkData[i].allnum;
        popFree = parkData[i].free;
        parkName = parkData[i].parkName;
        var point = new BMap.Point(newpoiX, newpoiY);
        if ((popFree / popAllnum) == 0) {
            var myIcon = new BMap.Icon("../img/parkicon_1.png",
                new BMap.Size(24, 28), {
                    offset: new BMap.Size(10, 28),
                    textColor: '#fff'
                });
            marker[i] = new BMap.Marker(point, {icon: myIcon});
            map.addOverlay(marker[i]);
        } else if ((popFree / popAllnum) > 0 && (popFree / popAllnum) <= 0.3) {
            var myIcon2 = new BMap.Icon("../img/parkicon_2.png",
                new BMap.Size(24, 29), {
                    offset: new BMap.Size(10, 29),
                    textColor: '#fff'
                });
            marker[i] = new BMap.Marker(point, {icon: myIcon2});
            map.addOverlay(marker[i]);

        } else if ((popFree / popAllnum) > 0.3) {
            var myIcon3 = new BMap.Icon("../img/parkicon_3.png",
                new BMap.Size(24, 29), {
                    offset: new BMap.Size(10, 29),
                    textColor: '#fff'
                });
            marker[i] = new BMap.Marker(point, {icon: myIcon3});
            map.addOverlay(marker[i]);

        }

        marker[i].parkNo = parkData[i].parkNo;
        marker[i].newpoiX = parkData[i].pointX;
        marker[i].newpoiY = parkData[i].pointY;
        marker[i].Allnum = parkData[i].allnum;
        marker[i].Free = parkData[i].free;
        marker[i].parkName = parkData[i].parkName;

        marker[i].addEventListener("mouseover", function (n) {

            var newpoiY = n.target.newpoiY;
            var parkNo = n.target.parkNo;
            var parkName = n.target.parkName;
            var newpoiX = n.target.newpoiX;
            var freepop = Number(n.target.Free);
            var allnumpop = Number(n.target.Allnum);
            var req = {
                sysCode: sysComm.sysCode,
                cityId: sysComm.cityId,
                plNos: [parkNo]
            }

            var opt = {
                method: "post",
                data: JSON.stringify(req),
                url: dataUrl.util.queryParkFreeBerthsByPkNos(),
                success: function (res, xhr, status) {
                    if (res.code == '8888') {
                        freepop = res.data[parkNo];
                        addInfoWindow(parkNo, parkName, freepop, allnumpop, newpoiX, newpoiY)
                    }
                }
            }
            sysAjax(opt);
        });
        marker[i].addEventListener("mouseout", function () {
            closeInfoWindow();
        })
    }
    removeCluster(marker);
}
function removeCluster(marker) {
    if (clear_flag) {
        markerClusterer.clearMarkers();         //此步骤需要
    }
    markerClusterer = new BMapLib.MarkerClusterer(map,
        {
            markers: marker,
            styles: [{
                url: '../img/parkicon_culter.png',
                size: new BMap.Size(68, 67)
            }],
        });
    markerClusterer.setMaxZoom(13);
    clear_flag = true;
}


function closeInfoWindow() {
    $(".parkpop-content").css('display', 'none');
}
//停车场信息弹窗
function addInfoWindow(parkNo, parkName, freepop, allnumpop, newpoiX, newpoiY) {
    $('.BMapLabel').empty();
    var parkNo = parkNo;
    var poix = newpoiX;
    var poiy = newpoiY;
    var freepop = freepop;
    var allnumpop = allnumpop;
    var point = new BMap.Point(poix, poiy);
    var myLabel = new BMap.Label('<div class="parkpop-content">' +
        '<div class="parkpop-main clearfix">' +
        '<div class="rightt-icon"></div>' +
        '<div class="pop-freecontnum clearfix"><div class="free-titfree">空闲车位数</div><div id="free-num" class="free-num">' + freepop + '</div></div>' +
        '<div class="pop-freecontall clearfix"><div class="free-titall">总车位数</div><div id="free-allnum" class="free-allnum">' + allnumpop + '</div></div>' +
        '<div id="pop-freebot" class="pop-freebot">' + parkName + '</div>' +
        '</div></div>', {
        offset: new BMap.Size(30, -85),                  //label的偏移量，为了让label的中心显示在点上
        position: point
    });

    myLabel.setStyle({
            color: "#F0F0F0",
            fontSize: "12px",
            padding: "5px",
            whiteSpace: "normal",
            backgroundColor: "rgba(0, 0, 0, 0)",
            border: "0px",
            zIndex: "1000"
        }
    );
    console.log(1111)
    map.addOverlay(myLabel);
    console.log(2222)
}
drawMarker();
//当前行政区域划分
function getBoundary(name) {
    var bdary = new BMap.Boundary();
    map.clearOverlays();
    bdary.get(name, function (rs) {
        // console.log(name)//获取行政区域
        // console.log(rs)
        var count = rs.boundaries.length; //行政区域的点有多少个
        if (count === 0) {
            alert('未能获取当前输入行政区域');
            return;
        }
        var pointArray = [];
        for (var i = 0; i < count; i++) {

            var ply = new BMap.Polygon(rs.boundaries[i], {
                strokeWeight: 2,
                strokeColor: "#ee07db",
                fillColor: '',
                fillOpacity: 0
            });                     //建立多边形覆盖物
            map.addOverlay(ply);  //添加覆盖物
            pointArray = pointArray.concat(ply.getPath());
        }
        map.setViewport(pointArray);    //调整视野

    });
}
// 获取位置
function theLocation(x, y, parkNo) {

    var new_point = new BMap.Point(x, y);
    map.panTo(new_point);
    map.centerAndZoom(new_point, 15);
    console.log(x + "," + y + "," + parkNo)

}
//点击停车场列表跳转至停车场详情页
$(document).on('click', '#list_con >li', function () {
    // console.log($(this).parent().parent().css);
    var x = $(this).find('.coordinate_x').text();
    var y = $(this).find('.coordinate_y').text();
    var parkNo = $(this).find(".coordinate_plNo").text();
    var dom = '#detail-cont_' + parkNo;
    addInfoWindow(parkNo, x, y);
    console.log(2)
    theLocation(x, y, parkNo);
    console.log(1)
    $('#list_wrap').hide();
    $(dom).show();
    console.log(3)
})

$('#cont-callback').on('click', function () {

    $('#detail-cont').css("display", "none");
    $('#list_wrap').css("display", "block");
    drawMarker();
})

