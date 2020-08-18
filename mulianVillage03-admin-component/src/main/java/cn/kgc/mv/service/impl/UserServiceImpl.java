package cn.kgc.mv.service.impl;

import cn.kgc.mv.constant.CrowdConstant;


import cn.kgc.mv.entity.User;
import cn.kgc.mv.exception.LoginFailedException;
import cn.kgc.mv.mapper.UserMapper;
import cn.kgc.mv.service.UserService;
import cn.kgc.mv.util.CrowdUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * @Author: czm
 * @Date: 2020/8/8 11:29
 */
@Service(value = "userService")
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    @Override
    public String getPhone(String phone) {
        return userMapper.getPhone(phone);
    }

    @Override
    public boolean getUserName(String username) {
        return userMapper.getUserName(username)!=null;
    }

    @Override
    public Integer saveUser(User user) {

        String password = CrowdUtil.md5(user.getPassword());
        user.setPassword(password);
        return userMapper.saveUser(user);

    }

    @Override
    public User queryUser(User user) {

        if(user.getUserName()==null || user.getUserName()==""){
            throw new LoginFailedException(CrowdConstant.MESSAGE_STRING_INVALIDATE);
        }

        if(user.getPassword()==null || user.getPassword()==""){
            throw new LoginFailedException(CrowdConstant.MESSAGE_STRING_INVALIDATE);
        }

        // 根据用户名查询用户
        User user1 = userMapper.queryUser(user);

        // 2.判断是否为有此用户
        if(user1 == null || user.equals("")) {
            throw new LoginFailedException(CrowdConstant.MESSAGE_LOGIN_FAILED);
        }

       /* if(list.size() > 1) {
            throw new RuntimeException(CrowdConstant.MESSAGE_SYSTEM_ERROR_LOGIN_NOT_UNIQUE);
        }*/



        // 3.如果Admin对象为null则抛出异常
        if(user1 == null) {
            throw new LoginFailedException(CrowdConstant.MESSAGE_LOGIN_FAILED);
        }

        // 4.如果Admin对象不为null则将数据库密码从Admin对象中取出
        String userPswdDB = user1.getPassword();

        // 5.将表单提交的明文密码进行加密
        String userPswdForm = CrowdUtil.md5(user.getPassword());

        // 6.对密码进行比较
        if(!Objects.equals(userPswdDB, userPswdForm)) {
            // 7.如果比较结果是不一致则抛出异常
            throw new LoginFailedException(CrowdConstant.MESSAGE_LOGIN_FAILED);
        }

        //判断用户类型是否一致
        if(user.getType()==user1.getType()){
            throw new LoginFailedException(CrowdConstant.MESSAGE_LOGIN_FAILED);
        }

        // 8.如果一致则返回Admin对象
        return user1;

    }

    @Override
    public boolean updateUsercreditLine(Integer userId) {
        return userMapper.updateUsercreditLine(userId)==1;
    }

    @Override
    public User queryCreditLine(String username) {
        return userMapper.queryCreditLine(username);
    }

    @Override
    public boolean addIntegral(Integer userId, int integral) {
        return userMapper.addIntegral(userId,integral)==1;
    }


}
