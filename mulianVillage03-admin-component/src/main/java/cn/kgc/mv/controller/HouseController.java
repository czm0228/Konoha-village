package cn.kgc.mv.controller;

import cn.kgc.mv.entity.House;
import cn.kgc.mv.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Author: ZL
 * @Date: 2020/8/8 16:04
 */
@Controller
public class HouseController {

    @Autowired
    private HouseService houseService;

    /*查询一个的方法*/
    @ResponseBody
    @RequestMapping(value = "/houseById")
    public House getHouseById(@RequestParam("id") Integer id){
        System.out.println(id);
        System.out.println(houseService.HouseById(id));
        return houseService.HouseById(id);
    }

    /*修改房源*/
    @ResponseBody
    @RequestMapping(value = "/updateHouse")
    public boolean updateHouse(House house){
        System.out.println(house);
        System.out.println(houseService.updateHouse(house));
        return houseService.updateHouse(house);
    }

    /*增加房源*/
    @ResponseBody
    @RequestMapping(value = "/saveHouse")
    public boolean saveHouse(House house){
        return houseService.saveHouse(house);
    }

    /*删除房源*/
    @ResponseBody
    @RequestMapping(value = "/delHouse")
    public boolean delHouse(@RequestParam("id") Integer id){
        System.out.println(id);
        return houseService.delHouseById(id);
    }

}
