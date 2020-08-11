package cn.kgc.mv.entity;

/**
 * @Author: czm
 * @Date: 2020/8/8 16:42
 */
/*面积*/
public class HouseSquareMeter {

    private Integer id;//序号
    private String squareMeter;//面积


    @Override
    public String toString() {
        return "HouseSquareMeter{" +
                "id=" + id +
                ", squareMeter=" + squareMeter +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSquareMeter() {
        return squareMeter;
    }

    public void setSquareMeter(String squareMeter) {
        this.squareMeter = squareMeter;
    }

    public HouseSquareMeter(Integer id, String squareMeter) {
        this.id = id;
        this.squareMeter = squareMeter;
    }

    public HouseSquareMeter() {
    }
}
