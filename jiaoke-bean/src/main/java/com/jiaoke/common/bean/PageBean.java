/**
 * FileName: PageBean
 * author:   Melone
 * Date:     2018/10/11 10:58
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.common.bean;

import java.util.List;

/**
 *  <一句话功能描述>
 *  分页实体类
 * @author: Melone
 * @create: 2018/10/11 10:58
 * @Description:
 */
public class PageBean<T> {

    /**
     * 当前页
     */
    private int currentPageNum;
    /**
     * 总页数
     */
    private int pageCount;
    /**
     * 每页数据个数
     */
    private int eachPageDataNum;
    /**
     * 每页数据
     */
    private List<T> pageData;

    /**
     * 一共多少条数据
     */
    private int dataCountNum;
    /**
     * 当前页第一条记录的行数(id)
     */
    private int pageFirstNum;

    /**
     * 请求URL
     */
    private String url;

    public void setCurrentPageNum(int currentPageNum){
        this.currentPageNum = currentPageNum;
    }

    public void setPageCount(int eachPageDataNum, int dataCountNum ){
        if (dataCountNum < eachPageDataNum ){
            this.pageCount = 1;
        }else {
            this.pageCount =(dataCountNum%eachPageDataNum == 0)? dataCountNum/eachPageDataNum:dataCountNum/eachPageDataNum+1;
        }
    }

    public void setEachPageDataNum(int eachPageDataNum) {
        this.eachPageDataNum = eachPageDataNum;
    }

    public void setPageData(List<T> pageData) {
        this.pageData = pageData;
    }

    public void setDataCountNum(int dataCountNum) {
        this.dataCountNum = dataCountNum;
    }

    /**
     * 可以通过每页记录是*(当前页数-1) + 1得到，当前页第一条记录的行数
     * @param eachPageDataNum
     * @param currentPageNum
     */
    public void setPageFirstNum(int eachPageDataNum,int currentPageNum ) {
        if (currentPageNum == 1){
            this.pageFirstNum = 0;
        }else {
            this.pageFirstNum = eachPageDataNum * (currentPageNum - 1) + 1;
        }

    }

    public void setUrl(String url) {
        this.url = url;
    }



    public int getCurrentPageNum() {
        return currentPageNum;
    }

    public int getPageCount() {
        return pageCount;
    }

    public int getEachPageDataNum() {
        return eachPageDataNum;
    }

    public List<T> getPageData() {
        return pageData;
    }

    public int getDataCountNum() {
        return dataCountNum;
    }

    public int getPageFirstNum() {
        return pageFirstNum;
    }

    public String getUrl() {
        return url;
    }
}
