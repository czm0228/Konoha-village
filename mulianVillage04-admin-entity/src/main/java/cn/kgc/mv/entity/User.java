package cn.kgc.mv.entity;

public class User {

    private Integer id;    //序号
    private String userName;   //用户名
    private String password;   //密码
    private String phoneNumber;  //电话号码
    private int type;    //用户类型（0租客  1房东）
    private int creditLine;//信用度
    private int integral;//积分


    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", type=" + type +
                ", creditLine=" + creditLine +
                ", integral=" + integral +
                '}';
    }

    public int getIntegral() {
        return integral;
    }

    public void setIntegral(int integral) {
        this.integral = integral;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getCreditLine() {
        return creditLine;
    }

    public void setCreditLine(int creditLine) {
        this.creditLine = creditLine;
    }

    public User(Integer id, String userName, String password, String phoneNumber, int type, int creditLine) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.phoneNumber = phoneNumber;
        this.type = type;
        this.creditLine = creditLine;
    }

    public User() {
    }
}
