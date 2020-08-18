package cn.kgc.mv.entity;

/**
 * @Author: ZL
 * @Date: 2020/8/17 14:19
 */
public class SalesmanFavorable {

    private Integer favorableId;
    private String favorableText;

    @Override
    public String toString() {
        return "SalesmanFavorable{" +
                "favorableId=" + favorableId +
                ", favorableText='" + favorableText + '\'' +
                '}';
    }

    public Integer getFavorableId() {
        return favorableId;
    }

    public void setFavorableId(Integer favorableId) {
        this.favorableId = favorableId;
    }

    public String getFavorableText() {
        return favorableText;
    }

    public void setFavorableText(String favorableText) {
        this.favorableText = favorableText;
    }

    public SalesmanFavorable() {

    }

    public SalesmanFavorable(Integer favorableId, String favorableText) {

        this.favorableId = favorableId;
        this.favorableText = favorableText;
    }
}
