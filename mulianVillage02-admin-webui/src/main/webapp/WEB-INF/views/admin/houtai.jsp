<%--
  Created by IntelliJ IDEA.
  User: yanghao
  Date: 2020/7/6
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>木葉村房屋租赁后台管理系统</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/frame.css">
    <!-- <link rel="stylesheet" href="../css/flyui.css"> -->
    <!--     <link rel="stylesheet" type="text/css" href="../css/notice-manage.css"> -->
    <link rel="stylesheet" type="text/css" href="../js/plugins/My97DatePicker/skin/whyGreen/datepicker.css">
</head>

<body>
<div class="container">
    <img class="background" src="../img/bg.jpg">
    <!-- 头部 begin -->
    <div class="header"><img src="../img/logo.png" id="logo" alt="logo" title="logo"/>    <span id="spanTitle">木葉村房屋租赁后台管理系统</span></div>


    <div class="main">
        <!-- 侧栏 begin -->
        <div class="sidebar">
            <div class="login">
                <img class="pic-header" src="../img/pic-header.png">
                <div class="welcome">管理，您好 !</div>
                <a class="exit" title="退出" href="/login">退出</a>
                <p class="last-login">上次登录时间 ：<span class="login-time">2015.02.04 08:20:12</span></p>
            </div>
            <a class="nav-notice-management nav" title="首页"  target="content"><img class="icon" src="../img/icon-infor.png">首页</a>
            <a class="nav-information-submit nav" title="会员信息" href="javascript:;"><img class="icon" src="../img/icon-infor.png">会员信息<img class="nav-down" src="../img/nav-down.png"></a>
            <ul class="submenu hide">
                <li>
                    <a title="租客信息" href="/ListUserServet" target="content"><img class="icon-sub" src="../img/icon-infor.png">租客信息</a>
                </li>


            </ul>
            <a class="nav-information-submit nav" title="房源信息" href="javascript:;"><img class="icon" src="../img/icon-infor.png">房源信息<img class="nav-down" src="../img/nav-down.png"></a>
            <ul class="submenu hide">
                <li>
                    <a title="房源列表" href="/house" target="content"><img class="icon-sub" src="../img/icon-infor.png">房源列表</a>
                </li>
                <li>
                    <a title="添加房源" href="/addHouse" ><img class="icon-sub" src="../img/icon-infor.png">添加房源</a>
                </li>

            </ul>
            <a class="nav-information-submit nav" title="评论管理" href="javascript:;"><img class="icon" src="../img/icon-infor.png">评论管理<img class="nav-down" src="../img/nav-down.png"></a>
            <ul class="submenu hide">
                <li>
                    <a title="评论信息" href="/CommentAllServlet" target="content"><img class="icon-sub" src="../img/icon-infor.png">评论信息</a>
                </li>
            </ul>






            <a class="nav-parameter-configuration nav" title="租金信息" href="javascript:;"><img class="icon" src="../img/icon-configuration.png">租金管理<img class="nav-down" src="../img/nav-down.png"></a>
            <ul class="submenu hide">

                <li>
                    <a title="已缴租金" href="javascript:;"><img class="icon-sub" src="../img/icon-infor.png">租金信息</a>
                </li>
            </ul>
            <a class="nav-parameter-configuration nav" title="申请信息" href="javascript:;"><img class="icon" src="../img/icon-configuration.png">申请信息<img class="nav-down" src="../img/nav-down.png"></a>
            <ul class="submenu hide">
                <li>
                    <a title="申请看房" href="/ApplyforManageServlet" target="content"> <img class="icon-sub" src="../img/icon-infor.png">看房申请</a>
                </li>
                <li>
                    <a title="待看房" href="/ApplyWaitLookServlet" target="content"> <img class="icon-sub" src="../img/icon-infor.png">待看房</a>
                </li>
                <li>
                    <a title="已处理申请" href="/processedServlet" target="content"><img class="icon-sub" src="../img/icon-infor.png">已处理列表</a>
                </li>
            </ul>
            <a class="nav-statistical-reports nav" title="租赁信息" href="javascript:;"><img class="icon" src="../img/icon-statistical.png">合同管理<img class="nav-down" src="../img/nav-down.png"></a>
            <ul class="submenu hide">
                <li>
                    <a title="租赁列表" href="/ConServlet" target="content"><img class="icon-sub" src="../img/icon-infor.png">合同审核</a>
                </li>
            </ul>

            <a class="nav-other-operating nav" title="其他操作" href="javascript:;"><img class="icon" src="../img/icon-configuration.png">其他操作<img class="nav-down" src="../img/nav-down.png"></a>
            <ul class="submenu hide">
                <li>
                    <a title="员工管理" href="../html/tenant/yuangong.html"  target="content"><img class="icon-sub" src="../img/icon-infor.png">员工管理</a>
                </li>
            </ul>
        </div>
        <!-- Iframe begin -->
        <div class="frame">
            <div class="frame-bg">
                <img src="../img/frame-bg.png">
                <!--  iframe的内容开始 -->
                <p class="system-management">房屋租赁管理系统</p>
                <div class="frame-container clearfix">
                    <!--  <iframe src="../html/notice-manage.html" name="content" scrolling="yes" frameborder="no"></iframe>-->
                    <iframe  name="content" scrolling="yes" frameborder="no"></iframe>
                </div>
            </div>
            <p class="footer">&copy;木葉村项目组</p>
        </div>
    </div>
    <div class="clear"></div>
</div>
</div>
<script src="../js/plugins/config.js"></script>
<script src="../js/plugins/require.js" data-main="../js/apps/service/frame"></script>
</body>

</html>
