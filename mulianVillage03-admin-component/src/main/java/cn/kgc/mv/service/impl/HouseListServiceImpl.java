package cn.kgc.mv.service.impl;

import cn.kgc.mv.entity.*;
import cn.kgc.mv.mapper.HouseListMapper;
import cn.kgc.mv.service.HouseListService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * @Author: czm
 * @Date: 2020/8/8 17:13
 */
@Service
public class HouseListServiceImpl implements HouseListService {

    @Autowired
    HouseListMapper houseListMapper;

    @Override
    public List<HousePrice> getHousePrice() {
        return houseListMapper.getHousePrice();
    }

    @Override
    public List<HouseSquareMeter> getHouseSquareMeter() {
        return houseListMapper.getHouseSquareMeter();
    }

    @Override
    public List<Area> getArea() {
        return houseListMapper.getArea();
    }

    @Override
    public List<HouseMetro> getHouseMetro() {
        return houseListMapper.getHouseMetro();
    }

    @Override
    public PageInfo<House> queryHouseList(Integer priceId, Integer squareMeterId, Integer metroId, Integer areaId, String search, Integer pageNum, Integer pageSize) {
        Map<String,Object> map = new HashMap();
        map.put("priceId",priceId);
        map.put("squareMeterId",squareMeterId);
        map.put("metroId",metroId);
        map.put("areaId",areaId);
        if(search !=null && search !=""){
            map.put("search","%"+search+"%");
        }else {
            map.put("search",null);
        }
        map.put("status","未租赁");

        // 1.调用PageHelper的静态方法开启分页功能
        // 这里充分体现了PageHelper的“非侵入式”设计：原本要做的查询不必有任何修改
        PageHelper.startPage(pageNum, pageSize);

        // 2.执行查询
        List<House> houses = houseListMapper.queryHouseList(map);

        // 3.封装到PageInfo对象中
        return new PageInfo<>(houses);

    }

  /*  @Override
    public List<House> queryHouseList(Integer priceId, Integer squareMeterId, Integer metroId, Integer areaId, String search) {
        Map<String,Object> map = new HashMap();
        map.put("priceId",priceId);
        map.put("squareMeterId",squareMeterId);
        map.put("metroId",metroId);
        map.put("areaId",areaId);
       if(search !=null && search !=""){
           map.put("search","%"+search+"%");
       }else {
           map.put("search",null);
       }
        map.put("status","未租赁");
      *//*  System.out.println(map);*//*
        return houseListMapper.queryHouseList(map);
    }
*/
    @Override
    public House queryHouseDetails(Integer houseId) {
        return houseListMapper.queryHouseDetails(houseId);
    }
    @Override
    public House getCoordinate(Integer id) {
        return houseListMapper.getCoordinate(id);
    }
}
