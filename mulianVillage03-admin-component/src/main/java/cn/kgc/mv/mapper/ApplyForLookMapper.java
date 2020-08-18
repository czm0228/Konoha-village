package cn.kgc.mv.mapper;

import cn.kgc.mv.entity.Apply;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

/**
 * @Author: czm
 * @Date: 2020/8/11 14:49
 */
public interface ApplyForLookMapper {


    /*添加申请看房*/
    Integer saveApply(Apply apply);

    /*查看是否申请过此房*/
    Apply queryApply(Map<String,Object> map);

    /*查询申请看房*/
    List<Apply> queryMyApply(Map<String,Object> map);

    /*取消申请*/
    Integer updateApply(Map<String, Object> map);

    /*待看列表  状态为已同意才可以待看*/
    List<Apply> queryToLookAt(Map<String,Object> map);

    /*点击已看房*/
    Integer toSeeHouse(Apply apply);

    /*查询已看房*/
    List<Apply> queryhtoSee(Map<String, Object> map);

    /*删除已看房*/
    Integer deletehaveToSee(Map<String, Object> map);
}
