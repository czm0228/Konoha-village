<%--
  Created by IntelliJ IDEA.
  User: zl
  Date: 2020/7/10
  Time: 19:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>

<html>
<head>
    <title>Title</title>

    <script type="text/javascript" src="../../js/jquery-1.8.3.js"></script>
    <script type="text/javascript">

        $(function () {


            var id = ${param.houseId};
            /*alert(id)*/
            $.ajax({
                url:"/houseById",
                data:{"id":id},
                type:"post",
                success:function (result) {

                    console.log(result)
                    $("#address1").val(result.address);
                    $("#price1").val(result.price);
                    $("#status1").val(result.status);
                    $("#squareMeter1").val(result.squareMeter);
                    $("#metro1").val(result.metro);
                    $("#abstracts1").val(result.abstracts);
                    $("#thumbUpFor1").val(result.thumbUpFor);
                    $("#houseType1").val(result.houseType);
                    $("#hierarchy1").val(result.hierarchy);
                    $("#numberPlies1").val(result.numberPlies);
                    $("#fitment1").val(result.fitment);
                    $("#orientation1").val(result.orientation);
                    $("#buildTime1").val(result.buildTime);
                    $("#plot1").val(result.plot);
                    $("#floorType1").val(result.floorType);
                    $("#rentWay1").val(result.rentWay);

                }
            })

            $("#updaBtn").click(function () {

                $.ajax({
                    url:"/updateHouse",
                    data:$("form").serialize()+"&id="+id,
                    type:"post",
                    success:function (result) {
                        /*alert(result)*/
                        console.log(result)
                        if (result){
                            alert("修改成功")
                            window.location.href="house";
                        }else {
                            alert("修改失败")
                        }

                    }
                })
            })

        })

        //获取地址栏参数,可以是中文参数
        function getUrlParam(key) {
            // 获取参数
            var url = window.location.search;
            //localhost:8080/doc?name=zhangsan&password=abc123
            // 正则筛选地址栏
            var reg = new RegExp("(^|&)" + key + "=([^&]*)(&|$)");
            // 匹配目标参数
            var result = url.substr(1).match(reg);
            //返回参数值
            return result ? decodeURIComponent(result[2]) : null;
        }

    </script>

    <style type="text/css">

        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
        }
        input[type="number"]{
            -moz-appearance: textfield;
        }
    </style>
</head>

<link rel="stylesheet" href="/css/addHouse.css">

<style type="text/css">
    .submit{
        position: absolute;
        bottom: -26px;
   left: 280px;
        padding: 4px 4px;
        font-size: 15px;
    }




</style>

<body>
   <div class="round">
       <h1>修改房源信息</h1>
<form>

修改地址:<input type="text" name="address" id="address1"><br/>
    修改价格:<input type="number" name="price" step="0.01" min="0" id="price1"><br/>

    修改房屋状态:<select name="status" id="status1" class="status" style="text-align: center; text-align-last: center">
        <option >已租赁</option>
        <option >未租赁</option>
    </select><br/>
    修改面积:<input type="number" name="squareMeter" id="squareMeter1"><br/>
    修改地铁信息:<select name="metro" id="metro1" style="text-align: center; text-align-last: center">
    <option >1</option>
    <option >2</option>
     <option >3</option>
    <option >4</option>
    <option >5</option>
     <option >6</option>
    <option >7</option>
     <option >8</option>
    <option >9</option>
    <option >10</option>
</select>号线路<br/>
   <%-- <input type="hidden" name="img" id="img1" value="${house.img}">--%>
    简介:<input type="text" name="abstracts" id="abstracts1"><br/>
    <%--<input type="hidden" name="landlordId" value="${house.landlordId}"><br/>--%>
    修改点赞数:<input type="number" min="0" name="thumbUpFor" id="thumbUpFor1"><br/>
    修改户型:<input type="text" name="houseType" id="houseType1"><br/>
    修改高中低楼层:<input type="text" name="hierarchy" id="hierarchy1"><br/>
    修改房层:<input type="text" name="numberPlies" id="numberPlies1"><br/>
    修改装修类型:<input type="text" name="fitment" id="fitment1"><br/>
    修改朝向:<input type="text" name="orientation" id="orientation1"><br/>
    修改建房时间:<input type="text" name="buildTime" id="buildTime1"><br/>
    修改小区:<input type="text" name="plot" id="plot1"><br/>
    修改楼型:<input type="text" name="floorType" id="floorType1"><br/>
    修改出租方式:<input type="text" name="rentWay" id="rentWay1"><br/>
    <%--<input type="hidden" name="salesmanId">--%>
    <input type="button" value="确认修改" class="submit" id="updaBtn"><br/>

    <br/>
    <br/>

</form>
       <input type="button" value="返回" class="submit" onclick="window.history.back()">

   </div>
</body>
</html>
