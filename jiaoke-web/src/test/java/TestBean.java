/**
 * FileName: TestBean
 * Author:   Melone
 * Date:     2018/9/27 11:45
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/

import com.jiaoke.inf.TestInf;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


/**
 *  <一句话功能描述>
 *
 * @Auther: Melone
 * @create: 2018/9/27 11:45
 * @Description:
 */
@ContextConfiguration({"classpath*:conf/applicationContext.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class TestBean {

    @Autowired
    private TestInf testInf;

    @Test
    public void te(){
        testInf.testInf();
    }

}
