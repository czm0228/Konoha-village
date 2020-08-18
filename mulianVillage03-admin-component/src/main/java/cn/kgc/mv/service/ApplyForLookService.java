package cn.kgc.mv.service;

import cn.kgc.mv.entity.Apply;
import com.github.pagehelper.PageInfo;

import java.util.List;
import java.util.Map;

/**
 * @Author: czm
 * @Date: 2020/8/11 14:48
 */
public interface ApplyForLookService {

    /*添加申请看房*/
    boolean saveApply(Apply apply);

    /*查看是否申请过此房*/
    Apply queryApply(Integer houseId, Integer userId);

    /*查询申请看房*/
    PageInfo<Apply> queryMyApply(Integer userId, String year, String month, String day, String state,String search, Integer pageNum, Integer pageSize);

    /*取消申请*/
    boolean closeApply(Integer userId, Integer applyId, String state);

    /*待看列表  状态为已同意才可以待看*/
    PageInfo<Apply> queryToLookAt(Integer userId, String year, String month, String day, String rentWay,String search, Integer pageNum, Integer pageSize);

    /*点击已看房*/
    boolean toSeeHouse(Integer id, Integer userId);

    /*查询已看房*/
    PageInfo<Apply> queryhtoSee(Integer userId, String year, String month, String day, String state, String search, Integer pageNum, Integer pageSize);

    /*删除已看房*/
    boolean deletehaveToSee(Integer id, Integer userId);
}
