/**
 * FileName: Student
 * author:   Melone
 * Date:     2018/9/27 14:17
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.bean;

import lombok.Data;
import org.springframework.stereotype.Component;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2018/9/27 14:17
 * @Description:
 */
@Data
@Component
public class Student {

    private int id;
    private String name;
    private int age;
}
