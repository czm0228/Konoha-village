package cn.kgc.mv.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author: czm
 * @Date: 2020/8/8 15:32
 */
@Controller
public class TenantController {

    /*房源列表*/
    @RequestMapping(value = "/houseList")
    public String houseList(){
        return "tenant/houseList";
    }

   /*租客首页*/
   @RequestMapping(value = "/frameTenant")
    public String frameTenant(){
       return "tenant/frameTenant";
   }

   /*房源详情*/
   @RequestMapping(value = "/housingDetails")
    public String housingDetails(){
       return "tenant/housingDetails";
   }

   /*申请看房*/
   @RequestMapping(value = "/applyForLook")
    public String applyWaitLook(){
       return "tenant/applyForLook";
   }

   /*申请看房列表*/
   @RequestMapping(value = "/myApplyFor")
    public String myApplyFor(){
       return "tenant/myApplyFor";
   }

    /*人气房源*/
    @RequestMapping(value = "/moodsHouses")
    public String moodsHouse(){
        return "tenant/popular";
    }

    /*帮你挑*/
    @RequestMapping(value = "/helpme")
    public String helpme(){
        return "tenant/helpme";
    }

}
