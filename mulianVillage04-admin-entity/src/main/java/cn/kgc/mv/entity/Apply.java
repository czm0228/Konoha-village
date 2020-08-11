package cn.kgc.mv.entity;

public class Apply {

    private Integer id;
    private Integer houseId;//房源id
    private Integer userId;//用户Id
    private String datetime;//申请时间
    private House house;//房源
    private String state;//状态
    private String phone;//手机号码
    private String userName;//姓名


    @Override
    public String toString() {
        return "Apply{" +
                "id=" + id +
                ", houseId=" + houseId +
                ", userId=" + userId +
                ", datetime='" + datetime + '\'' +
                ", house=" + house +
                ", state='" + state + '\'' +
                ", phone='" + phone + '\'' +
                ", userName='" + userName + '\'' +
                '}';
    }

    public Apply() {
    }

    public Apply(Integer id, Integer houseId, Integer userId, String datetime, House house, String state) {
        this.id = id;
        this.houseId = houseId;
        this.userId = userId;
        this.datetime = datetime;
        this.house = house;
        this.state = state;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getState() {
        return state;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public House getHouse() {
        return house;
    }

    public void setHouse(House house) {
        this.house = house;
    }
}
