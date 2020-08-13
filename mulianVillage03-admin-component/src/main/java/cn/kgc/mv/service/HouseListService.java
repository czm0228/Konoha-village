package cn.kgc.mv.service;

import cn.kgc.mv.entity.*;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @Author: czm
 * @Date: 2020/8/8 17:13
 */
public interface HouseListService {

    /*查询价格*/
    public List<HousePrice> getHousePrice();

    /*查询面积*/
    public List<HouseSquareMeter> getHouseSquareMeter();

    /*查询区域*/
    public List<Area> getArea();

    /*查询地铁*/
    public List<HouseMetro> getHouseMetro();

    /*查询房源*/
    /*List<House> queryHouseList(Integer priceId, Integer squareMeterId, Integer metroId, Integer areaId, String search);*/
    public PageInfo<House> queryHouseList(Integer priceId, Integer squareMeterId, Integer metroId, Integer areaId, String search, Integer pageNum, Integer pageSize);

    /*查看房源详情*/
    House queryHouseDetails(Integer houseId);
}
