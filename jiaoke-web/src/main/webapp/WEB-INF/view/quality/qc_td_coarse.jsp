<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <link href="/static/css/test_detection.css" rel="stylesheet" type="text/css">
    <link href="/static/css/default.css" rel="stylesheet" type="text/css">
    <script src="/static/js/echarts/echarts.js"></script>
    <script src="/static/js/echarts/uimaker.js"></script>
</head>

<body >

    <div class="div_from">
        <div class="title_from" >
            <span>粗集料试验记录<i>（SYJL/T01-01）</i></span>
        </div>
        <div class="input_div" >
            <form >

                <div  class="div_span" >
                    <span>实验基础信息 </span>
                </div>

                <div class="div_input" >
                    <div class="parcel_div" >
                        <span>种类规格 </span>
                        <input type="text" value="You'r Message" >
                    </div>

                    <div class="parcel_div">
                        <span>取样地点 </span>
                        <input type="text" value="You'r Message">
                    </div>

                    <div class="parcel_div">
                        <span>实验人 </span>
                        <input type="text" value="You'r Message">
                    </div>

                    <div class="parcel_div">
                        <span>试验日期 </span>
                        <input type="text" value="You'r Message">
                    </div>
                </div>

                <div  class="div_span" >
                    <span>干燥试样总量m<sub><small>3</small></sub> <i>(g)</i></span>
                </div>

                <div  class="div_input_only" >
                    <div class="parcel_div" >
                        <span>第一组 </span>
                        <input type="text" value="You'r Message" >
                    </div>

                    <div class="parcel_div">
                        <span>第二组 </span>
                        <input type="text" value="You'r Message">
                    </div>
                </div>


                <div  class="div_span" >
                    <span>水洗后筛上总量 m<sub><small>4</small></sub> <i>(g)</i></span>
                </div>

                <div class="div_input_only" >
                    <div class="parcel_div" >
                        <span>第一组 </span>
                        <input type="text" value="You'r Message" >
                    </div>

                    <div class="parcel_div">
                        <span>第二组 </span>
                        <input type="text" value="You'r Message">
                    </div>
                </div>

                <div  class="div_span" >
                    <span>水洗后0.075mm 筛下量m<sub><small>0.0075</small></sub><i>(g)</i></span>
                </div>

                <div class="div_input_only" >
                    <div class="parcel_div">
                        <span>第一组 </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_div">
                        <span>第二组 </span>
                        <input type="text" value="You'r Message">
                    </div>
                </div>


                <div  class="div_span" >
                    <span>通过率检测</span>
                </div>

                <div class="div_input_only" >
                    <div class="parcel_two_div">
                        <span>筛孔尺寸<i>(mm)</i></span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>(1)筛上重m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>(2)筛上重m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>筛孔尺寸<i>(mm)</i></span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>(1)筛上重m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>(2)筛上重m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>筛孔尺寸<i>(mm)</i></span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>(1)筛上重m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>(2)筛上重m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>筛孔尺寸<i>(mm)</i></span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>(1)筛上重m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>(2)筛上重m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div> 
                    <div class="parcel_two_div">
                        <span>筛孔尺寸<i>(mm)</i></span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>(1)筛上重m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>(2)筛上重m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>筛孔尺寸<i>(mm)</i></span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>(1)筛上重m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>(2)筛上重m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div> 
                    <div class="parcel_two_div">
                        <span>筛孔尺寸<i>(mm)</i></span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>(1)筛上重m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>(2)筛上重m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>筛孔尺寸<i>(mm)</i></span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>(1)筛上重m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>(2)筛上重m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>                    
                    <div class="parcel_two_div">
                        <span>筛底<i>(mm)</i></span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>(1)筛上重m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>(2)筛上重m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>干筛后总量Σm<sub><small>i</small></sub></span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>(1)筛上重m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>(2)筛上重m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>损耗m<sub><small>5</small></sub><i>(g)</i></span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>(1)筛上重m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>(2)筛上重m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div> 
                    <div class="parcel_two_div">
                        <span>扣除损耗后总量<i>(g)</i></span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>(1)筛上重m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>(2)筛上重m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div> 
                </div>

                <div  class="div_span" >
                    <span>其他信息</span>
                </div>

                <div  class="div_input_only" >
                    <div class="parcel_div" >
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message" >
                    </div>

                    <div class="parcel_div">
                        <span>备注 </span>
                        <input type="text" value="You'r Message">
                    </div>
                </div>
 

                <div class="btn_div">
                    <input type="button" value="开始实验">
                    <input type="button" value="重置参数">
                </div>
            </form>
        </div>
    </div>
</body>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/qc/detection.js"></script>

</html>