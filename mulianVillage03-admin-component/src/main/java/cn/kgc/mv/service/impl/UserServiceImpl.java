package cn.kgc.mv.service.impl;

import cn.kgc.mv.entity.User;
import cn.kgc.mv.mapper.UserMapper;
import cn.kgc.mv.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author: czm
 * @Date: 2020/8/8 11:29
 */
@Service
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
        return userMapper.saveUser(user);
    }

    @Override
    public User queryUser(User user) {
        return userMapper.queryUser(user);
    }
}
