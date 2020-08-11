<%--
  Created by IntelliJ IDEA.
  User: 陈志明
  Date: 2020/7/5
  Time: 16:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
    <script src="../../../js/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../../css/style.css">
    <script type="text/javascript" src="../../../js/jquery-1.8.3.js"></script>
    <link rel="stylesheet" type="text/css" href="../../../css/bootstrap.min.css">
    <link href="../../../css/housingDetails.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="../../../css/common.css"/>
    <link rel="stylesheet" type="text/css" href="../../../css/main.css"/>

    <%-- <script src="../../../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>--%>
    <script src="../../../js/bootbox.min.js"></script>
    <style type="text/css">
        .img-span {
            float: left;
            margin: 20px 20px 20px 20px;
            width: 600px;
        }

        /* 这开始*/
        #img-span {
            position: absolute;
            right: 150px;
        }

        #btn2 {
            position: absolute;
            top: 470px;
            left: 150px;
        }

        #btn1 {
            position: absolute;
            top: 470px;
            left: 350px;
        }

        .login1 { /* 按钮美化 */
            width: 70px; /* 宽度 */
            height: 30px; /* 高度 */
            border-width: 0px; /* 边框宽度 */
            border-radius: 3px; /* 边框半径 */
            background: #1E90FF; /* 背景颜色 */
            cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
            outline: none; /* 不显示轮廓线 */
            font-family: Microsoft YaHei; /* 设置字体 */
            color: white; /* 字体颜色 */
            font-size: 17px; /* 字体大小 */
        }

        .login1:hover { /* 鼠标移入按钮范围时改变颜色 */
            background: #5599FF;

        }

        .login2 { /* 按钮美化 */
            width: 140px; /* 宽度 */
            height: 30px; /* 高度 */
            border-width: 0px; /* 边框宽度 */
            border-radius: 3px; /* 边框半径 */
            background: #1E90FF; /* 背景颜色 */
            cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
            outline: none; /* 不显示轮廓线 */
            font-family: Microsoft YaHei; /* 设置字体 */
            color: white; /* 字体颜色 */
            font-size: 17px; /* 字体大小 */
        }

        .login2:hover {
            background: #5599FF;
        }

        /* 这结束*/

        .font {
            color: red; /*字体颜色*/
            font-size: 30px; /* 字体大小 */
            font-weight: bold; /* 字体粗细 */
        }

        .fonts {
            color: red; /*字体颜色*/
            font-size: 12px; /* 字体大小 */
        }

        table {
            width: 350px;
        / / 边框大小
        }

        table tr td {
            border-top: #ccc solid 1px; /*顶部边框颜色和粗细*/
            border-bottom: #ccc solid 1px; /*底部边框颜色和粗细*/
            width: 120px; /*宽度大小*/
            background-color: white; /*背景颜色*/
            text-align: center;
            line-height: 24px;

            content: " ";
            height: 60px;
            display: inline-block;
            vertical-align: middle;

        }

        .big {
            font-size: 23px; /* 字体大小 */
            padding-bottom: 6px; /* 内边距 （下）*/
            padding-top: 12px; /* 内边距 （上）*/

        }

        .xiao {

            color: gray;
            font-size: 14px; /* 字体大小 */
            margin-bottom: 12px; /* 外边距 （下）*/
        }

        html {
            overflow-x: hidden;
            overflow-y: auto;
        }

        .div {
            width: 350px;

            border-bottom: 1px solid #ccc;
        }

        .fonts-size {
            font-size: 16px;

        }

        #xin {

            position: absolute;
            right: 0px;
            top: 187px;

        }

        #shi {

            position: absolute;
            right: -64px;
            top: 230px;

        }

        #zu {
            position: absolute;
            top: 230px;
        }

        #qu {
            position: absolute;
            top: 270px;
        }

        .div2 {
            width: 350px;
            height: 250px;
        }

        h2 {
            position: absolute;
            right: 40px;
            font-size: 24px;
            font-weight: bold;
            top: 310px;
        }

        .d-xl-inline {
            position: absolute;
            right: -120px;
            top: 360px;
        }

        .sub1 {

            position: absolute;
            top: 430px;
            position: absolute;
            right: 10px;

            line-height: 10px;

            width: 120px; /* 宽度 */
            height: 50px; /* 高度 */
            border-width: 0px; /* 边框宽度 */
            border-radius: 3px; /* 边框半径 */
            background: #EDF6FF; /* 背景颜色 */
            cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
            outline: none; /* 不显示轮廓线 */
            font-family: Microsoft YaHei; /* 设置字体 */
            font-size: 16px;
            color: blue;
            font-weight: 300px;

            background-image: url(../../../img/submit1.png); /*设置小图标*/
            background-size: 30px 30px; /*小图标的大小*/
            background-position: 11px 11px; /*小图标在input的位置*/
            background-repeat: no-repeat; /*背景小图标不重复*/
            padding: 8px 10px 8px 40px; /*设置input内边距*/

        }

        .sub2 {
            position: absolute;
            top: 430px;
            position: absolute;
            right: -120px;
            font-weight: 300px;

            width: 120px; /* 宽度 */
            height: 50px; /* 高度 */
            border-width: 0px; /* 边框宽度 */
            border-radius: 3px; /* 边框半径 */
            background: cornsilk; /* 背景颜色 */
            cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
            outline: none; /* 不显示轮廓线 */
            font-family: Microsoft YaHei; /* 设置字体 */
            font-size: 16px;
            color: red;

            background-image: url(../../../img/submit2.png); /*设置小图标*/
            background-size: 30px 30px; /*小图标的大小*/
            background-position: 11px 11px; /*小图标在input的位置*/
            background-repeat: no-repeat; /*背景小图标不重复*/
            padding: 8px 10px 8px 40px; /*设置input内边距*/
        }

        .tu {
            margin-top: 20px;
            width: 40%;
            height: 65%;
        }

        .pagination {
            position: absolute;

            left: 260px;
        }

        .pagination {
            display: inline-block;
            padding: 0;
            margin: 0;
        }

        .pagination a {

            padding: 5px 6px;
            text-decoration: none;
        }

        .pagination a {
            background-color: deepskyblue;
            color: white;
        }

        .active {

            background-color: white;
            color: white;
        }

        .pagination a:hover:not(.active) {
            background-color: aquamarine;
        }

        .button {
            display: inline-block;
            padding: 7px 7px;
            font-size: 19px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            outline: none;
            color: #fff;
            background-color: #00bfff;
            border: none;
            border-radius: 15px;
            box-shadow: 0 9px #999;
        }

        .button:hover {
            background-color: #00bfff
        }

        .button:active {
            background-color: #00bfff;
            box-shadow: 0 5px #666;
            transform: translateY(4px);
        }

        .blue {
            border: 1px solid #ccc;
            padding: 7px 0px;
            border-radius: 3px;
            padding-left: 5px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
            -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s
        }

        .blue:focus {
            border-color: #66afe9;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px rgba(102, 175, 233, .6);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px rgba(102, 175, 233, .6)
        }


    </style>

    <script type="text/javascript">

        $(function () {

            $.ajax({
                url: "/queryHouseDetails",
                data: {"houseId":${param.id}},
                success: function (result) {
                    /* console.log(result)*/
                    $("#houseImg").attr("src", result.img)
                    $("#houseImg").attr("alt", result.address)
                    $("#price").text(result.price)
                    $("#houseType").text(result.houseType)
                    $("#hierarchy").text(result.hierarchy + "/" + result.numberPlies)
                    $("#squareMeter").text(result.squareMeter + "m²")
                    $("#fitment").text(result.fitment)
                    $("#orientation").text(result.orientation)
                    $("#buildTime").text(result.buildTime + "年建")
                    $("#plot").text(result.plot)
                    $("#xin").text("楼型：" + result.floorType)
                    $("#zu").text("出租方式：" + result.rentWay)
                    $("#area").text(result.area)
                    $("#slaesmanImg").attr("src", result.salesman.img)
                    $("#slaesmanName").text(result.salesman.name)
                    if (result.status == "未租赁") {

                        $("#btn1").attr("disabled", false);
                        $("#btn1").text("申请看房");

                    } else if (result.status == "已租赁") {
                        $("#btn1").attr("disabled", true);
                        $("#btn1").text("已租赁");
                    }
                }
            })


            $("#btn1").click(function () {
                var username = "${sessionScope.user.userName}";
                if (username != "" && username != null) {
                    $.ajax({
                        url: "/queryApply",
                        data: {"houseId":${param.id}, "userId":${sessionScope.user.id}},
                        success: function (result) {
                            var houseId =${param.id};
                            var userId =${sessionScope.user.id};
                            if (houseId == result.houseId && userId == result.userId) {

                                alert("你已申请看房！")

                            } else {
                                window.location.href = "/applyForLook?houseId=" +${param.id};
                            }
                        }
                    })

                } else {
                    alert("您还没有登录，请登陆后再申请看房！！")
                    return false;
                }
            })


            $("#btn2").click(function () {
                history.go(-1);
            });


            <%----%>
            /**/


            //判断是否在前面加0
            function getNow(s) {
                return s < 10 ? '0' + s : s;
            }

            var myDate = new Date();

            var year = myDate.getFullYear();        //获取当前年
            var month = myDate.getMonth() + 1;   //获取当前月
            var date = myDate.getDate();            //获取当前日


            var h = myDate.getHours();              //获取当前小时数(0-23)
            var m = myDate.getMinutes();          //获取当前分钟数(0-59)
            var s = myDate.getSeconds();

            var now = year + '-' + getNow(month) + "-" + getNow(date) + " " + getNow(h) + ':' + getNow(m) + ":" + getNow(s);

            /!*评论按钮单击事件*!/
            $("#btnComment").click(function () {
                var userId = "${sessionScope.user.id}";

                if (userId != "") {
                    var value = $("#commentText").val();
                    if (value == "") {
                        alert("评论的内容不能为空!");
                        return false
                            ;
                    }

                    var url = "/CommentServlet";

                    var param = {
                        "userId": userId,
                        "houseId": 11<%--${requestScope.house.id}--%>,
                        "value": value,
                        "now": now
                    };
                    $.post(url, param, function (data) {
                        alert(data)
                        return false;
                    }, "text");

                    $("#commentText").val("");
                } else {
                    alert("请登录!")
                }


            })

        });

    </script>
</head>
<body>
<div>
    <div class="result-title">
        <h1>当前位置>房屋列表>房屋详情页 </h1>
    </div>

    <div>
			<span class="img-span"> <img alt="${requestScope.house.address}"
                                         src="${requestScope.house.img}" width="600px" height="400px" id="houseImg">
			</span>
        <span class="img-span" id="img-span"> <br>

				<p>价格:<span class="font" id="price">${requestScope.house.price}</span> <span
                        class="fonts">元/月</span></p> <br>

                  <table border="0" cellpadding="0" cellspacing="0" style="width: 600px;border-collapse: collapse;">
             <tr>
               <td style="height: 80px;border-collapse: collapse;">
                   <p class="big" id="houseType">${requestScope.house.houseType}</p>
                      <p class="xiao"
                         id="hierarchy">${requestScope.house.hierarchy}/${requestScope.house.numberPlies}层</p>
               </td>

                 <td style="height: 80px;border-collapse: collapse;">
                    <p class="big" id="squareMeter">${requestScope.house.squareMeter}</p>
                      <p class="xiao" id="fitment">${requestScope.house.fitment}</p>

                 </td>
                 <td style="height: 80px;border-collapse: collapse;">
                     <p class="big" id="orientation">${requestScope.house.orientation}</p>
                       <p class="xiao" id="buildTime">${requestScope.house.buildTime}</p>

                 </td>
                  </tr>

</table> <br>


  <div class="div">

               <p class="fonts-size">小区：<a href="#" id="plot">${requestScope.house.plot}</a></p> <br>
               <p class="fonts-size" id="xin">${requestScope.house.floorType}</p> <br>
               <p class="fonts-size" id="zu">${requestScope.house.rentWay}</p> <br>
               <p class="fonts-size" id="shi">看房时间：随时看房</p> <br>
               <p class="fonts-size" id="qu">区域： <a href="#" id="area">${requestScope.house.area}</a> </p>
  </div>


            <div class="div2">
                <img src="${requestScope.house.sImg}" class="tu" id="slaesmanImg">
               <h2 id="slaesmanName">${requestScope.house.name}</h2>
                <p class="d-xl-inline">我是房源信息维护人 &nbsp; 房源信息由我维护</p>
                <br>

                 <input class="sub1" img src="../../img/submit1.png" type="submit" value="在线咨询">
                 <input class="sub2" img src="../../img/submit2.png" type="submit" value="拨打电话">




            </div>



            
            
            

			</span>
    </div>
    <div>
        <%--<a href="/AddApplyServlet?houseId=${requestScope.house.id}"></a>--%>
        <button id="btn1" class="login2" type="button"></button>

        <button id="btn2" class="login1" type="button">返回</button>
    </div>
</div>

<%--<div id="comment" style="width: 900px;position: absolute;top: 600px; left: 100px;">
    <input type="text" style="width: 700px;margin-left: 40px" id="commentText"  class="blue" placeholder="对此房评价" height="15">
    <input type="button" value="发表评论" style="margin-left: 20px;width: 100px" id="btnComment" class="button">
    <br><br><br>
    <ul>
        <c:forEach items="${requestScope.page.data}" var="list">
            <li style="display: inline-block;font-size: 15px;"><img class="pic-header"
                                                                    src="../img/pic-header.png"><strong>${list.userName}:</strong>
            </li>
            <li style="display: inline-block; float: right">${list.time}</li>
            <br><br>
            <li>${list.content}</li>
            &lt;%&ndash;<li style="float: right"><a href="#">回复</a></li>&ndash;%&gt;
            <li>
                <hr>
            </li>
        </c:forEach>
    </ul>

</div>--%>

</body>
</html>