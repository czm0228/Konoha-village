<%--
  Created by IntelliJ IDEA.
  User: 陈志明
  Date: 2020/7/6
  Time: 13:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>木葉村房屋租赁管理系统</title>
    <link rel="stylesheet" href="../../css/reset.css">
    <link rel="stylesheet" href="../../css/frame.css">
    <!-- <link rel="stylesheet" href="../css/flyui.css"> -->
    <!--     <link rel="stylesheet" type="text/css" href="../css/notice-manage.css"> -->
    <link rel="stylesheet" type="text/css" href="../../js/plugins/My97DatePicker/skin/whyGreen/datepicker.css">
</head>

<body>
<div class="container">
    <img class="background" src="../../img/bg.jpg">
    <!-- 头部 begin -->
    <div class="header"><img src="../../img/logo.png" id="logo" alt="logo" title="logo"/>    <span id="spanTitle">木葉村房屋租赁管理系统</span></div>


    <div class="main">
        <!-- 侧栏 begin -->
        <div class="sidebar">
            <div class="login">
                <img class="pic-header" src="../../img/pic-header.png">
                <div class="welcome">游客,您好 !</div>
                <a class="exit" title="登录" href="/login">登录</a>
            </div>

            <a class="nav-information-submit nav" title="房源信息" href="/houseList" target="content"><img class="icon" src="../../img/icon-infor.png">房源信息<img class="nav-down" src="../../img/nav-down.png"></a>

            <a class="nav-information-submit nav" title="人气好房" href="/PopularServlet" target="content"><img class="icon" src="../../img/icon-statistical.png">人气好房<img class="nav-down" src="../../img/nav-down.png"></a>

            <a class="nav-statistical-reports nav" title="帮你挑" href="/HelpMe" target="content"><img class="icon" src="../../img/icon-statistical.png">帮你挑<img class="nav-down" src="../../img/nav-down.png"></a>

            <%--<a class="nav-data-maintenance nav" title="帮你租" href="javascript:;"><img class="icon" src="../img/icon-maintenance.png">帮你租<img class="nav-down" src="../img/nav-down.png"></a>--%>
        </div>
        <!-- Iframe begin -->
        <div class="frame">
            <div class="frame-bg">
                <img src="../../img/frame-bg.png">
                <!--  iframe的内容开始 -->
                <p class="system-management">房屋租赁管理系统</p>
                <div class="frame-container clearfix">
                    <!--  <iframe src="../html/notice-manage.html" name="content" scrolling="yes" frameborder="no"></iframe>-->
                    <iframe  name="content" scrolling="yes" frameborder="no" src="/houseList"></iframe>
                </div>
            </div>
            <p class="footer">&copy;木葉村项目组</p>
        </div>
    </div>
    <div class="clear"></div>
</div>
</div>
<script src="../../js/plugins/config.js"></script>
<script src="../../js/plugins/require.js" data-main="../../../js/apps/service/frame"></script>
</body>

</html>

