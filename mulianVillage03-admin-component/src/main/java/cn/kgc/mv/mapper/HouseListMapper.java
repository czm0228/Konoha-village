package cn.kgc.mv.mapper;

import cn.kgc.mv.entity.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @Author: czm
 * @Date: 2020/8/8 17:03
 */
public interface HouseListMapper {

    /*分页*/
    List<House> selectAdminByKeyword(String keyword);

    /*查询价格*/
    public List<HousePrice> getHousePrice();

    /*查询面积*/
    public List<HouseSquareMeter> getHouseSquareMeter();

    /*查询区域*/
    public List<Area> getArea();

    /*查询地铁*/
    public List<HouseMetro> getHouseMetro();

    /*查询房源*/
    public List<House> queryHouseList(Map<String, Object> map);

    /*查看房源详情*/
    public House queryHouseDetails(@Param("houseId") Integer houseId);
    /*通过房源查询经纬度*/
    House getCoordinate(@Param("id") Integer id);
}
