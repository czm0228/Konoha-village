package cn.kgc.mv.service.impl;

import cn.kgc.mv.entity.House;
import cn.kgc.mv.mapper.HouseMapper;
import cn.kgc.mv.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: ZL
 * @Date: 2020/8/8 16:02
 */
@Service
public class HouseServiceImpl implements HouseService {

    @Autowired
    private HouseMapper houseMapper;

    @Override
    public Boolean saveHouse(House house) {
        return houseMapper.saveHouse(house)==1;
    }

    @Override
    public List<House> allHouseList() {
        return houseMapper.allHouseList();
    }

    @Override
    public Boolean delHouseById(Integer id) {
        return houseMapper.delHouseById(id)==1;
    }

    @Override
    public House HouseById(Integer id) {
        return houseMapper.HouseById(id);
    }

    @Override
    public Boolean updateHouse(House house) {
        return houseMapper.updateHouse(house)==1;
    }

}
