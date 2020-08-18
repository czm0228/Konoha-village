package cn.kgc.mv.mapper;

import cn.kgc.mv.entity.Salesman;
import cn.kgc.mv.entity.SalesmanAge;
import cn.kgc.mv.entity.SalesmanFavorable;

import java.util.List;
import java.util.Map;

/**
 * @Author: ZL
 * @Date: 2020/8/17 11:14
 */
public interface SalesmanMapper {

    /*查询年龄*/
    List<SalesmanAge> getSalesmanAge();

    /*查询好评率*/
    List<SalesmanFavorable> getSalesmanFavorable();

    /*查询所有的业务员*/
    public List<Salesman> querySalesman(Map<String, Object> map);

}
