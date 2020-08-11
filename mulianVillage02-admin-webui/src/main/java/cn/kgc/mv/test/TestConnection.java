package cn.kgc.mv.test;


import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.sql.SQLException;


/**
 * @Author: czm
 * @Date: 2020/8/7 16:55
 */
public class TestConnection {
    public static void main(String[] args) throws SQLException {
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("spring-persist-mybatis.xml");
     /*   DataSource dataSource = (DataSource) ctx.getBean("dataSource");
        Connection connection = dataSource.getConnection();*/
   /*     UserMapper bean = ctx.getBean(UserMapper.class);

        System.out.println(user);*/

    }
}
