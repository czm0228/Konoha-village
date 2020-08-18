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

    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="../../../js/bootstrap-3.3.7-dist/js/bootstrap.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>



<%-- <script src="../../../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>--%>

    <style type="text/css">
        .img-span {
            float: left;
            margin: 28px 20px 20px 20px;
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
            right: -50px;
            top: 173px;

        }

        #shi {

            position: absolute;
            right: -114px;
            top: 205px;

        }

        #zu {
            position: absolute;
            top: 205px;
        }

        #qu {
            position: absolute;
            top: 235px;
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
            right: -70px;
            top: 360px;
        }

        .sub1 {

            position: absolute;
            top: 430px;
            position: absolute;
            right: -50px;

        }

        .sub2 {
            position: absolute;
            top: 430px;
            position: absolute;
            right: -190px;
        }

        .tu {
            margin-top: 20px;
            width: 40%;
            height: 65%;
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

        .button:hover {background-color: #00bfff}

        .button:active {
            background-color: #00bfff;
            box-shadow: 0 5px #666;
            transform: translateY(4px);
        }
        .blue{
            border: 1px solid #ccc;
            padding: 7px 0px;
            border-radius: 3px;
            padding-left:5px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s
        }
        .blue:focus{
            border-color: #66afe9;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)
        }

        .yi{
            position: relative;
            left: -50px;
        }
        #slaesmanName{
            position:absolute;
            right: -35px;
            top: 300px;
        }

        #houseImg{
            position: relative;
            top: 25px;


        }


    </style>

    <script type="text/javascript">

        $(function () {
            $.ajax({
                url: "/queryHouseDetails",
                data: {"houseId":${param.id}},
                success: function (result) {
                    /*console.log(result)*/
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
                var userId = "${sessionScope.user.id}";
                var falg = false;

                    //查询用户信用度
                    $.ajax({
                        url: "/queryCreditLine",
                        type: "post",
                        async: false,
                        data: {"userName": username},
                        success: function (result) {
                            if(result=="" || result==null){
                                alert("您还没有登录，请登陆后再申请看房！！")
                                falg = true;
                            }else {
                            if (result.creditLine < 50) {
                                alert("对不起!,你的信用度不足")
                                falg = true;
                            }
                            }

                        }
                    })


                    if (!falg) {
                        $.ajax({
                            url: "/queryApply",
                            data: {"houseId":${param.id}, "userId": userId},
                            success: function (result) {
                                var houseId =${param.id};
                                var userId = "${sessionScope.user.id}";
                                if (houseId == result.houseId && userId == result.userId) {

                                    alert("你已申请看房！")

                                } else {
                                    window.location.href = "/applyForLook?houseId=" +${param.id};
                                }
                            }
                        })
                    }

            })


            $("#btn2").click(function () {
                window.history.go(-1);
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
        <p>当前位置>房屋列表>房屋详情页 </p>
    </div>

    <div >
			<span class="img-span"> <img alt="${requestScope.house.address}"
                                         src="${requestScope.house.img}" width="600px" height="400px" id="houseImg">
			</span>
        <span class="img-span" id="img-span"> <br>

           <div class="yi">
				<p>价格:<span class="font" id="price">${requestScope.house.price}</span> <span class="fonts">元/月</span></p> <br>


                  <table border="0" cellpadding="0" cellspacing="0" style="width: 600px;border-collapse: collapse;">
             <tr>
               <td style="height: 80px;border-collapse: collapse;">
                   <p class="big" id="houseType">${requestScope.house.houseType}</p>
                      <p class="xiao" id="hierarchy">${requestScope.house.hierarchy}/${requestScope.house.numberPlies}层</p>
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

               <p class="fonts-size" >小区：<a href="#" id="plot">${requestScope.house.plot}</a></p> <br>
               <p class="fonts-size" id="xin">${requestScope.house.floorType}</p> <br>
               <p class="fonts-size" id="zu">${requestScope.house.rentWay}</p> <br>
               <p class="fonts-size" id="shi">看房时间：随时看房</p> <br>
               <p class="fonts-size" id="qu">区域： <a href="#" id="area">${requestScope.house.area}</a> </p>
  </div>


            <div class="div2">
                <img src="${requestScope.house.sImg}" class="tu" id="slaesmanImg">
               <h2 id="slaesmanName">${requestScope.house.name}</h2>
                <p class="d-xl-inline">我是房源信息维护人
                   </p>
                <br>
                </div>

         <%--<input class="sub1" img src="../../img/submit1.png" type="submit" value="在线咨询">--%>


       <button  type="submit" class="btn btn-info  sub1" style="height: 35px" style="width: 130px">
         <span class=" glyphicon glyphicon-comment" aria-hidden="true"></span>  在线咨询</button>



       <button  type="submit" class="btn btn-warning  sub2" style="height: 35px" style="width: 130px">
         <span class=" glyphicon glyphicon-earphone" aria-hidden="true"></span>  拨打电话</button>

</div>









			</span>
    </div>
    <div>
        <%--<a href="/AddApplyServlet?houseId=${requestScope.house.id}"></a>--%>


            <button  type="button" class="btn btn-info" id="btn1"style="height: 35px" style="width: 130px">
               </button>


            <button  type="button" class="btn btn-info"  id="btn2" style="height: 35px" style="width: 130px">
                返回</button>
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