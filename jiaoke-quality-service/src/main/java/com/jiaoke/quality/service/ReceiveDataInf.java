/**
 * FileName: ReceiveDataInf
 * Author:   Melone
 * Date:     2018/10/8 10:42
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

/**
 *  <一句话功能描述>
 * 接受并处理生产本地发送过来的数据
 * @author: Melone
 * @create: 2018/10/8 10:42
 * @Description:
 */

public interface ReceiveDataInf {

    /**
     * 获取传入的数据解析后传入数据库
     * @param messageData
     */
     void  receiveDataToDB( String messageData );

}
