/**
 * FileName: TestImpl
 * author:   Melone
 * Date:     2018/9/27 14:30
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.impl;

import com.jiaoke.bean.Student;
import com.jiaoke.dao.TestDao;
import com.jiaoke.inf.TestInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2018/9/27 14:30
 * @Description:
 */
@Service
public class TestImpl implements TestInf {

    @Autowired
    private Student student;
    @Autowired
    private TestDao testDao;


    public void testInf() {
        System.out.println("test service");
        System.out.println(student);
        System.out.println(testDao.testDao());
    }
}
