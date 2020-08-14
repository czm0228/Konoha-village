package cn.kgc.mv.test;

import cn.kgc.mv.entity.House;
import cn.kgc.mv.mapper.HouseMapper;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * @Author: ZL
 * @Date: 2020/8/12 9:11
 */
public class TestHouseMapper {

    public static void main(String[] args) {

        ClassPathXmlApplicationContext cat = new ClassPathXmlApplicationContext("spring-persist-mybatis.xml");
        HouseMapper bean = cat.getBean(HouseMapper.class);
        House house = bean.HouseById(2);
        System.out.println(house);
        /*List<House> houses = bean.allHouseList();
        System.out.println(houses);*/
        /*House house = new House();
        house.setAddress("小行路");
        house.setPrice(1000.00);
        house.setId(30);
        Integer integer = bean.updateHouse(house);
        System.out.println(integer);*/

    }

}
