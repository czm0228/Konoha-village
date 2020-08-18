package cn.kgc.mv.service;



import cn.kgc.mv.entity.User;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 * @Author: czm
 * @Date: 2020/8/8 11:29
 */
public interface UserService {

    /*查询手机号是否被注册*/
    public String getPhone(String phone);

    /*查询用户名是否存在*/
    boolean getUserName(String username);

    /*增加用户*/
    Integer saveUser(User user);

    /*根据用户名密码 用户类型查询用户*/
    User queryUser(User user);

    /*修改用户信用度*/
    boolean updateUsercreditLine(Integer userId);

    /*查询信用度*/
    User queryCreditLine(String username);

    /*用户发表已看评论增加积分*/
    boolean addIntegral(Integer userId, int i);
}
