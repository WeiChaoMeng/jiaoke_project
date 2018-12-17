package com.jiake.utils;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author lihui
 * @version 1.0
 * @date 2018/11/15 15:02
 */
public class ExcelUtils {

    private final static String XLS = "xls";
    private final static String XLSX = "xlsx";

    /**
     * 读入excel文件，解析后返回
     *
     * @param file file
     */
    public static List<String[]> readExcel(MultipartFile file) throws IOException {
        //检查文件
        checkFile(file);
        //获得Workbook工作薄对象
        Workbook workbook = getWorkBook(file);
        //创建返回对象，把每行中的值作为一个数组，所有行作为一个集合返回
        List<String[]> list = new ArrayList<>();
        if (workbook != null) {
            for (int sheetNum = 0; sheetNum < workbook.getNumberOfSheets(); sheetNum++) {
                //获得当前sheet工作表
                Sheet sheet = workbook.getSheetAt(sheetNum);
                if (sheet == null) {
                    continue;
                }
                //获得当前sheet的开始行
                int firstRowNum = sheet.getFirstRowNum();
                //获得当前sheet的结束行
                int lastRowNum = sheet.getLastRowNum();
                //循环除了第一行的所有行
                for (int rowNum = firstRowNum + 1; rowNum <= lastRowNum; rowNum++) {
                    //获得当前行
                    Row row = sheet.getRow(rowNum);
                    if (row == null) {
                        continue;
                    }
                    //获得当前行的开始列
                    int firstCellNum = row.getFirstCellNum();
                    //获得当前行的列数
                    int lastCellNum = row.getPhysicalNumberOfCells();
                    String[] cells = new String[row.getPhysicalNumberOfCells()];
                    //循环当前行
                    for (int cellNum = firstCellNum; cellNum < lastCellNum; cellNum++) {
                        Cell cell = row.getCell(cellNum);
                        cells[cellNum] = getCellValue(cell);
                    }
                    list.add(cells);
                }
            }
            workbook.close();
        }
        return list;
    }

    /**
     * 检查文件
     *
     * @param file file
     * @throws IOException e
     */
    private static void checkFile(MultipartFile file) throws IOException {
        //判断文件是否存在
        if (null == file) {
            throw new FileNotFoundException("文件不存在！");
        }
        //获得文件名
        String fileName = file.getOriginalFilename();
        //判断文件是否是excel文件
        if (fileName != null) {
            if (!fileName.endsWith(XLS) && !fileName.endsWith(XLSX)) {
                throw new IOException(fileName + "不是excel文件");
            }
        }
    }

    /**
     * 获得Workbook工作薄对象
     *
     * @param file file
     * @return workbook
     */
    private static Workbook getWorkBook(MultipartFile file) {
        //获得文件名
        String fileName = file.getOriginalFilename();
        //创建Workbook工作薄对象，表示整个excel
        Workbook workbook = null;
        try {
            //获取excel文件的io流
            InputStream is = file.getInputStream();
            //根据文件后缀名不同(xls和xlsx)获得不同的Workbook实现类对象
            if (fileName != null) {
                if (fileName.endsWith(XLS)) {
                    //2003
                    workbook = new HSSFWorkbook(is);
                } else if (fileName.endsWith(XLSX)) {
                    //2007
                    workbook = new XSSFWorkbook(is);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return workbook;
    }

    /**
     * 获取单元数据
     *
     * @param cell cell
     * @return cellValue
     */
    private static String getCellValue(Cell cell) {
        String cellValue = "";
        String digitalFormat = "-[0-9]+(.[0-9]+)?|[0-9]+(.[0-9]+)?";
        String decimal = ".";
        if (cell == null) {
            return cellValue;
        }
        //把数字当成String来读，避免出现1读成1.0的情况
        if (cell.getCellType() == CellType.NUMERIC) {
            if (!HSSFDateUtil.isCellDateFormatted(cell)) {
                cell.setCellType(CellType.STRING);
            } else {
                //日期格式保留
                cell.setCellType(CellType.NUMERIC);
            }
        }
        //判断数据的类型
        switch (cell.getCellType()) {
            //数字
            case NUMERIC:
                //日期格式处理，保留年月
                if (HSSFDateUtil.isCellDateFormatted(cell)) {
                    SimpleDateFormat simpleDateFormat;
                    short format = cell.getCellStyle().getDataFormat();
                    if (format == 179 || format == 14 || format == 177 || format == 180 || format == 181 || format == 182 || format == 178) {
                        simpleDateFormat = new SimpleDateFormat("yyyy-MM");
                        Date date = cell.getDateCellValue();
                        cellValue = simpleDateFormat.format(date);
                    }
                } else {
                    cellValue = String.valueOf(cell.getNumericCellValue());
                }
                break;
            //字符串
            case STRING:
                //四舍五入保存小数点后两位
                if (cell.getStringCellValue().contains(decimal)) {
                    //是否是整性或者浮点型
                    if (cell.getStringCellValue().matches(digitalFormat)) {
                        String stringCellValue = cell.getStringCellValue();
                        DecimalFormat decimalFormat = new DecimalFormat("0.00");
                        cellValue = decimalFormat.format(new BigDecimal(stringCellValue)).replaceAll("\\s*", "");
                    }
                } else {
                    //纯文本格式去除空格
                    cellValue = String.valueOf(cell.getStringCellValue()).replaceAll("\\s*", "");
                }
                break;
            //Boolean
            case BOOLEAN:
                cellValue = String.valueOf(cell.getBooleanCellValue());
                break;
            //公式
            case FORMULA:
                try {
                    cellValue = cell.getStringCellValue();
                } catch (IllegalStateException e) {
                    try {
                        //保留小数点后两位
                        cellValue = String.format("%.2f", cell.getNumericCellValue());
                    } catch (Exception exce) {
                        //错误的的公式处理
                        cellValue = "错误数据";
                    }
                }
                break;
            //空值
            case BLANK:
                break;
            //故障
            case ERROR:
                cellValue = "非法字符";
                break;
            default:
                cellValue = "未知类型";
                break;
        }
        return cellValue;
    }

   /* @Test
    public void testExcel() throws IOException {

        File pdfFile = new File("D://excel/职工工资表.xlsx");
        FileInputStream fileInputStream = new FileInputStream(pdfFile);
        MultipartFile multipartFile = new MockMultipartFile(pdfFile.getName(), pdfFile.getName(), null, fileInputStream);
        List<String[]> list = readExcel(multipartFile);
        for (String[] strings : list) {
            for (String string : strings) {
                System.out.print(string + "|");
            }
            System.out.println();
            System.out.println("---------------------");
            System.out.println();

        }
    }*/
}
