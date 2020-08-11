package cn.kgc.mv.controller;

import cn.kgc.mv.entity.User;
import cn.kgc.mv.service.UserService;
import cn.kgc.mv.util.SendCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @Author: czm
 * @Date: 2020/8/8 9:10
 */
/*注册控制层*/
@Controller
public class RegisterController {

    @Autowired
    UserService userService;

    /*跳转到注册页面*/
    @RequestMapping(value = "/register")
    public String loginToRegister() {
        return "register";
    }

    /*获取验证码*/
    @ResponseBody
    @RequestMapping(value = "/getCode")/*produces = { "text/html;charset=UTF-8;", "application/json;charset=UTF-8;" }解决中文乱码问题*/
    public boolean getCode(@RequestParam("phone") String phone, HttpSession session) {

        //查询该手机号吗是否被注册
        String phoneNumber = userService.getPhone(phone);
        /*System.out.println(phoneNumber);*/
        //被注册 return false
        if (phoneNumber != null) {
            return false;
        } else {

            //未被注册 调用工具类生成验证码，并把手机号码和验证码存到域对象中
            try {
               /* String send = SendCode.send(phone);*/
                session.setAttribute("code", "888888");
                session.setAttribute("phone", phone);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return true;
        }
    }




    /*注册成功跳转到缓冲页面*/
    @RequestMapping(value = "/success")
    public String success(){
        return "success";
    }
}

