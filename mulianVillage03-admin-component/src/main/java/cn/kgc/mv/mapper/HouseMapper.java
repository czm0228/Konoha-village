package cn.kgc.mv.mapper;

import cn.kgc.mv.entity.House;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HouseMapper {

    /*增加房源的方法*/
    Integer saveHouse(House house);

    /*查询所有房源信息*/
    List<House> allHouseList();

    /*根据id删除房源*/
    Integer delHouseById(@Param("id") Integer id);

    /*根据id查询一个的房源*/
    House HouseById(@Param("id") Integer id);

    /*修改房源*/
    Integer updateHouse(House house);

}
