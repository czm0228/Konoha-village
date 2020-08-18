package cn.kgc.mv.service.impl;

import cn.kgc.mv.entity.House;
import cn.kgc.mv.entity.Salesman;
import cn.kgc.mv.entity.SalesmanAge;
import cn.kgc.mv.entity.SalesmanFavorable;
import cn.kgc.mv.mapper.SalesmanMapper;
import cn.kgc.mv.service.SalesmanService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: ZL
 * @Date: 2020/8/17 11:16
 */
@Service
public class SalesmanServiceImpl implements SalesmanService {

    @Autowired
    private SalesmanMapper salesmanMapper;


    @Override
    public List<SalesmanAge> getSalesmanAge() {
        return salesmanMapper.getSalesmanAge();
    }

    @Override
    public List<SalesmanFavorable> getSalesmanFavorable() {
        return salesmanMapper.getSalesmanFavorable();
    }

    @Override
    public PageInfo<Salesman> querySalesman(Integer ageId, String sex, Integer favorableId,String search, Integer pageNum, Integer pageSize) {

        Map<String,Object> map = new HashMap();
        map.put("ageId",ageId);
        map.put("sex",sex);
        map.put("favorableId",favorableId);
        if(search !=null && search !=""){
            map.put("search","%"+search+"%");
        }else {
            map.put("search",null);
        }
        // 1.调用PageHelper的静态方法开启分页功能
        // 这里充分体现了PageHelper的“非侵入式”设计：原本要做的查询不必有任何修改
        PageHelper.startPage(pageNum, pageSize);

        // 2.执行查询
        List<Salesman> salesman = salesmanMapper.querySalesman(map);

        // 3.封装到PageInfo对象中
        return new PageInfo<>(salesman);
    }
}
