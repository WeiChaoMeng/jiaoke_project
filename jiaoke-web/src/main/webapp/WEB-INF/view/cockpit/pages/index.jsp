<head>
    <title>数据中心</title>
    <meta charset="UTF-8">
    <meta name="google" value="notranslate"><!-- 禁止Chrome 浏览器中自动提示翻译 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge"><!--IE=edge：保持使用最高级别模式显示内容-->
    <meta name="renderer" content="webkit"><!--360浏览器-->
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <link rel="stylesheet" href="../css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../css/logo.css">
    <link rel="stylesheet" href="../css/index.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
    <style>
        .amap-logo,.amap-copyright{
            display: none!important;
        }
    </style>
</head>
<body>

<!--首页头部 sta -->
<div class="jimu-main-header" id="Header-Panel"
     style="left: 10px; top: 30px; width: 313px;z-index: 9999; height: 36px; right: auto; bottom: auto;">
    <div class="jimu-head">
        <div class="jimu-head-content" id="jimu-head-content" style="line-height: 33px;">
            <div class="jimu-head-leftTopBg" id="leftTopBg"></div>
            <div class="jimu-head-logo"><img id="logoNode" src="../img/logo-left.png"></div>
            <div class="jimu-head-title jimu-head-title-light" id="titleNode">路驰分公司综合管理平台</div>

            <i class="jimu-head-masked"></i>
            <div class="jimu-head-rightBottomBg" id="rightBottomBg"></div>
        </div>
    </div>
</div>

<div id="model-top" class="model-top">

</div>
<!--首页头部 end -->
<div class="model-content">
    <!--首页左侧 sta -->
    <div class="comtab">
        <div class="modelpub">
            <div class="common-tit">标题</div>
            <span class="tilt"></span>
            <div class="echart_con" style="height: 170px;" id="radar_echart">

            </div>
        </div>
        <div class="modelpub margin10">
            <div class="common-tit">标题</div>
            <span class="tilt"></span>
            <div class="echart_con bar_l_echart" style="height: 170px;" id="xctj">

            </div>
        </div>
        <div class="modelpub">
            <div class="common-tit">标题</div>
            <span class="tilt"></span>
            <div class="echart_con" style="height: 170px;" id="sssjtj">

            </div>
        </div>
    </div>

    <!--首页左侧 end -->
    <!--首页居中 sta -->
    <div class="model-mid">
        <div class="mid-top" id="container">
            <div class="echart_con" style="height: 170px;" id="mid_echart">

            </div>
        </div>
        <!--中底 sta -->
        <div class="mid-foot">
            <div class="parkingbox">
                <div class="commombox-top"><span class="prakbg"></span>
                    <div class="boxnum"><span id="parknum">第58天</span></div>
                    <div class="commonbox-foot"></div>
                </div>
                <div class="commonbox-tit">开工</div>
            </div>
            <div class="parkingbox marginl15">
                <div class="commombox-top"><span class="placebg"></span>
                    <div class="boxnum"><span id="parkplace">1.7万吨</span></div>
                    <div class="commonbox-foot"></div>
                </div>
                <div class="commonbox-tit">产量</div>
            </div>
            <div class="parkingbox marginl15">
                <div class="commombox-top"><span class="freebg"></span>
                    <div class="boxnum"><span id="freenum">0.32吨</span></div>
                    <div class="commonbox-foot"></div>
                </div>
                <div class="commonbox-tit">再生料总用量</div>
            </div>
            <div class="parkingbox marginl15">
                <div class="commombox-top"><span class="matchbg"></span>
                    <div class="boxnum"><span id="matchnum">18次</span></div>
                    <div class="commonbox-foot"></div>
                </div>
                <div class="commonbox-tit">预警</div>
            </div>
        </div>
        <!--中底 end -->
    </div>
    <!--首页居中 end -->
    <!--首页右侧 sta -->
    <div class="comtab">
        <div class="modelpub">
            <div class="common-tit">标题</div>
            <span class="tilt"></span>
            <div class="echart_con">
                <div id="container-speed" style="width: 459px; height: 150px; "></div>
            </div>
        </div>
        <div class="modelpub margin10">
            <div class="common-tit">标题</div>
            <span class="tilt"></span>
            <div class="echart_con bar_c_echart" style="height: 170px;" id="ldwhl">

            </div>
        </div>
        <div class="modelpub">
            <div class="common-tit">标题</div>
            <span class="tilt"></span>
            <div class="echart_con line_r_echart" style="height: 170px;" id="line_r_echart">

            </div>
        </div>
    </div>
    <!--首页右侧 end -->
</div>
<div class="clearfix"></div>
<!--首页底部 sta -->
<div id="model-foot" class="model-foot">

</div>
<input  id="path" value="${path}" type="hidden" >
<!--首页底部 end-->
<script type="text/javascript" src="../../../../static/cockpit/js/lib/jquery.min.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/lib/echarts.min.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/highcharts.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/highcharts-3d.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/highcharts-zh_CN.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/common/header-footer.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/pagejs/index.js?c=2.9"></script>

<script>
    var map = new AMap.Map('container', {
        zoom:8,
        center: [116.40491,40.229931],
        pitch: 0,
        viewMode: '2D',
        //设置地图背景图
        mapStyle: 'amap://styles/darkblue'

    });
    map.setZoom(12.2); //设置地图层级
    new AMap.DistrictSearch({
        extensions: 'all',
        showbiz: false,
        subdistrict: 0
    }).search('北京市', function (status, result) {
        // 外多边形坐标数组和内多边形坐标数组
        var outer = [
            new AMap.LngLat(-360, 90, true),
            new AMap.LngLat(-360, -90, true),
            new AMap.LngLat(360, -90, true),
            new AMap.LngLat(360, 90, true),
        ];
        var holes = result.districtList[0].boundaries;

        var pathArray = [
            outer
        ];
        pathArray.push.apply(pathArray, holes)
        var polygon = new AMap.Polygon({
            pathL: pathArray,
            strokeColor: '#172853',
            strokeWeight: 1,
            fillColor: '#000000',
            fillOpacity: 1
        });
        polygon.setPath(pathArray);
        map.add(polygon);

        AMapUI.load(['ui/misc/PathSimplifier', 'lib/$'], function (PathSimplifier, $) {

            if (!PathSimplifier.supportCanvas) {
                alert('当前环境不支持 Canvas！');
                return;
            }

            var defaultRenderOptions = {
                renderAllPointsIfNumberBelow: -1,
                pathTolerance: 0,
                keyPointTolerance: -1,
                pathLineStyle: {
                    lineWidth: 0,
                    strokeStyle: '#033447',
                    borderWidth: 3,
                    borderStyle: null,
                    dirArrowStyle: false
                },
                pathLineHoverStyle: {
                    lineWidth: 3,
                    strokeStyle: '#ffffff',
                    borderWidth: 1,
                    borderStyle: null,
                    dirArrowStyle: false
                },
                pathLineSelectedStyle: {
                    lineWidth: 3,
                    strokeStyle: '#ffffff',
                    borderWidth: 1,
                    borderStyle: null,
                    dirArrowStyle: true
                },
                dirArrowStyle: {
                    stepSpace: 35,
                    strokeStyle: '#ffffff',
                    lineWidth: 2
                },
                startPointStyle: {
                    radius: 4,
                    fillStyle: '#109618',
                    lineWidth: 1,
                    strokeStyle: '#eeeeee'
                },
                endPointStyle: {
                    radius: 4,
                    fillStyle: '#dc3912',
                    lineWidth: 1,
                    strokeStyle: '#eeeeee'
                },
                keyPointStyle: {
                    radius: 3,
                    fillStyle: 'rgba(8, 126, 196, 1)',
                    lineWidth: 1,
                    strokeStyle: '#eeeeee'
                },
                keyPointHoverStyle: {
                    radius: 4,
                    fillStyle: 'rgba(0, 0, 0, 0)',
                    lineWidth: 2,
                    strokeStyle: '#ffa500'
                },
                keyPointOnSelectedPathLineStyle: {
                    radius: 4,
                    fillStyle: 'rgba(8, 126, 196, 1)',
                    lineWidth: 2,
                    strokeStyle: '#eeeeee'
                }
            };

            var pathSimplifierIns = new PathSimplifier({
                zIndex: 300,
                autoSetFitView:false,
                map: map, //所属的地图实例
                getPath: function (pathData, pathIndex) {
                    return pathData.path;
                },
                getHoverTitle: function (pathData, pathIndex, pointIndex) {
                    if (pointIndex >= 0) {
                        return pathData.name + '，点：' + pointIndex + '/' + pathData.path.length;
                    }
                    return pathData.name + '，点数量' + pathData.path.length;
                },
                renderOptions: defaultRenderOptions
            });

            window.pathSimplifierIns = pathSimplifierIns;

            //设置数据
            pathSimplifierIns.setData([
                {
                    "name": "路驰 - > 大兴机场",
                    "path": [[116.352291,39.697203],[116.354217,39.695478],  [116.356594, 39.696718], [116.358498, 39.696863], [116.361331, 39.696978],
                        [116.362591, 39.696908], [116.363836, 39.696363], [116.365289, 39.695559], [116.366754, 39.694605], [116.367779, 39.693813],
                        [116.368712, 39.692562], [116.36905, 39.691555], [116.369259, 39.69058], [116.369431, 39.690155], [116.369769, 39.689495],
                        [116.369951, 39.689259], [116.370252, 39.688826], [116.371019, 39.688252], [116.371705, 39.687736], [116.373025, 39.686745],
                        [116.373958, 39.686035], [116.374672, 39.685466], [116.376582, 39.683885], [116.377982, 39.682737], [116.380315, 39.680821],
                        [116.381195, 39.680144], [116.38311, 39.679166], [116.384698, 39.678402], [116.387917, 39.676804], [116.391564, 39.675], [116.393748, 39.673955],
                        [116.396124, 39.672857], [116.398173, 39.671899], [116.400974, 39.670512], [116.403795, 39.66912], [116.407829, 39.667097], [116.411059, 39.665325],
                        [116.411971, 39.665181], [116.414503, 39.665172], [116.41461, 39.664396], [116.414723, 39.663545], [116.414969, 39.661864], [116.415173, 39.66058],
                        [116.415291, 39.659613], [116.415318, 39.658222], [116.415307, 39.656574], [116.415318, 39.654719], [116.415339, 39.652807], [116.41535, 39.651068],
                        [116.415393, 39.649466], [116.41542, 39.648061], [116.415441, 39.645682], [116.415457, 39.643237], [116.415436, 39.641386], [116.415457, 39.639362],
                        [116.415447, 39.636941], [116.415457, 39.633979], [116.415484, 39.62955], [116.415484, 39.625877], [116.4155, 39.623344], [116.415517, 39.620782],
                        [116.415533, 39.618142], [116.415668, 39.606162], [116.416183, 39.596044], [116.417642, 39.594457], [116.419445, 39.592803], [116.424852, 39.58308],
                        [116.427599, 39.574877], [116.428457, 39.57018], [116.429144, 39.565019], [116.428285, 39.556979],
                        [116.42826, 39.551355], [116.428121, 39.546433], [116.427713, 39.544116], [116.427316, 39.539268], [116.428163, 39.536049], [116.428775, 39.533914], [116.429075, 39.532987]
                    ]
                },
                {
                    "name": "路驰 - > 丽泽桥",
                    "path": [[116.352291,39.697203],[116.354217,39.695478],[116.356594, 39.696718], [116.358652, 39.696871], [116.361334, 39.696974], [116.361506, 39.697176], [116.361463, 39.697416], [116.359457, 39.697824], [116.357606, 39.698113],
                        [116.356034, 39.698889], [116.354779, 39.69995], [116.353443, 39.701295], [116.3523, 39.703219], [116.351684, 39.704387], [116.349903, 39.70773], [116.348642, 39.710309], [116.347531, 39.712715],
                        [116.346389, 39.715034], [116.345434, 39.717031], [116.344999, 39.717914], [116.344522, 39.717943],[116.344698,39.718774],[116.344821,39.719393],[116.345256,39.720891],[116.345508,39.722063],
                        [116.346307,39.725818],[116.346264,39.728697],[116.346061,39.731911],[116.345846,39.73471],[116.345546,39.737511],[116.345234,39.740609],[116.345101,39.744728],[116.344914,39.746044],[116.344731,39.746625],
                        [116.344383,39.751744],[116.343428,39.759472],[116.342902,39.763145],[116.342178,39.768538],[116.341727,39.772117],[116.341727,39.774401],[116.342124,39.776834],[116.34368,39.780569],[116.345772,39.784007],
                        [116.347639,39.787008],[116.348476,39.790116],[116.347757,39.795062],[116.347692,39.797873],[116.346298,39.802419],[116.34553,39.807044],[116.344919,39.8177],[116.34597,39.830142],[116.34596,39.842599],
                        [116.346212,39.847483],[116.348014,39.850342],[116.347649,39.85105],[116.346619,39.851248],[116.34648,39.851231],[116.34515,39.850449],[116.342703,39.849189],[116.333927,39.849016],[116.329968,39.849065]
                        ,[116.323381,39.851314],[116.322319,39.852154],[116.316278,39.858776],[116.313221,39.863305],[116.312555,39.867488],[116.310604, 39.884675]
                    ]
                },
                {
                    "name": "路驰 - > 马驹桥",
                    "path": [[116.352291,39.697203],[116.354217,39.695478],[116.356594, 39.696718], [116.358652, 39.696871], [116.361334, 39.696974], [116.361506, 39.697176], [116.361463, 39.697416], [116.359457, 39.697824],
                        [116.357606, 39.698113],[116.356034, 39.698889], [116.354779, 39.69995], [116.353443, 39.701295], [116.3523, 39.703219], [116.351684, 39.704387], [116.349903, 39.70773], [116.348642, 39.710309],
                        [116.347531, 39.712715],[116.346389, 39.715034], [116.345434, 39.717031], [116.344999, 39.717914], [116.344522, 39.717943],[116.344698,39.718774],[116.344821,39.719393],[116.345256,39.720891],
                        [116.345508,39.722063],[116.36628,39.721981],[116.381815,39.721618],[116.392222,39.721139],[116.393746,39.720743],[116.398499,39.720867],[116.403466,39.720628],[116.406829,39.720636],[116.412666,39.720925],
                        [116.415488,39.721403],[116.423486,39.722398],[116.426088,39.722658],[116.433437,39.722604],[116.440792,39.722881],[116.447744,39.724659],[116.454739,39.72543],[116.463364,39.726239],[116.47214,39.727481],
                        [116.482086,39.729536],[116.487257,39.730922],[116.494349,39.734272],[116.498437,39.736087],[116.501698,39.73725],[116.509005,39.738768],[116.517963,39.739655],[116.521584,39.740096],[116.527968,39.742287],
                        [116.536975,39.745483],[116.545343,39.746201],[116.556791,39.746399],[116.559199,39.746915],[116.578839,39.75512]
                    ]
                },
                {
                    "name": "路驰 - > 西六环",
                    "path": [[116.352298,39.697197],[116.355398,39.694469],[116.356149,39.692884],[116.354239,39.692826],[116.353778,39.692875],[116.35234,39.692785],[116.352196,39.692426],[116.351799,39.69238],[116.342604,39.692017],
                        [116.329794,39.691571],[116.318164,39.691678],[116.317745,39.691984],[116.317552,39.698951],[116.314183,39.697383],[116.313593,39.696136],[116.306555,39.693577],[116.291867,39.691811],[116.267776,39.690766],
                        [116.247837,39.692644],[116.225285,39.695706],[116.213156,39.696148],[116.19511,39.696247],[116.171351,39.696759],[116.153408,39.697378],[116.120341,39.698447],[116.110932,39.698905],[116.104924,39.700544],
                        [116.100611,39.703218],[116.097113,39.707791],[116.09612,39.711825],[116.095884,39.726065],[116.097011,39.73307],[116.099017,39.740958],[116.099961,39.74773],[116.101458,39.758447],[116.102177,39.765457],
                        [116.102187,39.770492],[116.103169,39.773469],[116.104821,39.775728],[116.108399,39.778408],[116.114949,39.783182],[116.117932,39.788903],[116.119037,39.79406],[116.119173,39.803789],[116.119897,39.80857],
                        [116.121077,39.814182],[116.120551,39.819118],[116.119435,39.821953],[116.116812,39.826304],[116.115525,39.830501],[116.115675,39.834802],[116.116694,39.837793],[116.118899,39.841191],[116.121924,39.844367],
                        [116.12929,39.851891],[116.135893,39.857726],[116.137471,39.859398],[116.139445,39.862882],[116.140024,39.865262],[116.140292,39.868906],[116.141843,39.871957],[116.14527,39.875442],[116.147802,39.879723],
                        [116.148574,39.882918]
                    ]
                }
            ]);

            //对第一条线路（即索引 0）创建一个巡航器 // #033447
            var navg1 = pathSimplifierIns.createPathNavigator(0, {
                loop: true, //循环播放
                speed: 10000, //巡航速度，单位千米/小时
                pathNavigatorStyle: {
                    width: 0,
                    height: 0,
                    //使用图片
                    content: 'defaultPathNavigator',
                    strokeStyle: null,
                    fillStyle: null,
                    //经过路径的样式
                    pathLinePassedStyle: {
                        lineWidth: 3,
                        strokeStyle: '#ffffff',
                        dirArrowStyle: false
                    }
                }
            });

            navg1.start();

            //对第一条线路（即索引 0）创建一个巡航器
            var navg2 = pathSimplifierIns.createPathNavigator(1, {
                loop: true, //循环播放
                speed: 10000, //巡航速度，单位千米/小时
                pathNavigatorStyle: {
                    width: 0,
                    height: 0,
                    //使用图片
                    content: 'defaultPathNavigator',
                    strokeStyle: null,
                    fillStyle: null,
                    //经过路径的样式
                    pathLinePassedStyle: {
                        lineWidth: 3,
                        strokeStyle: '#ffffff',
                        dirArrowStyle: false
                    }
                }
            });

            navg2.start();

            //对第一条线路（即索引 0）创建一个巡航器
            var navg3 = pathSimplifierIns.createPathNavigator(2, {
                loop: true, //循环播放
                speed: 10000, //巡航速度，单位千米/小时
                pathNavigatorStyle: {
                    width: 0,
                    height: 0,
                    //使用图片
                    content: 'defaultPathNavigator',
                    strokeStyle: null,
                    fillStyle: null,
                    //经过路径的样式
                    pathLinePassedStyle: {
                        lineWidth: 3,
                        strokeStyle: '#ffffff',
                        dirArrowStyle: false
                    }
                }
            });

            navg3.start();

            //对第一条线路（即索引 0）创建一个巡航器
            var navg4 = pathSimplifierIns.createPathNavigator(3, {
                loop: true, //循环播放
                speed: 10000, //巡航速度，单位千米/小时
                pathNavigatorStyle: {
                    width: 0,
                    height: 0,
                    //使用图片
                    content: 'defaultPathNavigator',
                    strokeStyle: null,
                    fillStyle: null,
                    //经过路径的样式
                    pathLinePassedStyle: {
                        lineWidth: 3,
                        strokeStyle: '#ffffff',
                        dirArrowStyle: false
                    }
                }
            });

            navg4.start();
        });
    })
</script>
</body>
</html>
