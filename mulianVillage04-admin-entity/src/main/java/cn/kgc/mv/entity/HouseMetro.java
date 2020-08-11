package cn.kgc.mv.entity;

/**
 * @Author: czm
 * @Date: 2020/8/8 16:41
 */
/*地铁*/
public class HouseMetro {

    private Integer id;//序号
    private String metro;//地铁


    @Override
    public String toString() {
        return "HouseMetro{" +
                "id=" + id +
                ", metro='" + metro + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMetro() {
        return metro;
    }

    public void setMetro(String metro) {
        this.metro = metro;
    }

    public HouseMetro(Integer id, String metro) {
        this.id = id;
        this.metro = metro;
    }

    public HouseMetro() {
    }
}
