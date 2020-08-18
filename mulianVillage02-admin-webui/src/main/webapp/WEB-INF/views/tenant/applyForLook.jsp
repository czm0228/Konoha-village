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
    <script type="text/javascript" src="../../../js/jquery-1.9.1.min.js"></script>
    <script src="../../../js/jquery.min.js"></script>


    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="../../../js/bootstrap-3.3.7-dist/js/bootstrap.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>




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

        input[type="reset"], input[type="submit"] {
            margin: 10px 30px;
            position: absolute;
            right: 540px;
        }



        .w {
            position: absolute;
            right: 630px;
        }

        .mytxt{
            position: absolute;
            right: 454px;
        }
        .s {
            position: absolute;
            top: 225px;
            right: 450px;
        }

        .t{
            position: absolute;
            right: 580px;
            top: 225px;
        }

        #enterPassword {

            position: absolute;

            right: 454px;
        }
        .user{
            background-image: url(../../../img/user.png);/*设置小图标*/

            background-size: 20px 20px;/*小图标的大小*/

            background-position: 135px 4px;/*小图标在input的位置*/

            background-repeat: no-repeat;/*背景小图标不重复*/

            padding: 20px 8px 8px 40px;/*设置input内边距*/
        }
        .shouji{
            background-image: url(../../../img/shouji.png);/*设置小图标*/

            background-size: 20px 20px;/*小图标的大小*/

            background-position: 135px 4px;/*小图标在input的位置*/

            background-repeat: no-repeat;/*背景小图标不重复*/

            padding: 20px 8px 8px 40px;/*设置input内边距*/
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
                    $.ajax({
                        url:"/saveApply",
                        data:{"userId":${sessionScope.user.id},"houseId":${param.houseId},"userName":name,"phone":phone,"datetime":data},
                        success:function (result) {
                            if(result){
                                alert("申请成功!")
                                window.location.href="/houseList";
                            }else {
                                alert("申请失败!")
                            }
                        }
                    })
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
            <p class="w">姓名:</p>
            <input class="mytxt  form-control  user " type="text"  name="userName" id="oldPassword" style="width: 170px"> <br/><br/>
            <p class="w">手机号码:</p> <input class="mytxt  form-control  shouji" type="text" name="phone" id="newPassword" style="width: 170px"><br/><br/>
            <p class="w" id="i">申请日期:</p><input class="mytxt form-control  date" type="date" name="date" id="enterPassword"  style="width: 170px" >
            <br/><br/>
            <%--<input type="hidden" name="houseId" value="${requestScope.houseId}">
            <input type="hidden" name="userId" value="${sessionScope.user.id}">--%>

            <button   type="button"  class="btn btn-info  s" style="height: 35px " style="width: 130px" id="submit">
                <span class="glyphicon glyphicon-ok" aria-hidden="true"></span> 提交</button>


            <button   type="button" class=" btn btn-info   t" style="height: 35px" style="width: 130px" id="return">
                <span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>返回</button>


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