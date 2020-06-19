/*高德地图*/
/*领导驾驶舱首页右下角地图-厂区安全*/
var map = new AMap.Map('container', {
    center: [116.352766,39.698453],
    layers: [
        new AMap.TileLayer.Satellite()
    ],
    zoom: 17,
    viewMode:'2D',
    mapStyle: 'amap://styles/dark'
});

//生产区
var path = [
    [116.354853,39.698065],
    [116.352648,39.700042],
    [116.350932,39.698874],
    [116.353233,39.696922],
    [116.354853,39.698065]
];

var polyline = new AMap.Polyline({
    path: path,
    isOutline: true,
    outlineColor: '#ffeeff',
    borderWeight: 0,
    strokeColor: "#ff0000",
    strokeOpacity: 1,
    strokeWeight:2,
    // 折线样式还支持 'dashed'
    strokeStyle: "solid",
    // strokeStyle是dashed时有效
    strokeDasharray: [10, 5],
    lineJoin: 'round',
    lineCap: 'round',
    zIndex: 50,
});

polyline.setMap(map)

var player;
var accessTokenStr;

$(function () {
    accessTokenStr = $('#accessToken').val();
});

function closeMonitor() {
    player.stop();
    $('#myPlayer').css('display','none');
    $('#closeMonitor').css('display','none');
    $('#container').css('display','block');
}

/*-----------------------------------监控画面-----------------------------------*/
/*东院石料库南北通道南向北*/
marker29 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.353845,39.697991],
    offset: new AMap.Pixel(-13, -30)
});
marker29.setMap(map);
// marker29.setTitle('石料库南北通道');

marker29.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034612/29.hd.live',
        autoplay: true,
        accessToken: accessTokenStr,
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker29.on('mouseover',function () {
    // marker29.setIcon("../../../../static/new/images/marker-red.png");
    marker29.setLabel({
        offset: new AMap.Pixel(5, -20),
        content: "<div class='label-style'>石料库南北通道</div>",
        direction: 'right'
    });
});

marker29.on('mouseout',function () {
    // marker29.setIcon("../../../../static/new/images/marker.png");
    marker29.setLabel(null);
});

/*东院1号机南侧通道北向南*/
marker30 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.353845,39.698173],
    offset: new AMap.Pixel(-13, -30)
});
marker30.setMap(map);
// marker30.setTitle('1号机南侧通道');

marker30.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034612/30.hd.live',
        autoplay: true,
        accessToken: accessTokenStr,
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker30.on('mouseover',function () {
    // marker30.setIcon("../../../../static/new/images/marker-red.png");
    marker30.setLabel({
        offset: new AMap.Pixel(5, -20),
        content: "<div class='label-style'>1号机南侧通道</div>",
        direction: 'right'
    });
});

marker30.on('mouseout',function () {
    // marker30.setIcon("../../../../static/new/images/marker.png");
    marker30.setLabel(null);
});

/*东院1号机南上料口*/
marker31 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.353523,39.698462],
    offset: new AMap.Pixel(-13, -30)
});
marker31.setMap(map);
// marker31.setTitle('1号机南上料口');

marker31.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034612/31.hd.live',
        autoplay: true,
        accessToken: accessTokenStr,
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker31.on('mouseover',function () {
    // marker31.setIcon("../../../../static/new/images/marker-red.png");
    marker31.setLabel({
        offset: new AMap.Pixel(5, -20),
        content: "<div class='label-style'>1号机南上料口</div>",
        direction: 'right'
    });
});

marker31.on('mouseout',function () {
    // marker31.setIcon("../../../../static/new/images/marker.png");
    marker31.setLabel(null);
});

/*东院1号机北上料口*/
marker32 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.353351,39.698606],
    offset: new AMap.Pixel(-13, -30)
});
marker32.setMap(map);
// marker32.setTitle('1号机北上料口');

marker32.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034612/32.hd.live',
        autoplay: true,
        accessToken: accessTokenStr,
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker32.on('mouseover',function () {
    // marker32.setIcon("../../../../static/new/images/marker-red.png");
    marker32.setLabel({
        offset: new AMap.Pixel(5, -20),
        content: "<div class='label-style'>1号机北上料口</div>",
        direction: 'right'
    });
});

marker32.on('mouseout',function () {
    // marker32.setIcon("../../../../static/new/images/marker.png");
    marker32.setLabel(null);
});

/*东院2号机上料口*/
marker33 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.353201,39.698746],
    offset: new AMap.Pixel(-13, -30)
});
marker33.setMap(map);
// marker33.setTitle('2号机上料口');

marker33.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034612/33.hd.live',
        autoplay: true,
        accessToken: accessTokenStr,
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker33.on('mouseover',function () {
    // marker33.setIcon("../../../../static/new/images/marker-red.png");
    marker33.setLabel({
        offset: new AMap.Pixel(5, -20),
        content: "<div class='label-style'>2号机上料口</div>",
        direction: 'right'
    });
});

marker33.on('mouseout',function () {
    // marker33.setIcon("../../../../static/new/images/marker.png");
    marker33.setLabel(null);
});

/*东院2号机南上料口*/
marker1 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.352916,39.699027],
    offset: new AMap.Pixel(-13, -30)
});
marker1.setMap(map);
// marker1.setTitle('2号机南上料口');

marker1.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/1.hd.live',
        autoplay: true,
        accessToken: accessTokenStr,
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker1.on('mouseover',function () {
    // marker1.setIcon("../../../../static/new/images/marker-red.png");
    marker1.setLabel({
        offset: new AMap.Pixel(5, -20),
        content: "<div class='label-style'>2号机南上料口</div>",
        direction: 'right'
    });
});

marker1.on('mouseout',function () {
    // marker1.setIcon("../../../../static/new/images/marker.png");
    marker1.setLabel(null);
});

/*东院2号机北上料口*/
marker2 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.352707,39.699213],
    offset: new AMap.Pixel(-13, -30)
});
marker2.setMap(map);
// marker2.setTitle('2号机北上料口');

marker2.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/2.hd.live',
        autoplay: true,
        accessToken: accessTokenStr,
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker2.on('mouseover',function () {
    // marker2.setIcon("../../../../static/new/images/marker-red.png");
    marker2.setLabel({
        offset: new AMap.Pixel(5, -20),
        content: "<div class='label-style'>2号机北上料口</div>",
        direction: 'right'
    });
});

marker2.on('mouseout',function () {
    // marker2.setIcon("../../../../static/new/images/marker.png");
    marker2.setLabel(null);
});

/*东院石料库废粉池*/
marker4 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.352348,39.699522],
    offset: new AMap.Pixel(-13, -30)
});
marker4.setMap(map);
// marker4.setTitle('石料库废粉池');

marker4.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/4.hd.live',
        autoplay: true,
        accessToken: accessTokenStr,
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker4.on('mouseover',function () {
    // marker4.setIcon("../../../../static/new/images/marker-red.png");
    marker4.setLabel({
        offset: new AMap.Pixel(5, -20),
        content: "<div class='label-style'>石料库废粉池</div>",
        direction: 'right'
    });
});

marker4.on('mouseout',function () {
    // marker4.setIcon("../../../../static/new/images/marker.png");
    marker4.setLabel(null);
});

/*东院1号机成品料通道*/
marker6 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.353008,39.698032],
    offset: new AMap.Pixel(-13, -30)
});
marker6.setMap(map);
// marker6.setTitle('1号机成品料通道');

marker6.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/6.hd.live',
        autoplay: true,
        accessToken: accessTokenStr,
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker6.on('mouseover',function () {
    // marker6.setIcon("../../../../static/new/images/marker-red.png");
    marker6.setLabel({
        offset: new AMap.Pixel(5, -20),
        content: "<div class='label-style'>1号机成品料通道</div>",
        direction: 'right'
    });
});

marker6.on('mouseout',function () {
    // marker6.setIcon("../../../../static/new/images/marker.png");
    marker6.setLabel(null);
});

/*东院2号机成品料通道*/
marker8 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.352498,39.698738],
    offset: new AMap.Pixel(-13, -30)
});
marker8.setMap(map);
// marker8.setTitle('2号机成品料通道');

marker8.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/8.hd.live',
        autoplay: true,
        accessToken: accessTokenStr,
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker8.on('mouseover',function () {
    // marker8.setIcon("../../../../static/new/images/marker-red.png");
    marker8.setLabel({
        offset: new AMap.Pixel(5, -20),
        content: "<div class='label-style'>2号机成品料通道</div>",
        direction: 'right'
    });
});

marker8.on('mouseout',function () {
    // marker8.setIcon("../../../../static/new/images/marker.png");
    marker8.setLabel(null);
});

/*东院1号机运输车等候区*/
marker10 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.352198,39.698631],
    offset: new AMap.Pixel(-13, -30)
});
marker10.setMap(map);
// marker10.setTitle('1号机运输车等候区');

marker10.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/10.hd.live',
        autoplay: true,
        accessToken: accessTokenStr,
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker10.on('mouseover',function () {
    // marker10.setIcon("../../../../static/new/images/marker-red.png");
    marker10.setLabel({
        offset: new AMap.Pixel(5, -20),
        content: "<div class='label-style'>1号机运输车等候区</div>",
        direction: 'right'
    });
});

marker10.on('mouseout',function () {
    // marker10.setIcon("../../../../static/new/images/marker.png");
    marker10.setLabel(null);
});

/*东院2号机再生料库*/
marker13 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.352257,39.699209],
    offset: new AMap.Pixel(-13, -30)
});
marker13.setMap(map);
// marker13.setTitle('2号机再生料库');

marker13.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/13.hd.live',
        autoplay: true,
        accessToken: accessTokenStr,
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker13.on('mouseover',function () {
    // marker13.setIcon("../../../../static/new/images/marker-red.png");
    marker13.setLabel({
        offset: new AMap.Pixel(5, -20),
        content: "<div class='label-style'>2号机再生料库</div>",
        direction: 'right'
    });
});

marker13.on('mouseout',function () {
    // marker13.setIcon("../../../../static/new/images/marker.png");
    marker13.setLabel(null);
});

/*东院2号机运输车等候区*/
marker122 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.351543,39.698903],
    offset: new AMap.Pixel(-13, -30)
});
marker122.setMap(map);
// marker122.setTitle('2号机运输车等候区');

marker122.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/22.hd.live',
        autoplay: true,
        accessToken: accessTokenStr,
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker122.on('mouseover',function () {
    // marker122.setIcon("../../../../static/new/images/marker-red.png");
    marker122.setLabel({
        offset: new AMap.Pixel(5, -20),
        content: "<div class='label-style'>2号机运输车等候区</div>",
        direction: 'right'
    });
});

marker122.on('mouseout',function () {
    // marker122.setIcon("../../../../static/new/images/marker.png");
    marker122.setLabel(null);
});

/*东院1号机南侧通道西向东*/
marker28 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.352916,39.697909],
    offset: new AMap.Pixel(-13, -30)
});
marker28.setMap(map);
// marker28.setTitle('1号机南侧通道');

marker28.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034612/28.hd.live',
        autoplay: true,
        accessToken: accessTokenStr,
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker28.on('mouseover',function () {
    // marker28.setIcon("../../../../static/new/images/marker-red.png");
    marker28.setLabel({
        offset: new AMap.Pixel(5, -20),
        content: "<div class='label-style'>1号机南侧通道</div>",
        direction: 'right'
    });
});

marker28.on('mouseout',function () {
    // marker28.setIcon("../../../../static/new/images/marker.png");
    marker28.setLabel(null);
});

/*东院地磅北侧通道东向西*/
marker20 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.352916,39.697649],
    offset: new AMap.Pixel(-13, -30)
});
marker20.setMap(map);
// marker20.setTitle('地磅北侧通道');

marker20.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034612/20.hd.live',
        autoplay: true,
        accessToken: accessTokenStr,
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker20.on('mouseover',function () {
    // marker20.setIcon("../../../../static/new/images/marker-red.png");
    marker20.setLabel({
        offset: new AMap.Pixel(5, -20),
        content: "<div class='label-style'>地磅北侧通道</div>",
        direction: 'right'
    });
});

marker20.on('mouseout',function () {
    // marker20.setIcon("../../../../static/new/images/marker.png");
    marker20.setLabel(null);
});

/*东院罐区北向南*/
marker126 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.35142,39.69911],
    offset: new AMap.Pixel(-13, -30)
});
marker126.setMap(map);
// marker126.setTitle('罐区');

marker126.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/26.hd.live',
        autoplay: true,
        accessToken: accessTokenStr,
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker126.on('mouseover',function () {
    // marker126.setIcon("../../../../static/new/images/marker-red.png");
    marker126.setLabel({
        offset: new AMap.Pixel(5, -20),
        content: "<div class='label-style'>罐区</div>",
        direction: 'right'
    });
});

marker126.on('mouseout',function () {
    // marker126.setIcon("../../../../static/new/images/marker.png");
    marker126.setLabel(null);
});

/*----------------------------机组1----------------------------*/
crew1 = new AMap.Marker({
    icon: "../../../../static/cockpit/img/passage/crew1.png",
    position: [116.352938,39.698222],
    offset: new AMap.Pixel(-13, -30)
});

crew1.setMap(map);

//开启一号机监控预览
crew1.on('click',function () {
    //地图
    $('#container').css('display','none');

    //1号机
    $('#productionGroup1').css('display','block');
    //1号机关闭
    $('#monitorPreviewView1').css('display','block');
});

//关闭一号机监控预览
function closePreviewView1() {
    //1号机
    $('#productionGroup1').css('display','none');
    //1号机关闭
    $('#monitorPreviewView1').css('display','none');

    //地图
    $('#container').css('display','block');
}

crew1.on('mouseover',function () {
    crew1.setLabel({
        offset: new AMap.Pixel(5, -20),
        content: "<div class='label-style'>机组1</div>",
        direction: 'right'
    });
});

crew1.on('mouseout',function () {
    crew1.setLabel(null);
});

//打开1号机监控
$('#productionGroup1 img').on('dblclick',function () {
    $('#productionGroup1').css('display','none');

    $('#myPlayer').css('display','block');
    $('#monitorRealTime1').css('display','block');

    var id = $(this).attr("class");
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/760303618/'+ id +'.hd.live',
        autoplay: true,
        accessToken: accessTokenStr,
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

// 关闭2号机实时监控
function closeMonitorRealTime1() {
    player.stop();
    $('#myPlayer').css('display','none');
    $('#monitorRealTime1').css('display','none');

    //1号机
    $('#productionGroup1').css('display','block');
    //1号机关闭
    $('#monitorPreviewView1').css('display','block');
}


/*----------------------------机组2----------------------------*/
crew2 = new AMap.Marker({
    icon: "../../../../static/cockpit/img/passage/crew2.png",
    position: [116.352171,39.698808],
    offset: new AMap.Pixel(-13, -30)
});

crew2.setMap(map);

//开启2号机监控预览
crew2.on('click',function () {
    //地图
    $('#container').css('display','none');

    //2号机
    $('#productionGroup2').css('display','block');
    //2号机关闭
    $('#monitorPreviewView2').css('display','block');
});

//关闭2号机监控预览
function closePreviewView2() {
    //2号机
    $('#productionGroup2').css('display','none');
    //2号机关闭
    $('#monitorPreviewView2').css('display','none');

    //地图
    $('#container').css('display','block');
}

crew2.on('mouseover',function () {
    crew2.setLabel({
        offset: new AMap.Pixel(5, -20),
        content: "<div class='label-style'>机组2</div>",
        direction: 'right'
    });
});

crew2.on('mouseout',function () {
    crew2.setLabel(null);
});

//打开2号机监控
$('#productionGroup2 img').on('dblclick',function () {
    $('#productionGroup2').css('display','none');

    $('#myPlayer').css('display','block');
    $('#monitorRealTime2').css('display','block');

    var id = $(this).attr("class");
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/C60480112/'+ id +'.hd.live',
        autoplay: true,
        accessToken: accessTokenStr,
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

//关闭2号机实时监控
function closeMonitorRealTime2() {
    player.stop();
    $('#myPlayer').css('display','none');
    $('#monitorRealTime2').css('display','none');

    //2号机
    $('#productionGroup2').css('display','block');
    //2号机关闭
    $('#monitorPreviewView2').css('display','block');
}