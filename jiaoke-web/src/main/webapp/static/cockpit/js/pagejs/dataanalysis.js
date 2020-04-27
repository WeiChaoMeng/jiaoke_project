
//下拉框

 
    (function () {

        $('#date_time_con').text(moment().subtract('days', 1).format('YYYY-MM-DD')+ '  -  ' + moment().subtract('days', 1).format('YYYY-MM-DD'))
        $('#daterange-btn').daterangepicker({
                "linkedCalendars": false,
                startDate:moment().subtract('days', 1),
                endDate:moment().subtract('days', 1),
                opens : 'left', //日期选择框的弹出位置
                autoUpdateInput:false,
                ranges: {
                    '昨天': [moment().subtract('days', 1), moment().subtract('days', 1)],
                    '最近一周': [moment().subtract('days', 7), moment().subtract('days', 1)],
                    '最近一个月': [moment().subtract('months', 1), moment().subtract('days', 1)],
                    '最近三个月': [moment().subtract('months', 3), moment().subtract('days', 1)],
                },
                maxDate : moment().subtract('days', 1), //最大时间
            },
            function(start, end) {
                $('#daterange-btn #date_time_con').html(start.format('YYYY-MM-DD') + ' - ' + end.format('YYYY-MM-DD'));
                
                //alert(start.format('YYYYMMDD') + " - " + end.format('YYYYMMDD'));
                fun.init();
                fun.pieChartInit(start.format('YYYY-MM-DD'),end.format('YYYY-MM-DD'));
                fun.statisticalChartInit(start.format('YYYY-MM-DD'),end.format('YYYY-MM-DD'));
                // loadData(moment().subtract('days', 1).format('YYYY-MM-DD'),moment().subtract('days', 1).format('YYYY-MM-DD'));
            }
        );
        $('#daterange-btn').on('show.daterangepicker', function(ev, picker) {
            //do something, like clearing an input

            if(picker.chosenLabel == '自定义'){
                $('.daterangepicker').removeClass('show-calendar');
            }
        });
        $('#daterange-btn').on('hide.daterangepicker', function(ev, picker) {
            //do something, like clearing an input
            if(picker.chosenLabel == '自定义'){
                $('.daterangepicker').removeClass('show-calendar');

            }

        });

         //饼图
         var pie_option = {
                    tooltip : {
                        trigger: 'item',
                        formatter: "{b} : {c}个 ({d}%)"
                    },
                    series : [
                        {

                            type:'pie',
                            radius : '65%',
                            center: ['50%', '50%'],
                            data:[
                                {
                                    value:10,
                                    name:'路内停车场',
                                    itemStyle: {
                                        normal: {
                                            label: {
                                                show: true,
                                                textStyle: {
                                                    fontSize: 15,
                                                    fontWeight: "bold"
                                                },
                                                position: "center"
                                            },
                                            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                                offset: 0,
                                                color: 'rgba(248,141,6,.9)'
                                            }, {
                                                offset: 1,
                                                color: 'rgba(238,4,224,.9)'
                                            }])
                                        }
                                    },
                                    label: {
                                        normal: {
                                            position: 'outside',
                                            textStyle: {
                                                color: '#bdd7fe',
                                                fontSize: 14
                                            },
                                            formatter: '{c}个 占比{d}%\n{b}'
                                        }
                                    },
                                    labelLine: {
                                        normal: {
                                            show: true,
                                            length: 5,
                                            length2: 5,
                                            smooth: false,
                                            lineStyle: {
                                                width: 1,
                                                color: 'rgba(238,4,224,.9)',
                                            }
                                        }
                                    }
                                },
                                {
                                    value:10,
                                    name:'路外停车场',
                                    itemStyle: {
                                        normal: {
                                            borderWidth:1,
                                            borderColor:'#071c84',
                                            shadowBlur:'10',
                                            shadowColor:'#071c84',
                                            shadowOffsetX:-5,
                                            label: {
                                                show: true,
                                                textStyle: {
                                                    fontSize: 15,
                                                    fontWeight: "bold"
                                                },
                                                position: "center"
                                            },
                                            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                                offset: 0,
                                                color: 'rgba(74,104,253,1)'
                                            }, {
                                                offset: 1,
                                                color: 'rgba(74,104,253,.3)'
                                            }])
                                        }
                                    },
                                    label: {
                                        normal: {
                                            position: 'outside',
                                            textStyle: {
                                                color: '#bdd7fe',
                                                fontSize: 14
                                            },
                                            formatter: '{c}个 占比{d}%\n{b}'
                                        }
                                    },
                                    labelLine: {
                                        normal: {
                                            show: true,
                                            length: 10,

                                            smooth: false,
                                            lineStyle: {
                                                width: 1,
                                                color: 'rgba(74,104,253,1)',
                                            }
                                        }
                                    }
                                },

                            ],
                            // roseType: 'radius',
                            label: {
                                normal: {
                                    textStyle: {
                                        color: 'rgba(255, 255, 255, 0.3)'
                                    }
                                }
                            },
                            labelLine: {
                                normal: {
                                    lineStyle: {
                                        color: 'rgba(255, 255, 255, 0.3)'
                                    },
                                    smooth: false,
                                    length: 10,
                                }
                            },
                            itemStyle: {
                                normal: {
                                    color: '#c23531',
                                    shadowBlur: 200,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            },

                            animationType: 'scale',
                            animationEasing: 'elasticOut',
                            animationDelay: function (idx) {
                                return Math.random() * 200;
                            }
                        }
                    ]
                };
        var pie_echarts = echarts.init(document.getElementById('pie_echarts'));
         //统计图
         var bar_option = {
                    tooltip : {
                        trigger: 'axis'
                    },
                    calculable : true,
                    xAxis : [
                        {
                            type : 'category',
                            data : ['商场','医院','小区','学校','写字楼','景区','交通场站','其他'],
                            axisLine:{
                                show:false,
                            },
                            axisTick:{
                                show:false,
                            },
                            axisLabel:{
                                textStyle:{
                                    color:'#bdd7fe',
                                }
                            }
                        }
                    ],
                    yAxis : [
                        {
                            show:false,
                            type : 'value',
                            axisTick:{
                                show:false,
                            },
                            axisLabel:{
                                show:false,
                            },
                            splitLine:{
                                show:false,
                            }
                        }
                    ],
                    series : [
                        {
                            barWidth:'50%',
                            name:'停车数量',
                            type:'bar',
                            data:[0, 0, 0,0, 0, 0,0, 0],
                            itemStyle: {
                                normal: {
                                    color: function(params) {
                                        // build a color map as your need.
                                        var colorList = [
                                            // '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
                                            // '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
                                            // '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
                                            {color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                                offset: 0,
                                                color: 'rgba(16,137,152,1)'
                                            }, {
                                                offset: 1,
                                                color: 'rgba(12,141,157,.4)'
                                            }])},
                                            {color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                                offset: 0,
                                                color: 'rgba(0,191,109,1)'
                                            }, {
                                                offset: 1,
                                                color: 'rgba(0,191,109,.4)'
                                            }])},
                                            {color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                                offset: 0,
                                                color: 'rgba(255,254,29,1)'
                                            }, {
                                                offset: 1,
                                                color: 'rgba(255,248,26,.4)'
                                            }])},
                                            {color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                                offset: 0,
                                                color: 'rgba(248,143,6,1)'
                                            }, {
                                                offset: 1,
                                                color: 'rgba(248,143,6,.4)'
                                            }])},
                                            {color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                                offset: 0,
                                                color: 'rgba(74,104,253,1)'
                                            }, {
                                                offset: 1,
                                                color: 'rgba(74,104,253,.4)'
                                            }])},
                                            {color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                                offset: 0,
                                                color: 'rgba(250,5,218,1)'
                                            }, {
                                                offset: 1,
                                                color: 'rgba(250,5,218,.4)'
                                            }])},
                                            {color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                                offset: 0,
                                                color: 'rgba(0,204,255,1)'
                                            }, {
                                                offset: 1,
                                                color: 'rgba(0,204,255,.4)'
                                            }])},
                                            {color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                                offset: 0,
                                                color: 'rgba(249,49,59,1)'
                                            }, {
                                                offset: 1,
                                                color: 'rgba(246,86,94,.4)'
                                            }])},
                                        ];
                                        return colorList[params.dataIndex].color
                                    },label: {
                                        show: true,
                                        position: 'top',
                                        formatter: '{c}'
                                    }
                                }
                            }
                        }
                    ]
                };
               var bar_echarts = echarts.init(document.getElementById('bar_echarts'));
        var fun = {
        	 /**初始化*/
            init : function () {
            	   
                pie_echarts.setOption(pie_option,true);
              
                bar_echarts.setOption(bar_option,true);
                
                window.onresize = function () {
                    pie_echarts.resize();
                    bar_echarts.resize();
                };
            },
            /**加载饼图 .*/
           pieChartInit:function  (beginTime,endTime) {
           	    var req={
				   beginTime:new Date(beginTime+' 00:00:00'.replace(new RegExp(/-/gm) ,"/")),
                   endTime:new Date(endTime+ ' 23:59:59'.replace(new RegExp(/-/gm) ,"/")),
				   provId: sysComm.provId,
				    cityId: sysComm.cityId,
				   sysCode:sysComm.sysCode
				 };
           	     //发起ajax请求
           	     sysAjax({
           	     	 method: "post",
                     url: dataUrl.util.getPieChartURL(),
                     data: JSON.stringify(req),
                    contentType: 'application/json; charset=utf-8',
                    dataType:'json',
                    success: function(res){
                    	   var data = res.data;
                    	   if(data != null &&data.length >0){
                    	   	        //添加数据
		                    	   $.each(data, function(index,row) {
		                    	   	   if(1==row.plType){
		                    	   	   	  pie_option.series[0].data[1].value=row.currentParkCount;
		                    	   	   	   pie_option.series[0].data[1].name=row.plTypeName;
		                    	   	   }else{
		                    	   	   	 pie_option.series[0].data[0].value=row.currentParkCount;
		                    	   	   	  pie_option.series[0].data[0].name=row.plTypeName;
		                    	   	   }
		                    	   });
		                    	   
		                    	   if(data[0].currentParkCount > data[1].currentParkCount ){
		                    	   	    $('#pie_chart').text(data[0].plTypeName);
		                    	   }else{
		                    	   	  $('#pie_chart').text(data[1].plTypeName);
		                    	   }
		                    	    pie_echarts.setOption(pie_option,true); //重新渲染
		                    	   	
                    	   }//if
                    	  
                    }
           	     });
           },
           /**统计图.*/
          statisticalChartInit:function(beginTime,endTime){
          	    var req={
				   beginTime:new Date(beginTime+' 00:00:00'.replace(new RegExp(/-/gm) ,"/")),
                   endTime:new Date(endTime+ ' 23:59:59'.replace(new RegExp(/-/gm) ,"/")),
				   provId: sysComm.provId,
				    cityId: sysComm.cityId,
				   sysCode:sysComm.sysCode
				 };
           	     //发起ajax请求
           	      sysAjax({
           	     	 method: "post",
                     url: dataUrl.util.getStatisticalChar(),
                     data: JSON.stringify(req),
                    contentType: 'application/json; charset=utf-8',
                    dataType:'json',
                    success: function(res){
                    	  
                    	   var data = res.data;
                    	    var returnName=new Array();
                    	    var returnData=new Array();
	                    	   if(data != null && data.length >0){
	                    	   	  $.each(data, function(index,row) {
	                    	   	  	   returnName[index] = row.busiCircleName;
	                    	   	  	   returnData[index] = row.currentParkCount;
	                    	   	  });
	                    	   	  bar_option.xAxis[0].data=returnName;
	                    	   	  bar_option.series[0].data=returnData;
	                    	   }
	                    	    bar_echarts.setOption(bar_option);
	                    	    //
	                    	   var maxValueIndex = 0;
	                    	   var maxValue = 0;
	                    	   if(returnData != null && returnData.length >0){
	                    	   	   $.each(returnData, function(index,row) {
	                    	   	     if( row >maxValue ){
	                    	   	     	 maxValue = row;
	                    	   	     	 maxValueIndex=index;
	                    	   	     }
	                    	       });
	                    	       $('#statistical_chart').text(returnName[maxValueIndex]);
	                    	   }
	                    	  
                    	 }//function
           	     });
          },
          /**生成轨迹.*/
         addParkingTrack:function(){
         	
         }
        };
         fun.init();
         fun.pieChartInit(moment().subtract('days', 1).format('YYYY-MM-DD'),moment().subtract('days', 1).format('YYYY-MM-DD'));
         fun.statisticalChartInit(moment().subtract('days', 1).format('YYYY-MM-DD'),moment().subtract('days', 1).format('YYYY-MM-DD'));
         fun.addParkingTrack();

         //表格。。。。。。
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
                            $(ser_object).parent().parent().find(".sel-float-box").css("height", '155');
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
        $("#select02").M_select({

            "Title": "车牌号",
            "inputName": "selected2_value",
            // 默认选中的值（参数值写需要选中的select的value值）
            "selected": "",
            Succee: function () {
                // alert()
            }
        });
        $('#date_time_ser').text(moment().subtract('days', 1).format('YYYY-MM-DD')+ '  -  ' + moment().subtract('days', 1).format('YYYY-MM-DD'))
        $('#daterange-btn-ser').daterangepicker({
                "linkedCalendars": false,
                startDate:moment().subtract('days', 1),
                endDate:moment().subtract('days', 1),
                opens : 'left', //日期选择框的弹出位置
                autoUpdateInput:false,
                ranges: {
                    '昨天': [moment().subtract('days', 1), moment().subtract('days', 1)],
                    '最近一周': [moment().subtract('days', 7), moment().subtract('days', 1)],
                    '最近一个月': [moment().subtract('months', 1), moment().subtract('days', 1)],
                    '最近三个月': [moment().subtract('months', 3), moment().subtract('days', 1)],
                },
                maxDate : moment().subtract('days', 1), //最大时间
            },
            function(start, end) {
                $('#daterange-btn-ser #date_time_ser').html(start.format('YYYY-MM-DD') + ' - ' + end.format('YYYY-MM-DD'));
                //alert(start.format('YYYYMMDD') + " - " + end.format('YYYYMMDD'));
                //fun.init();

            }
        );
        $('#daterange-btn-ser').on('show.daterangepicker', function(ev, picker) {
            //do something, like clearing an input

            if(picker.chosenLabel == '自定义'){
                $('.daterangepicker').removeClass('show-calendar');
            }
        });
        $('#daterange-btn-ser').on('hide.daterangepicker', function(ev, picker) {
            //do something, like clearing an input
            if(picker.chosenLabel == '自定义'){
                $('.daterangepicker').removeClass('show-calendar');

            }

        });
        loadData(moment().subtract('days', 1).format('YYYY-MM-DD'),moment().subtract('days', 1).format('YYYY-MM-DD'));
        //鼠标事件
        $('#table_control').on('click',function () {
            // $('#table_wrap').animate({right:"-400px"});
            var obj = $('#table_wrap');
            if($('#table_wrap').hasClass('hoverActive')){
                $('#table_wrap').removeClass('hoverActive');
                $('#table_wrap').animate({right:"0"});
                $('#table_control').css('background-image','url(../img/hover_arrow.png)');

            }else{
                obj.addClass('hoverActive');
                $('#table_wrap').animate({right:"-400px"});
                $('#table_control').css('background-image','url(../img/hover_arrow_left.png)');
            }
        });

        // function checkHover(e, target) {
        //     if (getEvent(e).type == "mouseover") {
        //         return !contains(target, getEvent(e).relatedTarget
        //                 || getEvent(e).fromElement)
        //             && !((getEvent(e).relatedTarget || getEvent(e).fromElement) === target);
        //     } else {
        //         return !contains(target, getEvent(e).relatedTarget
        //                 || getEvent(e).toElement)
        //             && !((getEvent(e).relatedTarget || getEvent(e).toElement) === target);
        //     }
        // }
        //
        // function contains(parentNode, childNode) {
        //     if (parentNode.contains) {
        //         return parentNode != childNode && parentNode.contains(childNode);
        //     } else {
        //         return !!(parentNode.compareDocumentPosition(childNode) & 16);
        //     }
        // }
        // //取得当前window对象的事件
        // function getEvent(e) {
        //     return e || window.event;
        // }
        // $('#table_wrap').mouseover(function (e) {
        //     if(checkHover(e,this)){
        //         var obj = $(this);
        //         obj.removeClass('hoverActive');
        //         obj.animate({right:"0"});}
        //
        // });
        // $('#table_wrap').mouseout(function (e) {
        //     if(checkHover(e,this)){
        //         var obj = $(this);
        //         obj.addClass('hoverActive');
        //         obj.animate({right:"-400px"});
        //     }
        //
        // });
        //搜索
        var pi = 1, ps = 10, loadFlag = false;
        var maxColumn =0;
         var arrayObj = new Array();　//创建一个数组 
        loadData(moment().subtract('days', 1).format('YYYY-MM-DD'),moment().subtract('days', 1).format('YYYY-MM-DD'));
        function loadData(beginTime,endTime,vplNumber) {
             if (loadFlag)
                     return;
             loadFlag = true;
             //查询参数
         	 var req={
				   beginTime:new Date(beginTime+' 00:00:00'.replace(new RegExp(/-/gm) ,"/")),
                   endTime:new Date(endTime+ ' 23:59:59'.replace(new RegExp(/-/gm) ,"/")),
				   provId: sysComm.provId,
				    cityId: sysComm.cityId,
				    vplNumber:vplNumber,
				   sysCode:sysComm.sysCode
				 };
				  //发起ajax请求
           	      sysAjax({
           	     	 method: "post",
                     url: dataUrl.util.queryParkingTrack(),
                     data: JSON.stringify(req),
                    contentType: 'application/json; charset=utf-8',
                    dataType:'json',
                    success: function(res){
                             if("8888" == res.code){
                                    $('#ser_result').empty()
			                    	   	   var data = res.data;
			                    	   	   console.log(data.parkingTrackMap)
			                    	   	   if(data.maxColumn!=null ){
			                    	   	   	    $("#table_main thead tr").empty();
			                    	   	   	   //1.动态生成列数
			                    	   	   	    maxColumn = data.maxColumn;
			                    	   	   	   if(maxColumn != null && maxColumn > 0){
			                    	   	   	   	   var tr='<td></td>  <td>车牌号</th>';
			                    	   	   	   	   for(var i=1;i<=maxColumn;i++){
			                    	   	   	   	   	    tr +='<td>停车点'+i+'</td>';
			                    	   	   	   	   }
			                    	   	   	   	  $("#table_main thead tr").html(tr);
			                    	   	   	   }
			                    	   	   	   //2.添加数据
			                    	   	   	   var parkingTrackMap = data.parkingTrackMap;
			                    	   	   	    var ii =0;
			                    	   	   	    arrayObj.splice(0,arrayObj.length);
                                              console.log(arrayObj); // 输出 []，空数组，即被清空了
                                            //清空表格数据
                                            $("#table_main tbody").empty();
	                    	   	   	   	      for(var key in parkingTrackMap){
	                    	   	   	   	      	       arrayObj[ii]  = parkingTrackMap[key];
	                    	   	   	   	      	       ii++;										
	                    	   	   	   	      }
									     if(arrayObj != null ){
									     	var tr = "<tr>";
									     	 //取前10条数据
												 	  for(var i =0;i<arrayObj.length;i++){
												 	  	     var arr = arrayObj[i];
												 	  	     var addClumNum =arr.length;
												 	  	     if(i <10){
												 	  	     	 $.each(arr, function(indexX,row) {
												 	  	     	 	 
													 			if(indexX == 0){
													 				 tr+="<td><input type='checkbox'  id='checkbox"+i+"' ><label for='checkbox"+i+"'></label></td>";
						                    	   	   	   	              tr+="<td>"+row.vplNumber+"</td>";
													 			}
													 			 tr+="<td   data-lat='"+row.lat+"' data-lon='"+row.lon+"' data-time='"+row.inTime+"'>"+row.inTime+"</td>";
													 		    });
													 		   if(data.maxColumn != null){
													 		   	 var addCl = data.maxColumn - addClumNum;//剩余列数
													 		   	 if(addCl >0){
													 		   	 	for(var yy=0;yy<addCl;yy++){
													 		   	 		tr+="<td ></td>";
													 		   	 	}
													 		   	 }
													 		   }
													 		 tr +="</tr>";
												 	  	     }
													 	  	
												 
												 	  }
												 		
												 
												 tr +="</tr>";
					                    	   	   $("#table_main tbody").append(tr);
									     }
			                    	   	   }else{
			                    	   	   	 $("#table_main tbody").empty();
                                               $('#ser_result').empty().append(' 没有查到纪录！')
			                    	   	   	 // if(vplNumber != null && vplNumber != ''){
			                    	   	   	 // 	$('#ser_result').empty().append(' 没有搜索到日期:<span class="ser_result_data">'+datatext+'</span>,车牌:<span class="ser_result_carnumber">'+carlice+car_license+'</span>的信息。')
			                    	   	   	 // }
			                    	   	   	  
			                    	   	   }
			                    	   	     loadFlag = false;
			                    	   	     pi++;
			                    	   }else{
			                    	   	 loadFlag = true;
			                    	   	  alert(res.msg);
			                    	   }
                         }
                  });//sysAjax
            
        };
        $('#ser_btn').on('click',function () {
            var datatext = $('#date_time_ser').text();
            if(datatext == null){
            	  alert("请选择日期");

            }else{
            	   var beginTime = datatext.substr(0,10);
               var endTime = datatext.substr(15,26);
            }
          
            //车牌第一个
            var carlice = $('.sel-title').text();
            //车牌后面
            var car_license = $.trim($('#car_license').val());
            var vplNumber = carlice+car_license;
            // if(!car_license){
            // 	       alert("请选择车牌号");
            // 	       return false;
            // }
            // if( carlice !== '车牌号'){
            // 	   alert("请输入牌号");
            // }
            // if(carlice=='车牌号'||!car_license){
            //     return false;
            // }

            if(carlice!='车牌号'&&(car_license!=null||car_license!=''||car_license!=undefined)){
            	   /**.调用ajax*/
                loadData(beginTime,endTime,vplNumber);
            }else if(carlice!='车牌号'&&(car_license==null||car_license==''||car_license==undefined)){
                loadData(beginTime,endTime,carlice);
            }else if(carlice==='车牌号'&&(car_license==null||car_license==''||car_license==undefined)){
                $('.modal-body').text("请选择车牌号或者输入车牌号");
                $('#myModal').modal('show');

                return false;
            }else if(carlice==='车牌号'&&(car_license!=null||car_license!=''||car_license!=undefined)){
                $('.modal-body').text("请选择车牌号");
                $('#myModal').modal('show');
                return false;
            }else {

            };


        });
        $('#table_container').on('scroll',function(){
              var pageStrartIndex = (pi -1) * ps;
			  var pageEndIndex = pi * ps -1;
              // alert(pi)
              if($('#table_container').scrollTop()>(156*(pi-1))){
                  console.log(pi)
                  if(arrayObj != null ){
                      var tr = "<tr>";
                      for(var i =pageStrartIndex;i<=pageEndIndex;i++){
                          if(arrayObj.length >= pageEndIndex){
                              console.log(pi +"=="+pageEndIndex);
                              var arr = arrayObj[i];
                               var addClumNum =arr.length;
                              $.each(arr, function(indexX,row) {
                                  if(indexX == 0){
                                      tr+="<td><input type='checkbox'  id='checkbox"+i+"' ><label for='checkbox"+i+"'></label></td>";
                                      tr+="<td>"+row.vplNumber+"</td>";
                                  }
                                  tr+="<td data-lat='"+row.lat+"' data-lon='"+row.lon+"' data-time='"+row.inTime+"'>"+row.inTime+"</td>";
                              });
                              if(maxColumn != null){
					 		   	 var addCl = maxColumn - addClumNum;//剩余列数
					 		   	 if(addCl >0){
					 		   	 	for(var yy=0;yy<addCl;yy++){
					 		   	 		tr+="<td ></td>";
					 		   	 	}
						           }
					 		   }
                              tr +="</tr>";
                          }else{

                          }

                      }//for
                      tr +="</tr>";
                      pi++;
                      $("#table_main tbody").append(tr);
                  }
              }

        
        });



    })();


//map地图

var map; //Map实例
//后台传过来
var currentLat = 118.922316;
var currentLon = 42.25953;
var my ={ title: "我的位置"};


map_init()
function map_init() {

    map = new BMap.Map("allmap", {enableMapClick: false});
//第1步：设置地图中心点，当前城市
    var point = new BMap.Point(currentLat,currentLon);
//第2步：初始化地图,设置中心点坐标和地图级别。
    map.centerAndZoom(point, 13);
//第3步：启用滚轮放大缩小
    map.enableScrollWheelZoom(true);

//第4步：设置地图风格
    map.setMapStyle({
        styleJson:[
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


};
$(document).on('click','#travel_btn',function(){

    dataInit()

});
function dataInit() {
    var markerArr = [];
    //var row =[];
    var checkedNum =0;
    var vplColor=['#ce2bec','#0bc788','#f4dc11','#1690f1','#f88b0a'];
    var vplImg=["../img/redicon_big.png","../img/greenicon_big.png","../img/yellowicon_big.png","../img/blueicon_big.png","../img/orangeicon_big.png"];
    map.clearOverlays();
    // console.log(markerArr)
    var tr = $("#table_main tbody").find('tr');
    $.each(tr, function() {
        var td = $(this).find('td');
        var ischecked =td.eq(0).find('input').is(':checked');
        if(ischecked){
            checkedNum ++;
        }
    });

    $.each(tr,function(ins,rows){
        var row =[];
        //markerArr.splice(0,markerArr.length);
        var td = $(this).find('td');
        var ischecked =td.eq(0).find('input').is(':checked');

        if(ischecked){
            if(td.eq(1).text() != null && td.eq(1).text() !=""){
                var vplNumber = td.eq(1).text();
                var stratClum =0;
                $.each(td, function(index,rows) {
                    if(index > 1){
                        if($(this).text() != null && $(this).text() != ""){
                            var lon = $(this).attr('data-lon'); //经度
                            var lat =$(this).attr('data-lat'); //纬度
                            var times = $(this).attr('data-time');
                            // row[i].title=times;
                            // row.vplNumber =vplNumber;
                            // row.point=lon+","+lat;
                            row.push({'title':times,'vplNumber':vplNumber,'point':lon+","+lat});
                            markerArr =row;
                            // console.log(markerArr)
                            stratClum++;

                        }
                    }
                });

            }
            drawMarker(markerArr,checkedNum);
        }
        //开始画线 markerArr
        //绘制点
    });
};
function  drawMarker(markerArr,checkedNum) {
    var points = new Array();

    for (var i = 0; i < markerArr.length; i++) {
        var p0 = markerArr[i].point.split(",")[0];
        var p1 = markerArr[i].point.split(",")[1];
        var point = new BMap.Point(p0, p1);

        points.push(point);
        var marker = addMarker(new window.BMap.Point(p0, p1), i);

        var newmarkerArr=markerArr[i];

        setTimeout(function () {
            toDrawdata(marker,newmarkerArr,checkedNum)
        },200)

    }

    drawPolyline(map, points);
}

function toDrawdata(marker,newmarkerArr,checkedNum) {
    var only_flag=true;
    if(checkedNum == 1){
        // setTimeout(function () {
            addInfoWindow(marker, newmarkerArr);
            theLocation(marker, newmarkerArr);
        // },1000)
        if(only_flag){
            only_flag=false;
            showVplnumber(marker,newmarkerArr);
            theLocation(marker, newmarkerArr)
        }

    }else if(checkedNum>1 && checkedNum <=5){
        if(only_flag){
            only_flag=false;
            showVplnumber(marker,newmarkerArr);
            theLocation(marker, newmarkerArr)
        }
    }else if(checkedNum>5){
        if(only_flag){
            only_flag=false;
            showVplnumber(marker,newmarkerArr);
            theLocation(marker, newmarkerArr)
        }
    }
}
/**
 * 画线
 * @param bMap
 * @param points
 */
function drawPolyline(bMap, points) {
    if (points==null || points.length<=1) {
        return;
    }
    var PolylineOptions = {
        strokeColor : "#ce2ebc",
        strokeWeight : 2,
        strokeOpacity : 0.5
    };

    bMap.addOverlay(new BMap.Polyline(points, PolylineOptions)); // 画线
}

// 添加icon标注
function addMarker(point) {
    // index=11;
    var myIcon = new BMap.Icon("../img/redicon_big.png",
        new BMap.Size(24, 24), {
            offset: new BMap.Size(10, 24)
        });
    var marker = new BMap.Marker(point, { icon: myIcon });
    map.addOverlay(marker);
    return marker;
}
//获取所有点位置并显示在页面中
function theLocation(marker, poi) {
    var p0 = poi.point.split(",")[0];
    var p1 = poi.point.split(",")[1];
    var new_point = new BMap.Point(p0, p1);
    // map.panTo(new_point);
    map.centerAndZoom(new_point, 10);
}
// 添加时间文字标注
function addInfoWindow(marker, poi) {
    console.log(poi)
    var label = new window.BMap.Label(poi.title, { offset: new window.BMap.Size(-50,-30) });
    marker.setLabel(label);
    label.setStyle({
        color: "#fff",
        fontSize: "14px",
        backgroundColor: "rgba(206,46,188,0.6)",
        border: "0",
        width:"130px",
        height:"24px",
        lineHeight:"24px",
        textAlign:"center",
        borderRadius:"20px",
        display:"block",

    });
    map.addOverlay(label);
}
//添加车牌号文字标注
function showVplnumber(marker,poi) {
    var label1 = new window.BMap.Label(poi.vplNumber, { offset: new window.BMap.Size(30,-4) });
    marker.setLabel(label1);
    label1.setStyle({
        color: "#bdd7fe",
        fontSize: "14px",
        backgroundColor: "rgb(21,111,204)",
        border: "2px solid #2238a0",
        width:"80px",
        height:"32px",
        paddingTop:"4px",
        textAlign:"center",
        borderRadius:"2px",
        display:"block"

    });
    map.addOverlay(label1);
}
$('.sel-float-box').perfectScrollbar();

//停车轨迹
$('#parktrack-tit').on('click',function () {
    var _that = $(this);
    $('.nav_left_b').find('li').removeClass('liactive');
    _that.addClass('liactive');
    $('.main_right').css('display','block');
    $('.perportrait-main').css('display','none');
    $('.caranalysis-main').css('display','none');
    $('.deckanalysis-main').css('display','none');
    $('.stopanalysis-main').css('display','none');
})
//车主画像
$('#perportrait-tit').on('click',function () {
        var _that = $(this);
        $('.nav_left_b').find('li').removeClass('liactive');
        _that.addClass('liactive');
        $('.perportrait-main').css('display','block');
        $('.main_right').css('display','none');
        $('.caranalysis-main').css('display','none');
        $('.deckanalysis-main').css('display','none');
        $('.stopanalysis-main').css('display','none');
})
//车辆分析
$('#caranalysis-tit').on('click',function () {
    var _that = $(this);
    $('.nav_left_b').find('li').removeClass('liactive');
    _that.addClass('liactive');
    $('.caranalysis-main').css('display','block');
    $('.main_right').css('display','none');
    $('.perportrait-main').css('display','none');
    $('.deckanalysis-main').css('display','none');
    $('.stopanalysis-main').css('display','none');
})
//套牌分析
$('#deckanalysis-tit').on('click',function () {
    var _that = $(this);
    $('.nav_left_b').find('li').removeClass('liactive');
    _that.addClass('liactive');
    $('.deckanalysis-main').css('display','block');
    $('.main_right').css('display','none');
    $('.caranalysis-main').css('display','none');
    $('.perportrait-main').css('display','none');
    $('.stopanalysis-main').css('display','none');
})
//违停分析
$('#stopanalysis-tit').on('click',function () {
    var _that = $(this);
    $('.nav_left_b').find('li').removeClass('liactive');
    _that.addClass('liactive');
    $('.stopanalysis-main').css('display','block');
    $('.main_right').css('display','none');
    $('.caranalysis-main').css('display','none');
    $('.deckanalysis-main').css('display','none');
    $('.perportrait-main').css('display','none');
})




