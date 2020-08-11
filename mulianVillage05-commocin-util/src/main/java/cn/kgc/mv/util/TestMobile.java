package cn.kgc.mv.util;

public class TestMobile {
    public static void main(String[] args) {
        try {
            String send = SendCode.send("18255270890");
            System.out.println(send);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
