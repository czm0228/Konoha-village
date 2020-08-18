package cn.kgc.mv.service;

import cn.kgc.mv.entity.HouseCommentSalesman; /**
 * @Author: czm
 * @Date: 2020/8/17 16:49
 */
public interface CommentService {

    /*新增已看评论*/
    boolean addHouseCommentSalesman(HouseCommentSalesman houseCommentSalesman);

    /*查询是否已评论*/
    HouseCommentSalesman queryComment(HouseCommentSalesman houseCommentSalesman);
}
