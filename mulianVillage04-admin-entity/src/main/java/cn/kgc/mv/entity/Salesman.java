package cn.kgc.mv.entity;

/**
 * @Author: czm
 * @Date: 2020/8/10 19:10
 */
public class Salesman {
    private Integer id;//id
    private String name;//姓名
    private int sex;//年龄
    private int age;//性别
    private String img;//图片
    private int performance;//业绩
    private int favorable;//好评率


    @Override
    public String toString() {
        return "Salesman{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", sex=" + sex +
                ", age=" + age +
                ", img='" + img + '\'' +
                ", performance=" + performance +
                ", favorable=" + favorable +
                '}';
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

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getPerformance() {
        return performance;
    }

    public void setPerformance(int performance) {
        this.performance = performance;
    }

    public int getFavorable() {
        return favorable;
    }

    public void setFavorable(int favorable) {
        this.favorable = favorable;
    }

    public Salesman(Integer id, String name, int sex, int age, String img, int performance, int favorable) {
        this.id = id;
        this.name = name;
        this.sex = sex;
        this.age = age;
        this.img = img;
        this.performance = performance;
        this.favorable = favorable;
    }

    public Salesman() {
    }
}
