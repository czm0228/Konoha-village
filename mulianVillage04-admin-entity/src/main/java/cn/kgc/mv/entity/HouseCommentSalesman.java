package cn.kgc.mv.entity;

/**
 * @Author: czm
 * @Date: 2020/8/17 16:20
 */
public class HouseCommentSalesman {
    private Integer id;//序号
    private double grade;;//分数
    private String comment;//评论内容
    private Integer houseId;//房源id
    private Integer userId;//用户id
    private String time;//时间
    private Integer aid;//申请看房id


    @Override
    public String toString() {
        return "houseCommentSalesman{" +
                "id=" + id +
                ", grade=" + grade +
                ", comment='" + comment + '\'' +
                ", houseId=" + houseId +
                ", userId=" + userId +
                ", time='" + time + '\'' +
                ", aid=" + aid +
                '}';
    }

    public HouseCommentSalesman(Integer id, double grade, String comment, Integer houseId, Integer userId, String time, Integer aid) {
        this.id = id;
        this.grade = grade;
        this.comment = comment;
        this.houseId = houseId;
        this.userId = userId;
        this.time = time;
        this.aid = aid;
    }

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public HouseCommentSalesman() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public double getGrade() {
        return grade;
    }

    public void setGrade(double grade) {
        this.grade = grade;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Integer getHouseId() {
        return houseId;
    }

    public void setHouseId(Integer houseId) {
        this.houseId = houseId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
