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
    <title>实验检测</title>
    <link href="/static/css/test_detection.css" rel="stylesheet" type="text/css">
    <link href="/static/css/default.css" rel="stylesheet" type="text/css">
    <script src="/static/js/echarts/echarts.js"></script>
    <script src="/static/js/echarts/uimaker.js"></script>
</head>

<body >
    <div class="div_munu" style="z-index: 100;" >
        <ul class="munu">
			<li><a href="javascript:void(0)" id="detection_start" onclick="detection_start(this.id)" ><b>开始试验</b></a></li>
			<li><a href="javascript:void(0)" id="history_result" onclick="detection_start(this.id)" ><b>历史结果</b></a></li>
			<li><a href="javascript:void(0)" id="meta_analysis" onclick="detection_start(this.id)" ><b>汇总分析</b></a></li>
		</ul>
    </div>

    <div class="div_munu_detection" id="menu_one" style="z-index: 1;display: none;"  >
        <ul class="munu_detection">
			<li><a href="javascript:void(0)" id="material_1" onclick="test_fn(this.id)"  ><b>粗集料试验</b></a></li>
			<li><a href="javascript:void(0)" id="material_2" onclick="test_fn(this.id)" ><b>细集料实验</b></a></li>
            <li><a href="javascript:void(0)" id="material_3" onclick="test_fn(this.id)" ><b>矿粉实验</b></a></li>
            <li><a href="javascript:void(0)" id="material_4" onclick="test_fn(this.id)" ><b>沥青实验</b></a></li>
            <li><a href="javascript:void(0)" id="material_5" onclick="test_fn(this.id)" ><b>纤维试验</b></a></li>
            <li><a href="javascript:void(0)" id="material_6" onclick="test_fn(this.id)" ><b>沥青混合料</b></a></li>
            <li><a href="javascript:void(0)" id="material_7" onclick="test_fn(this.id)"  ><b>沥青混合料试验</b></a></li>
		</ul>
    </div>

    <div class="div_munu_detection" id="test_material_one" style="z-index: 1;display: none;" >
        <ul class="munu_detection">
            <li><b>粗集料实验</b></li>
			<li><a href="javascript:void(0)" id="detection_start"  ><b>SYJL/T01-01</b></a></li>
			<li><a href="javascript:void(0)" id="history_result" ><b>SYJL/T01-02</b></a></li>
            <li><a href="javascript:void(0)" id="meta_analysis"  ><b>SYJL/T01-03</b></a></li>
            <li><a href="javascript:void(0)" id="meta_analysis"  ><b>SYJL/T01-02</b></a></li>
		</ul>
    </div>
    <div class="div_munu_detection" id="test_material_two" style="z-index: 1;display: none;" >
        <ul class="munu_detection">
            <li><b>细集料实验</b></li>
			<li><a href="javascript:void(0)" id="detection_start"  ><b>SYJL/T02-01</b></a></li>
			<li><a href="javascript:void(0)" id="history_result" ><b>SYJL/T02-02</b></a></li>
            <li><a href="javascript:void(0)" id="meta_analysis"  ><b>SYJL/T02-03</b></a></li>
		</ul>
    </div>
    <div class="div_munu_detection" id="test_material_three" style="z-index: 1;display: none;" >
        <ul class="munu_detection">
			<li><b>矿粉实验</b></li>
			<li><a href="javascript:void(0)" id="detection_start"  ><b>SYJL/T03-01</b></a></li>
		</ul>
    </div>
    <div class="div_munu_detection" id="test_material_four" style="z-index: 1;display: none;" >
        <ul class="munu_detection">
			<li><b>沥青实验</b></li>
			<li><a href="javascript:void(0)" id="detection_start"  ><b>SYJL/T04-01</b></a></li>
			<li><a href="javascript:void(0)" id="history_result" ><b>SYJL/T04-02</b></a></li>
            <li><a href="javascript:void(0)" id="meta_analysis"  ><b>SYJL/T04-03</b></a></li>
            <li><a href="javascript:void(0)" id="meta_analysis"  ><b>SYJL/T04-01</b></a></li>
            <li><a href="javascript:void(0)" id="meta_analysis"  ><b>SYJL/T04-02</b></a></li>
		</ul>
    </div>
    <div class="div_munu_detection" id="test_material_five" style="z-index: 1;display: none;" >
        <ul class="munu_detection">
            <li><b>纤维实验</b></li>
			<li><a href="javascript:void(0)" id="detection_start"  ><b>SYJL/T05-01</b></a></li>
		</ul>
    </div>
    <div class="div_munu_detection" id="test_material_six" style="z-index: 1;display: none;" >
        <ul class="munu_detection">
            <li><b>马氏、密度实验</b></li>
			<li><a href="javascript:void(0)" id="detection_start"  ><b>SYJL/T06-07</b></a></li>
		</ul>
    </div>
    <div class="div_munu_detection" id="test_material_seven" style="z-index: 1;display: none;" >
        <ul class="munu_detection">
            <li><b>沥青混合料实验</b></li>
			<li><a href="javascript:void(0)" id="detection_start"  ><b>SYJL/T06-01</b></a></li>
			<li><a href="javascript:void(0)" id="history_result" ><b>SYJL/T06-02</b></a></li>
            <li><a href="javascript:void(0)" id="meta_analysis"  ><b>SYJL/T06-04</b></a></li>
            <li><a href="javascript:void(0)" id="meta_analysis"  ><b>SYJL/T06-05</b></a></li>
            <li><a href="javascript:void(0)" id="meta_analysis"  ><b>SYJL/T06-06</b></a></li>
            <li><a href="javascript:void(0)" id="meta_analysis"  ><b>SYJL/T03-03</b></a></li>
		</ul>
    </div>

    <div class="div_from" id="SYJL/T01-01" style="z-index: 1;display: none;" >
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

    <div class="div_from" id="SYJL/T01-02"  style="z-index: 1;display: none;" >
        <div class="title_from" >
            <span>粗集料试验记录<i>（SYJL/T01-02）</i></span>
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
                    <span>压碎值试验 T0316-2005</span>
                </div>
                <div class="div_input_only">
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
                    
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
                    
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
                    
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>材料编号</span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验前质量m<sub><small>0</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>通过2.36mm筛孔质量m<sub><small>1</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>材料编号</span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验前质量m<sub><small>0</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>通过2.36mm筛孔质量m<sub><small>1</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>材料编号</span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验前质量m<sub><small>0</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>通过2.36mm筛孔质量m<sub><small>1</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                </div>

                <div  class="div_span" >
                    <span>洛杉矶磨耗试验 T0317-2005</span>
                </div>
                <div class="div_input_only">
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
                    
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
                    
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
                    
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>材料编号</span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验前质量m<sub><small>0</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>1.7mm筛上 质量m<sub><small>2</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>材料编号</span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验前质量m<sub><small>0</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>1.7mm筛上 质量m<sub><small>2</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>

                </div>

                <div  class="div_span" >
                    <span>坚固性试验 T0314-2000</span>
                </div>
                <div class="div_input_only">
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
                    
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
                    
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
                    
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>材料粒级</span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验前烘干质量m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验后烘干质量m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>材料粒级</span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验前烘干质量m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验后烘干质量m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>材料粒级</span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验前烘干质量m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验后烘干质量m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>材料粒级</span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验前烘干质量m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验后烘干质量m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>材料粒级</span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验前烘干质量m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验后烘干质量m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>材料粒级</span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验前烘干质量m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验后烘干质量m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>材料粒级</span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验前烘干质量m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验后烘干质量m<sub><small>i</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                </div>

                <div  class="div_span" >
                    <span>粘附性 <i>T0616-1993</i> </span>
                </div>

                <div class="div_input" >
                    <div class="parcel_div" >
                        <span>集料粒径<i>(mm)</i> </span>
                        <input type="text" value="You'r Message" >
                    </div>
                    <div class="parcel_div" >
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message" >
                    </div>
                    <div class="parcel_div">
                        <span>颗粒1 </span>
                        <input type="text" value="You'r Message">
                    </div>

                    <div class="parcel_div">
                        <span>颗粒2 </span>
                        <input type="text" value="You'r Message">
                    </div>

                    <div class="parcel_div">
                        <span>颗粒3 </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_div">
                        <span>颗粒4 </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_div">
                        <span>颗粒5 </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_div">
                        <span>采用的方法 </span>
                        <input type="text" value="You'r Message">
                    </div>
                </div>

                <div  class="div_span" >
                    <span>泥块含量 <i>T0310-2005</i></span>
                </div>
                <div class="div_input_only">
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
                    
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
                    
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
                    
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>材料编号</span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>4.75mm筛余烘干质量m<sub><small>2</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验后烘干质量m<sub><small>3</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>材料编号</span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>4.75mm筛余烘干质量m<sub><small>2</small></sub> <i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验后烘干质量m<sub><small>3</small></sub> <i>(g)</i> </span>
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

    <div class="div_from" id="SYJL/T01-03" style="z-index: 1;">
        <div class="title_from">
            <span>粗集料试验记录
                <i>（SYJL/T01-03）</i>
            </span>
        </div>
        <div class="input_div">
            <form>
    
                <div class="div_span">
                    <span>实验基础信息 </span>
                </div>
    
                <div class="div_input">
                    <div class="parcel_div">
                        <span>种类规格 </span>
                        <input type="text" value="You'r Message">
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
    
                <div class="div_span">
                    <span>密度及吸水率试验 <i>T0304-2005</i></span>
                </div>
                <div class="div_input_only">
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>

                    <div class="parcel_div">
                        <span>水温<i>(℃)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                </div>
                <div class="div_input">
                    <div class="parcel_div">
                        <span>二号材料编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
    
                    <div class="parcel_div">
                        <span>烘干重m<sub><i>a</i></sub><i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
    
                    <div class="parcel_div">
                        <span>水中重m<sub><i>w</i></sub><i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
    
                    <div class="parcel_div">
                        <span>表观相对密度<i>γ</i></span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_div">
                        <span>毛体积相对密度<i>γ</i></span>
                        <input type="text" value="You'r Message">
                    </div>
    
                    <div class="parcel_div">
                        <span>表干重m<sub><i>f</i></sub><i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                </div>
                <br>
                <div class="div_input">
                    <div class="parcel_div">
                        <span>一号材料编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
    
                    <div class="parcel_div">
                        <span>烘干重m<i>a</i><i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
    
                    <div class="parcel_div">
                        <span>水中重m<i>w</i><i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
    
                    <div class="parcel_div">
                        <span>表干重m<sub><i>f</i></sub><i>(g)</i> </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_div">
                        <span>表观相对密度<i>γ</i></span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_div">
                        <span>毛体积相对密度<i>γ</i></span>
                        <input type="text" value="You'r Message">
                    </div>
                </div>


                   <div class="div_span">
                        <span>针片状颗粒含量试验<i>T0312-2005</i> </span>
                    </div>
                    <div class="div_input">
                            <div class="parcel_two_div">
                                <span>材料编号</span>
                                <input type="text" value="You'r Message">
                            </div>
                            <div class="parcel_two_div">
                                <span>总质量m
                                    <sub>
                                        <small>0</small>
                                    </sub>
                                    <i>(g)</i>
                                </span>
                                <input type="text" value="You'r Message">
                            </div>
                            <div class="parcel_two_div">
                                <span>针片状质量m
                                    <sub>
                                        <small>1</small>
                                    </sub>
                                    <i>(g)</i>
                                </span>
                                <input type="text" value="You'r Message">
                            </div>
                            <div class="parcel_two_div">
                                <span>材料编号</span>
                                <input type="text" value="You'r Message">
                            </div>
                            <div class="parcel_two_div">
                                <span>总质量m
                                    <sub>
                                        <small>0</small>
                                    </sub>
                                    <i>(g)</i>
                                </span>
                                <input type="text" value="You'r Message">
                            </div>
                            <div class="parcel_two_div">
                                <span>针片状质量m
                                    <sub>
                                        <small>1</small>
                                    </sub>
                                    <i>(g)</i>
                                </span>
                                <input type="text" value="You'r Message">
                            </div>

                           <div class="parcel_two_div">
                                <span>设备编号</span>
                                <input type="text" value="You'r Message">
                            </div>
                            <div class="parcel_two_div">
                                <span>设备编号</span>
                                <input type="text" value="You'r Message">
                            </div>
                            <div class="parcel_two_div">
                                <span>设备编号</span>
                                <input type="text" value="You'r Message">
                            </div>
                    </div>
                   <div class="div_span">
                        <span>含水率<i>T0305-1994</i> </span>
                    </div>
                    <div class="div_input">
                            <div class="parcel_two_div">
                                <span>材料编号</span>
                                <input type="text" value="You'r Message">
                            </div>
                            <div class="parcel_two_div">
                                <span>试验前试样质量m
                                    <sub>
                                        <small>0</small>
                                    </sub>
                                    <i>(g)</i>
                                </span>
                                <input type="text" value="You'r Message">
                            </div>
                            <div class="parcel_two_div">
                                <span>试验后试样质量m
                                    <sub>
                                        <small>1</small>
                                    </sub>
                                    <i>(g)</i>
                                </span>
                                <input type="text" value="You'r Message">
                            </div>
                            <div class="parcel_two_div">
                                <span>材料编号</span>
                                <input type="text" value="You'r Message">
                            </div>
                            <div class="parcel_two_div">
                                <span>试验前试样质量m
                                    <sub>
                                        <small>0</small>
                                    </sub>
                                    <i>(g)</i>
                                </span>
                                <input type="text" value="You'r Message">
                            </div>
                            <div class="parcel_two_div">
                                <span>试验后试样质量m
                                    <sub>
                                        <small>1</small>
                                    </sub>
                                    <i>(g)</i>
                                </span>
                                <input type="text" value="You'r Message">
                            </div>

                           <div class="parcel_two_div">
                                <span>设备编号</span>
                                <input type="text" value="You'r Message">
                            </div>
                            <div class="parcel_two_div">
                                <span>设备编号</span>
                                <input type="text" value="You'r Message">
                            </div>
                            <div class="parcel_two_div">
                                <span>设备编号</span>
                                <input type="text" value="You'r Message">
                            </div>
                    </div>
                   <div class="div_span">
                        <span>软弱颗粒试验<i>T0320-2000</i> </span>
                    </div>
                    <div class="div_input">
                            <div class="parcel_two_div">
                                <span>设备编号</span>
                                <input type="text" value="You'r Message">
                            </div>
                            <div class="parcel_two_div">
                                <span>各粒级颗粒总质量m
                                    <sub>
                                        <small>1</small>
                                    </sub>
                                    <i>(g)</i>
                                </span>
                                <input type="text" value="You'r Message">
                            </div>
                            <div class="parcel_two_div">
                                <span>各粒级完好颗粒总质量m
                                    <sub>
                                        <small>2</small>
                                    </sub>
                                    <i>(g)</i>
                                </span>
                                <input type="text" value="You'r Message">
                            </div>
                    </div>

                   <div class="div_span">
                        <span>堆积密度<i>T0309-2005</i> </span>
                    </div>
                    <div class="div_input">
                        <div class="parcel_div">
                            <span>材料编号 </span>
                            <input type="text" value="You'r Message">
                        </div>

                        <div class="parcel_div">
                            <span>容量筒质量m<sub><i>i</i></sub><i>(kg)</i> </span>
                            <input type="text" value="You'r Message">
                        </div>

                        <div class="parcel_div">
                            <span>容量筒+水质量m(kg)</i> </span>
                            <input type="text" value="You'r Message">
                        </div>

                        <div class="parcel_div">
                            <span>水质量m<sub><i>w</i></sub><i>(kg)</i></span>
                            <input type="text" value="You'r Message">
                        </div>
                        <div class="parcel_div">
                            <span>材料编号 </span>
                            <input type="text" value="You'r Message">
                        </div>

                        <div class="parcel_div">
                            <span>容量筒质量m<sub><i>i</i></sub><i>(kg)</i> </span>
                            <input type="text" value="You'r Message">
                        </div>

                        <div class="parcel_div">
                            <span>容量筒+水质量m(kg)</i> </span>
                            <input type="text" value="You'r Message">
                        </div>

                        <div class="parcel_div">
                            <span>水质量m<sub><i>w</i></sub><i>(kg)</i></span>
                            <input type="text" value="You'r Message">
                        </div>
                    </div>


                    
                    <div class="div_input">
                        <div class="parcel_div">
                            <span>材料编号 </span>
                            <input type="text" value="You'r Message">
                        </div>

                        <div class="parcel_div">
                            <span>自然状态重m<sub><i>2</i></sub><i>(kg)</i> </span>
                            <input type="text" value="You'r Message">
                        </div>

                        <div class="parcel_div">
                            <span>振实状态重m<sub><i>2</i></sub>(kg) </span>
                            <input type="text" value="You'r Message">
                        </div>

                        <div class="parcel_div">
                            <span>捣实状态重m<sub><i>2</i></sub>(kg) </span>
                            <input type="text" value="You'r Message">
                        </div>
                       <div class="parcel_div">
                            <span>材料编号 </span>
                            <input type="text" value="You'r Message">
                        </div>

                        <div class="parcel_div">
                            <span>自然状态重m<sub><i>2</i></sub><i>(kg)</i> </span>
                            <input type="text" value="You'r Message">
                        </div>

                        <div class="parcel_div">
                            <span>振实状态重m<sub><i>2</i></sub>(kg) </span>
                            <input type="text" value="You'r Message">
                        </div>

                        <div class="parcel_div">
                            <span>捣实状态重m<sub><i>2</i></sub>(kg) </span>
                            <input type="text" value="You'r Message">
                        </div>
                        <div class="parcel_div">
                            <span>试验时水温(℃) </span>
                            <input type="text" value="You'r Message">
                        </div>
                        <div class="parcel_div">
                            <span>设备编号 </span>
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

    <div class="div_from" id="SYJL/T01-04" style="z-index: 1;display: none;">
        <div class="title_from">
            <span>粗集料试验记录
                <i>（SYJL/T01-03）</i>
            </span>
        </div>
        <div class="input_div">
            <form>
    
                <div class="div_span">
                    <span>实验基础信息 </span>
                </div>
    
                <div class="div_input">
                    <div class="parcel_div">
                        <span>种类规格 </span>
                        <input type="text" value="You'r Message">
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
    
                <div class="div_span">
                    <span>压碎值试验 <i>T0316-2005</i></span>
                </div>
                <div class="div_input_only">
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
    
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
    
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
    
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>材料编号</span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验前质量m
                            <sub>
                                <small>0</small>
                            </sub>
                            <i>(g)</i>
                        </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>通过2.36mm筛孔质量m
                            <sub>
                                <small>1</small>
                            </sub>
                            <i>(g)</i>
                        </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>材料编号</span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验前质量m
                            <sub>
                                <small>0</small>
                            </sub>
                            <i>(g)</i>
                        </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>通过2.36mm筛孔质量m
                            <sub>
                                <small>1</small>
                            </sub>
                            <i>(g)</i>
                        </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>材料编号</span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验前质量m
                            <sub>
                                <small>0</small>
                            </sub>
                            <i>(g)</i>
                        </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>通过2.36mm筛孔质量m
                            <sub>
                                <small>1</small>
                            </sub>
                            <i>(g)</i>
                        </span>
                        <input type="text" value="You'r Message">
                    </div>
                </div>
    
                <div class="div_span">
                    <span>洛杉矶磨耗试验 <i>T0317-2005</i></span>
                </div>
                <div class="div_input_only">
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
    
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
    
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
    
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>材料编号</span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验前质量m
                            <sub>
                                <small>0</small>
                            </sub>
                            <i>(g)</i>
                        </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>1.7mm筛上 质量m
                            <sub>
                                <small>2</small>
                            </sub>
                            <i>(g)</i>
                        </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>材料编号</span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验前质量m
                            <sub>
                                <small>0</small>
                            </sub>
                            <i>(g)</i>
                        </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>1.7mm筛上 质量m
                            <sub>
                                <small>2</small>
                            </sub>
                            <i>(g)</i>
                        </span>
                        <input type="text" value="You'r Message">
                    </div>
    
                </div>
    
                <div class="div_span">
                    <span>坚固性试验 <i>T0314-2000</i></span>
                </div>
                <div class="div_input_only">
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
    
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
    
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
    
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>材料粒级</span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验前烘干质量m
                            <sub>
                                <small>i</small>
                            </sub>
                            <i>(g)</i>
                        </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验后烘干质量m
                            <sub>
                                <small>i</small>
                            </sub>
                            <i>(g)</i>
                        </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>材料粒级</span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验前烘干质量m
                            <sub>
                                <small>i</small>
                            </sub>
                            <i>(g)</i>
                        </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验后烘干质量m
                            <sub>
                                <small>i</small>
                            </sub>
                            <i>(g)</i>
                        </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>材料粒级</span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验前烘干质量m
                            <sub>
                                <small>i</small>
                            </sub>
                            <i>(g)</i>
                        </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验后烘干质量m
                            <sub>
                                <small>i</small>
                            </sub>
                            <i>(g)</i>
                        </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>材料粒级</span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验前烘干质量m
                            <sub>
                                <small>i</small>
                            </sub>
                            <i>(g)</i>
                        </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验后烘干质量m
                            <sub>
                                <small>i</small>
                            </sub>
                            <i>(g)</i>
                        </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>材料粒级</span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验前烘干质量m
                            <sub>
                                <small>i</small>
                            </sub>
                            <i>(g)</i>
                        </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验后烘干质量m
                            <sub>
                                <small>i</small>
                            </sub>
                            <i>(g)</i>
                        </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>材料粒级</span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验前烘干质量m
                            <sub>
                                <small>i</small>
                            </sub>
                            <i>(g)</i>
                        </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验后烘干质量m
                            <sub>
                                <small>i</small>
                            </sub>
                            <i>(g)</i>
                        </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>材料粒级</span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验前烘干质量m
                            <sub>
                                <small>i</small>
                            </sub>
                            <i>(g)</i>
                        </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验后烘干质量m
                            <sub>
                                <small>i</small>
                            </sub>
                            <i>(g)</i>
                        </span>
                        <input type="text" value="You'r Message">
                    </div>
                </div>
    
                <div class="div_span">
                    <span>粘附性
                        <i>T0616-1993</i>
                    </span>
                </div>
    
                <div class="div_input">
                    <div class="parcel_div">
                        <span>集料粒径
                            <i>(mm)</i>
                        </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_div">
                        <span>颗粒1 </span>
                        <input type="text" value="You'r Message">
                    </div>
    
                    <div class="parcel_div">
                        <span>颗粒2 </span>
                        <input type="text" value="You'r Message">
                    </div>
    
                    <div class="parcel_div">
                        <span>颗粒3 </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_div">
                        <span>颗粒4 </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_div">
                        <span>颗粒5 </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_div">
                        <span>采用的方法 </span>
                        <input type="text" value="You'r Message">
                    </div>
                </div>
    
                <div class="div_span">
                    <span>泥块含量
                        <i>T0310-2005</i>
                    </span>
                </div>
                <div class="div_input_only">
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
    
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
    
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
    
                    <div class="parcel_div">
                        <span>设备编号 </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>材料编号</span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>4.75mm筛余烘干质量m
                            <sub>
                                <small>2</small>
                            </sub>
                            <i>(g)</i>
                        </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验后烘干质量m
                            <sub>
                                <small>3</small>
                            </sub>
                            <i>(g)</i>
                        </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>材料编号</span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>4.75mm筛余烘干质量m
                            <sub>
                                <small>2</small>
                            </sub>
                            <i>(g)</i>
                        </span>
                        <input type="text" value="You'r Message">
                    </div>
                    <div class="parcel_two_div">
                        <span>试验后烘干质量m
                            <sub>
                                <small>3</small>
                            </sub>
                            <i>(g)</i>
                        </span>
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