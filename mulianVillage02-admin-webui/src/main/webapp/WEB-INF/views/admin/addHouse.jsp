<%--
  Created by IntelliJ IDEA.
  User: zl
  Date: 2020/8/8
  Time: 16:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<html>
<head>
    <title>Title</title>


<link rel="stylesheet" href="../css/addHouse.css">
<script type="text/javascript" src="../../js/jquery-1.8.3.js"></script>
<script type="text/javascript">

    $(function () {

        $("#addBtn").click(function () {

            var address = $("#address1").val();
            var price = $("#price1").val();
            /*var status = $("#status1").val();*/
            var squareMeter = $("#squareMeter1").val();
            /*var metro = $("#metro1").val();*/
            var img = $("#img1").val();
            /*var abstracts = $("#abstracts1").val();
            var thumbUpFor = $("#thumbUpFor1").val();
            var houseType = $("#houseType1").val();
            var hierarchy = $("#hierarchy1").val();*/
            var numberPlies = $("#numberPlies1").val();
            /*var fitment = $("#fitment1").val();
            var orientation = $("#orientation1").val();
            var buildTime = $("#buildTime1").val();
            var plot = $("#plot1").val();
            var floorType = $("#floorType1").val();
            var rentWay = $("#rentWay1").val();*/

            if (address==''){
                alert("地址不能为空")
            }else if(price==''){
                alert("价钱不能为空")
            }else if(squareMeter=''||squareMeter==""){
                alert("面积不能为空")
            }else if(numberPlies=''||numberPlies=="") {
                alert("楼层不能为空")
            }else {
                $.ajax({
                    url:"/saveHouse",
                    data:$("form").serialize(),
                    success:function (result) {

                        /* alert(result)*/
                        console.log(result)
                        if (result){
                            alert("增加成功")
                            window.location.href="house";
                        }else{
                            alert("增加失败")
                        }

                    }
                })
            }

        })

    })

</script>
</head>
<body>
<div class="round">
    <h1>增加房源</h1>
    <form enctype="multipart/form-data">
        地址:<input type="text" name="address" id="address1" value="${param.address1}"><br/>
        价格:<input type="number" name="price" id="price1" step="0.01" min="0"><br/>
        房屋状态:<select name="status" id="status1" class="status" style="text-align: center; text-align-last: center" >
        <option  >未租赁</option>
        <option  >已租赁</option>
    </select><br/>
        面积:<input type="number" name="squareMeter" id="squareMeter1" min="0"><br/>
        地铁信息:地铁<select name="metro" id="metro1" style="text-align: center; text-align-last: center">
        <option  >1</option>
        <option  >2</option>
        <option  >3</option>
        <option  >4</option>
        <option  >5</option>
        <option  >6</option>
        <option  >7</option>
        <option  >8</option>
        <option  >9</option>
        <option  >10</option>
    </select>号线<br/>
        <input type="file" name="img" id="img1"><br/>
        简介:<input type="text" name="abstracts" id="abstracts1"><br/>
        <%--<input type="hidden" name="landlordId" id="landlordId1" >--%>
        <%--点赞数:<input type="number" min="0" name="thumbUpFor" id="thumbUpFor1"><br/>--%>
        户型:<input type="text" name="houseType" id="houseType1" ><br/>
        高中低楼层:<input type="text" name="hierarchy" id="hierarchy1"><br/>
        房层:<input type="number" name="numberPlies" id="numberPlies1" min="0"><br/>
        装修类型:<input type="text" name="fitment" id="fitment1"><br/>
        朝向:<input type="text" name="orientation" id="orientation1"><br/>
        建房时间:<input type="text" name="buildTime" id="buildTime1"><br/>
        小区:<input type="text" name="plot" id="plot1"><br/>
        楼型:<input type="text" name="floorType" id="floorType1"><br/>
        出租方式:<input type="text" name="rentWay" id="rentWay1"><br/>
        <br/>
        <br/>
        <input type="button"  class="submit" id="addBtn" value="确认增加">
    </form>
    <input type="button"  class="submit" onclick="window.history.back()" value="返回">
</div>
</body>
</html>
