(function () {
    var fun = {
        init : function () {
            time_left_init_active:{
                $('#time_ul_l').prev().addClass('time_line_active');
                $('#time_ul_l li .time_date').addClass('time_date_all_active');
                $('#time_ul_l li:last .time_date').addClass('time_date_active');
                $('#time_ul_l li:last .time_circle').addClass('time_circle_l_active');
            };
            left_seven_time:{
                //设置日期，当前日期的前七天
                var myDate = new Date(); //获取今天日期
                myDate.setDate(myDate.getDate() - 7);
                var dateArray = [];
                var dateTemp;
                var flag = 1;
                for (var i = 0; i < 7; i++) {
                    dateTemp = (myDate.getMonth()+1)+"月"+myDate.getDate()+'日';
                    dateArray.push(dateTemp);
                    myDate.setDate(myDate.getDate() + flag);

                };
                $.each($('#time_ul_l .time_date'),function (i,item) {
                    //console.log(dateArray[i])
                    $(this).text(dateArray[i])
                })
            };
        },
        time_left_init:function () {
            $('#time_ul_l').prev().removeClass('time_line_active');
            $('#time_ul_l li .time_date').removeClass('time_date_all_active');
            $('#time_ul_l li .time_date').removeClass('time_date_active');
            $('#time_ul_l li .time_circle').removeClass('time_circle_l_active');
        },
        time_left_active:function (obj) {
            $('#time_ul_l').prev().addClass('time_line_active');
            $('#time_ul_l').find('.time_date').addClass('time_date_all_active');
            $(obj).find('.time_date').addClass('time_date_active');
            $(obj).find('.time_circle').addClass('time_circle_l_active');
        },
        time_right_init:function () {
            $('#time_ul_r').prev().removeClass('time_line_active');
            $('#time_ul_r li .time_date_r').removeClass('time_date_all_active');
            $('#time_ul_r li .time_date_r').removeClass('time_date_active');
            $('#time_ul_r li .time_circle_r').removeClass('time_circle_r_active');
        },
        time_right_active:function (obj) {
            $('#time_ul_r').prev().addClass('time_line_active');
            $('#time_ul_r').find('.time_date_r').addClass('time_date_all_active');
            $(obj).find('.time_date_r').addClass('time_date_active');
            $(obj).find('.time_circle_r').addClass('time_circle_r_active');
        },

    };
    fun.init();
    //时间轴右侧点击事件
    $('#time_ul_r li').on('click',function () {
        var obj = $(this);
        fun.time_left_init();
        fun.time_right_init();
        fun.time_right_active(obj);
        var o=obj.find('.time_date_r').text().indexOf(':');
        var o2=obj.find('.time_date_r').text().substr(o-2,o);
        var hourTime='2017-07-12 '+o2;
        console.log(hourTime);
        
        //ajax
        var req= {
                sysCode:sysComm.sysCode,
                cityId:sysComm.cityId,
                provId:sysComm.provId,
                queryDate:new Date(hourTime.replace(new RegExp(/-/gm) ,"/")),
            };
        var queryParkHeatmapByHour= {
            method: "post",
            url: dataUrl.util.queryParkHeatmapByHour(),
            data: JSON.stringify(req),
            contentType: 'application/json; charset=utf-8',
            dataType:'json',
            success: function(res){
                if(res.code == '8888'){
                    var result = res.data;
                    console.log(JSON.stringify(result));
                    var points =[];
                    for(var i=0; i<result.length;i++){
                    	 points =[{"lng":result[i].lon,"lat":result[i].lat,"count":result[i].currentParkCount}];
                    	 //console.log(points);
                    }
                    heatmapOverlay.setDataSet({data:points,max:10});
                    setGradient()
                }
        	}
        };
        sysAjax(queryParkHeatmapByHour);
        
        
//      var points =[
//          {"lng":116.418261,"lat":39.921984,"count":50},
//          {"lng":116.423332,"lat":39.916532,"count":51},
//          {"lng":116.419787,"lat":39.930658,"count":15},
//          {"lng":116.418455,"lat":39.920921,"count":40},
//          ];
//      heatmapOverlay.setDataSet({data:points,max:100});
    });
    //时间轴左侧点击事件
    $('#time_ul_l li').on('click',function () {
        var obj = $(this);
        fun.time_right_init();
        fun.time_left_init();
        fun.time_left_active(obj);
       // console.log(obj.find('.time_date').text())
        var monthAddress=obj.find('.time_date').text().indexOf('月');
        var month=obj.find('.time_date').text().substr(monthAddress-1,monthAddress);
       // console.log(month)
        var dayAddress=obj.find('.time_date').text().indexOf('日');
        var day=obj.find('.time_date').text().substr(monthAddress+1,dayAddress-2);
        //console.log(day);
        var date=new Date();
        var s=date.getFullYear();
        //console.log("year"+s)
        var time=s+'-'+month+'-'+day+' 00:00:00';
       	console.log(time);
        //ajax
        var req= {
                sysCode:sysComm.sysCode,
                cityId:sysComm.cityId,
                provId:sysComm.provId,
                queryDate:new Date(time.replace(new RegExp(/-/gm) ,"/")),
            };
        var queryParkHeatmapByDay= {
            method: "post",
            url: dataUrl.util.queryParkHeatmapByDay(),
            data: JSON.stringify(req),
            contentType: 'application/json; charset=utf-8',
            dataType:'json',
            success: function(res){
                if(res.code == '8888'){
                    var result = res.data;
                   var points =[];
                    //var result = [{"lon":118.852074,"lat":42.258144,"currentParkCount":1},{"lon":118.909241,"lat":42.250501,"currentParkCount":131},{"lon":118.909961,"lat":42.250772,"currentParkCount":131},{"lon":118.913833,"lat":42.250834,"currentParkCount":5},{"lon":118.914219,"lat":42.252357,"currentParkCount":4},{"lon":118.915952,"lat":42.252687,"currentParkCount":2},{"lon":118.91767,"lat":42.255253,"currentParkCount":50},{"lon":118.918532,"lat":42.258913,"currentParkCount":168},{"lon":118.918631,"lat":42.256303,"currentParkCount":130},{"lon":118.918715,"lat":42.256935,"currentParkCount":33},{"lon":118.919219,"lat":42.254187,"currentParkCount":249},{"lon":118.919294,"lat":42.254791,"currentParkCount":165},{"lon":118.919407,"lat":42.254552,"currentParkCount":67},{"lon":118.971387,"lat":42.281217,"currentParkCount":86}];
                    for(var i=0; i<result.length;i++){
                    	 points =[{"lng":result[i].lon,"lat":result[i].lat,"count":result[i].currentParkCount}];
                    	
                    	 // console.log(points);
                    }
                    heatmapOverlay.setDataSet({data:points,max:10});
                    setGradient()
                    // heatmapOverlay.setDataSet({data:points,max:100});
                }
        	}
        };
        sysAjax(queryParkHeatmapByDay);
        
//      var points =[
//          {"lng":116.418261,"lat":39.921984,"count":50},
//          {"lng":116.423332,"lat":39.916532,"count":51},
//          {"lng":116.419787,"lat":39.930658,"count":15},
//          {"lng":116.418455,"lat":39.920921,"count":40},
//          {"lng":116.420755,"lat":39.928001,"count":10},
//          {"lng":116.414077,"lat":39.930655,"count":14},
//          {"lng":116.426092,"lat":39.922995,"count":16},
//          {"lng":116.41535,"lat":39.931054,"count":15},
//          {"lng":116.413022,"lat":39.921895,"count":13},
//          {"lng":116.415551,"lat":39.913373,"count":17},
//          {"lng":116.421191,"lat":39.926572,"count":1},
//          {"lng":116.419612,"lat":39.917119,"count":9},
//          {"lng":116.418237,"lat":39.921337,"count":54},
//          {"lng":116.423776,"lat":39.921919,"count":26},
//      ];
//      heatmapOverlay.setDataSet({data:points,max:100});
    });


})();


var map = new BMap.Map('allmap',{enableMapClick:false});// 创建地图实例
var point = new BMap.Point(sysComm.point_lng,sysComm.point_lat);

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
map.centerAndZoom(point, 10);             // 初始化地图，设置中心点坐标和地图级别
map.enableScrollWheelZoom(); // 允许滚轮缩放





var points =[





// 	{ lng: 118.998103, lat: 42.286232, count: 66 },
//  { lng: 118.959539, lat: 42.274121, count: 54 },
//  { lng: 118.959176, lat: 42.278517, count: 65 },
//  { lng: 118.927625, lat: 42.29311,  count: 32 },
//  { lng: 118.918821, lat: 42.281345, count: 71 },
//  { lng: 119.04771,  lat: 42.22231,  count: 39 },
//  { lng: 118.757106, lat: 42.268753, count: 19 }





//  {"lng":116.418261,"lat":39.921984,"count":50},
//  {"lng":116.423332,"lat":39.916532,"count":151},
//  {"lng":116.419787,"lat":39.930658,"count":15},
//  {"lng":116.418455,"lat":39.920921,"count":140},
//  {"lng":116.418843,"lat":39.915516,"count":100},
//  {"lng":116.42546,"lat":39.918503,"count":6},
//  {"lng":116.423289,"lat":39.919989,"count":18},
//  {"lng":116.418162,"lat":39.915051,"count":80},
//  {"lng":116.422039,"lat":39.91782,"count":11},
//  {"lng":116.41387,"lat":39.917253,"count":7},
//  {"lng":116.41773,"lat":39.919426,"count":42},
//  {"lng":116.421107,"lat":39.916445,"count":4},
//  {"lng":116.417521,"lat":39.917943,"count":27},
//  {"lng":116.419812,"lat":39.920836,"count":23},
//  {"lng":116.420682,"lat":39.91463,"count":60},
//  {"lng":116.415424,"lat":39.924675,"count":8},
//  {"lng":116.419242,"lat":39.914509,"count":15},
//  {"lng":116.422766,"lat":39.921408,"count":125},
//  {"lng":116.421674,"lat":39.924396,"count":21},
//  {"lng":116.427268,"lat":39.92267,"count":1},
//  {"lng":116.417721,"lat":39.920034,"count":151},
//  {"lng":116.412456,"lat":39.92667,"count":7},
//  {"lng":116.420432,"lat":39.919114,"count":111},
//  {"lng":116.425013,"lat":39.921611,"count":35},
//  {"lng":116.418733,"lat":39.931037,"count":22},
//  {"lng":116.419336,"lat":39.931134,"count":4},
//  {"lng":116.413557,"lat":39.923254,"count":5},
//  {"lng":116.418367,"lat":39.92943,"count":3},
//  {"lng":116.424312,"lat":39.919621,"count":100},
//  {"lng":116.423874,"lat":39.919447,"count":87},
//  {"lng":116.424225,"lat":39.923091,"count":32},
//  {"lng":116.417801,"lat":39.921854,"count":44},
//  {"lng":116.417129,"lat":39.928227,"count":21},
//  {"lng":116.426426,"lat":39.922286,"count":80},
//  {"lng":116.421597,"lat":39.91948,"count":32},
//  {"lng":116.423895,"lat":39.920787,"count":26},
//  {"lng":116.423563,"lat":39.921197,"count":17},
//  {"lng":116.417982,"lat":39.922547,"count":117},
//  {"lng":116.426126,"lat":39.921938,"count":25},
//  {"lng":116.42326,"lat":39.915782,"count":100},
//  {"lng":116.419239,"lat":39.916759,"count":39},
//  {"lng":116.417185,"lat":39.929123,"count":111},
//  {"lng":116.417237,"lat":39.927518,"count":9},
//  {"lng":116.417784,"lat":39.915754,"count":147},
//  {"lng":116.420193,"lat":39.917061,"count":52},
//  {"lng":116.422735,"lat":39.915619,"count":100},
//  {"lng":116.418495,"lat":39.915958,"count":16},
//  {"lng":116.416292,"lat":39.931166,"count":119},
//  {"lng":116.419916,"lat":39.924055,"count":118},
//  {"lng":116.42189,"lat":39.921308,"count":111},
//  {"lng":116.413765,"lat":39.929376,"count":3},
//  {"lng":116.418232,"lat":39.920348,"count":150},
//  {"lng":116.417554,"lat":39.930511,"count":15},
//  {"lng":116.418568,"lat":39.918161,"count":23},
//  {"lng":116.413461,"lat":39.926306,"count":3},
//  {"lng":116.42232,"lat":39.92161,"count":13},
//  {"lng":116.4174,"lat":39.928616,"count":6},
//  {"lng":116.424679,"lat":39.915499,"count":21},
//  {"lng":116.42171,"lat":39.915738,"count":29},
//  {"lng":116.417836,"lat":39.916998,"count":99},
//  {"lng":116.420755,"lat":39.928001,"count":10},
//  {"lng":116.414077,"lat":39.930655,"count":14},
//  {"lng":116.426092,"lat":39.922995,"count":16},
//  {"lng":116.41535,"lat":39.931054,"count":15},
//  {"lng":116.413022,"lat":39.921895,"count":13},
//  {"lng":116.415551,"lat":39.913373,"count":17},
//  {"lng":116.421191,"lat":39.926572,"count":1},
//  {"lng":116.419612,"lat":39.917119,"count":119},
//  {"lng":116.418237,"lat":39.921337,"count":154},
//  {"lng":116.423776,"lat":39.921919,"count":126},
//  {"lng":116.417694,"lat":39.92536,"count":17},
//  {"lng":116.415377,"lat":39.914137,"count":119},
//  {"lng":116.417434,"lat":39.914394,"count":143},
//  {"lng":116.42588,"lat":39.922622,"count":27},
//  {"lng":116.418345,"lat":39.919467,"count":8},
//  {"lng":116.426883,"lat":39.917171,"count":3},
//  {"lng":116.423877,"lat":39.916659,"count":134},
//  {"lng":116.415712,"lat":39.915613,"count":14},
//  {"lng":116.419869,"lat":39.931416,"count":112},
//  {"lng":116.416956,"lat":39.925377,"count":111},
//  {"lng":116.42066,"lat":39.925017,"count":38},
//  {"lng":116.416244,"lat":39.920215,"count":91},
//  {"lng":116.41929,"lat":39.915908,"count":54},
//  {"lng":116.422116,"lat":39.919658,"count":21},
//  {"lng":116.4183,"lat":39.925015,"count":15},
//  {"lng":116.421969,"lat":39.913527,"count":3},
//  {"lng":116.422936,"lat":39.921854,"count":24},
//  {"lng":116.41905,"lat":39.929217,"count":12},
//  {"lng":116.424579,"lat":39.914987,"count":57},
//  {"lng":116.42076,"lat":39.915251,"count":170},
//  {"lng":116.425867,"lat":39.918989,"count":8}
    ];
//默认请求昨天的热力图点
function defaultHeat() {

var date = new Date();
var seperator1 = "-";
var month = date.getMonth() + 1;
var strDate = date.getDate()-1;
var yesterday = date.getFullYear() + seperator1 + month + seperator1 + strDate;
console.log(yesterday);
var req= {
    sysCode:sysComm.sysCode,
    cityId:sysComm.cityId,
    provId:sysComm.provId,
    queryDate:new Date(yesterday.replace(new RegExp(/-/gm) ,"/")),
};
var queryParkHeatmapByDay= {
    method: "post",
    url: dataUrl.util.queryParkHeatmapByDay(),
    data: JSON.stringify(req),
    contentType: 'application/json; charset=utf-8',
    dataType:'json',
    success: function(res){
        if(res.code == '8888'){
            var result = res.data;
            console.log(result);
            for(var i=0; i<result.length;i++){
                points =[{"lng":result[i].lon,"lat":result[i].lat,"count":result[i].currentParkCount}];
            }
        }
    }
};
sysAjax(queryParkHeatmapByDay);

}
 defaultHeat();

if(!isSupportCanvas()){
    alert('热力图目前只支持有canvas支持的浏览器,您所使用的浏览器不能使用热力图功能~')
}
//详细的参数,可以查看heatmap.js的文档 https://github.com/pa7/heatmap.js/blob/master/README.md
//参数说明如下:
/* visible 热力图是否显示,默认为true
 * opacity 热力的透明度,1-100
 * radius 势力图的每个点的半径大小
 * gradient  {JSON} 热力图的渐变区间 . gradient如下所示
 *	{
 .2:'rgb(0, 255, 255)',
 .5:'rgb(0, 110, 255)',
 .8:'rgb(100, 0, 255)'
 }
 其中 key 表示插值的位置, 0~1.
 value 为颜色值.
 */
heatmapOverlay = new BMapLib.HeatmapOverlay({"radius":20});

map.addOverlay(heatmapOverlay);
var poilist1 = [];
var poilist2 = [];
var poilist3 = [];
// $.each(points,function (i,item) {
//    if(item.count>100){
//        poilist1.push({
//            "lng":item.lng,
//            "lat":item.lat,
//            "count":item.count
//        });
//        gradient1 = {
//            0:'rgb(255,0,0)',
//
//            1:'rgb(255,0,0)'
//        };
//
//    }
//     if(item.count>20&&item.count<=100){
//         poilist2.push({
//             "lng":item.lng,
//             "lat":item.lat,
//             "count":item.count
//         });
//         gradient2 = {
//             0:'rgb(255,0,255)',
//
//             1:'rgb(255,0,255)'
//         };
//
//     }
//
// });
// gradient = {
//     0:'rgb(102, 255, 0)',
//     .5:'rgb(255, 170, 0)',
//     1:'rgb(255, 0, 0)'
// };
heatmapOverlay.setDataSet({data:points,max:100});
// heatmapOverlay1.setOptions({"gradient":gradient1});
// heatmapOverlay2.setDataSet({data:poilist2,max:100});
// heatmapOverlay.setOptions({"gradient":gradient});


setGradient();
function setGradient(){
    //*格式如下所示:
    var gradient = {
        .2:'rgb(0,255,0)',
     .5:'rgb(255,255,0)',
     1:'rgb(255,0,0)'
     };
    // var gradient = {};
    // var colors = document.querySelectorAll("input[type='color']");
    // colors = [].slice.call(colors,0);
    // colors.forEach(function(ele){
    //     gradient[ele.getAttribute("data-key")] = ele.value;
    // });
    heatmapOverlay.setOptions({"gradient":gradient});
}
//判断浏览区是否支持canvas
function isSupportCanvas(){
    var elem = document.createElement('canvas');
    return !!(elem.getContext && elem.getContext('2d'));
}
function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
   var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate;
            + " " + date.getHours() + seperator2 + date.getMinutes()
            + seperator2 + date.getSeconds();
    return currentdate;
}