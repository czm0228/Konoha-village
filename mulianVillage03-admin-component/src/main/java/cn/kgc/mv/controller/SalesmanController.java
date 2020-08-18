package cn.kgc.mv.controller;

import cn.kgc.mv.constant.CrowdConstant;
import cn.kgc.mv.entity.Salesman;
import cn.kgc.mv.entity.SalesmanAge;
import cn.kgc.mv.entity.SalesmanFavorable;
import cn.kgc.mv.service.SalesmanService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Author: ZL
 * @Date: 2020/8/17 16:33
 */
@Controller
public class SalesmanController {

    @Autowired
    private SalesmanService salesmanService;

    /*查询好评度*/
    @ResponseBody
    @RequestMapping(value = "/getFavorable")
    public List<SalesmanFavorable> getFavorable(){
        return salesmanService.getSalesmanFavorable();
    }

    /*查询年龄*/
    @ResponseBody
    @RequestMapping(value = "/getAge")
    public List<SalesmanAge> getAge(){
        return salesmanService.getSalesmanAge();
    }

    /*查询业务员*/
    @ResponseBody
    @RequestMapping(value = "/querySalesman")
    public PageInfo<Salesman> querySalesman(
            @RequestParam("ageId") Integer ageId,
            @RequestParam("sex") String sex,
            @RequestParam("favorableId") Integer favorableId,
            @RequestParam("search") String search,
            // pageNum默认值使用1
            @RequestParam(value="pageNum", defaultValue="1") Integer pageNum,
            // pageSize默认值使用5
            @RequestParam(value="pageSize", defaultValue="5") Integer pageSize,
            ModelMap modelMap
    ){
        System.out.println("ageId="+ageId+"-sex="+sex+"-favorableId="+favorableId+"-search="+search);
        PageInfo<Salesman> pageInfo = salesmanService.querySalesman(ageId,sex,favorableId,search,pageNum,pageSize);

        // 将PageInfo对象存入模型
        modelMap.addAttribute(CrowdConstant.ATTR_NAME_PAGE_INFO, pageInfo);

        return pageInfo;

    }

}
