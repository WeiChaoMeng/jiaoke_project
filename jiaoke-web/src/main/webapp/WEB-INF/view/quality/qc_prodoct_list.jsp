<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>

    <meta charset="utf-8">
    <title>数据管理</title>
    <link href="/static/css/default.css" rel="stylesheet" type="text/css">
    <link href="/static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>

    <link rel="stylesheet" type="text/css" href="/static/css/statement/normalize.css" />
    <link rel="stylesheet" type="text/css" href="/static/css/statement/demo.css" />
    <link rel="stylesheet" type="text/css" href="/static/css/statement/component.css" />
    <link rel="stylesheet" type="text/css" href="/static/css/statement.css" />
    <script src="/static/js/echarts/echarts.js"></script>
</head>

<body style="padding:15px 8px 0px 8px;">
    <svg class="hidden">
        <symbol id="icon-arrow" viewBox="0 0 24 24">
            <title>arrow</title>
            <polygon points="6.3,12.8 20.9,12.8 20.9,11.2 6.3,11.2 10.2,7.2 9,6 3.1,12 9,18 10.2,16.8 " />
        </symbol>
        <symbol id="icon-drop" viewBox="0 0 24 24">
            <title>drop</title>
            <path d="M12,21c-3.6,0-6.6-3-6.6-6.6C5.4,11,10.8,4,11.4,3.2C11.6,3.1,11.8,3,12,3s0.4,0.1,0.6,0.3c0.6,0.8,6.1,7.8,6.1,11.2C18.6,18.1,15.6,21,12,21zM12,4.8c-1.8,2.4-5.2,7.4-5.2,9.6c0,2.9,2.3,5.2,5.2,5.2s5.2-2.3,5.2-5.2C17.2,12.2,13.8,7.3,12,4.8z" />
            <path d="M12,18.2c-0.4,0-0.7-0.3-0.7-0.7s0.3-0.7,0.7-0.7c1.3,0,2.4-1.1,2.4-2.4c0-0.4,0.3-0.7,0.7-0.7c0.4,0,0.7,0.3,0.7,0.7C15.8,16.5,14.1,18.2,12,18.2z" />
        </symbol>
        <symbol id="icon-caret" viewBox="0 0 24 24">
            <title>caret</title>
            <polygon points="15.7,16.6 11.1,12 15.7,7.4 14.3,6 8.3,12 14.3,18" />
        </symbol>
        <symbol id="icon-menu" viewBox="0 0 24 24">
            <title>menu</title>
            <path d="M23.8,6H0.1V3h23.7V6z M23.8,10.5H0.1v3h23.7V10.5z M14.2,18h-14v3h14V18z" />
        </symbol>
        <symbol id="icon-cross" viewBox="0 0 24 24">
            <title>cross</title>
            <path d="M14.1,12l7.3,7.3l-2.1,2.1L12,14.1l-7.3,7.3l-2.1-2.1L9.9,12L2.6,4.7l2.1-2.1L12,9.9l7.3-7.3l2.1,2.1L14.1,12z" />
        </symbol>
    </svg>
    <main class="view">
        <div class="content">
            <div class="statement_div_echar">
                <div class="boxtitle"><span>一号机组上月产品预警统计</span></div>
                <div id="chart2" class="statement_charts1">
                    <script type="text/javascript">
                        var myChart1 = echarts.init(document.getElementById('chart2'), 'uimaker');
                        option = {
                            tooltip: {
                                trigger: 'item',
                                formatter: "{a} <br/>{b} : {c} ({d}%)"
                            },
                            toolbox: {
                                left: 'left',
                                feature: {
                                    saveAsImage: {}
                                }
                            },
                            legend: {
                                orient: 'vertical',
                                top: 'middle',
                                bottom: 10,
                                left: '',
                                data: ['无预警', '一级预警', '二级预警', '三级预警']
                            },
                            series: [
                                {
                                    type: 'pie',
                                    radius: '65%',
                                    center: ['50%', '50%'],
                                    selectedMode: 'single',
                                    data: [
                                        { value: 1203, name: '三级预警' },
                                        { value: 3004, name: '二级预警' },
                                        { value: 21246, name: '一级预警' },
                                        { value: 73537, name: '无预警' }
                                    ],
                                    itemStyle: {
                                        emphasis: {
                                            shadowBlur: 10,
                                            shadowOffsetX: 0,
                                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                                        }
                                    }
                                }
                            ]
                        };
                        // 使用刚指定的配置项和数据显示图表。
                        myChart1.setOption(option);
                        window.addEventListener("resize", function () {
                            myChart1.resize();
                        });
                    </script>
                </div>
            </div>
            <div class="statement_div_echar">
                <div class="boxtitle"><span>二号机组上月产品预警统计</span></div>
                <div id="chart7" class="statement_charts1">
                    <script type="text/javascript">
                        var myChart7 = echarts.init(document.getElementById('chart7'), 'uimaker');
                        option7 = {
                            tooltip: {
                                trigger: 'item',
                                formatter: "{a} <br/>{b} : {c} ({d}%)"
                            },
                            toolbox: {
                                left: 'left',
                                feature: {
                                    saveAsImage: {}
                                }
                            },
                            legend: {
                                orient: 'vertical',
                                top: 'middle',
                                bottom: 10,
                                left: '',
                                data: ['无预警', '一级预警', '二级预警', '三级预警']
                            },
                            series: [
                                {
                                    type: 'pie',
                                    radius: '65%',
                                    center: ['50%', '50%'],
                                    selectedMode: 'single',
                                    data: [
                                        { value: 1130, name: '三级预警' },
                                        { value: 3700, name: '二级预警' },
                                        { value: 23031, name: '一级预警' },
                                        { value: 71972, name: '无预警' }
                                    ],
                                    itemStyle: {
                                        emphasis: {
                                            shadowBlur: 10,
                                            shadowOffsetX: 0,
                                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                                        }
                                    }
                                }
                            ]
                        };
                        // 使用刚指定的配置项和数据显示图表。
                        myChart7.setOption(option7);
                        window.addEventListener("resize", function () {
                            myChart7.resize();
                        });
                    </script>
                </div>
            </div>
            </header>
        </div>
        <div class="div_from">
            <div class="input_div">
                <form>
                    <div class="parcel_div">
                        <span>开始日期 :</span>
                        <input type="text" id="crew1_month_start_date" value="2018-10-1">
                    </div>

                    <div class="parcel_div">
                        <span>截至日期 :</span>
                        <input type="text" id="crew1_month_end_date" value="2018-10-30">
                    </div>
                    <div class="parcel_div">
                        <span>生产总数(盘) :</span>
                        <input type="text" id="crew1_month_prototal" value="150320">
                    </div>
                    <div class="parcel_div">
                        <span>材料使用总量(吨) :</span>
                        <input type="text" id="crew1_month_total" value="135000">
                    </div>
                    <div class="parcel_div">
                        <span>三级报警最多材料 :</span>
                        <input type="text" id="crew1_month_material_name" value="骨料一">
                    </div>
                    <div class="parcel_div">
                        <span>最大误差 :</span>
                        <input type="text" id="crew1_month_maxDeviation" value="10%">
                    </div>

                    <div class="parcel_div">
                        <span>使用最多配比 :</span>
                        <input type="text" id="crew1_month_ration_name" value="55号配比">
                    </div>

                    <div class="parcel_div">
                        <span>生产数量(盘) :</span>
                        <input type="text" id="crew1_month_count" value="45300">
                    </div>

                </form>
            </div>
        </div>

        <div class="div_from2">
            <div class="input_div">
                <form>
                    <div class="parcel_div">
                        <span>开始日期 :</span>
                        <input type="text" id="crew2_month_start_date" value="2018-10-1">
                    </div>

                    <div class="parcel_div">
                        <span>截至日期 :</span>
                        <input type="text" id="crew2_month_end_date" value="2018-10-30">
                    </div>
                    <div class="parcel_div">
                        <span>生产总数(盘) :</span>
                        <input type="text" id="crew2_month_prototal"  value="125000">
                    </div>
                    <div class="parcel_div">
                        <span>材料使用总量 :</span>
                        <input type="text" id="crew2_month_total" value="105000">
                    </div>
                    <div class="parcel_div">
                        <span>三级报警最多材料 :</span>
                        <input type="text" id="crew2_month_material_name" value="骨料2">
                    </div>
                    <div class="parcel_div">
                        <span>最大误差 :</span>
                        <input type="text" id="crew2_month_maxDeviation" value="8%">
                    </div>
                    <div class="parcel_div">
                        <span>使用最多配比 :</span>
                        <input type="text" id="crew2_month_ration_name" value="4号配比">
                    </div>
                    <div class="parcel_div">
                        <span>生产数量(盘) :</span>
                        <input type="text" id="crew2_month_count" value="35410">
                    </div>

                </form>
            </div>
        </div>
        <button class="btn btn--menu">
            <svg class="icon icon--menu">
                <use xlink:href="#icon-menu"></use>
            </svg>
            <svg class="icon icon--cross">
                <use xlink:href="#icon-cross"></use>
            </svg>
        </button>
        <nav class="tabsnav tabsnav--vertical tabsnav--ander">
            <div class="tabsnav__item" onclick="yearFrom()">
                <div class="tabsnav__bar"></div>
                <h3 class="tabsnav__title">年报表</h3>

            </div>
            <div class="tabsnav__item" onclick="yearSeason()">
                <div class="tabsnav__bar"></div>
                <h3 class="tabsnav__title">季报表</h3>
            </div>
            <div class="tabsnav__item" onclick="yearMonth()">
                <div class="tabsnav__bar"></div>
                <h3 class="tabsnav__title">月报表</h3>
            </div>
        </nav>
        <div class="tabscontent">
            <div class="tabscontent__item">
                <div class="statement_infoboxright">
                    <div class="select">

                        <select id="monthOption" >

                        </select>

                    </div>
                    <ul class="textlist" id="monthList">

                    </ul>
                </div>

                <div class="content">
                    <div class="statement_div_echar">
                        <div class="boxtitle"><span>本年一号机组产品预警统计</span></div>
                        <div id="chart11" class="statement_charts1">
                            <script type="text/javascript">
                                var myChart11 = echarts.init(document.getElementById('chart11'), 'uimaker');
                                option11 = {
                                    tooltip: {
                                        trigger: 'item',
                                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                                    },
                                    legend: {
                                        orient: 'vertical',
                                        top: 'middle',
                                        bottom: 10,
                                        left: '',
                                        data: ['无预警', '一级预警', '二级预警', '三级预警']
                                    },
                                    series: [
                                        {
                                            type: 'pie',
                                            radius: '65%',
                                            center: ['50%', '50%'],
                                            selectedMode: 'single',
                                            data: [
                                                { value: 5351, name: '三级预警' },
                                                { value: 5103, name: '二级预警' },
                                                { value: 63431, name: '一级预警' },
                                                { value: 735532, name: '无预警' }
                                            ],
                                            itemStyle: {
                                                emphasis: {
                                                    shadowBlur: 10,
                                                    shadowOffsetX: 0,
                                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                                }
                                            }
                                        }
                                    ]
                                };
                                // 使用刚指定的配置项和数据显示图表。
                                myChart11.setOption(option11);
                                window.addEventListener("resize", function () {
                                    myChart11.resize();
                                });
                            </script>
                        </div>
                    </div>
                    <div class="statement_div_echar">
                        <div class="boxtitle"><span>本年二号机组产品预警统计</span></div>
                        <div id="chart12" class="statement_charts1">
                            <script type="text/javascript">
                                var myChart12 = echarts.init(document.getElementById('chart12'), 'uimaker');
                                option12 = {
                                    tooltip: {
                                        trigger: 'item',
                                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                                    },
                                    legend: {
                                        orient: 'vertical',
                                        top: 'middle',
                                        bottom: 10,
                                        left: '',
                                        data: ['无预警', '一级预警', '二级预警', '三级预警']
                                    },
                                    series: [
                                        {
                                            type: 'pie',
                                            radius: '65%',
                                            center: ['50%', '50%'],
                                            selectedMode: 'single',
                                            data: [
                                                { value: 5351, name: '三级预警' },
                                                { value: 5103, name: '二级预警' },
                                                { value: 63422, name: '一级预警' },
                                                { value: 735111, name: '无预警' }
                                            ],
                                            itemStyle: {
                                                emphasis: {
                                                    shadowBlur: 10,
                                                    shadowOffsetX: 0,
                                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                                }
                                            }
                                        }
                                    ]
                                };
                                // 使用刚指定的配置项和数据显示图表。
                                myChart12.setOption(option12);
                                window.addEventListener("resize", function () {
                                    myChart12.resize();
                                });
                            </script>
                        </div>
                    </div>
                    </header>
                </div>
                <div class="div_from_month">
                    <div class="input_div">
                        <form>
                            <div class="parcel_div">
                                <span>开始日期 :</span>
                                <input type="text" id="year1_start_date" value="2018-01">
                            </div>

                            <div class="parcel_div">
                                <span>截至日期 :</span>
                                <input type="text" id="year1_end_date" value="2019-02">
                            </div>
                            <div class="parcel_div">
                                <span>生产总数(盘) :</span>
                                <input type="text" id="year1_product_count" value="182500">
                            </div>
                            <div class="parcel_div">
                                <span>材料使用总量(万吨) :</span>
                                <input type="text" id="year1_material_total" value="164.25">
                            </div>
                            <div class="parcel_div">
                                <span>三级报警最多材料 :</span>
                                <input type="text" id="year1_material_name" value="">
                            </div>
                            <div class="parcel_div">
                                <span>最大误差 :</span>
                                <input type="text" id="year1_maxDeviation" value="">%
                            </div>

                            <div class="parcel_div">
                                <span>使用最多配比 :</span>
                                <input type="text" id="year1_ration_name" value="4号配比">
                            </div>

                            <div class="parcel_div">
                                <span>生产数量(盘) :</span>
                                <input type="text" id="year1_count" value="36521">
                            </div>

                        </form>
                    </div>
                </div>

                <div class="div_from_month2">
                    <div class="input_div">
                        <form>
                            <div class="parcel_div">
                                <span>开始日期 :</span>
                                <input type="text" id="year2_start_date" value="2018-01">
                            </div>

                            <div class="parcel_div">
                                <span>截至日期 :</span>
                                <input type="text" id="year2_end_date" value="2019-02">
                            </div>
                            <div class="parcel_div">
                                <span>生产总数(盘) :</span>
                                <input type="text" id="year2_product_count"  value="162900">
                            </div>
                            <div class="parcel_div">
                                <span>材料使用总量(万吨) :</span>
                                <input type="text" id="year2_material_total" value="134.7">
                            </div>
                            <div class="parcel_div">
                                <span>三级报警最多材料 :</span>
                                <input type="text" id="year2_material_name" value="骨料2">
                            </div>
                            <div class="parcel_div">
                                <span>最大误差 :</span>
                                <input type="text" id="year2_maxDeviation" value="7%">
                            </div>
                            <div class="parcel_div">
                                <span>使用最多配比 :</span>
                                <input type="text" id="year2_ration_name" value="4号配比">
                            </div>
                            <div class="parcel_div">
                                <span>生产数量(盘) :</span>
                                <input type="text" id="year2_count" value="71423">
                            </div>

                        </form>
                    </div>
                </div>
                <figure class="poster">
                    <img class="poster__img" src="img/img1.jpg" alt="Poster 1" />
                    <figcaption class="poster__caption">
                        <h2 class="poster__title">home<br />maze</h2>
                        <p class="poster__deco">binary sun</p>
                        <div class="poster__box"></div>
                        <span class="poster__number">03</span>
                    </figcaption>
                </figure>
            </div>
            <div class="tabscontent__item">
                <div class="statement_infoboxright">
                    <div class="select">

                        <select name="">
                            <option value="2018-9-1">2017</option>
                            <option value="2018-10-1">2016</option>
                        </select>

                    </div>
                    <ul class="textlist">
                        <li><a href="#">2018年一季度产品报表</a></li>
                        <li><a href="#">2018年二季度产品报表</a></li>
                        <li><a href="#">2018年三季度产品报表</a></li>
                        <li><a href="#">2017年一季度产品报表</a></li>
                        <li><a href="#">2017年二季度产品报表</a></li>
                        <li><a href="#">2017年三季度产品报表</a></li>
                        <li><a href="#">2017年四季度产品报表</a></li>
                        <li><a href="#">2016年一季度产品报表</a></li>
                        <li><a href="#">2016年二季度产品报表</a></li>
                    </ul>
                </div>

                <div class="content">
                    <div class="statement_div_echar">
                        <div class="boxtitle"><span>2018年一季度一号机组产品预警统计</span></div>
                        <div id="chart5" class="statement_charts1">
                            <script type="text/javascript">
                                var myChart5 = echarts.init(document.getElementById('chart5'), 'uimaker');
                                option5 = {
                                    tooltip: {
                                        trigger: 'item',
                                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                                    },
                                    legend: {
                                        orient: 'vertical',
                                        top: 'middle',
                                        bottom: 10,
                                        left: '',
                                        data: ['无预警', '一级预警', '二级预警', '三级预警']
                                    },
                                    series: [
                                        {
                                            type: 'pie',
                                            radius: '65%',
                                            center: ['50%', '50%'],
                                            selectedMode: 'single',
                                            data: [
                                                { value: 5351, name: '三级预警' },
                                                { value: 4716, name: '二级预警' },
                                                { value: 12234, name: '一级预警' },
                                                { value: 454437, name: '无预警' }
                                            ],
                                            itemStyle: {
                                                emphasis: {
                                                    shadowBlur: 10,
                                                    shadowOffsetX: 0,
                                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                                }
                                            }
                                        }
                                    ]
                                };
                                // 使用刚指定的配置项和数据显示图表。
                                myChart5.setOption(option5);
                                window.addEventListener("resize", function () {
                                    myChart5.resize();
                                });
                            </script>
                        </div>
                    </div>
                    <div class="statement_div_echar">
                        <div class="boxtitle"><span>2018年一季度二号机组产品预警统计</span></div>
                        <div id="charts" class="statement_charts1">
                            <script type="text/javascript">
                                var myCharts = echarts.init(document.getElementById('charts'), 'uimaker');
                                options = {
                                    tooltip: {
                                        trigger: 'item',
                                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                                    },
                                    legend: {
                                        orient: 'vertical',
                                        top: 'middle',
                                        bottom: 10,
                                        left: '',
                                        data: ['无预警', '一级预警', '二级预警', '三级预警']
                                    },
                                    series: [
                                        {
                                            type: 'pie',
                                            radius: '65%',
                                            center: ['50%', '50%'],
                                            selectedMode: 'single',
                                            data: [
                                                { value: 3267, name: '三级预警' },
                                                { value: 5678, name: '二级预警' },
                                                { value: 16457, name: '一级预警' },
                                                { value: 34523, name: '无预警' }
                                            ],
                                            itemStyle: {
                                                emphasis: {
                                                    shadowBlur: 10,
                                                    shadowOffsetX: 0,
                                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                                }
                                            }
                                        }
                                    ]
                                };
                                // 使用刚指定的配置项和数据显示图表。
                                myCharts.setOption(options);
                                window.addEventListener("resize", function () {
                                    myCharts.resize();
                                });
                            </script>
                        </div>
                    </div>
                    </header>
                </div>
                <div class="div_from_month">
                    <div class="input_div">
                        <form>
                            <div class="parcel_div">
                                <span>开始日期 :</span>
                                <input type="text" value="2018-1-01">
                            </div>

                            <div class="parcel_div">
                                <span>截至日期 :</span>
                                <input type="text" value="2018-4-01">
                            </div>
                            <div class="parcel_div">
                                <span>生产总数(盘) :</span>
                                <input type="text" value="13923">
                            </div>
                            <div class="parcel_div">
                                <span>材料使用总量(吨):</span>
                                <input type="text" value="120000">
                            </div>
                            <div class="parcel_div">
                                <span>三级报警最多材料 :</span>
                                <input type="text" value="再生料">
                            </div>
                            <div class="parcel_div">
                                <span>最大误差 :</span>
                                <input type="text" value="3%">
                            </div>

                            <div class="parcel_div">
                                <span>使用最多配比 :</span>
                                <input type="text" value="55号">
                            </div>

                            <div class="parcel_div">
                                <span>生产数量(盘) :</span>
                                <input type="text" value="4700">
                            </div>

                        </form>
                    </div>
                </div>

                <div class="div_from_month2">
                    <div class="input_div">
                        <form>
                            <div class="parcel_div">
                                <span>生产总数(盘) :</span>
                                <input type="text" value="17134">
                            </div>
                            <div class="parcel_div">
                                <span>材料使用总量(吨) :</span>
                                <input type="text" value="98341">
                            </div>
                            <div class="parcel_div">
                                <span>三级报警最多材料 :</span>
                                <input type="text" value="骨料1">
                            </div>
                            <div class="parcel_div">
                                <span>最大误差 :</span>
                                <input type="text" value="6%">
                            </div>
                            <div class="parcel_div">
                                <span>使用最多配比 :</span>
                                <input type="text" value="4号配比">
                            </div>
                            <div class="parcel_div">
                                <span>生产数量(盘) :</span>
                                <input type="text" value="5400">
                            </div>

                        </form>
                    </div>
                </div>
                <figure class="poster">
                    <img class="poster__img" src="img/img1.jpg" alt="Poster 1" />
                    <figcaption class="poster__caption">
                        <h2 class="poster__title">blue<br />gun</h2>
                        <p class="poster__deco">fingerpaint</p>
                        <div class="poster__box"></div>
                        <span class="poster__number">02</span>
                    </figcaption>
                </figure>
            </div>
            <div class="tabscontent__item">
                <div class="statement_infoboxright">
                    <div class="select">

                        <select name="">
                            <option value="2018-9-1">2018-10</option>
                            <option value="2018-10-1">2018-11</option>
                        </select>

                    </div>
                    <ul class="textlist" >
                        <li><a href="#">一八年一月产品报表</a></li>
                        <li><a href="#">一八年二月产品报表</a></li>
                        <li><a href="#">一八年三月产品报表</a></li>
                        <li><a href="#">一八年四月产品报表</a></li>
                        <li><a href="#">一八年五月产品报表</a></li>
                        <li><a href="#">一八年六月产品报表</a></li>
                        <li><a href="#">一八年七月产品报表</a></li>
                        <li><a href="#">一八年十月月产品报表</a></li>
                        <li><a href="#">一八年十一月产品报表</a></li>
                    </ul>
                </div>

                <div class="content">
                    <div class="statement_div_echar">
                        <div class="boxtitle"><span>上月一号机组产品预警统计</span></div>
                        <div id="chart14" class="statement_charts1">
                            <script type="text/javascript">
                                var myChart14 = echarts.init(document.getElementById('chart14'), 'uimaker');
                                option14 = {
                                    tooltip: {
                                        trigger: 'item',
                                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                                    },
                                    legend: {
                                        orient: 'vertical',
                                        top: 'middle',
                                        bottom: 10,
                                        left: '',
                                        data: ['无预警', '一级预警', '二级预警', '三级预警']
                                    },
                                    series: [
                                        {
                                            type: 'pie',
                                            radius: '65%',
                                            center: ['50%', '50%'],
                                            selectedMode: 'single',
                                            data: [
                                                { value: 535, name: '三级预警' },
                                                { value: 765 ,name: '二级预警' },
                                                { value: 3123, name: '一级预警' },
                                                { value: 11394, name: '无预警' }
                                            ],
                                            itemStyle: {
                                                emphasis: {
                                                    shadowBlur: 10,
                                                    shadowOffsetX: 0,
                                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                                }
                                            }
                                        }
                                    ]
                                };
                                // 使用刚指定的配置项和数据显示图表。
                                myChart14.setOption(option14);
                                window.addEventListener("resize", function () {
                                    myChart14.resize();
                                });
                            </script>
                        </div>
                    </div>
                    <div class="statement_div_echar">
                        <div class="boxtitle"><span>九月二号机组产品预警统计</span></div>
                        <div id="chart15" class="statement_charts1">
                            <script type="text/javascript">
                                var myChart15 = echarts.init(document.getElementById('chart15'), 'uimaker');
                                option15 = {
                                    tooltip: {
                                        trigger: 'item',
                                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                                    },
                                    legend: {
                                        orient: 'vertical',
                                        top: 'middle',
                                        bottom: 10,
                                        left: '',
                                        data: ['无预警', '一级预警', '二级预警', '三级预警']
                                    },
                                    series: [
                                        {
                                            type: 'pie',
                                            radius: '65%',
                                            center: ['50%', '50%'],
                                            selectedMode: 'single',
                                            data: [
                                                { value: 535, name: '三级预警' },
                                                { value: 510, name: '二级预警' },
                                                { value: 634, name: '一级预警' },
                                                { value: 735, name: '无预警' }
                                            ],
                                            itemStyle: {
                                                emphasis: {
                                                    shadowBlur: 10,
                                                    shadowOffsetX: 0,
                                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                                }
                                            }
                                        }
                                    ]
                                };
                                // 使用刚指定的配置项和数据显示图表。
                                myChart15.setOption(option15);
                                window.addEventListener("resize", function () {
                                    myChart15.resize();
                                });
                            </script>
                        </div>
                    </div>
                    </header>
                </div>
                <div class="div_from_month">
                    <div class="input_div">
                        <form>
                            <div class="parcel_div">
                                <span>开始日期 :</span>
                                <input type="text" value="2018-9-01" id="crew1_LastMonth_start_date">
                            </div>

                            <div class="parcel_div">
                                <span>截至日期 :</span>
                                <input type="text" value="2018-10-01" id="crew1_LastMonth_end_date">
                            </div>
                            <div class="parcel_div">
                                <span>生产总数(盘) :</span>
                                <input type="text" value="15872" id="crew1_LastMonth_prototal">
                            </div>
                            <div class="parcel_div">
                                <span>材料使用总量(吨) :</span>
                                <input type="text" value="15764" id="crew1_LastMonth_total">
                            </div>
                            <div class="parcel_div">
                                <span>三级报警最多材料 :</span>
                                <input type="text" value="骨料2" id="crew1_LastMonth_material_name">
                            </div>
                            <div class="parcel_div">
                                <span>最大误差 :</span>
                                <input type="text" value="5%" id="crew1_LastMonth_maxDeviation">
                            </div>

                            <div class="parcel_div">
                                <span>使用最多配比 :</span>
                                <input type="text" value="4号配比" id="crew1_LastMonth_ration_name">
                            </div>

                            <div class="parcel_div">
                                <span>生产数量(盘) :</span>
                                <input type="text" value="4576" id="crew1_LastMonth_count">
                            </div>

                        </form>
                    </div>
                </div>

                <div class="div_from_month2">
                    <div class="input_div">
                        <form>
                            <div class="parcel_div">
                                <span>开始日期 :</span>
                                <input type="text" value="2018-9-01" id="crew2_LastMonth_start_date">
                            </div>

                            <div class="parcel_div">
                                <span>截至日期 :</span>
                                <input type="text" value="2018-10-01" id="crew2_LastMonth_end_date">
                            </div>
                            <div class="parcel_div">
                                <span>生产总数(盘) :</span>
                                <input type="text" value="12642" id="crew2_LastMonth_prototal">
                            </div>
                            <div class="parcel_div">
                                <span>材料使用总量(吨) :</span>
                                <input type="text" value="13690" id="crew2_LastMonth_total">
                            </div>
                            <div class="parcel_div">
                                <span>三级报警最多材料 :</span>
                                <input type="text" value="再生料" id="crew2_LastMonth_material_name">
                            </div>
                            <div class="parcel_div">
                                <span>最大误差 :</span>
                                <input type="text" value="5%" id="crew2_LastMonth_maxDeviation" >
                            </div>
                            <div class="parcel_div">
                                <span>使用最多配比 :</span>
                                <input type="text" value="60号配比" id="crew2_LastMonth_ration_name">
                            </div>
                            <div class="parcel_div">
                                <span>生产数量(盘) :</span>
                                <input type="text" value="4512" id="crew2_LastMonth_count">
                            </div>

                        </form>
                    </div>
                </div>
                <figure class="poster">
                    <img class="poster__img" src="img/img1.jpg" alt="Poster 1" />
                    <figcaption class="poster__caption">
                        <h2 class="poster__title">wild<br />corn</h2>
                        <p class="poster__deco">nothing lost</p>
                        <div class="poster__box"></div>
                        <span class="poster__number">01</span>
                    </figcaption>
                </figure>
            </div>
            <button class="btn btn--back"><svg class="icon icon--caret">
                <use xlink:href="#icon-caret"></use>
            </svg></button>
        </div>
    </main>
    <%--js获取路径--%>
    <input id="path" type="hidden" value="${path}"/>
</body>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/oa/oa_common.js"></script>

<script src="/static/js/qc/statement/anime.min.js"></script>
<script src="/static/js/qc/statement/enquire.min.js"></script>
<script src="/static/js/qc/statement/tabsnav.js"></script>
<script src="/static/js/qc/statement/demo1.js"></script>
<script src="/static/js/qc/quality_statement.js"></script>
</html>