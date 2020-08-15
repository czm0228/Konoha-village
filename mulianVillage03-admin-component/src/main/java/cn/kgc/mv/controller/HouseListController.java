package cn.kgc.mv.controller;

import cn.kgc.mv.constant.CrowdConstant;
import cn.kgc.mv.entity.*;
import cn.kgc.mv.service.ApplyForLookService;
import cn.kgc.mv.service.HouseListService;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Author: czm
 * @Date: 2020/8/8 16:10
 */
@RestController
public class HouseListController {

   @Autowired
   HouseListService houseListService;


   /*查询价格*/
   @RequestMapping(value = "/getHousePrice")
   public List<HousePrice> getHousePrice(){
      return houseListService.getHousePrice();
   }

   /*查询面积*/
   @RequestMapping(value = "/getHouseSquareMeter")
   public List<HouseSquareMeter> getHouseSquareMeter(){
      return houseListService.getHouseSquareMeter();
   }

   /*查询区域*/
   @RequestMapping(value = "/getArea")
   public List<Area> getArea(){
      return houseListService.getArea();
   }

   /*查询地铁*/
   @RequestMapping(value = "/getHouseMetro")
   public List<HouseMetro> getHouseMetro(){
      return houseListService.getHouseMetro();
   }

   /*查询房源*/
   @RequestMapping(value = "/queryHouseList")
   public PageInfo<House> queryHouseList(@RequestParam("priceId") Integer priceId,
                                     @RequestParam("squareMeterId") Integer squareMeterId,
                                     @RequestParam("metroId") Integer metroId,
                                     @RequestParam("areaId") Integer areaId,
                                     @RequestParam("search") String search,
                                     // pageNum默认值使用1
                                     @RequestParam(value="pageNum", defaultValue="1") Integer pageNum,
                                     // pageSize默认值使用5
                                     @RequestParam(value="pageSize", defaultValue="4") Integer pageSize,
                                     ModelMap modelMap){
     /* System.out.println(priceId+""+squareMeterId+""+metroId+""+areaId+""+search);*/
      // 调用Service方法获取PageInfo对象
      PageInfo<House> pageInfo = houseListService.queryHouseList(priceId,squareMeterId,metroId,areaId,search,pageNum,pageSize);

      // 将PageInfo对象存入模型
      modelMap.addAttribute(CrowdConstant.ATTR_NAME_PAGE_INFO, pageInfo);

      return pageInfo;
   }

   /*查看房源详情*/
   @RequestMapping(value = "/queryHouseDetails")
   public House queryHouseDetails(@RequestParam("houseId") Integer houseId){
      return houseListService.queryHouseDetails(houseId);
   }
}
