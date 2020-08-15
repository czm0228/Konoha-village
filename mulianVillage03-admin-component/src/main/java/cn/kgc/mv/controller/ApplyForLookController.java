package cn.kgc.mv.controller;

import cn.kgc.mv.constant.CrowdConstant;
import cn.kgc.mv.entity.Apply;
import cn.kgc.mv.service.ApplyForLookService;
import cn.kgc.mv.service.UserService;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Author: czm
 * @Date: 2020/8/11 14:29
 */
@RestController
public class ApplyForLookController {

    @Autowired
    ApplyForLookService applyForLookService;

    @Autowired
    UserService userService;

    /*添加申请看房*/
    @RequestMapping(value = "/saveApply")
    public boolean saveApply(Apply apply){
        System.out.println(apply);
        return applyForLookService.saveApply(apply);
    }

    /*查询用户是否申请过房*/
    @RequestMapping(value = "/queryApply")
    public Apply queryApply(@RequestParam("houseId") Integer houseId,@RequestParam("userId") Integer userId){
        return applyForLookService.queryApply(houseId,userId);
    }

    /*查询申请看房*/
    @RequestMapping(value = "/queryMyApply")
    public PageInfo<Apply> queryMyApply(
            @RequestParam("userId") Integer userId,
            @RequestParam("year") String year,
            @RequestParam("month") String month,
            @RequestParam("day") String day,
            @RequestParam("state") String state,
            @RequestParam("search") String search,
            // pageNum默认值使用1
            @RequestParam(value="pageNum", defaultValue="1") Integer pageNum,

            // pageSize默认值使用5
            @RequestParam(value="pageSize", defaultValue="6") Integer pageSize,

            ModelMap modelMap

    ){

        // 调用Service方法获取PageInfo对象
        PageInfo<Apply> pageInfo = applyForLookService.queryMyApply(userId, year, month,day,state,search,pageNum,pageSize);

       /* List<Apply> list = pageInfo.getList();
        for (Apply apply : list) {
            System.out.println(apply);
        }*/
        return pageInfo;
    }

    /*取消申请*/
    @RequestMapping(value = "/closeApply")
    public boolean closeApply(@RequestParam("userId") Integer userId,@RequestParam("applyId") Integer applyId,@RequestParam("state") String state){

       boolean falg= applyForLookService.closeApply(userId,applyId,state);
       if(falg){
           /*减少用户信用度*/
           userService.updateUsercreditLine(userId);
       }

        return falg;
    }
}
