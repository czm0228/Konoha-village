package cn.kgc.mv.entity;

/**
 * @Author: czm
 * @Date: 2020/8/8 17:06
 */
public class Area {

    private Integer id;//序号
    private String district;//区域


    @Override
    public String toString() {
        return "Area{" +
                "id=" + id +
                ", district='" + district + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public Area(Integer id, String district) {
        this.id = id;
        this.district = district;
    }

    public Area() {
    }
}
