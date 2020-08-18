package cn.kgc.mv.controller;

import cn.kgc.mv.entity.HouseCommentSalesman;

import cn.kgc.mv.service.CommentService;
import cn.kgc.mv.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: czm
 * @Date: 2020/8/17 16:44
 */
@RestController
public class CommentController {

    @Autowired
    CommentService commentService;

    @Autowired
    UserService userService;

    /*增加已看评论*/
    @RequestMapping(value = "/addHouseCommentSalesman")
    public boolean addHouseCommentSalesman(HouseCommentSalesman houseCommentSalesman){
        /*System.out.println(houseCommentSalesman);*/
        if (commentService.addHouseCommentSalesman(houseCommentSalesman) && userService.addIntegral(houseCommentSalesman.getUserId(),5)){
            return true;
        }

        return false;
    }

    /*查询是否已评论*/
    @RequestMapping(value = "/queryComment")
    public HouseCommentSalesman queryComment(HouseCommentSalesman houseCommentSalesman){
       /* System.out.println(houseCommentSalesman);*/
        return commentService.queryComment(houseCommentSalesman);
    }

}
