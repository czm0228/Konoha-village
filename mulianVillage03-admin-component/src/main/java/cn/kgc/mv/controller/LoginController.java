package cn.kgc.mv.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author: czm
 * @Date: 2020/8/7 19:30
 */
/*登录控制层*/
@Controller
public class LoginController {

    /*登录页面*/
    @RequestMapping(value = "login")
    public String login(){
        return "login";
    }


    /*首页*/
    @RequestMapping(value = "/frameHomePag")
    public String frameHomePag(){
        return "frameHomePag";
    }
}
