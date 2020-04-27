/**
 * Created by mac on 17/7/11.
 */

//下拉框
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

// 百度地图API功能
var map; //Map实例
//后台传过来
var currentLat = 118.967899;
var currentLon = 42.279838;
//热点区域中心点
var  centerData=[
    /*{
        title:"维多利购物广场",
        point:"118.967899,42.27983",
        titkm:"3"
    },
    {
        title:"万达广场",
        point:"118.922316,42.25953",
        titkm:"3"
    },*/
];
//停车场数据，key:停车场编号，value:停车场信息
var parkData={
    "001":{
        parkNo:"001",
        pointX:"118.970907",
        pointY:"42.27894",
        allnum:"270",
        free:"23"
    },
    "002":{
        parkNo:"002",
        pointX:"118.963558",
        pointY:"42.278059",
        allnum:"260"
    }
};

//空闲车位数,key:停车场编号，value:空闲车位数
var freeBerthData={
	"001":"123",
	"002":"33"
}
var marker ={}; 
map = new BMap.Map('allmap',{enableMapClick:false});            // 创建Map实例
var point = new BMap.Point(currentLat,currentLon);
map.enableScrollWheelZoom();
//第5步：设置地图风格
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
map.centerAndZoom(point,15);
//向地图中添加缩放控件
var ctrlNav = new window.BMap.NavigationControl({
    // 靠右上角位置
    anchor: BMAP_ANCHOR_TOP_RIGHT,
    // LARGE类型
    type: BMAP_NAVIGATION_CONTROL_ZOOM,
    //偏离值
    offset: new BMap.Size(25, 80)
});
map.addControl(ctrlNav);
//预警内容
var warningCount = "";
//热点区域
function hotAreas(){
	//请求热点区域
	sysAjax({
        method: "post",
        url: dataUrl.util.getHotspotByCityId(),
        data: "cityId="+sysComm.cityId+"&sysCode="+sysComm.sysCode,
        contentType: 'application/x-www-form-urlencoded',
        dataType:'json',
        async:false,
        success: function(res){
        	if(res.code=='8888'){
        		var resultData = res.data;
        		//清空
        		centerData = [];
        		if(resultData.length<=0){
        			return;
        		}
        		for(var index in resultData){
        			var hotareaitem = {
        				title:resultData[index].name,
				        point:resultData[index].longitude+","+resultData[index].latitude,
				        titkm:"3"
        			}
        			centerData.push(hotareaitem);
        		}
        	}
    	}
    });
	
	
    var hotTit=null;//热点区域中心店名称
    var hotpoiX = null;//热点区域中心点
    var hotpoiY = null;
    var hotKm=null;//热点区域半径公里
    var mPoint=null;
    var marker=[];
    for(var i = 0; i < centerData.length; i++){
        hotTit=centerData[i].title;
        hotpoiX=centerData[i].point.split(",")[0];
        hotpoiY=centerData[i].point.split(",")[1];
        hotKm=centerData[i].titkm;
        mPoint = new BMap.Point(hotpoiX,hotpoiY);
        // 创建标注
        var myIcon = new BMap.Icon("../img/center-icon.png", new BMap.Size(30,30));
        var marker2 = new BMap.Marker(mPoint,{icon:myIcon});  // 创建标注
        map.addOverlay(marker2);
        addCircle(hotTit,hotKm,hotpoiX,hotpoiY);
        function addCircle(hotTit,hotKm,hotpoiX,hotpoiY) {
            var hotTit=centerData[i].title;
            var hotKm=centerData[i].titkm;
            var hotpoiX=centerData[i].point.split(",")[0];
            var hotpoiY=centerData[i].point.split(",")[1];
            var mPoint = new BMap.Point(hotpoiX,hotpoiY);
            //添加文字标注
            var label = new BMap.Label('<div id="co-center" class="co-center">'+hotTit+'</div>',{offset:new BMap.Size(-74,-64),position:mPoint});
            // 创建文本标注对象
            label.setStyle({
                color: "#F0F0F0",
                fontSize: "12px",
                padding: "5px",
                whiteSpace: "normal",
                backgroundColor: "rgba(0, 0, 0, 0)",
                border: "0px"
            });
            var circle = new BMap.Circle(mPoint,1000,{fillColor:"#ee04e0", strokeWeight: 'hotKm-2' ,stroke:'#8e1a7e',fillOpacity: 0.2, strokeOpacity: 0.4});
            map.addOverlay(circle);
            map.addOverlay(label);
        }
	
    }
	$('#select01').empty();
	$.each(centerData,function(i,item){
	    $('#select01').append('<option value="'+item.title+'">'+item.title+'</option>')
	});
	//默认第一个
	warningCount = centerData[0].title;
	$("#select01").M_select({
	
	    "Title": centerData[0].title,
	    "inputName": "selected1_value",
	    // 默认选中的值（参数值写需要选中的select的value值）
	    "selected": "01",
	    Succee: function () {
	    	warningCount = $("input[name='selected1_value']").attr('value');
	        //console.log($("input[name='selected1_value']").attr('value'));
	    }
	});
}
//请求热点区域周边停车场
function requestHotAreasParkLot(){
	var req = [];
	for(var i = 0; i < centerData.length; i++){
        var hotpoiX=centerData[i].point.split(",")[0];
        var hotpoiY=centerData[i].point.split(",")[1];
        var hotKm=centerData[i].titkm;
        var reqitem = {
            sysCode:sysComm.sysCode,
            radius:hotKm*1000,
            longitude:hotpoiX,
            latitude:hotpoiY
        }
        req.push(reqitem);
    }
	
	sysAjax({
	        method: "post",
	        url: dataUrl.util.getParkLotByHotSpot(),
	        data: JSON.stringify(req),
	        contentType: 'application/json; charset=utf-8',
	        dataType:'json',
	        async:false,
	        success: function(res){
	        	if(res.code=='8888'){
	        		var resultData = res.data;
	        		//清空
	        		parkData = {};
	        		if(resultData.length<=0){
	        			return;
	        		}
	        		for(var index in resultData){
	        			var plNo = resultData[index].plNo;
	        			var item = {
	        				parkName:resultData[index].parkinglotName,
					        parkNo:resultData[index].plNo,
					        pointX:resultData[index].longitude,
					        pointY:resultData[index].latitude,
					        allnum:resultData[index].totalBerthNum
					    }
	        			parkData[plNo]=item;
	        		}
	        	}
	    	}
    });
}

//请求热点区域周边停车场空闲车位
function requestHotAreasFreeBerths(){
	var plNos = [];
	for(var plNo in parkData){
        plNos.push(plNo);
    }
	var req= {
        sysCode:sysComm.sysCode,
        plNos:plNos
    };
	
	sysAjax({
	        method: "post",
	        url: dataUrl.util.queryParkFreeBerthsByPkNos(),
	        data: JSON.stringify(req),
	        contentType: 'application/json; charset=utf-8',
	        dataType:'json',
	        async:false,
	        success: function(res){
	        	if(res.code=='8888'){
	        		var resultData = res.data;
	        		//清空
	        		freeBerthData = {};
	        		if(resultData.length<=0){
	        			return;
	        		}
	        		for(var plNo in resultData){
	        			freeBerthData[plNo]=resultData[plNo];
	        		}
	        	}
	    	}
    });
    
    
    //第7步：绘制点
    var newpoiX=null;//坐标
    var newpoiY=null;
    var parkNo=null;//编号
    //修改颜色
	for (var plNo in parkData) {
		newpoiX=parkData[plNo].pointX;
        newpoiY=parkData[plNo].pointY;
        parkNo=parkData[plNo].parkNo;
        var point = new BMap.Point(newpoiX,newpoiY);

        var popAllnum =Number(parkData[plNo].allnum);
        var popFree = Number(freeBerthData[plNo]);
		var myIcon;
        if( (popFree/popAllnum)== 0){
            myIcon = new BMap.Icon("../img/parkicon_1.png",
                new BMap.Size(24,28), {
                    offset: new BMap.Size(10, 28),
                    textColor: '#fff'
                });
        }else if((popFree/popAllnum)>0 && (popFree/popAllnum) <=0.3) {
            myIcon = new BMap.Icon("../img/parkicon_2.png",
                new BMap.Size(24,29), {
                    offset: new BMap.Size(10, 29),
                    textColor: '#fff'
                });
        }else if((popFree/popAllnum) > 0.3){
            myIcon = new BMap.Icon("../img/parkicon_3.png",
                new BMap.Size(24,29), {
                    offset: new BMap.Size(10, 29),
                    textColor: '#fff'
                });
        }
        function parkiconBig(){
          var  popAllnum =Number(parkData[plNo].allnum);
          var  popFree = Number(freeBerthData[plNo]);
          var  that=this;
            console.log(popAllnum+","+popFree);
            if( (popFree/popAllnum)== 0){
                myIcon = new BMap.Icon("../img/p-redbig.png",
                    new BMap.Size(30,36), {
                        offset: new BMap.Size(10, 36),
                        textColor: '#fff'
                    });
            }else if((popFree/popAllnum)>0 && (popFree/popAllnum) <=0.3) {
                myIcon = new BMap.Icon("../img/p-orangebig.png",
                    new BMap.Size(30,36), {
                        offset: new BMap.Size(10, 36),
                        textColor: '#fff'
                    });
            }else if((popFree/popAllnum) > 0.3){
                myIcon = new BMap.Icon("../img/p-greenbig.png",
                    new BMap.Size(30,36), {
                        offset: new BMap.Size(10, 36),
                        textColor: '#fff'
                    });
            }
            marker[plNo] = new BMap.Marker(point,{icon:myIcon});
            map.addOverlay(marker[plNo]);
        }
        marker[plNo] = new BMap.Marker(point,{icon:myIcon});
        map.addOverlay(marker[plNo]);

        marker[plNo].parkNo=plNo;
        marker[plNo].pointX=newpoiX;
        marker[plNo].pointY=newpoiY;
        marker[plNo].addEventListener("mouseover", function (n) {
            var parkNo = n.target.parkNo;
            var newpoiX=n.target.pointX;
            var newpoiY=n.target.pointY;
            addInfoWindow(parkNo,newpoiX,newpoiY);
            //parkiconBig();
        });
        marker[plNo].addEventListener("mouseout", function () {
            closeInfoWindow();
        });
    }
}
//判断是否已经点击过热点周边了，只点击一次
var isClickedHotAreaParkLot = false;
//热点周边
function hotAreaParkLot(){
	requestHotAreasFreeBerths();
	if(isClickedHotAreaParkLot){
		return;
	}
	isClickedHotAreaParkLot = true;
	//查询空闲车位数
	window.setInterval(function(){
        requestHotAreasFreeBerths();
    },1000*60*5);
}


function closeInfoWindow(){
    $(".parkpop-content").css('display','none');
}
//停车场信息弹窗
function addInfoWindow(parkNo,newpoiX,newpoiY) {
    var parkNO=parkNo;
    var poix=parkData[parkNO].pointX;
    var poiy=parkData[parkNO].pointY;
    var parkname = parkData[parkNO].parkName;
    var freepop=Number(freeBerthData[parkNO]);
    var allnumpop=Number(parkData[parkNO].allnum);
    var point=new BMap.Point(poix,poiy);
    $('.BMapLabel .parkpop-contenttop').empty();
    var myLabel = new BMap.Label('<div class="parkpop-contenttop">'+
        '<div class="parkpop-content">'+
        '<div class="parkpop-main clearfix">' +
        '<div class="rightt-icon"></div>' +
        '<div class="pop-freecontnum clearfix"><div class="free-titfree">空闲车位数</div><div id="free-num" class="free-num">'+freepop+'</div></div>' +
        '<div class="pop-freecontall clearfix"><div class="free-titall">总车位数</div><div id="free-allnum" class="free-allnum">'+allnumpop+'</div></div>' +
        '<div id="pop-freebot" class="pop-freebot">'+parkname+'</div>' +
        '</div></div></div>',{offset:new BMap.Size(30,-85),                  //label的偏移量，为了让label的中心显示在点上
        position:point});
        myLabel.setStyle({
            color: "#F0F0F0",
            fontSize: "12px",
            //height: "220px",
            // width: "350px",
            padding: "5px",
            whiteSpace: "normal",
            //fontFamily: "微软雅黑",
            zIndex:"1000",
            backgroundColor: "rgba(0, 0, 0, 0)",
            border: "0px"
        }

    );
    map.addOverlay(myLabel,point);
    // map.panTo(new BMap.Point(poix,poiy));
}
//热点周边
$("#opr_btn_t").on("click",function () {
    hotAreaParkLot();
});
(function () {
    //预警下发操作
    $('#opr_btn_b').on('click',function () {
        $('#dialog_wrap').show();
    });
    //弹窗关闭
    $('#dialog_close').on('click',function () {
        $('#inp_phohe_t').val('');
        $('#inp_phohe_b').val('');
        $('#inp_del').click();
        $('#dialog_wrap').hide();
    });

    //添加
    function add_fun() {
        $('#hide_li').removeClass('hide_li');
        $('#inp_add').hide();
    };
    $('#inp_add').on('click',function () {
        add_fun();
    });
    //删除
    function del_fun() {
        $('#hide_li').addClass('hide_li');
        $('#inp_add').show();
    };
    $('#inp_del').on('click',function () {
        del_fun();
    });

    //确定事件
    //失焦
    $('#inp_phohe_t').on('blur',function () {
        var mobile1 = $('#inp_phohe_t').val();
        var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
        if(mobile1){
            if(!myreg.test(mobile1)){
                $('#inp_phohe_t').focus();
                $('#ifo_hint').text('请输入正确的手机号');
            }else {

                $('#ifo_hint').text('');
            }
        }else{
            $('#inp_phohe_t').focus();
            $('#ifo_hint').text('');
            return false;
        }
    });
    $('#inp_phohe_b').on('blur',function () {
        var mobile2 = $('#inp_phohe_b').val();
        var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
        if(mobile2){
            if(!myreg.test(mobile2)){
                $('#inp_phohe_b').focus();
                $('#ifo_hint').text('请输入正确的手机号');
            }else {

                $('#ifo_hint').text('');
            }
        }else{
            $('#inp_phohe_b').focus();
            $('#ifo_hint').text('');
            return false;
        }
    });
    $('#sure_btn').on('click',function () {
        var mobile1 = $('#inp_phohe_t').val();
        var mobile2 = $('#inp_phohe_b').val();
        var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
        //判断第二个手机号是否出现
        if($('#hide_li').hasClass('hide_li')){
            //如果第二个手机号隐藏
            //验证第一个手机号
            if(mobile1){
                if(!myreg.test(mobile1)){
                    $('#inp_phohe_t').focus();
                    $('#ifo_hint').text('请输入正确的手机号');
                }else {
                    $('#ifo_hint').text('');
                    //ajax mobile1

                }
            }else{
                $('#inp_phohe_t').focus();
                $('#ifo_hint').text('请输入手机号');
                return false;
            }
        }else{
            //如果第二个手机号出现

            //都为空的情况
            if(!mobile1&&!mobile2){
                $('#inp_phohe_t').focus();
                $('#ifo_hint').text('请输入手机号');
                return false;
            };
            //mobile1存在mobile2不存在
            if(mobile1&&!mobile2){
                if(!myreg.test(mobile1)){
                    $('#inp_phohe_t').focus();
                    $('#ifo_hint').text('第一个手机号输入错误');
                    return false;
                }else {
                    $('#ifo_hint').text('');
                    //ajax mobile1

                }
            };
            //mobile2存在mobile1不存在
            if(!mobile1&&mobile2){
                $('#inp_phohe_t').focus();
                 $('#ifo_hint').text('第一个手机号必须输入');
                 return false;
            };
            //mobile1和mobile2都存在
            if(mobile1&&mobile2){
                if(mobile1==mobile2){
                    $('#inp_phohe_t').focus();
                    $('#ifo_hint').text('两个手机号不能相同');
                    return false;
                }
                if(!myreg.test(mobile1)){
                    $('#inp_phohe_t').focus();
                    $('#ifo_hint').text('第一个手机号输入错误');
                    return false;
                }else if(!myreg.test(mobile2)){
                    $('#inp_phohe_b').focus();
                    $('#ifo_hint').text('第二个手机号输入错误');
                    return false;
                }else{
                    $('#ifo_hint').text('');
                    //ajax mobile1 mobile2
                }
            };


        };
        if($('#ifo_hint').text()!=""){
        	return false;
        }
		//调用后台预警下发
		var req= {
            phones:[mobile1,mobile2],
            content:warningCount+"附近停车拥挤，请前往疏导"
        };
		sysAjax({
            method: "post",
            url: dataUrl.util.smsWarningNotice(),
            data: JSON.stringify(req),
            contentType: 'application/json; charset=utf-8',
            dataType:'json',
            success: function(res){
            	if(res.code=='8888'){
                    $('#myModal').modal('show');
                    setTimeout(function(){
                        $('#myModal').modal('hide');
                        $('#dialog_close').click();
                    },3000)
            	}
        	}
        });

    });
	
	function init(){
		//TODO 请求中心点
		//请求热点区域
		hotAreas();
		//请求热点周边
		requestHotAreasParkLot();
	}
	
	init();
})();
