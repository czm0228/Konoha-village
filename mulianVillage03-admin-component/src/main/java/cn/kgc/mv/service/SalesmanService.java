package cn.kgc.mv.service;

import cn.kgc.mv.entity.Salesman;
import cn.kgc.mv.entity.SalesmanAge;
import cn.kgc.mv.entity.SalesmanFavorable;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @Author: ZL
 * @Date: 2020/8/17 11:15
 */
public interface SalesmanService {

    /*查询年龄*/
    List<SalesmanAge> getSalesmanAge();

    /*查询好评率*/
    List<SalesmanFavorable> getSalesmanFavorable();

    /*查询所有的业务员*/
    public PageInfo<Salesman> querySalesman(Integer ageId,String sex,Integer favorableId,String search,Integer pageNum, Integer pageSize);

}
