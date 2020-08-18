package cn.kgc.mv.test;

import cn.kgc.mv.entity.House;
import cn.kgc.mv.mapper.HouseListMapper;
import cn.kgc.mv.mapper.HouseMapper;
import com.sun.xml.internal.ws.util.xml.ContentHandlerToXMLStreamWriter;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: ZL
 * @Date: 2020/8/15 14:08
 */
public class TestLiseMapper {

    public static void main(String[] args) {

        ClassPathXmlApplicationContext cat = new ClassPathXmlApplicationContext("spring-persist-mybatis.xml");
        HouseListMapper bean = cat.getBean(HouseListMapper.class);
        Map map = new HashMap();
        List<House> houses = bean.moodsHouse();
        System.out.println(houses);

    }

}
