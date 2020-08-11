package cn.kgc.mv.entity;

public class House {

private Integer id;     //房源序号
private int areaId;     //地区ID
private String address; //地址
private double price;   //价格
private String status;  //状态
private int squareMeter;//面积
private int metro;      //地铁
private String img;     //图片
private String abstracts;//简介
private int landlordId; //房东ID
private int thumbUpFor; //点赞数
private User user;
private Message message;
private String houseType;//户型
private String hierarchy;//高中低  楼层
private int numberPlies;//房子在第几层
private String fitment;//装修类型
private String orientation;//朝向
private String buildTime;//建房时间
private String plot;//小区
private String floorType;//楼型
private String rentWay;//出租方式
private String area;//区域
private Salesman salesman;
/*private String name;//维护房源人姓名
private String sImg;//维护房源人照片*/

    @Override
    public String toString() {
        return "House{" +
                "id=" + id +
                ", areaId=" + areaId +
                ", address='" + address + '\'' +
                ", price=" + price +
                ", status='" + status + '\'' +
                ", squareMeter=" + squareMeter +
                ", metro=" + metro +
                ", img='" + img + '\'' +
                ", abstracts='" + abstracts + '\'' +
                ", landlordId=" + landlordId +
                ", thumbUpFor=" + thumbUpFor +
                ", user=" + user +
                ", message=" + message +
                ", houseType='" + houseType + '\'' +
                ", hierarchy='" + hierarchy + '\'' +
                ", numberPlies=" + numberPlies +
                ", fitment='" + fitment + '\'' +
                ", orientation='" + orientation + '\'' +
                ", buildTime='" + buildTime + '\'' +
                ", plot='" + plot + '\'' +
                ", floorType='" + floorType + '\'' +
                ", rentWay='" + rentWay + '\'' +
                ", area='" + area + '\'' +
                ", salesman=" + salesman +
                '}';
    }

    public Salesman getSalesman() {
        return salesman;
    }

    public void setSalesman(Salesman salesman) {
        this.salesman = salesman;
    }

    public House(Integer id, int areaId, String address, double price, String status, int squareMeter, int metro, String img, String abstracts, int landlordId, int thumbUpFor, User user, Message message, String houseType, String hierarchy, int numberPlies, String fitment, String orientation, String buildTime, String plot, String floorType, String rentWay, String area, Salesman salesman) {
        this.id = id;
        this.areaId = areaId;
        this.address = address;
        this.price = price;
        this.status = status;
        this.squareMeter = squareMeter;
        this.metro = metro;
        this.img = img;
        this.abstracts = abstracts;
        this.landlordId = landlordId;
        this.thumbUpFor = thumbUpFor;
        this.user = user;
        this.message = message;
        this.houseType = houseType;
        this.hierarchy = hierarchy;
        this.numberPlies = numberPlies;
        this.fitment = fitment;
        this.orientation = orientation;
        this.buildTime = buildTime;
        this.plot = plot;
        this.floorType = floorType;
        this.rentWay = rentWay;
        this.area = area;
        this.salesman = salesman;
    }

    public House() {
    }

    public House(Integer id, int areaId, String address, double price, String status, int squareMeter, int metro, String img, String abstracts, int landlordId, int thumbUpFor) {
        this.id = id;
        this.areaId = areaId;
        this.address = address;
        this.price = price;
        this.status = status;
        this.squareMeter = squareMeter;
        this.metro = metro;
        this.img = img;
        this.abstracts = abstracts;
        this.landlordId = landlordId;
        this.thumbUpFor = thumbUpFor;
    }

    public House(Integer id, int areaId, String address, double price, String status, int squareMeter, int metro, String img, String abstracts, int landlordId) {
        this.id = id;
        this.areaId = areaId;
        this.address = address;
        this.price = price;
        this.status = status;
        this.squareMeter = squareMeter;
        this.metro = metro;
        this.img = img;
        this.abstracts = abstracts;
        this.landlordId = landlordId;
        this.user=user;
    }
    public House(Integer id, int areaId, String address, double price, String status, int squareMeter, int metro, String img, String abstracts, int landlordId, Message message) {
        this.id = id;
        this.areaId = areaId;
        this.address = address;
        this.price = price;
        this.status = status;
        this.squareMeter = squareMeter;
        this.metro = metro;
        this.img = img;
        this.abstracts = abstracts;
        this.landlordId = landlordId;
        this.message=message;
    }

    public House(Integer id, int areaId, String address, double price, String status, int squareMeter, int metro, String img, String abstracts, int landlordId, User user) {
        this.id = id;
        this.areaId = areaId;
        this.address = address;
        this.price = price;
        this.status = status;
        this.squareMeter = squareMeter;
        this.metro = metro;
        this.img = img;
        this.abstracts = abstracts;
        this.landlordId = landlordId;
        this.user=user;
    }

    public House(Integer id, int areaId, String address, double price, String status, int squareMeter, int metro, String img, String abstracts, int landlordId, int thumbUpFor, User user, Message message, String houseType, String hierarchy, int numberPlies, String fitment, String orientation, String buildTime, String plot, String floorType, String rentWay, String area) {
        this.id = id;
        this.areaId = areaId;
        this.address = address;
        this.price = price;
        this.status = status;
        this.squareMeter = squareMeter;
        this.metro = metro;
        this.img = img;
        this.abstracts = abstracts;
        this.landlordId = landlordId;
        this.thumbUpFor = thumbUpFor;
        this.user = user;
        this.message = message;
        this.houseType = houseType;
        this.hierarchy = hierarchy;
        this.numberPlies = numberPlies;
        this.fitment = fitment;
        this.orientation = orientation;
        this.buildTime = buildTime;
        this.plot = plot;
        this.floorType = floorType;
        this.rentWay = rentWay;
        this.area = area;
    }



    public String getHouseType() {
        return houseType;
    }

    public void setHouseType(String houseType) {
        this.houseType = houseType;
    }

    public String getHierarchy() {
        return hierarchy;
    }

    public void setHierarchy(String hierarchy) {
        this.hierarchy = hierarchy;
    }

    public int getNumberPlies() {
        return numberPlies;
    }

    public void setNumberPlies(int numberPlies) {
        this.numberPlies = numberPlies;
    }

    public String getFitment() {
        return fitment;
    }

    public void setFitment(String fitment) {
        this.fitment = fitment;
    }

    public String getOrientation() {
        return orientation;
    }

    public void setOrientation(String orientation) {
        this.orientation = orientation;
    }

    public String getBuildTime() {
        return buildTime;
    }

    public void setBuildTime(String buildTime) {
        this.buildTime = buildTime;
    }

    public String getPlot() {
        return plot;
    }

    public void setPlot(String plot) {
        this.plot = plot;
    }

    public String getFloorType() {
        return floorType;
    }

    public void setFloorType(String floorType) {
        this.floorType = floorType;
    }

    public String getRentWay() {
        return rentWay;
    }

    public void setRentWay(String rentWay) {
        this.rentWay = rentWay;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public int getThumbUpFor() {
        return thumbUpFor;
    }

    public void setThumbUpFor(int thumbUpFor) {
        this.thumbUpFor = thumbUpFor;
    }

    public Message getMessage() {
        return message;
    }

    public void setMessage(Message message) {
        this.message = message;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getAreaId() {
        return areaId;
    }

    public void setAreaId(int areaId) {
        this.areaId = areaId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getSquareMeter() {
        return squareMeter;
    }

    public void setSquareMeter(int squareMeter) {
        this.squareMeter = squareMeter;
    }

    public int getMetro() {
        return metro;
    }

    public void setMetro(int metro) {
        this.metro = metro;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getAbstracts() {
        return abstracts;
    }

    public void setAbstracts(String abstracts) {
        this.abstracts = abstracts;
    }

    public int getLandlordId() {
        return landlordId;
    }

    public void setLandlordId(int landlordId) {
        this.landlordId = landlordId;
    }

}
