package cn.kgc.mv.service.impl;

import cn.kgc.mv.entity.HouseCommentSalesman;
import cn.kgc.mv.mapper.CommentMapper;
import cn.kgc.mv.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author: czm
 * @Date: 2020/8/17 16:49
 */
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    CommentMapper commentMapper;

    @Override
    public boolean addHouseCommentSalesman(HouseCommentSalesman houseCommentSalesman) {
        return commentMapper.addHouseCommentSalesman(houseCommentSalesman)==1;
    }

    @Override
    public HouseCommentSalesman queryComment(HouseCommentSalesman houseCommentSalesman) {
        return commentMapper.queryComment(houseCommentSalesman);
    }
}
