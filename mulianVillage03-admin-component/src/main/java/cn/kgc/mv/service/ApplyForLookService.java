package cn.kgc.mv.service;

import cn.kgc.mv.entity.Apply;

import java.util.List;

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
    List<Apply> queryMyApply(Integer userId);

    /*取消申请*/
    boolean closeApply(Integer userId, Integer applyId, String state);
}
