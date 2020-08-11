<%--
  Created by IntelliJ IDEA.
  User: 陈志明
  Date: 2020/7/3
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
    <link rel="stylesheet" type="text/css" href="../../../css/style.css">

    <link rel="stylesheet" type="text/css" href="../../../css/bootstrap.min.css">
    <%--<link rel="stylesheet" type="text/css" href="../../css/jquery.selectlist.css">--%>
    <script src="../../../js/jquery.min.js"></script>
    <script src="../../../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="../../../js/bootbox.min.js"></script>
    <script type="text/javascript" src="../../../js/jquery-1.8.3.js"></script>


    <style type="text/css">
        #show_tbody td {
            font-size: 15px;
            vertical-align: middle
        }

        .content {
            height: 200px;
            position: relative;
            top: -40px;
        }

        .result-title h1 {
        / position: absolute;
            top: -20px;
            color: #BFBFBF;
            font-size: 15px;
        }

        /* 这开始*/
        ---
        input[type="reset"], input[type="submit"] {
            margin: 10px 30px;
            background-color: darkorange;
            color: white;
            padding: 5px;
            height: 45px;
            width: 80px;
            border: 0;
            position: absolute;
            right: 540px;
        }

        input[type="reset"], input[type="submit"]:hover {
            cursor: pointer;
            border-color: royalblue;
        }

        input[type="reset"], input[type="button"] {
            margin: 10px 30px;
            background-color: darkorange;
            color: white;
            padding: 5px;
            height: 45px;
            width: 80px;
            border: 0;
            position: absolute;
            right: 430px;
        }

        input[type="reset"], input[type="button"]:hover {
            cursor: pointer;
            border-color: royalblue;
        }

        .mytxt {
            color: #333;
            line-height: normal;
            font-family: "Microsoft YaHei", Tahoma, Verdana, SimSun;
            font-style: normal;
            font-variant: normal;
            font-size-adjust: none;
            font-stretch: normal;
            font-weight: normal;
            margin-top: 0px;
            margin-bottom: 0px;
            margin-left: 0px;
            padding-top: 4px;
            padding-right: 4px;
            padding-bottom: 4px;
            padding-left: 4px;
            font-size: 15px;
            outline-width: medium;
            outline-style: none;
            outline-color: invert;
            border-top-left-radius: 3px;
            border-top-right-radius: 3px;
            border-bottom-left-radius: 3px;
            border-bottom-right-radius: 3px;
            text-shadow: 0px 1px 2px #fff;
            background-attachment: scroll;
            background-repeat: repeat-x;
            background-position-x: left;
            background-position-y: top;
            background-size: auto;
            background-origin: padding-box;
            background-clip: border-box;
            background-color: rgb(255, 255, 255);
            margin-right: 8px;
            border-top-color: #ccc;
            border-right-color: #ccc;
            border-bottom-color: #ccc;
            border-left-color: #ccc;
            border-top-width: 1px;
            border-right-width: 1px;
            border-bottom-width: 1px;
            border-left-width: 1px;
            border-top-style: solid;
            border-right-style: solid;
            border-bottom-style: solid;
            border-left-style: solid;
        }

        .mytxt:focus {
            border: 1px solid red;
            -webkit-box-shadow: 0px 0px 6px red;
            -moz-box-shadow: 0px 0px 5px red;
            box-shadow: 0px 0px 5px red;

        }

        .mytxt {
            border-color: black;
            border-width: 1px;
        }

        .w {
            position: absolute;
            right: 630px;
        }

        .mytxt {
            position: absolute;

            right: 450px;
        }

        .s {
            position: absolute;
            right: 480px;
        }

        #enterPassword {

            position: absolute;

            right: 454px;
        }

        /* 这结束*/

    </style>


    <script type="text/javascript">

        $(function () {


            $("#return").click(function () {
                history.go(-1);
            })

            $("#submit").click(function () {
                var name = $("#oldPassword").val();
                var phone = $("#newPassword").val();
                var data = $("#enterPassword").val();
                if (name == null || name == "") {
                    alert("姓名不能为空!")
                } else if (!(/^0?(13[0-9]|15[012356789]|17[013678]|18[0-9]|14[57])[0-9]{8}$/.test(phone))) {
                    alert("手机号码有误，请重填")
                } else if (data == null || data == "") {
                    alert("日期不能为空!")
                }else {
                    alert("申请成功!")
                }

            })


            //得到当前时间
            var date_now = new Date();
            //得到当前年份
            var year = date_now.getFullYear();
            //得到当前月份
            //注：
            //  1：js中获取Date中的month时，会比当前月份少一个月，所以这里需要先加一
            //  2: 判断当前月份是否小于10，如果小于，那么就在月份的前面加一个 '0' ， 如果大于，就显示当前月份
            var month = date_now.getMonth() + 1 < 10 ? "0" + (date_now.getMonth() + 1) : (date_now.getMonth() + 1);
            //得到当前日子（多少号）
            var date = date_now.getDate() < 10 ? "0" + date_now.getDate() : date_now.getDate();
            //设置input标签的max属性
            $("#enterPassword").attr("min", year + "-" + month + "-" + date);


        })

    </script>


</head>
<body>
<%--<div class="result-title">
    <h1>当前位置>房屋列表</h1>
</div>--%>

<div class="box">
    <div class="content">
        <form action="/QueryServlet" method="post"></form>
        <!--搜索输入框及查询、重置按钮-->
        <div class="container content_width">

            <div class="person_search">
                <div class="search_input">
                    <div class="input-group mb-3">

                    </div>
                </div>
            </div>
        </div>

        <!--添加按钮及bootstrap的模态框-->

        <!--表格列表-->

        <form>
            <p class="w">姓名:</p> <input class="mytxt" type="text" name="userName" id="oldPassword" style="width: 170px"
                                        > <br/><br/>
            <p class="w">手机号码:</p> <input class="mytxt" type="text" name="phone" id="newPassword" style="width: 170px"
                                          ><br/><br/>
            <p class="w" id="i">申请日期:</p> <input class="mytxt" type="date" name="date" id="enterPassword">
            <br/><br/>
            <%--<input type="hidden" name="houseId" value="${requestScope.houseId}">
            <input type="hidden" name="userId" value="${sessionScope.user.id}">--%>
            <input class="s" type="submit" value="提交" id="submit">
            <input class="s" type="button" value="返回" id="return">
        </form>

    </div>


</div>
</body>
<%--<script type="text/javascript">
    $(function () {
        alert("123456")
        $("#tijiao").click(function () {

            var count =${requestScope.i};
            if(count!=0){
                alert("修改成功!")
            }
        })
    })

</script>--%>
</html>