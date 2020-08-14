package cn.kgc.mv.service;

import cn.kgc.mv.entity.House;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @Author: ZL
 * @Date: 2020/8/8 16:01
 */
public interface HouseService {


    /*增加房源的方法*/
    Boolean saveHouse(House house);

    /*查询所有房源信息*/
    List<House> allHouseList();

    /*根据id删除房源*/
    Boolean delHouseById(Integer id);

    /*根据id查询一个的房源*/
    House HouseById(Integer id);

    /*修改房源*/
    Boolean updateHouse(House house);

}
