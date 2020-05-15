/*高德地图*/
/*领导驾驶舱首页右下角地图-厂区安全*/
var map = new AMap.Map('container', {
    center: [116.352654,39.698689],
    layers: [
        new AMap.TileLayer.Satellite()
    ],
    zoom: 17,
    viewMode:'2D',
    mapStyle: 'amap://styles/dark'
});

var player;
var accessTokenStr;

$(function () {
    accessTokenStr = "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5";
    $('#container').css('display','none');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034612/19.hd.live',
        autoplay: true,
        accessToken: accessTokenStr,
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

function closeMonitor() {
    player.stop();
    $('#myPlayer').css('display','none');
    $('#closeMonitor').css('display','none');
    $('#container').css('display','block');
}

/*东院地磅南侧通道东向西*/
marker17 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.352997,39.697578],
    offset: new AMap.Pixel(-13, -30)
});
marker17.setMap(map);
marker17.setTitle('东院地磅南侧通道东向西');

marker17.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034612/17.hd.live',
        autoplay: true,
        accessToken: accessTokenStr,
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker17.on('mouseover',function () {
    marker17.setIcon("../../../../static/new/images/marker-red.png");
});

marker17.on('mouseout',function () {
    marker17.setIcon("../../../../static/new/images/marker.png");
});

/*东院地磅南侧通道西向东*/
marker18 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.352857,39.697479],
    offset: new AMap.Pixel(-13, -30)
});
marker18.setMap(map);
marker18.setTitle('东院地磅南侧通道西向东');

marker18.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034612/18.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker18.on('mouseover',function () {
    marker18.setIcon("../../../../static/new/images/marker-red.png");
});

marker18.on('mouseout',function () {
    marker18.setIcon("../../../../static/new/images/marker.png");
});

/*东院西门东向西*/
marker19 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.352825,39.697446],
    offset: new AMap.Pixel(-13, -30)
});
marker19.setMap(map);
marker19.setTitle('东院西门东向西');

marker19.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034612/19.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker19.on('mouseover',function () {
    marker19.setIcon("../../../../static/new/images/marker-red.png");
});

marker19.on('mouseout',function () {
    marker19.setIcon("../../../../static/new/images/marker.png");
});

/*东院地磅北侧通道东向西*/
marker20 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.352916,39.697649],
    offset: new AMap.Pixel(-13, -30)
});
marker20.setMap(map);
marker20.setTitle('东院地磅北侧通道东向西');

marker20.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034612/20.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker20.on('mouseover',function () {
    marker20.setIcon("../../../../static/new/images/marker-red.png");
});

marker20.on('mouseout',function () {
    marker20.setIcon("../../../../static/new/images/marker.png");
});

/*东院地磅北侧通道西向东*/
marker21 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.352777,39.697558],
    offset: new AMap.Pixel(-13, -30)
});
marker21.setMap(map);
marker21.setTitle('东院地磅北侧通道西向东');

marker21.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034612/21.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker21.on('mouseover',function () {
    marker21.setIcon("../../../../static/new/images/marker-red.png");
});

marker21.on('mouseout',function () {
    marker21.setIcon("../../../../static/new/images/marker.png");
});

/*东院地磅东侧北通道北向南*/
marker22 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.352815,39.697826],
    offset: new AMap.Pixel(-13, -30)
});
marker22.setMap(map);
marker22.setTitle('东院地磅东侧北通道北向南');

marker22.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034612/22.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker22.on('mouseover',function () {
    marker22.setIcon("../../../../static/new/images/marker-red.png");
});

marker22.on('mouseout',function () {
    marker22.setIcon("../../../../static/new/images/marker.png");
});

/*东院配电室西侧通道南向北*/
marker23 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.352702,39.697529],
    offset: new AMap.Pixel(-13, -30)
});
marker23.setMap(map);
marker23.setTitle('东院配电室西侧通道南向北');

marker23.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034612/23.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker23.on('mouseover',function () {
    marker23.setIcon("../../../../static/new/images/marker-red.png");
});

marker23.on('mouseout',function () {
    marker23.setIcon("../../../../static/new/images/marker.png");
});

/*东院西门北向南*/
marker24 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.352573,39.697455],
    offset: new AMap.Pixel(-13, -30)
});
marker24.setMap(map);
marker24.setTitle('东院西门北向南');

marker24.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034612/24.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker24.on('mouseover',function () {
    marker24.setIcon("../../../../static/new/images/marker-red.png");
});

marker24.on('mouseout',function () {
    marker24.setIcon("../../../../static/new/images/marker.png");
});

/*东院西门外东向西*/
marker25 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.35253,39.697426],
    offset: new AMap.Pixel(-13, -30)
});
marker25.setMap(map);
marker25.setTitle('东院西门外东向西');

marker25.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034612/25.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker25.on('mouseover',function () {
    marker25.setIcon("../../../../static/new/images/marker-red.png");
});

marker25.on('mouseout',function () {
    marker25.setIcon("../../../../static/new/images/marker.png");
});

/*东院石料库南通道西向东*/
marker26 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.35326,39.697599],
    offset: new AMap.Pixel(-13, -30)
});
marker26.setMap(map);
marker26.setTitle('东院石料库南通道西向东');

marker26.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034612/26.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker26.on('mouseover',function () {
    marker26.setIcon("../../../../static/new/images/marker-red.png");
});

marker26.on('mouseout',function () {
    marker26.setIcon("../../../../static/new/images/marker.png");
});

/*东院石料库西门南向北*/
marker27 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.353201,39.697632],
    offset: new AMap.Pixel(-13, -30)
});
marker27.setMap(map);
marker27.setTitle('东院石料库西门南向北');

marker27.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034612/27.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker27.on('mouseover',function () {
    marker27.setIcon("../../../../static/new/images/marker-red.png");
});

marker27.on('mouseout',function () {
    marker27.setIcon("../../../../static/new/images/marker.png");
});

/*东院1号机南侧通道西向东*/
marker28 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.352916,39.697909],
    offset: new AMap.Pixel(-13, -30)
});
marker28.setMap(map);
marker28.setTitle('东院1号机南侧通道西向东');

marker28.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034612/28.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker28.on('mouseover',function () {
    marker28.setIcon("../../../../static/new/images/marker-red.png");
});

marker28.on('mouseout',function () {
    marker28.setIcon("../../../../static/new/images/marker.png");
});

/*东院石料库南北通道南向北*/
marker29 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.353845,39.697991],
    offset: new AMap.Pixel(-13, -30)
});
marker29.setMap(map);
marker29.setTitle('东院石料库南北通道南向北');

marker29.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034612/29.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker29.on('mouseover',function () {
    marker29.setIcon("../../../../static/new/images/marker-red.png");
});

marker29.on('mouseout',function () {
    marker29.setIcon("../../../../static/new/images/marker.png");
});

/*东院1号机南侧通道北向南*/
marker30 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.353845,39.698173],
    offset: new AMap.Pixel(-13, -30)
});
marker30.setMap(map);
marker30.setTitle('东院1号机南侧通道北向南');

marker30.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034612/30.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker30.on('mouseover',function () {
    marker30.setIcon("../../../../static/new/images/marker-red.png");
});

marker30.on('mouseout',function () {
    marker30.setIcon("../../../../static/new/images/marker.png");
});

/*东院1号机南上料口*/
marker31 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.353523,39.698462],
    offset: new AMap.Pixel(-13, -30)
});
marker31.setMap(map);
marker31.setTitle('东院1号机南上料口');

marker31.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034612/31.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker31.on('mouseover',function () {
    marker31.setIcon("../../../../static/new/images/marker-red.png");
});

marker31.on('mouseout',function () {
    marker31.setIcon("../../../../static/new/images/marker.png");
});

/*东院1号机北上料口*/
marker32 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.353351,39.698606],
    offset: new AMap.Pixel(-13, -30)
});
marker32.setMap(map);
marker32.setTitle('东院1号机北上料口');

marker32.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034612/32.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker32.on('mouseover',function () {
    marker32.setIcon("../../../../static/new/images/marker-red.png");
});

marker32.on('mouseout',function () {
    marker32.setIcon("../../../../static/new/images/marker.png");
});

/*东院2号机上料口*/
marker33 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.353201,39.698746],
    offset: new AMap.Pixel(-13, -30)
});
marker33.setMap(map);
marker33.setTitle('东院2号机上料口');

marker33.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034612/33.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker33.on('mouseover',function () {
    marker33.setIcon("../../../../static/new/images/marker-red.png");
});

marker33.on('mouseout',function () {
    marker33.setIcon("../../../../static/new/images/marker.png");
});

/*东院1号机中间通道*/
marker34 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.352916,39.698804],
    offset: new AMap.Pixel(-13, -30)
});
marker34.setMap(map);
marker34.setTitle('东院1号机中间通道');

marker34.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034612/34.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker34.on('mouseover',function () {
    marker34.setIcon("../../../../static/new/images/marker-red.png");
});

marker34.on('mouseout',function () {
    marker34.setIcon("../../../../static/new/images/marker.png");
});

/*东院2号机南上料口*/
marker1 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.352916,39.699027],
    offset: new AMap.Pixel(-13, -30)
});
marker1.setMap(map);
marker1.setTitle('东院2号机南上料口');

marker1.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/1.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker1.on('mouseover',function () {
    marker1.setIcon("../../../../static/new/images/marker-red.png");
});

marker1.on('mouseout',function () {
    marker1.setIcon("../../../../static/new/images/marker.png");
});

/*东院2号机北上料口*/
marker2 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.352707,39.699213],
    offset: new AMap.Pixel(-13, -30)
});
marker2.setMap(map);
marker2.setTitle('东院2号机北上料口');

marker2.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/2.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker2.on('mouseover',function () {
    marker2.setIcon("../../../../static/new/images/marker-red.png");
});

marker2.on('mouseout',function () {
    marker2.setIcon("../../../../static/new/images/marker.png");
});

/*东院石料库南北通道北向南*/
marker3 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.352353,39.699452],
    offset: new AMap.Pixel(-13, -30)
});
marker3.setMap(map);
marker3.setTitle('东院石料库南北通道北向南');

marker3.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/3.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker3.on('mouseover',function () {
    marker3.setIcon("../../../../static/new/images/marker-red.png");
});

marker3.on('mouseout',function () {
    marker3.setIcon("../../../../static/new/images/marker.png");
});

/*东院石料库废粉池*/
marker4 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.352348,39.699522],
    offset: new AMap.Pixel(-13, -30)
});
marker4.setMap(map);
marker4.setTitle('东院石料库废粉池');

marker4.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/4.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker4.on('mouseover',function () {
    marker4.setIcon("../../../../static/new/images/marker-red.png");
});

marker4.on('mouseout',function () {
    marker4.setIcon("../../../../static/new/images/marker.png");
});

/*东院沥青罐区东侧通道南向北*/
marker5 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.352766,39.698115],
    offset: new AMap.Pixel(-13, -30)
});
marker5.setMap(map);
marker5.setTitle('东院沥青罐区东侧通道南向北');

marker5.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/5.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker5.on('mouseover',function () {
    marker5.setIcon("../../../../static/new/images/marker-red.png");
});

marker5.on('mouseout',function () {
    marker5.setIcon("../../../../static/new/images/marker.png");
});

/*东院1号机成品料通道*/
marker6 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.353008,39.698008],
    offset: new AMap.Pixel(-13, -30)
});
marker6.setMap(map);
marker6.setTitle('东院1号机成品料通道');

marker6.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/6.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker6.on('mouseover',function () {
    marker6.setIcon("../../../../static/new/images/marker-red.png");
});

marker6.on('mouseout',function () {
    marker6.setIcon("../../../../static/new/images/marker.png");
});

/*东院1号机废粉通道*/
marker7 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.353179,39.698177],
    offset: new AMap.Pixel(-13, -30)
});
marker7.setMap(map);
marker7.setTitle('东院1号机废粉通道');

marker7.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/7.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker7.on('mouseover',function () {
    marker7.setIcon("../../../../static/new/images/marker-red.png");
});

marker7.on('mouseout',function () {
    marker7.setIcon("../../../../static/new/images/marker.png");
});

/*东院2号机成品料通道*/
marker8 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.352498,39.698738],
    offset: new AMap.Pixel(-13, -30)
});
marker8.setMap(map);
marker8.setTitle('东院2号机成品料通道');

marker8.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/8.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker8.on('mouseover',function () {
    marker8.setIcon("../../../../static/new/images/marker-red.png");
});

marker8.on('mouseout',function () {
    marker8.setIcon("../../../../static/new/images/marker.png");
});

/*东院2号机废粉通道*/
marker9 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.352407,39.698647],
    offset: new AMap.Pixel(-13, -30)
});
marker9.setMap(map);
marker9.setTitle('东院2号机废粉通道');

marker9.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/9.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker9.on('mouseover',function () {
    marker9.setIcon("../../../../static/new/images/marker-red.png");
});

marker9.on('mouseout',function () {
    marker9.setIcon("../../../../static/new/images/marker.png");
});

/*东院1号机运输车等候区*/
marker10 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.352198,39.698631],
    offset: new AMap.Pixel(-13, -30)
});
marker10.setMap(map);
marker10.setTitle('东院1号机运输车等候区');

marker10.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/10.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker10.on('mouseover',function () {
    marker10.setIcon("../../../../static/new/images/marker-red.png");
});

marker10.on('mouseout',function () {
    marker10.setIcon("../../../../static/new/images/marker.png");
});

/*东院2号机组维修间*/
marker11 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.352251,39.698664],
    offset: new AMap.Pixel(-13, -30)
});
marker11.setMap(map);
marker11.setTitle('东院2号机组维修间');

marker11.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/11.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker11.on('mouseover',function () {
    marker11.setIcon("../../../../static/new/images/marker-red.png");
});

marker11.on('mouseout',function () {
    marker11.setIcon("../../../../static/new/images/marker.png");
});

/*东院1.2号机中通道西向东*/
marker12 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.352085,39.698656],
    offset: new AMap.Pixel(-13, -30)
});
marker12.setMap(map);
marker12.setTitle('东院1.2号机中通道西向东');

marker12.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/12.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker12.on('mouseover',function () {
    marker12.setIcon("../../../../static/new/images/marker-red.png");
});

marker12.on('mouseout',function () {
    marker12.setIcon("../../../../static/new/images/marker.png");
});

/*东院2号机再生料库*/
marker13 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.352257,39.699209],
    offset: new AMap.Pixel(-13, -30)
});
marker13.setMap(map);
marker13.setTitle('东院2号机再生料库');

marker13.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/13.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker13.on('mouseover',function () {
    marker13.setIcon("../../../../static/new/images/marker-red.png");
});

marker13.on('mouseout',function () {
    marker13.setIcon("../../../../static/new/images/marker.png");
});

/*东院宿舍门前*/
marker14 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.352471,39.6979],
    offset: new AMap.Pixel(-13, -30)
});
marker14.setMap(map);
marker14.setTitle('东院宿舍门前');

marker14.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/14.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker14.on('mouseover',function () {
    marker14.setIcon("../../../../static/new/images/marker-red.png");
});

marker14.on('mouseout',function () {
    marker14.setIcon("../../../../static/new/images/marker.png");
});

/*东院卸油口*/
marker15 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.352342,39.698003],
    offset: new AMap.Pixel(-13, -30)
});
marker15.setMap(map);
marker15.setTitle('东院卸油口');

marker15.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/15.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker15.on('mouseover',function () {
    marker15.setIcon("../../../../static/new/images/marker-red.png");
});

marker15.on('mouseout',function () {
    marker15.setIcon("../../../../static/new/images/marker.png");
});

/*东院卸油口*/
marker16 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.352176,39.698156],
    offset: new AMap.Pixel(-13, -30)
});
marker16.setMap(map);
marker16.setTitle('东院卸油口');

marker16.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/16.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker16.on('mouseover',function () {
    marker16.setIcon("../../../../static/new/images/marker-red.png");
});

marker16.on('mouseout',function () {
    marker16.setIcon("../../../../static/new/images/marker.png");
});

/*东院库房.宿舍门前*/
marker117 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.351983,39.698317],
    offset: new AMap.Pixel(-13, -30)
});
marker117.setMap(map);
marker117.setTitle('东院库房.宿舍门前');

marker117.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/17.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker117.on('mouseover',function () {
    marker117.setIcon("../../../../static/new/images/marker-red.png");
});

marker117.on('mouseout',function () {
    marker117.setIcon("../../../../static/new/images/marker.png");
});

/*东院库房门前*/
marker118 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.351854,39.698396],
    offset: new AMap.Pixel(-13, -30)
});
marker118.setMap(map);
marker118.setTitle('东院库房门前');

marker118.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/18.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker118.on('mouseover',function () {
    marker118.setIcon("../../../../static/new/images/marker-red.png");
});

marker118.on('mouseout',function () {
    marker118.setIcon("../../../../static/new/images/marker.png");
});

/*卸油口*/
marker119 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.351785,39.698462],
    offset: new AMap.Pixel(-13, -30)
});
marker119.setMap(map);
marker119.setTitle('卸油口');

marker119.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/19.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker119.on('mouseover',function () {
    marker119.setIcon("../../../../static/new/images/marker-red.png");
});

marker119.on('mouseout',function () {
    marker119.setIcon("../../../../static/new/images/marker.png");
});

/*卸油口*/
marker120 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.351575,39.698623],
    offset: new AMap.Pixel(-13, -30)
});
marker120.setMap(map);
marker120.setTitle('卸油口');

marker120.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/20.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker120.on('mouseover',function () {
    marker120.setIcon("../../../../static/new/images/marker-red.png");
});

marker120.on('mouseout',function () {
    marker120.setIcon("../../../../static/new/images/marker.png");
});

/*东院糊沥青*/
marker121 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.351774,39.698751],
    offset: new AMap.Pixel(-13, -30)
});
marker121.setMap(map);
marker121.setTitle('东院糊沥青');

marker121.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/21.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker121.on('mouseover',function () {
    marker121.setIcon("../../../../static/new/images/marker-red.png");
});

marker121.on('mouseout',function () {
    marker121.setIcon("../../../../static/new/images/marker.png");
});

/*东院2号机运输车等候区*/
marker122 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.351543,39.698903],
    offset: new AMap.Pixel(-13, -30)
});
marker122.setMap(map);
marker122.setTitle('东院2号机运输车等候区');

marker122.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/22.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker122.on('mouseover',function () {
    marker122.setIcon("../../../../static/new/images/marker-red.png");
});

marker122.on('mouseout',function () {
    marker122.setIcon("../../../../static/new/images/marker.png");
});

/*东院锅炉房操作间*/
marker123 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.351447,39.698916],
    offset: new AMap.Pixel(-13, -30)
});
marker123.setMap(map);
marker123.setTitle('东院锅炉房操作间');

marker123.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/23.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker123.on('mouseover',function () {
    marker123.setIcon("../../../../static/new/images/marker-red.png");
});

marker123.on('mouseout',function () {
    marker123.setIcon("../../../../static/new/images/marker.png");
});

/*东院2号机北侧*/
marker124 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.351972,39.699205],
    offset: new AMap.Pixel(-13, -30)
});
marker124.setMap(map);
marker124.setTitle('东院2号机北侧');

marker124.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/24.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker124.on('mouseover',function () {
    marker124.setIcon("../../../../static/new/images/marker-red.png");
});

marker124.on('mouseout',function () {
    marker124.setIcon("../../../../static/new/images/marker.png");
});

/*东院2号机上料区北向南*/
marker125 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.351919,39.699159],
    offset: new AMap.Pixel(-13, -30)
});
marker125.setMap(map);
marker125.setTitle('东院2号机上料区北向南');

marker125.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/25.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker125.on('mouseover',function () {
    marker125.setIcon("../../../../static/new/images/marker-red.png");
});

marker125.on('mouseout',function () {
    marker125.setIcon("../../../../static/new/images/marker.png");
});

/*东院罐区北向南*/
marker126 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.351377,39.699126],
    offset: new AMap.Pixel(-13, -30)
});
marker126.setMap(map);
marker126.setTitle('东院罐区北向南');

marker126.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/26.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker126.on('mouseover',function () {
    marker126.setIcon("../../../../static/new/images/marker-red.png");
});

marker126.on('mouseout',function () {
    marker126.setIcon("../../../../static/new/images/marker.png");
});

/*东院垃圾站*/
marker127 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.351135,39.698986],
    offset: new AMap.Pixel(-13, -30)
});
marker127.setMap(map);
marker127.setTitle('东院垃圾站');

marker127.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/27.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker127.on('mouseover',function () {
    marker127.setIcon("../../../../static/new/images/marker-red.png");
});

marker127.on('mouseout',function () {
    marker127.setIcon("../../../../static/new/images/marker.png");
});

/*东院西侧通道北向南*/
marker128 = new AMap.Marker({
    icon: "../../../../static/new/images/marker.png",
    position: [116.351071,39.698928],
    offset: new AMap.Pixel(-13, -30)
});
marker128.setMap(map);
marker128.setTitle('东院西侧通道北向南');

marker128.on('click',function () {
    $('#container').css('display','none');
    $('#myPlayer').css('display','block');
    $('#closeMonitor').css('display','block');
    player = new EZUIPlayer({
        id: 'myPlayer',
        url: 'ezopen://open.ys7.com/D13034870/28.hd.live',
        autoplay: true,
        accessToken: "at.cbbhvp3q04slp4ip2dwkd7tu9wo0w72r-1vwv91bpb1-0yk5pqh-rddasqgu5",
        decoderPath: '../../../static/EZUIKit/',
        width: 458,
        height: 381,
        splitBasis: 1
    });
});

marker128.on('mouseover',function () {
    marker128.setIcon("../../../../static/new/images/marker-red.png");
});

marker128.on('mouseout',function () {
    marker128.setIcon("../../../../static/new/images/marker.png");
});
