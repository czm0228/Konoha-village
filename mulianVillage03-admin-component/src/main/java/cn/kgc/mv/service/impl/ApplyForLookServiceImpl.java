package cn.kgc.mv.service.impl;

import cn.kgc.mv.entity.Apply;
import cn.kgc.mv.mapper.ApplyForLookMapper;
import cn.kgc.mv.service.ApplyForLookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: czm
 * @Date: 2020/8/11 14:48
 */
@Service
public class ApplyForLookServiceImpl implements ApplyForLookService{

    @Autowired
    public ApplyForLookMapper applyForLookMapper;


    @Override
    public boolean saveApply(Apply apply) {
        return applyForLookMapper.saveApply(apply)==1;
    }

    @Override
    public Apply queryApply(Integer houseId, Integer userId) {
        return applyForLookMapper.queryApply(houseId,userId);
    }

    @Override
    public List<Apply> queryMyApply(Integer userId) {
        return applyForLookMapper.queryMyApply(userId);
    }

    @Override
    public boolean closeApply(Integer userId, Integer applyId, String state) {
        Map<String,Object> map= new HashMap();
        map.put("userId",userId);
        map.put("applyId",applyId);
        map.put("state",state);
        map.put("state2","已取消");
        return applyForLookMapper.updateApply(map)==1;
    }
}
