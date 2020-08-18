package cn.kgc.mv.service.impl;

import cn.kgc.mv.entity.Apply;
import cn.kgc.mv.mapper.ApplyForLookMapper;
import cn.kgc.mv.service.ApplyForLookService;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: czm
 * @Date: 2020/8/11 14:48
 */
@Service
public class ApplyForLookServiceImpl implements ApplyForLookService {

    @Autowired
    public ApplyForLookMapper applyForLookMapper;


    @Override
    public boolean saveApply(Apply apply) {
        return applyForLookMapper.saveApply(apply) == 1;
    }

    @Override
    public Apply queryApply(Integer houseId, Integer userId) {
        Map<String,Object> map=new HashMap<>();
        map.put("state1","已申请");
        map.put("state2","已同意");
        map.put("userId",userId);
        map.put("houseId",houseId);
        return applyForLookMapper.queryApply(map);
    }

    @Override
    public PageInfo<Apply> queryMyApply(Integer userId, String year, String month, String day, String state,String search, Integer pageNum, Integer pageSize) {

        String date = null;

        if (day == "" || day == null || "0".equals(day) && year == "" || year == null || "0".equals(year) && month == "" || month == null || "0".equals(month)) {
            date = null;
        } else {
            int monthi = Integer.parseInt(month);
            int dayi = Integer.parseInt(day);



            if(day == "" || day == null || "0".equals(day)){
                if (monthi < 10) {
                    month = 0 + "" + month;
                }
                if (dayi < 10) {
                    day = 0 + "" + day;
                }
                date = "%"+year + "-" + month+"%";
            }else if(month == "" || month == null || "0".equals(month)){
                if (monthi < 10) {
                    month = 0 + "" + month;
                }
                if (dayi < 10) {
                    day = 0 + "" + day;
                }
                date = "%"+year+"%";
            }else {
                if (monthi < 10) {
                    month = 0 + "" + month;
                }
                if (dayi < 10) {
                    day = 0 + "" + day;
                }
                date = "%"+year + "-" + month + "-" + day+"%";
            }

        }

       if(search!="" || search!=null){
           search="%"+search+"%";
        }

        Map<String, Object> map = new HashMap<>();
        map.put("userId", userId);
        map.put("state1", "已看房");
        map.put("state2", "已完成");
        map.put("state", state);
        map.put("date", date);
        map.put("search",search);

        // 1.调用PageHelper的静态方法开启分页功能
        // 这里充分体现了PageHelper的“非侵入式”设计：原本要做的查询不必有任何修改
        PageHelper.startPage(pageNum, pageSize);

        // 2.执行查询
        List<Apply> list = applyForLookMapper.queryMyApply(map);

        // 3.封装到PageInfo对象中
        return new PageInfo<>(list);
    }

    @Override
    public boolean closeApply(Integer userId, Integer applyId, String state) {
        Map<String, Object> map = new HashMap();
        map.put("userId", userId);
        map.put("applyId", applyId);
        map.put("state", state);
        map.put("state2", "已取消");
        return applyForLookMapper.updateApply(map) == 1;
    }

    @Override
    public PageInfo<Apply> queryToLookAt(Integer userId, String year, String month, String day, String rentWay, String search, Integer pageNum, Integer pageSize) {
        String date = null;

        if (day == "" || day == null || "0".equals(day) && year == "" || year == null || "0".equals(year) && month == "" || month == null || "0".equals(month)) {
            date = null;
        } else {
            int monthi = Integer.parseInt(month);
            int dayi = Integer.parseInt(day);



            if(day == "" || day == null || "0".equals(day)){
                if (monthi < 10) {
                    month = 0 + "" + month;
                }
                if (dayi < 10) {
                    day = 0 + "" + day;
                }
                date = "%"+year + "-" + month+"%";
            }else if(month == "" || month == null || "0".equals(month)){
                if (monthi < 10) {
                    month = 0 + "" + month;
                }
                if (dayi < 10) {
                    day = 0 + "" + day;
                }
                date = "%"+year+"%";
            }else {
                if (monthi < 10) {
                    month = 0 + "" + month;
                }
                if (dayi < 10) {
                    day = 0 + "" + day;
                }
                date = "%"+year + "-" + month + "-" + day+"%";
            }

        }

        if(search!="" || search!=null){
            search="%"+search+"%";
        }

        Map<String, Object> map = new HashMap<>();
        map.put("userId", userId);
        map.put("state1", "已同意");
        map.put("rentWay", rentWay);
        map.put("date", date);
        map.put("search",search);

        // 1.调用PageHelper的静态方法开启分页功能
        // 这里充分体现了PageHelper的“非侵入式”设计：原本要做的查询不必有任何修改
        PageHelper.startPage(pageNum, pageSize);

        // 2.执行查询
        List<Apply> list = applyForLookMapper.queryToLookAt(map);

        // 3.封装到PageInfo对象中
        return new PageInfo<>(list);
    }

    @Override
    public boolean toSeeHouse(Integer id, Integer userId) {
        Apply apply = new Apply();
        apply.setId(id);
        apply.setUserId(userId);
        apply.setState("已看房");
        return applyForLookMapper.toSeeHouse(apply)==1;
    }

    @Override
    public PageInfo<Apply> queryhtoSee(Integer userId, String year, String month, String day, String state, String search, Integer pageNum, Integer pageSize) {
        String date = null;

        if (day == "" || day == null || "0".equals(day) && year == "" || year == null || "0".equals(year) && month == "" || month == null || "0".equals(month)) {
            date = null;
        } else {
            int monthi = Integer.parseInt(month);
            int dayi = Integer.parseInt(day);



            if(day == "" || day == null || "0".equals(day)){
                if (monthi < 10) {
                    month = 0 + "" + month;
                }
                if (dayi < 10) {
                    day = 0 + "" + day;
                }
                date = "%"+year + "-" + month+"%";
            }else if(month == "" || month == null || "0".equals(month)){
                if (monthi < 10) {
                    month = 0 + "" + month;
                }
                if (dayi < 10) {
                    day = 0 + "" + day;
                }
                date = "%"+year+"%";
            }else {
                if (monthi < 10) {
                    month = 0 + "" + month;
                }
                if (dayi < 10) {
                    day = 0 + "" + day;
                }
                date = "%"+year + "-" + month + "-" + day+"%";
            }

        }

        if(search!="" || search!=null){
            search="%"+search+"%";
        }

        Map<String, Object> map = new HashMap<>();
        map.put("userId", userId);
        map.put("state1", "已看房");
        map.put("state2", "已完成");
        map.put("state", state);
        map.put("date", date);
        map.put("search",search);

        // 1.调用PageHelper的静态方法开启分页功能
        // 这里充分体现了PageHelper的“非侵入式”设计：原本要做的查询不必有任何修改
        PageHelper.startPage(pageNum, pageSize);

        // 2.执行查询
        List<Apply> list = applyForLookMapper.queryhtoSee(map);

        // 3.封装到PageInfo对象中
        return new PageInfo<>(list);
    }

    @Override
    public boolean deletehaveToSee(Integer id, Integer userId) {
        Map<String, Object> map = new HashMap<>();
        map.put("id", id);
        map.put("userId", userId);
        map.put("state1", "已看房");
        map.put("state2", "已完成");
        return applyForLookMapper.deletehaveToSee(map)==1;
    }
}
