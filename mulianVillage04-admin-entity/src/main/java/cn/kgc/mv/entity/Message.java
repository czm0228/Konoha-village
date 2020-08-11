package cn.kgc.mv.entity;

public class Message {

    private Integer id;  //id
    private String name; //姓名
    private String sex; //性别
    private String age;  //年龄
    private String numberId;//身份证号
    private String cardNumber;//卡号

    public Message() {
    }

    public Message(Integer id, String name, String sex, String age, String numberId, String cardNumber) {
        this.id = id;
        this.name = name;
        this.sex = sex;
        this.age = age;
        this.numberId = numberId;
        this.cardNumber = cardNumber;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getNumberId() {
        return numberId;
    }

    public void setNumberId(String numberId) {
        this.numberId = numberId;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    @Override
    public String toString() {
        return "Message{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", age='" + age + '\'' +
                ", numberId='" + numberId + '\'' +
                ", cardNumber='" + cardNumber + '\'' +
                '}';
    }
}
