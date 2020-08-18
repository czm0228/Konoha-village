package cn.kgc.mv.entity;

/**
 * @Author: ZL
 * @Date: 2020/8/17 14:17
 */
public class SalesmanAge {

    private Integer ageId;
    private String ageText;

    public SalesmanAge() {
    }

    @Override
    public String toString() {
        return "SalesmanAge{" +
                "ageId=" + ageId +
                ", ageText='" + ageText + '\'' +
                '}';
    }

    public Integer getAgeId() {
        return ageId;
    }

    public void setAgeId(Integer ageId) {
        this.ageId = ageId;
    }

    public String getAgeText() {
        return ageText;
    }

    public void setAgeText(String ageText) {
        this.ageText = ageText;
    }

    public SalesmanAge(Integer ageId, String ageText) {

        this.ageId = ageId;
        this.ageText = ageText;
    }
}
