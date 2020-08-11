package cn.kgc.mv.entity;

/**
 * @Author: czm
 * @Date: 2020/8/8 16:41
 */
/*价格*/
public class HousePrice {

    private Integer id;//序号
    private String price;//价格


    @Override
    public String toString() {
        return "HousePrice{" +
                "id=" + id +
                ", price=" + price +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public HousePrice() {
    }

    public HousePrice(Integer id, String price) {
        this.id = id;
        this.price = price;
    }
}
