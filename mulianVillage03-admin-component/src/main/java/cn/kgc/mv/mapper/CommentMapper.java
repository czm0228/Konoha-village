package cn.kgc.mv.mapper;

import cn.kgc.mv.entity.HouseCommentSalesman; /**
 * @Author: czm
 * @Date: 2020/8/17 16:49
 */
public interface CommentMapper {

    /*已看房评论*/
    Integer addHouseCommentSalesman(HouseCommentSalesman houseCommentSalesman);

    /*查询是否已评论*/
    HouseCommentSalesman queryComment(HouseCommentSalesman houseCommentSalesman);
}
