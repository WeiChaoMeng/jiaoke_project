/**
 * FileName: QualityWarningUtil
 * author:   Melone
 * Date:     2018/10/8 11:02
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiake.utils;

import com.alibaba.druid.util.StringUtils;
import com.jiaoke.quality.bean.QualityRatioTemplate;
import com.jiaoke.quality.bean.QualityWarningData;
import org.apache.logging.log4j.core.util.ArrayUtils;

import java.sql.*;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

/**
 * <一句话功能描述>
 * 公共工具类
 *
 * @author: Melone
 * @create: 2018/10/8 11:02
 * @Description:
 */
public class QualityWarningUtil {


    private static Map<String,String> aggregate1 = new HashMap<>();
    private static Map<String,String> aggregate2 = new HashMap<>();
    private static Map<String,String> aggregate3 = new HashMap<>();
    private static Map<String,String> aggregate4 = new HashMap<>();
    private static Map<String,String> aggregate5 = new HashMap<>();
    private static Map<String,String> aggregate6 = new HashMap<>();
    private static Map<String,String> breeze = new HashMap<>();
    private static Map<String,String> asphalt = new HashMap<>();
    private static Map<String,String> regenerate = new HashMap<>();
    private static Map<String,String> additive = new HashMap<>();
    private static Map<String,String> warehouse1 = new HashMap<>();
    private static Map<String,String> temperatureMixture = new HashMap<>();
    private static Map<String,String> temperatureDuster = new HashMap<>();
    private static Map<String,String> temperatureAsphalt = new HashMap<>();
    private static Map<String,String> temperatureAggregate = new HashMap<>();



     static {
         Connection connection = null;
         List<Map<String,String>> list = new ArrayList<>();
         try {
             connection = getConnection();
             list = getDouyinAccountMap(connection);
         } catch (Exception e) {
             e.printStackTrace();
         }
//         List<Map<String,String>> list = qualityWarningDao.selectWarningLevel();

        for (int i = 0; i < list.size();i++){
            String materialName = list.get(i).get("material_name");

            switch (materialName){
                case "aggregate1":
                    aggregate1 = list.get(i);
                    break;
                case "aggregate2":
                    aggregate2 = list.get(i);
                    break;
                case "aggregate3":
                    aggregate3 = list.get(i);
                    break;
                case "aggregate4":
                    aggregate4 = list.get(i);
                    break;
                case "aggregate5":
                    aggregate5 = list.get(i);
                    break;
                case "aggregate6":
                    aggregate6 = list.get(i);
                    break;
                case "breeze":
                    breeze = list.get(i);
                    break;
                case "asphalt":
                    asphalt = list.get(i);
                    break;
                case "regenerate":
                    regenerate = list.get(i);
                    break;
                case "additive":
                    additive = list.get(i);
                    break;
                case "warehouse_1":
                    warehouse1 = list.get(i);
                    break;
                case "temperature_mixture":
                    temperatureMixture = list.get(i);
                    break;
                case "temperature_duster":
                    temperatureDuster = list.get(i);
                    break;
                case "temperature_asphalt":
                    temperatureAsphalt = list.get(i);
                    break;
                case "temperature_aggregate":
                    temperatureAggregate = list.get(i);
                    break;
                    default:
                        break;
            }
        }
    }


    private static List<Map<String,String>> getDouyinAccountMap(Connection conn) {

        PreparedStatement ps = null;
        ResultSet rs = null;

        List<Map<String,String>> list = new ArrayList<>();

        String sql = " SELECT * FROM `quality_warning_level`";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            ResultSetMetaData md = rs.getMetaData(); //获得结果集结构信息,元数据
            int columnCount = md.getColumnCount();   //获得列数
            while (rs.next()) {
                Map<String,String> rowData = new HashMap<String,String>();
                for (int i = 1; i <= columnCount; i++) {
                    rowData.put(md.getColumnName(i), rs.getString(i));
                }
                list.add(rowData);

            }
        } catch (Exception e) {
            e.getStackTrace();
        } finally {
            close(ps, rs);
        }
        return list;
    }

    private static void close(Statement st, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (st != null) {
                st.close();
            }
        } catch (SQLException e) {
            e.getStackTrace();
        }
    }

    private static Connection getConnection() throws Exception {
        String hostIP = "localhost";
        String port = "3306";
        String dbName = "luchi_date";
        String userName = "root";
        String userPwd = "123";
        Class.forName("com.mysql.cj.jdbc.Driver");
        StringBuffer dburl = new StringBuffer("jdbc:mysql://");
        dburl.append(hostIP);
        dburl.append(":");
        dburl.append(port);
        dburl.append("/");
        dburl.append(dbName);
        dburl.append("?serverTimezone=GMT%2B8&useSSL=false&characterEncoding=utf-8&user=");
        dburl.append(userName);
        dburl.append("&password=");
        dburl.append(userPwd);
//        dburl.append("&zeroDateTimeBehavior=convertToNull");
        DriverManager.setLoginTimeout(60);
        return DriverManager.getConnection(dburl.toString());
    }
    /**
     * 功能描述: <br>
     * < 分解后台发送来的数据字符串，返回map，>
     *
     * @param: [messageData]
     * @return: String[]
     * @auther:Melone
     * @date: 2018/10/8 11:05
     */
    public static String[] splitDataToMap(String messageData) {

        if (StringUtils.isEmpty(messageData)) return null;

        String[] dataArray = messageData.split(",");

        String[] temDate= new String[2];
        //获取生产时间
        if (dataArray[0].contains("/")){
            temDate = dataArray[0].split("/");
        }else {
            temDate[0] = dataArray[0].split("月")[0];
            temDate[1] = dataArray[0].split("日")[0].split("月")[1];
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy");

        Date date = new Date();

        String messageDate = sdf.format(date) + "-" + temDate[0] + "-" + temDate[1];

        Arrays.fill(dataArray, 0, 1, messageDate);

        return dataArray;

    }


    /**
     * 功能描述: <br>
     * <计算百分比>
     *
     * @param: [total, individual]
     * @return: java.lang.String
     * @auther:
     * @date: 2018/10/8 19:18
     */

    public static String calculateRatio(double total, double individual) {


        if (total == 0 || individual == 0) return "0";

        DecimalFormat df = new DecimalFormat("##.#");

        String result = df.format((float) individual / (float) total * 100);

        return result;

    }

    /**
     * 功能描述: <br>
     * <填充并返回预警对象>
     *
     * @param: [str, obj]
     * @return: java.util.Map<java.lang.String   ,   java.lang.Object>
     * @auther:
     * @date: 2018/10/8 19:25
     */
    public static QualityWarningData pushMapByParam(Object... obj) {

        if (null == obj) return null;

        QualityWarningData qualityWarningData = new QualityWarningData();

        if (obj[1].toString().equals("沥青温度") || obj[1].toString().equals("混合料温度") || obj[1].toString().equals("骨料温度") ||obj[1].toString().equals("一仓温度")) {
            qualityWarningData.setCrewId(obj[0].toString());
            qualityWarningData.setMaterialName(obj[1].toString());
            qualityWarningData.setActualRatio(obj[2].toString());
            qualityWarningData.setMoudleRatio(obj[3].toString() + "-" + obj[4].toString());
            qualityWarningData.setDeviationRatio(obj[5].toString());
            qualityWarningData.setWarningLevel(obj[6].toString());
        } else {
            qualityWarningData.setCrewId(obj[0].toString());
            qualityWarningData.setMaterialName(obj[1].toString());
            qualityWarningData.setActualRatio(obj[2].toString());
            qualityWarningData.setMoudleRatio(obj[3].toString());
            qualityWarningData.setDeviationRatio(obj[4].toString());
            qualityWarningData.setWarningLevel(obj[5].toString());
        }


        return qualityWarningData;
    }

    /**
     * 功能描述: <br>
     * <传入温度进行对比后返回map>
     *
     * @param: [temperatureMoudel, temperatureReal, id, name, strings]
     * @return: java.util.Map<java.lang.String   ,   java.lang.Object>
     * @auther:
     * @date: 2018/10/8 20:04
     */
    public static QualityWarningData temperatureWarningLevel(int temperatureMoudel, int temperatureMoudelUp, int temperatureReal, int id, String name) {

        QualityWarningData qualityWarningData;
        //温度对比
        int diffTemperature = 0;

        //温度在区间时判断
        if (temperatureReal <= temperatureMoudelUp && temperatureReal >= temperatureMoudel){
            qualityWarningData = QualityWarningUtil.pushMapByParam(id, name, temperatureReal, temperatureMoudel, temperatureMoudelUp, 0, "0");
            return qualityWarningData;
        }


        double levelOneUp = 0.00;
        double levelOneDown = 0.00;
        double levelTwoUp = 0.00;
        double levelTwoDown = 0.00;
        double levelThreeUp = 0.00;
        double levelThreeDown = 0.00;

        switch (name){
            case "一仓温度":
                levelOneUp = Double.parseDouble(warehouse1.get("level_one_up"));
                levelOneDown = Double.parseDouble(warehouse1.get("level_one_down"));
                levelTwoUp = Double.parseDouble(warehouse1.get("level_two_up"));
                levelTwoDown = Double.parseDouble(warehouse1.get("level_two_down"));
                levelThreeUp = Double.parseDouble(warehouse1.get("level_three_up"));
                levelThreeDown = Double.parseDouble(warehouse1.get("level_three_down"));
                break;
            case "沥青温度":
                levelOneUp = Double.parseDouble(temperatureAsphalt.get("level_one_up"));
                levelOneDown = Double.parseDouble(temperatureAsphalt.get("level_one_down"));
                levelTwoUp = Double.parseDouble(temperatureAsphalt.get("level_two_up"));
                levelTwoDown = Double.parseDouble(temperatureAsphalt.get("level_two_down"));
                levelThreeUp = Double.parseDouble(temperatureAsphalt.get("level_three_up"));
                levelThreeDown = Double.parseDouble(temperatureAsphalt.get("level_three_down"));
                break;
            case "混合料温度":
                levelOneUp = Double.parseDouble(temperatureMixture.get("level_one_up"));
                levelOneDown = Double.parseDouble(temperatureMixture.get("level_one_down"));
                levelTwoUp = Double.parseDouble(temperatureMixture.get("level_two_up"));
                levelTwoDown = Double.parseDouble(temperatureMixture.get("level_two_down"));
                levelThreeUp = Double.parseDouble(temperatureMixture.get("level_three_up"));
                levelThreeDown = Double.parseDouble(temperatureMixture.get("level_three_down"));
            break;
            case "骨料温度":
                levelOneUp = Double.parseDouble(temperatureAggregate.get("level_one_up"));
                levelOneDown = Double.parseDouble(temperatureAggregate.get("level_one_down"));
                levelTwoUp = Double.parseDouble(temperatureAggregate.get("level_two_up"));
                levelTwoDown = Double.parseDouble(temperatureAggregate.get("level_two_down"));
                levelThreeUp = Double.parseDouble(temperatureAggregate.get("level_three_up"));
                levelThreeDown = Double.parseDouble(temperatureAggregate.get("level_three_down"));
                break;
                default:
                    break;
        }


        //温度大于上限、小于下限时逻辑
        if (temperatureReal > temperatureMoudelUp){
            diffTemperature = temperatureReal - temperatureMoudelUp;

        }else{
            diffTemperature = temperatureMoudel - temperatureReal;
        }



        //返回相应数据
        if (diffTemperature > levelThreeUp || diffTemperature < levelThreeDown ){
            qualityWarningData = QualityWarningUtil.pushMapByParam(id, name, temperatureReal, temperatureMoudel, temperatureMoudelUp, diffTemperature, "3");
            return qualityWarningData;
        }else if(diffTemperature > levelTwoUp || diffTemperature < levelTwoDown  ){
            qualityWarningData = QualityWarningUtil.pushMapByParam(id, name, temperatureReal, temperatureMoudel, temperatureMoudelUp, diffTemperature, "2");
            return qualityWarningData;
        }else if (diffTemperature > levelOneUp || diffTemperature < levelOneDown ){
            qualityWarningData = QualityWarningUtil.pushMapByParam(id, name, temperatureReal, temperatureMoudel, temperatureMoudelUp, diffTemperature, "1");
            return qualityWarningData;
        }else {
            qualityWarningData = QualityWarningUtil.pushMapByParam(id, name, temperatureReal, temperatureMoudel, temperatureMoudelUp, diffTemperature, "0");
            return qualityWarningData;
        }

    }

    /**
     * 功能描述: <br>
     * <根据各材料返回返回材料预警级别对象>
     *
     * @param: [materialRationMoudel, materialRationReal, id, name]
     * @return: com.jiaoke.quality.bean.QualityWarningData
     * @auther:
     * @date: 2018/10/9 11:21
     */

    public static QualityWarningData materialWarningLevel(float materialRationMoudel, float materialRationReal, int id, String name) {

        if (0 == materialRationReal) return null;

        QualityWarningData qualityWarningData = new QualityWarningData();

        double aggregate1LevelOneUp = Double.parseDouble(aggregate1.get("level_one_up"));
        double aggregate1LevelOneDown = Double.parseDouble(aggregate1.get("level_one_down"));
        double aggregate1LevelTwoUp = Double.parseDouble(aggregate1.get("level_two_up"));
        double aggregate1LevelTwoDown = Double.parseDouble(aggregate1.get("level_two_down"));
        double aggregate1LevelThreeUp = Double.parseDouble(aggregate1.get("level_three_up"));
        double aggregate1LevelThreeDown = Double.parseDouble(aggregate1.get("level_three_down"));

        double aggregate2LevelOneUp = Double.parseDouble(aggregate2.get("level_one_up"));
        double aggregate2LevelOneDown = Double.parseDouble(aggregate2.get("level_one_down"));
        double aggregate2LevelTwoUp = Double.parseDouble(aggregate2.get("level_two_up"));
        double aggregate2LevelTwoDown = Double.parseDouble(aggregate2.get("level_two_down"));
        double aggregate2LevelThreeUp = Double.parseDouble(aggregate2.get("level_three_up"));
        double aggregate2LevelThreeDown = Double.parseDouble(aggregate2.get("level_three_down"));

        double aggregate3LevelOneUp = Double.parseDouble(aggregate3.get("level_one_up"));
        double aggregate3LevelOneDown = Double.parseDouble(aggregate3.get("level_one_down"));
        double aggregate3LevelTwoUp = Double.parseDouble(aggregate3.get("level_two_up"));
        double aggregate3LevelTwoDown = Double.parseDouble(aggregate3.get("level_two_down"));
        double aggregate3LevelThreeUp = Double.parseDouble(aggregate3.get("level_three_up"));
        double aggregate3LevelThreeDown = Double.parseDouble(aggregate3.get("level_three_down"));

        double aggregate4LevelOneUp = Double.parseDouble(aggregate4.get("level_one_up"));
        double aggregate4LevelOneDown = Double.parseDouble(aggregate4.get("level_one_down"));
        double aggregate4LevelTwoUp = Double.parseDouble(aggregate4.get("level_two_up"));
        double aggregate4LevelTwoDown = Double.parseDouble(aggregate4.get("level_two_down"));
        double aggregate4LevelThreeUp = Double.parseDouble(aggregate4.get("level_three_up"));
        double aggregate4LevelThreeDown = Double.parseDouble(aggregate4.get("level_three_down"));

        double aggregate5LevelOneUp = Double.parseDouble(aggregate5.get("level_one_up"));
        double aggregate5LevelOneDown = Double.parseDouble(aggregate5.get("level_one_down"));
        double aggregate5LevelTwoUp = Double.parseDouble(aggregate5.get("level_two_up"));
        double aggregate5LevelTwoDown = Double.parseDouble(aggregate5.get("level_two_down"));
        double aggregate5LevelThreeUp = Double.parseDouble(aggregate5.get("level_three_up"));
        double aggregate5LevelThreeDown = Double.parseDouble(aggregate5.get("level_three_down"));

        double aggregate6LevelOneUp = Double.parseDouble(aggregate6.get("level_one_up"));
        double aggregate6LevelOneDown = Double.parseDouble(aggregate6.get("level_one_down"));
        double aggregate6LevelTwoUp = Double.parseDouble(aggregate6.get("level_two_up"));
        double aggregate6LevelTwoDown = Double.parseDouble(aggregate6.get("level_two_down"));
        double aggregate6LevelThreeUp = Double.parseDouble(aggregate6.get("level_three_up"));
        double aggregate6LevelThreeDown = Double.parseDouble(aggregate6.get("level_three_down"));

        double breezeLevelOneUp = Double.parseDouble(breeze.get("level_one_up"));
        double breezeLevelOneDown = Double.parseDouble(breeze.get("level_one_down"));
        double breezeLevelTwoUp = Double.parseDouble(breeze.get("level_two_up"));
        double breezeLevelTwoDown = Double.parseDouble(breeze.get("level_two_down"));
        double breezeLevelThreeUp = Double.parseDouble(breeze.get("level_three_up"));
        double breezeLevelThreeDown = Double.parseDouble(breeze.get("level_three_down"));


        double asphaltLevelOneUp = Double.parseDouble(asphalt.get("level_one_up"));
        double asphaltLevelOneDown = Double.parseDouble(asphalt.get("level_one_down"));
        double asphaltLevelTwoUp = Double.parseDouble(asphalt.get("level_two_up"));
        double asphaltLevelTwoDown = Double.parseDouble(asphalt.get("level_two_down"));
        double asphaltLevelThreeUp = Double.parseDouble(asphalt.get("level_three_up"));
        double asphaltLevelThreeDown = Double.parseDouble(asphalt.get("level_three_down"));

        double regenerateLevelOneUp = Double.parseDouble(regenerate.get("level_one_up"));
        double regenerateLevelOneDown = Double.parseDouble(regenerate.get("level_one_down"));
        double regenerateLevelTwoUp = Double.parseDouble(regenerate.get("level_two_up"));
        double regenerateLevelTwoDown = Double.parseDouble(regenerate.get("level_two_down"));
        double regenerateLevelThreeUp = Double.parseDouble(regenerate.get("level_three_up"));
        double regenerateLevelThreeDown = Double.parseDouble(regenerate.get("level_three_down"));

        double additiveLevelOneUp = Double.parseDouble(additive.get("level_one_up"));
        double additiveLevelOneDown = Double.parseDouble(additive.get("level_one_down"));
        double additiveLevelTwoUp = Double.parseDouble(additive.get("level_two_up"));
        double additiveLevelTwoDown = Double.parseDouble(additive.get("level_two_down"));
        double additiveLevelThreeUp = Double.parseDouble(additive.get("level_three_up"));
        double additiveLevelThreeDown = Double.parseDouble(additive.get("level_three_down"));


        switch (name) {
            case "骨料6":
                qualityWarningData = compareDifference(aggregate6LevelOneUp,
                                                            aggregate6LevelOneDown,
                                                            aggregate6LevelTwoUp,
                                                            aggregate6LevelTwoDown,
                                                            aggregate6LevelThreeUp,
                                                            aggregate6LevelThreeDown,
                                                            materialRationReal,
                                                            materialRationMoudel,
                                                            id,
                                                            name);
                break;
            case "骨料5":
                qualityWarningData = compareDifference(aggregate5LevelOneUp,
                        aggregate5LevelOneDown,
                        aggregate5LevelTwoUp,
                        aggregate5LevelTwoDown,
                        aggregate5LevelThreeUp,
                        aggregate5LevelThreeDown,
                        materialRationReal,
                        materialRationMoudel,
                        id,
                        name);
                break;
            case "骨料4":
                qualityWarningData = compareDifference(aggregate4LevelOneUp,
                        aggregate4LevelOneDown,
                        aggregate4LevelTwoUp,
                        aggregate4LevelTwoDown,
                        aggregate4LevelThreeUp,
                        aggregate4LevelThreeDown,
                        materialRationReal,
                        materialRationMoudel,
                        id,
                        name);
                break;
            case "骨料3":
                qualityWarningData = compareDifference(aggregate3LevelOneUp,
                        aggregate3LevelOneDown,
                        aggregate3LevelTwoUp,
                        aggregate3LevelTwoDown,
                        aggregate3LevelThreeUp,
                        aggregate3LevelThreeDown,
                        materialRationReal,
                        materialRationMoudel,
                        id,
                        name);
                break;
            case "骨料2":
                qualityWarningData = compareDifference(aggregate2LevelOneUp,
                        aggregate2LevelOneDown,
                        aggregate2LevelTwoUp,
                        aggregate2LevelTwoDown,
                        aggregate2LevelThreeUp,
                        aggregate2LevelThreeDown,
                        materialRationReal,
                        materialRationMoudel,
                        id,
                        name);
                break;
            case "骨料1":
                qualityWarningData = compareDifference(aggregate1LevelOneUp,
                        aggregate1LevelOneDown,
                        aggregate1LevelTwoUp,
                        aggregate1LevelTwoDown,
                        aggregate1LevelThreeUp,
                        aggregate1LevelThreeDown,
                        materialRationReal,
                        materialRationMoudel,
                        id,
                        name);
                break;
            case "矿粉":
                qualityWarningData = compareDifference(breezeLevelOneUp,
                        breezeLevelOneDown,
                        breezeLevelTwoUp,
                        breezeLevelTwoDown,
                        breezeLevelThreeUp,
                        breezeLevelThreeDown,
                        materialRationReal,
                        materialRationMoudel,
                        id,
                        name);
                break;
            case "沥青":
                    qualityWarningData = compareDifference(asphaltLevelOneUp,
                            asphaltLevelOneDown,
                            asphaltLevelTwoUp,
                            asphaltLevelTwoDown,
                            asphaltLevelThreeUp,
                            asphaltLevelThreeDown,
                            materialRationReal,
                            materialRationMoudel,
                            id,
                            name);
                break;
            case "再生料":
                qualityWarningData = compareDifference(regenerateLevelOneUp,
                        regenerateLevelOneDown,
                        regenerateLevelTwoUp,
                        regenerateLevelTwoDown,
                        regenerateLevelThreeUp,
                        regenerateLevelThreeDown,
                        materialRationReal,
                        materialRationMoudel,
                        id,
                        name);
                break;
            case "岩沥青":
                qualityWarningData = compareDifference(additiveLevelOneUp,
                        additiveLevelOneDown,
                        additiveLevelTwoUp,
                        additiveLevelTwoDown,
                        additiveLevelThreeUp,
                        additiveLevelThreeDown,
                        materialRationReal,
                        materialRationMoudel,
                        id,
                        name);
                break;
                default:break;

        }


        return qualityWarningData;

    }

    /**
     * 功能描述: <br>
     * <根据材料，返回预警对象集合>
     *
     * @param: [temArray, ratioTemplate]
     * @return: java.util.List<com.jiaoke.quality.bean.QualityWarningData>
     * @auther:
     * @date: 2018/10/9 11:14
     */
    public static List<QualityWarningData> materialWarningObj(int id, String[] temArray, QualityRatioTemplate ratioTemplate) {

        if (0 == temArray.length || null == ratioTemplate) {
            return null;
        }

        List<QualityWarningData> list = new ArrayList<QualityWarningData>();

        //从模板中获取总数
        float total = Float.parseFloat(temArray[temArray.length - 1]);
        //在数组中删除最后一位
        String[] temarry1 = ArrayUtils.remove(temArray, temArray.length - 1);

        String[] array = Float.parseFloat(temarry1[6]) > Float.parseFloat(temarry1[7]) ? ArrayUtils.remove(temarry1, 7) : ArrayUtils.remove(temarry1, 6);

        String[] materialName = {"骨料6", "骨料5", "骨料4", "骨料3", "骨料2", "骨料1", "矿粉", "沥青", "再生料", "岩沥青"};

        float[] ratioMoudel = {ratioTemplate.getRepertorySix(),
                ratioTemplate.getRepertoryFive(),
                ratioTemplate.getRepertoryFour(),
                ratioTemplate.getRepertoryThree(),
                ratioTemplate.getRepertoryTwo(),
                ratioTemplate.getRepertoryOne(),
                ratioTemplate.getBreeze(),
                ratioTemplate.getRatioStone(),
                ratioTemplate.getRatioRegenerate1() + ratioTemplate.getRatioRegenerate2(),
                ratioTemplate.getRatioAdditive()};


        for (int i = 0; i < array.length; i++) {

            if (0 == Float.parseFloat(array[i])) continue;
            if (i != 0 && i < 6) {
                //处理骨料递增百分比
                float materialsValue = Float.parseFloat(array[i]) - Float.parseFloat(array[i - 1]);

                //处理特殊数据 骨料累加 下一个比上一个小
                if (materialsValue < 0) continue;

                String realRatio = QualityWarningUtil.calculateRatio(total, materialsValue);

                list.add(QualityWarningUtil.materialWarningLevel(ratioMoudel[i], Float.parseFloat(realRatio), id, materialName[i]));

            } else {
                //处理正常材料百分比
                String realRatio = QualityWarningUtil.calculateRatio(total, Float.parseFloat(array[i]));

                list.add(QualityWarningUtil.materialWarningLevel(ratioMoudel[i], Float.parseFloat(realRatio), id, materialName[i]));
            }

        }

        return list;
    }


    public static QualityWarningData compareDifference(double leve1Up,double leve1Down, double leve2Up,double leve2Down, double leve3Up,double leve3Down,  float materialRationReal, float materialRationMoudel, int id, String name) {

        float diffMaterialRation = materialRationReal - materialRationMoudel;
        DecimalFormat decimalFormat = new DecimalFormat("##.##");
        String diffStr = decimalFormat.format(diffMaterialRation);

        QualityWarningData qualityWarningData = new QualityWarningData();

        if (diffMaterialRation <  leve3Down || diffMaterialRation > leve3Up) {
            qualityWarningData = QualityWarningUtil.pushMapByParam(id, name, materialRationReal, materialRationMoudel, diffStr, "3");
        } else if (diffMaterialRation < leve2Down || diffMaterialRation > leve2Up) {
            qualityWarningData = QualityWarningUtil.pushMapByParam(id, name, materialRationReal, materialRationMoudel, diffStr, "2");
        } else if (diffMaterialRation < leve1Down || diffMaterialRation > leve1Up) {
            qualityWarningData = QualityWarningUtil.pushMapByParam(id, name, materialRationReal, materialRationMoudel, diffStr, "1");
        } else {
            qualityWarningData = QualityWarningUtil.pushMapByParam(id, name, materialRationReal, materialRationMoudel, diffStr, "0");
        }

        return qualityWarningData;
    }

}
