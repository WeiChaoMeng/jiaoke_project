/**
 * Created by chenbiao on 2017/7/4.
 */
//下拉框
var clear_flag = false;
var guideLevel=['零','一','二','三','四','五','六','七'];

;(function ($) {
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
                var req= {
                sysCode:sysComm.sysCode,
                cityId:sysComm.cityId
            	};
		        var queryNextLowerLeverById= {
		            method: "post",
		            url: dataUrl.util.queryNextLowerLeverById(),
		            data: JSON.stringify(req),
		            contentType: 'application/json; charset=utf-8',
		            dataType:'json',
		            success: function(res){
		                if(res.code == '8888'){


		                    var result = res.data;
		                    console.log(result);
		                    
		                   	$('#select01').empty();
							$.each(result,function(i,item){
								for(var key in item){
									console.log(key)
									$('#select01').append('<option value="'+key+'">'+item[key]+'</option>')
								}
							});
		                   	$("#select01").M_select({

		                    "Title": "行政区划",
		                    "inputName": "selected1_value",
		                    // 默认选中的值（参数值写需要选中的select的value值）
		                    "selected": "923",
		                    Succee: function () {
		                        console.log($("input[name='selected1_value']").attr('value'));
		                        // var checktext;
		                         checkText = $(".sel-title").eq(0).text();
		                        if (checkText == "全部") {
		                            checktext = "赤峰市"
		                        } else if (checkText == "其他") {
		                            // map.clearOverlays();
		                            checktext = "赤峰市";
		                        } else {
		                            checktext = "赤峰市" + checkText;
		                        }
		                        getBoundary(checktext);
                                console.log(111)
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

        // $('#guide_con').show();

        $('#list_wrap').show();
        //计算 $('#list_wrap')自适应高度
        if ($('#list_con >li').length >= 1) {

            list_wrap_height();
        } else {
            $('#list_wrap').css('height', 'auto');
        }

        console.log('请求数据ajax');
    }
    //搜索
    //调接口后删除str
    //list_wrap_height();
    //调接口后删除end
    function serfun() {

        $('#callBackPager').show();
        $("#list_wrap").find('#list_con').empty();
        var ser_text = $.trim($('#ser_text').val());
        var area_text = $("input[name='selected1_value']").attr('value');
        var level_text = $("input[name='selected2_value']").attr('value');
        if (ser_text || area_text || level_text) {

            var areaCodes = [];
            var levels = [];
            var queryStr;
            if (ser_text) {
                queryStr = ser_text;
            }
            if (area_text) {
                areaCodes = area_text.split(',');
            }
            if (level_text) {
                levels = level_text.split(',');
            }
            var cond = {
                queryStr: queryStr,
                areaCodes: areaCodes,
                dataState:1,
                levels: levels
            };
            //console.log(JSON.stringify(cond))
            //如果选择了诱导级别，则诱导统计不在展示
            if (undefined == levels || null == levels || levels.length == 0 || levels[0] == '04') {
                levels=[];
                $("#guide_con").show();
            } else {
                $("#guide_con").hide();
            }

            if(!(undefined == ser_text || null == ser_text || ser_text == '' )){
                $("#guide_con").hide();
            }
            $.ajax({
                type: "post",
                url: dataUrl.util.statisticsGuideScreenLevelByAreaCodes(),
                data: JSON.stringify(cond),
                contentType: 'application/json; charset=utf-8',
                dataType: "json",
                success: function (data) {
                    console.log("level and num" + JSON.stringify(data))
                    if (data.code == '8888') {
                        $(".guide_number").each(function (index, value) {
                            $(this).text(0);
                        });
                        $.each(data.data, function (index, domEle) {
                            $('#guide_number_' + domEle.level).text(domEle.num);
                        });
                    }
                    createHtml();
                }
            });

            var cond1 = {
                queryStr: queryStr,
                areaCodes: areaCodes,
                dataState:1,
                levels: levels,
                pageNum: 1,
                pageSize: 10
            };
            var cond2 = {
                queryStr: queryStr,
                areaCodes: areaCodes,
                dataState:1,
                levels: levels
            };
            $.ajax({
                type: "post",
                url: dataUrl.util.listGuideScreenByAreaCodes(),
                data: JSON.stringify(cond1),
                contentType: 'application/json; charset=utf-8',
                dataType: "json",
                success: function (data) {
                    console.log(data)
                    if (data.code == '8888') {
                        $('#guide_total').text('');
                        if (null == data.data || null == data.data.pageTotals) {
                            if(clear_flag){
                                markerClusterer.clearMarkers();         //此步骤需要
                            }
                            $('#guide_total').text('');
                            //展示未查询到检索数据提示
                            $('#nodataInfo').show();
                            $('#callBackPager').css({'border-top': '0'})
                        } else {
                            //隐藏未查询到检索数据提示
                            $('#nodataInfo').hide();
                        	getGuideMapInfo(cond2);
                            $('#guide_total').append('诱导屏幕总计:<span class="guide_total_number" id="guide_total_number">'+data.data.pageTotals+'</span>');
                            $.each(data.data.dataList, function (index, domEle) {
                                //console.log(JSON.stringify(domEle))
                                var str = '<li>';
                                str += '<span class="coordinate_x" style="display: none">' + domEle.lonId + '</span>';
                                str += '<span class="coordinate_y" style="display: none">' + domEle.latId + '</span>';
                                str += '<span class="coordinate_guideNo" style="display: none">' + domEle.guideNo + '</span>';
                                str += '<ul class="fl list_item_ul">';
                                str += '<li>';
                                str += '<span class="space_span">' + (index + 1) + '.' + '</span>';
                                str += domEle.guideName == null ? "未知" : domEle.guideName;
                                str += '</li>';
                                str += '<li>';
                                str += '<span class="space_span"></span>停车场数:';
                                str += domEle.parkingNum == null ? "未知" : domEle.parkingNum
                                str += '</li>';
                                str += '<li>';
                                str += '<span class="space_span"></span>空闲车位总数:';
                                str += domEle.freeBerthNum == null ? "未知" : domEle.freeBerthNum
                                str += '</li>';
                                str += '<li>';
                                str += '<span class="space_span"></span>诱导级别:';
                                str += domEle.level == null ? "未知" : guideLevel[domEle.level]+'级'
                                str += '</li>';
                                str += '</ul>';
                                str += '<div class="fl list_item_img">';
                                str += '<img src="' + domEle.picturePath + '">';
                                str += '</div>';
                                str += '</li>';

                                //console.log(str)
                                $("#list_wrap").find('#list_con').append(str);
                            });
                            $('#callBackPager').css({'border-top': '1px solid #1c83f6'})
                        }

                    }
                    $('#callBackPager').extendPagination({
                        totalCount: data.data.pageTotals,
                        limit: 10,
                        callback: function (curr, limit, totalCount) {
                            //console.log("curr" + curr + " limit" + limit + "  totalCount" + totalCount)
                            var ser_text = $.trim($('#ser_text').val());
                            var area_text = $("input[name='selected1_value']").attr('value');
                            var level_text = $("input[name='selected2_value']").attr('value');

                            var areaCodes = [];
                            var levels = [];
                            var queryStr;
                            if (ser_text) {
                                queryStr = ser_text;
                            }
                            if (area_text) {
                                areaCodes = area_text.split(',');
                            }
                            if (level_text) {
                                levels = level_text.split(',');
                            }
                            //如果选择了诱导级别，则诱导统计不在展示
                            if (undefined == levels || null == levels || levels.length == 0 || levels[0] == '04') {
                                levels=[];
                                $("#guide_con").show();
                            } else {
                                $("#guide_con").hide();
                            }

                            if(!(undefined == ser_text || null == ser_text || ser_text == '' )){
                                $("#guide_con").hide();
                            }
                            var cond = {
                                queryStr: queryStr,
                                areaCodes: areaCodes,
                                dataState:1,
                                levels: levels,
                                "baseRequest": {
                                    "pageNum": curr,
                                    "pageSize": limit
                                }
                                /*pageNum: curr,
                                 pageSize: limit*/
                            };
                            //alert(JSON.stringify(cond));
                            $.ajax({
                                type: "post",
                                url: dataUrl.util.listGuideScreenByAreaCodes(),
                                data: JSON.stringify(cond),
                                contentType: 'application/json; charset=utf-8',
                                dataType: "json",
                                success: function (data) {
                                    //console.log(data)
                                    if (data.code == '8888') {
                                        /*$.each(data.data, function (index, domEle) {
                                         $('#guide_number_' + domEle.level).text(domEle.num);
                                         });*/
                                        /*guideData=[];
                                        guidanceMapInfo(data.data.dataList);*/
                                        $("#list_wrap").find('#list_con').html('');
                                        $.each(data.data.dataList, function (index, domEle) {
                                            //console.log(JSON.stringify(domEle))
                                            var str = '<li>';
                                            str += '<span class="coordinate_x" style="display: none">' + domEle.lonId + '</span>';
                                            str += '<span class="coordinate_y" style="display: none">' + domEle.latId + '</span>';
                                            str += '<span class="coordinate_guideNo" style="display: none">' + domEle.guideNo + '</span>';
                                            str += '<ul class="fl list_item_ul">';
                                            str += '<li>';
                                            str += '<span class="space_span">' + (index + 1) + '.' + '</span>';
                                            str += domEle.guideName == null ? "未知" : domEle.guideName;
                                            str += '</li>';
                                            str += '<li>';
                                            str += '<span class="space_span"></span>停车场数:';
                                            str += domEle.parkingNum == null ? "未知" : domEle.parkingNum
                                            str += '</li>';
                                            str += '<li>';
                                            str += '<span class="space_span"></span>空闲车位总数:';
                                            str += domEle.freeBerthNum == null ? "未知" : domEle.freeBerthNum
                                            str += '</li>';
                                            str += '<li>';
                                            str += '<span class="space_span"></span>诱导级别:';
                                            str += domEle.level == null ? "未知" : guideLevel[domEle.level]+'级'
                                            str += '</li>';
                                            str += '</ul>';
                                            str += '<div class="fl list_item_img">';
                                            str += '<img src="' + domEle.picturePath + '">';
                                            str += '</div>';
                                            str += '</li>';

                                            //console.log(str)
                                            $("#list_wrap").find('#list_con').append(str);
                                        });
                                    }

                                }
                            });
                        }
                    });

                    createHtml();
                }
            });
        }
        else{
        	$('#guide_total').text('');
        	$('#callBackPager').hide();
        	$('#list_wrap').css('height','auto');
        }
    }

    $('#ser_btn').on('click', function () {
        /*checkText = $(".sel-title").eq(0).text();
        if (checkText == "全部") {
            checktext = "赤峰市"
        } else if (checkText == "其他") {
            // map.clearOverlays();
            checktext = "赤峰市";
        } else {
            checktext = "赤峰市" + checkText;
        }
        getBoundary(checktext);*/
        serfun();
    })


});


//地图调用 sta

var map; //Map实例
//后台传过来
var currentLat = 118.922316;
var currentLon = 42.25953;
var my = {title: "万达广场"};
//数据
var guideData = [];
//地图数据加载



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
    var guideNo = null;//编号
    var popLevel = null;//诱导级别
    var popRule = null;//空闲车位

    for (var i = 0; i < guideData.length; i++) {
        newpoiX = guideData[i].pointX;
        newpoiY = guideData[i].pointY;
        guideNo = guideData[i].guideNo;
        popLevel = guideData[i].level;
        popRule = guideData[i].rule;
        //console.log(popLevel);
        var point = new BMap.Point(newpoiX, newpoiY);
        // addMarker(point)
        var newRule = popRule;

        if (newRule == 0) {
            var myIcon = new BMap.Icon("../img/guidance_1.png",
                new BMap.Size(28, 24), {
                    offset: new BMap.Size(0, 24),
                    textColor: '#fff'
                });
            marker[i] = new BMap.Marker(point, {icon: myIcon});
            map.addOverlay(marker[i]);
        } else if (newRule <= 0.3 && newRule > 0) {
            var myIcon2 = new BMap.Icon("../img/guidance_2.png",
                new BMap.Size(28, 24), {
                    offset: new BMap.Size(0, 24),
                    textColor: '#fff'
                });
            marker[i] = new BMap.Marker(point, {icon: myIcon2});
            map.addOverlay(marker[i]);

        } else if (newRule > 0.3) {
            var myIcon3 = new BMap.Icon("../img/guidance_3.png",
                new BMap.Size(28, 24), {
                    offset: new BMap.Size(0, 24),
                    textColor: '#fff'
                });
            marker[i] = new BMap.Marker(point, {icon: myIcon3});
            map.addOverlay(marker[i]);

        }



        marker[i].popLevel = guideData[i].level;
        marker[i].guideNo = guideData[i].guideNo;
        marker[i].newpoiX = guideData[i].pointX;
        marker[i].newpoiY = guideData[i].pointY;
        marker[i].rule = guideData[i].rule;

        marker[i].addEventListener("click", function (n) {

            var newpoiY = n.target.newpoiY;
            var guideNo = n.target.guideNo;
            var newpoiX = n.target.newpoiX;
            var popLevel = Number(n.target.popLevel);
            var rule=n.target.rule;
            if (rule == 0) {
                var myIcon = new BMap.Icon("../img/guidance_1.png",
                    new BMap.Size(32, 27), {
                        offset: new BMap.Size(0, 27),
                        textColor: '#fff'
                    });
                marker[i] = new BMap.Marker(point, {icon: myIcon});
                // map.addOverlay(marker[i]);
            } else if (rule <= 0.3 && rule > 0) {
                var myIcon2 = new BMap.Icon("../img/guidance_2.png",
                    new BMap.Size(32, 27), {
                        offset: new BMap.Size(0, 27),
                        textColor: '#fff'
                    });
                marker[i] = new BMap.Marker(point, {icon: myIcon2});
                // map.addOverlay(marker[i]);

            } else if (rule > 0.3) {
                var myIcon3 = new BMap.Icon("../img/guidance_3.png",
                    new BMap.Size(32, 27), {
                        offset: new BMap.Size(0, 27),
                        textColor: '#fff'
                    });
                marker[i] = new BMap.Marker(point, {icon: myIcon3});
                // map.addOverlay(marker[i]);

            }

            addInfoWindow(guideNo, popLevel, newpoiX, newpoiY)

        });

    };
    removeCluster(marker);

}
function  removeCluster(marker) {
    if(clear_flag){
        markerClusterer.clearMarkers();         //此步骤需要
    }
     markerClusterer = new BMapLib.MarkerClusterer(map,
        {
            markers:marker,
            styles : [{
                url:'../img/poly_icon.png',
                size: new BMap.Size(68, 67)
            }],
        });
    markerClusterer.setMaxZoom(13);
    clear_flag = true;
}
map.addEventListener("click", function () {
    colseInfoWindow()
});
function colseInfoWindow() {
    $(".pop-common").css("display", "none");
}
//三个级别诱导弹窗
function addInfoWindow(guideNo, popLevel, newpoiX, newpoiY) {
    var guideNO = guideNo;
    var level = Number(popLevel);
    var point = new BMap.Point(newpoiX, newpoiY);
    var req = {
        guideNo: guideNO,
        sysCode: sysComm.sysCode
    };
    var opt = {
        data: JSON.stringify(req),
        url: dataUrl.util.getGuideScreenInfo(),
        method: "POST",
        success: function (res, status, xhr) {
            var data = res.data;
            if (res.code === "8888") {
                level = data.level;
                if (1 == level) {
                    alertFirstLevelGuideInfo(data, point);
                } else if (2 == level) {
                    alertSecondLevelGuideInfo(data, point);
                } else if (3 == level) {
                    alertThridLevelGuideInfo(data, point);
                } else {
                    alert("未知的诱导屏等级 level=" + level);
                }
            } else {
                alert("服务请求报错:code=" + res.code + "errMsg=" + res.msg + "-" + res.errMsg);
            }


        }
    }

    sysAjax(opt);
    $('.BMapLabel').empty();


}

//弹出一级诱导信息
function alertFirstLevelGuideInfo(data, point) {
    var guideHtml = '<div id="guidance1-pop" class="guidance1-pop pop-common">' +
        '<div class="pop-content1" style="background:url(' + data.filePath + ')"></div>'
    var configs = data.configs;
    if (configs) {
        $.each(configs, function (index, item) {
            //空余车位数
            var freeNum = item.freeNum == undefined || item.freeNum == null ? 0 : item.freeNum;
            var allBerthNum = item.allBerthNum == undefined || item.allBerthNum == null ? 1 : item.allBerthNum;
            var rate = freeNum / allBerthNum * 100;
            var classStyle;

            if (rate < 1) {
                //车位已满
                classStyle = 'num-full';
            } else if (rate <= 30) {
                //车位不多
                classStyle = 'num-few';
            } else {
                //车位充足
                classStyle = 'num-free';
            }

            guideHtml += '<span class="' + classStyle + '" id="num-full" style="top: ' + item.freeHeight + 'px;left: ' + item.freeWidth + 'px;">' + freeNum + '</span>'

        })
    }
    // '<span class="num-full" id="num-full" style="top: 20px;left: 40px;">280</span>' +
    // '<span class="num-few" id="num-few" style="top:60px ;left:40px ;">80</span>' +
    // '<span class="num-free" id="num-free" style="top:95px ;left: 40px;">20</span>' +

    guideHtml += '<div class="height24"></div>' +
        '<div id="pop-close1" class="pop-close"></div>' +
        '</div>';

    var myLabel1 = new BMap.Label(guideHtml, {
        offset: new BMap.Size(60, -180),                  //label的偏移量，为了让label的中心显示在点上
        position: point
    });
    myLabel1.setStyle({
        color: "#F0F0F0",
        fontSize: "12px",
        //height: "220px",
        // width: "350px",
        padding: "5px",
        whiteSpace: "normal",
        //fontFamily: "微软雅黑",
        zIndex: "1000",
        backgroundColor: "rgba(0, 0, 0, 0)",
        border: "0px"
    });
    map.addOverlay(myLabel1, point);
    map.panTo(point);
}
//弹出二级诱导信息
function alertSecondLevelGuideInfo(data, point) {
    var guideInfos = data.guideInfos;
    var guideHtml = '<div id="guidance2-pop" class="guidance2-pop pop-common"><div class="pop-content"><div class="pop-topcontent"><div class="topcontent-main"><span class="zte-logo"></span><span class="park-picon"></span></div></div><div class="pop-bottomcontent">';
    if (null != guideInfos) {
        $.each(guideInfos, function (index, item) {
            guideHtml += '<div class="bottom-style">' +
                '<div id="bot-tit1" class="bot-tit">' + item.plName + '</div>' +
                '<div class="bot-right">';
            if (item.guidePoint == 1) {
                guideHtml += '<div id="bot-icon" class="left-icon"></div>'
            } else if (item.guidePoint == 2) {
                guideHtml += '<div id="bot-icon" class="right-icon"></div>'
            } else if (item.guidePoint == 3) {
                guideHtml += '<div id="bot-icon" class="around-icon"></div>'
            } else if (item.guidePoint == 4) {
                guideHtml += '<div id="bot-icon" class="run-icon"></div>'
            }
            guideHtml += '<div class="height20"></div>' +
                '<div id="space-firstnum" class="bot-num space-firstnum">' + item.freeNum + '</div> </div></div>'
        })
    }
    guideHtml += '</div></div><div class="height24"></div><div id="pop-close2" class="pop-close"></div></div>';
    var myLabel2 = new BMap.Label(guideHtml, {
        offset: new BMap.Size(60, -180),                  //label的偏移量，为了让label的中心显示在点上
        position: point
    });
    myLabel2.setStyle({
        color: "#F0F0F0",
        fontSize: "12px",
        //height: "220px",
        // width: "350px",
        padding: "5px",
        whiteSpace: "normal",
        //fontFamily: "微软雅黑",
        zIndex: "1000",
        backgroundColor: "rgba(0, 0, 0, 0)",
        border: "0px"
    });
    map.addOverlay(myLabel2, point);
    map.panTo(point);
}
//弹出三级诱导信息
function alertThridLevelGuideInfo(data, point) {
    //是否有限高提示
    var highLimitStatus = data.highLimitStatus;
    //是否有急转弯提示
    var sharpTurnStatus = data.sharpTurnStatus;
    //是否有楼层指示
    var floorStatus = data.floorStatus;
    //时间制式
    var timeSystem = data.timeSystem + '';

    var guideHtml = '<div id="guidance3-pop" class="guidance3-pop pop-common">' +
        '<div class="pop-content3">' +
        '<div class="pop-topcontent3">' +
        '<div class="topcontent-main3">' +
        '<span class="zte-logo3"></span>' +
        '<span class="park-picon3"></span>' +
        '</div>' +
        '</div>' +
        '<div class="pop-bottomcontent3 clearfix">' +
        '<div class="bottom-style3  bg202020">' +
        '<div class="bottom3-left"><span id="upper-case" class="upper-case">' + (data.floor == null ? '--' : data.floor ) + '</span>层</div>' +
        '<div class="width15"></div>' +
        '<div class="bottom3-mid">空闲</div>' +
        '<div class="bottom3-right">' + (data.freeNum == null ? '0' : data.freeNum ) + '</div>' +
        '</div> '
    //判断是否有楼层限高
    if (highLimitStatus == 1) {
        guideHtml += '<div class="maxheight-2m"><span class="maxheight-tit">' + data.highLimitNum + '</span></div>'
    }
    //判断时间营业时间，
    if (null != timeSystem) {
        if (timeSystem.length > 6) {
            guideHtml += '<div class="time-hour"><div class="time-num1">' + timeSystem + '</div></div>'
        } else {
            guideHtml += '<div class="time-24h"></div>'
        }
    }

    if (sharpTurnStatus == 1) {
        guideHtml += '<div class="now-turn"></div>'
    }

    guideHtml += '</div></div><div class="height24"></div><div id="pop-close3" class="pop-close"></div></div>'

    var myLabel3 = new BMap.Label(guideHtml, {
        offset: new BMap.Size(60, -180),                  //label的偏移量，为了让label的中心显示在点上
        position: point
    });
    myLabel3.setStyle({
        color: "#F0F0F0",
        fontSize: "12px",
        //height: "220px",
        // width: "350px",
        padding: "5px",
        whiteSpace: "normal",
        zIndex: "1000",
        backgroundColor: "rgba(0, 0, 0, 0)",
        border: "0px"
    });
    map.addOverlay(myLabel3, point);
    map.panTo(point);
}


//当前行政区域划分
function getBoundary(name) {
    var bdary = new BMap.Boundary();
    map.clearOverlays();
    bdary.get(name, function (rs) {
        console.log(name)//获取行政区域
        console.log(rs)
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
        // map.setMaxZoom(13);
    });

}

// 获取位置
function theLocation(x, y, guideNo) {
    //map.clearOverlays();
    var new_point = new BMap.Point(x, y);
    map.panTo(new_point);
    map.centerAndZoom(new_point, 15);
    addInfoWindow(guideNo, null, x, y);

}
//点击左侧列表显示相应诱导icon
$(document).on('click', '#list_con >li', function () {
    var x = $(this).find('.coordinate_x').text();
    var y = $(this).find('.coordinate_y').text();
    var guideNo = $(this).find('.coordinate_guideNo').text();
    theLocation(x, y, guideNo)
});


//关闭弹窗
$(document).delegate(".pop-close", 'click', function () {
    $(".pop-common").css("display", "none");
})

//获取地图上诱导屏的信息
function getGuideMapInfo(cond) {
    
    $.ajax({
        type: "post",
        url: dataUrl.util.listGuideScreenForMap(),
        data: JSON.stringify(cond),
        contentType: 'application/json; charset=utf-8',
        dataType: "json",
        success: function (data) {
            if (data.code == '8888') {
                guidanceMapInfo(data.data.dataList);
            }
            else {
                alert("服务请求报错:code=" + data.code + "errMsg=" + data.msg + "-" + data.errMsg);
            }
        }
    });
}

//将诱导屏位置数据放入List中
function guidanceMapInfo(data) {

    map.clearOverlays();
    guideData = [];
    console.log(data)
    $.each(data, function (index, domEle) {
        var freeBerthNum = domEle.freeBerthNum;
        var berthNum = domEle.berthNum;
        if (freeBerthNum == null) {
            freeBerthNum = 0;
        }
        if (berthNum == null || berthNum == 0) {
            freeBerthNum = 0;
            berthNum = 1;
        }
        guideData.push({
            'guideNo': domEle.guideNo, 'pointX': domEle.lonId, 'pointY': domEle.latId,
            'level': domEle.level, 'rule': freeBerthNum / berthNum
        });
    })
    //console.log("地图上的数据" + JSON.stringify(guideData));
    //加载地图位置气泡
    drawMarker();
};

