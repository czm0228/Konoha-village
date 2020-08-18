package cn.kgc.mv.test;

import cn.kgc.mv.entity.Salesman;
import cn.kgc.mv.entity.SalesmanAge;
import cn.kgc.mv.entity.SalesmanFavorable;
import cn.kgc.mv.mapper.SalesmanMapper;
import cn.kgc.mv.service.SalesmanService;
import com.sun.xml.internal.ws.util.xml.ContentHandlerToXMLStreamWriter;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: ZL
 * @Date: 2020/8/17 11:20
 */
public class TestSalesman {

    public static void main(String[] args) {

        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("spring-persist-mybatis.xml");
        SalesmanMapper bean = ctx.getBean(SalesmanMapper.class);
        /*List<Salesman> salesmen = bean.querySalesman();
        System.out.println(salesmen);*/
        List<SalesmanAge> salesmanAge = bean.getSalesmanAge();
        System.out.println(salesmanAge);
        /*List<SalesmanFavorable> salesmanFavorable = bean.getSalesmanFavorable();
        System.out.println(salesmanFavorable);*/
        /*Map map = new HashMap();
        map.put("search","手");
        System.out.println(map);
        List list = bean.querySalesman(map);
        System.out.println(list);*/


    }

}
