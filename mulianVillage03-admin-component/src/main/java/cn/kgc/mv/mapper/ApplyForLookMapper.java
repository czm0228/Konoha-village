package cn.kgc.mv.mapper;

import cn.kgc.mv.entity.Apply;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @Author: czm
 * @Date: 2020/8/11 14:49
 */
public interface ApplyForLookMapper {


    /*添加申请看房*/
    Integer saveApply(Apply apply);

    /*查看是否申请过此房*/
    Apply queryApply(@Param("houseId") Integer houseId, @Param("userId") Integer userId);

    /*查询申请看房*/
    List<Apply> queryMyApply(@Param("userId") Integer userId);
}
