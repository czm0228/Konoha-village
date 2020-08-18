package cn.kgc.mv.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author: ZL
 * @Date: 2020/8/8 16:45
 */
@Controller
public class AdminController {

    /*后台页面*/
    @RequestMapping(value = "/houtai")
    public String houtai(){
        return "admin/houtai";
    }

    /*修改房源页面*/
    @RequestMapping(value = "/updaHouse")
    public String updaHouse(){
        return "admin/updateHouse";
    }

    /*增加房源页面*/
    @RequestMapping(value = "/addHouse")
    public String addHouse(){
        return "admin/addHouse";
    }

    /*房源列表页面*/
    @RequestMapping(value = "/house")
    public String queryHouseList(){
        return "admin/house";
    }

    @RequestMapping(value = "/addHouse1")
    public String addHouse2(){
        return "admin/addhouse2";
    }


}
