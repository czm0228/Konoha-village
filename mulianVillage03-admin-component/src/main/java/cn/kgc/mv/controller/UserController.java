package cn.kgc.mv.controller;

import cn.kgc.mv.entity.User;
import cn.kgc.mv.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @Author: czm
 * @Date: 2020/8/9 19:26
 */
@Controller
public class UserController {

    @Autowired
    UserService userService;


    /*退出登录*/
    @RequestMapping(value = "/exitToLogin")
    public String exitToLogin(HttpSession session){
        session.invalidate();
        return "redirect:/login";
    }



    /*查询用户*/
    @RequestMapping(value = "/queryUser")
    public String queryUser(User user,HttpSession session){

      User users=userService.queryUser(user);
      if(users!=null){
          session.setAttribute("user",users);
      }
       return "redirect:/frameTenant";
    }


    /*增加用户*/
    @ResponseBody
    @RequestMapping(value = "/saveUser", produces = {"text/html;charset=UTF-8;", "application/json;charset=UTF-8;"})
    public String saveUser(User user, @RequestParam("code") String code, HttpSession session) {
       /* System.out.println(user+"code="+code);*/
        String phone = (String) session.getAttribute("phone");
        String code1 = (String) session.getAttribute("code");

        //判断用户名是否已存在
        if (userService.getUserName(user.getUserName())) {
            return "用户名已存在!";
        } else {
            if (phone == "" || phone == null) {
                return "您还获取验证码！";
            } else if (!phone.equals(user.getPhoneNumber())) {//提交的手机号码是否和接收验证码的手机号码一致！
                return "提交的手机号码与接收验证码的手机号码一致!";
            } else if (!code.equals(code1)) {//判断验证码是否一致
                return "验证码不正确!";
            } else {
                userService.saveUser(user);
                return "注册成功!";
            }
        }

    }
}
