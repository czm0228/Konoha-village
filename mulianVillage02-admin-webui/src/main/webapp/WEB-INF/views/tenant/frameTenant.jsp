<%--
  Created by IntelliJ IDEA.
  User: 陈志明
  Date: 2020/7/4
  Time: 17:34
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
<script type="text/javascript">



</script>

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
                <div class="welcome">${sessionScope.user.userName},您好 !</div>
                <a class="exit" title="退出" href="/login">退出</a>
               <%-- <p class="last-login">上次登录时间 ：<span class="login-time">2015.02.04 08:20:12</span></p>--%>
            </div>
            <a class="nav-notice-management nav" title="通知公告管理" href="javascript:;"  target="content"><img class="icon" src="../../img/icon-infor.png">通知公告管理</a>
            <a class="nav-information-submit nav" title="房源信息" href="javascript:;"><img class="icon" src="../img/icon-infor.png">房源信息<img class="nav-down" src="../../img/nav-down.png"></a>
            <ul class="submenu hide">
                <li>
                    <a title="房源列表" href="/houseList" target="content"><img class="icon-sub" src="../../img/icon-infor.png">房源列表</a>
                </li>
                <li>
                    <a title="人气好房" href="/PopularServlet" target="content"><img class="icon-sub" src="../../img/icon-infor.png">人气好房</a>
                </li>
                <li>
                    <a title="帮你挑" href="/HelpMe" target="content" target="content"><img class="icon-sub" src="../../img/icon-infor.png">帮你挑</a>
                </li>

                <!--<li>
                    <a title="添加房源" href="javascript:;" ><img class="icon-sub" src="../img/icon-infor.png">添加房源</a>
                </li>-->
            </ul>


            <a class="nav-statistical-reports nav" title="租赁信息" href="javascript:;"><img class="icon" src="../../img/icon-statistical.png">租赁信息<img class="nav-down" src="../../img/nav-down.png"></a>
            <ul class="submenu hide">
                <li>
                    <a title="待租赁列表" href="/LeaseServlet?userId=${sessionScope.user.id}" target="content"><img class="icon-sub" src="../../img/icon-infor.png">待租赁列表</a>
                </li>
                <li>
                    <a title="我的租赁" href="javascript:;"><img class="icon-sub" src="../../img/icon-infor.png">我的租赁</a>
                </li>
                <li>
                    <a title="已退租列表" href="javascript:;"><img class="icon-sub" src="../../img/icon-infor.png">已退租列表</a>
                </li>

            </ul>

            <a class="nav-data-maintenance nav" title="我的申请" href="javascript:;"><img class="icon" src="../../img/icon-maintenance.png">我的申请<img class="nav-down" src="../../img/nav-down.png"></a>
            <ul class="submenu hide">
                <li>
                    <a title="看房申请列表" href="/myApplyFor" target="content"><img class="icon-sub" src="../../img/icon-infor.png">看房申请列表</a>
                </li>
                <li>
                    <a title="待看列表" href="/ForTheLease?userId=${sessionScope.user.id}" target="content"><img class="icon-sub" src="../../img/icon-infor.png">待看列表</a>
                </li>
                <li>
                    <a title="退租申请列表" href="javascript:;"><img class="icon-sub" src="../../img/icon-infor.png">退租申请列表</a>
                </li>
            </ul>

            <a class="nav-parameter-configuration nav" title="租金信息" href="javascript:;"><img class="icon" src="../../img/icon-configuration.png">租金信息<img class="nav-down" src="../../img/nav-down.png"></a>
            <ul class="submenu hide">
                <li>
                    <a title="待缴租金" href="javascript:;"><img class="icon-sub" src="../../img/icon-infor.png">待缴租金</a>
                </li>
                <li>
                    <a title="已缴租金" href="javascript:;"><img class="icon-sub" src="../../img/icon-infor.png">已缴租金</a>
                </li>
            </ul>



            <a class="nav-the-contract nav" title="合同信息" href="javascript:;"><img class="icon" src="../../img/icon-infor.png">合同信息<img class="nav-down" src="../../img/nav-down.png"></a>
            <ul class="submenu hide">
                <li>
                    <a title="合同信息" href="/ContractInformation?userId=${sessionScope.user.id}" target="content"><img class="icon-sub" src="../../img/icon-infor.png">合同信息</a>
                </li>
            </ul>

            <a class="nav-other-operating nav" title="其他操作" href="javascript:;"><img class="icon" src="../../img/icon-configuration.png">其他操作<img class="nav-down" src="../../img/nav-down.png"></a>
            <ul class="submenu hide">
                <li>
                    <a title="账户管理" href="javascript:;"><img class="icon-sub" src="../../img/icon-infor.png">账户管理</a>
                </li>
                <li>
                    <a title="账号绑定" href="javascript:;"><img class="icon-sub" src="../../img/icon-infor.png">账号绑定</a>
                </li>
                <li>
                    <a title="修改密码" href="./tenant/changePassword.jsp" target="content"><img class="icon-sub" src="../../img/icon-infor.png">修改密码</a>
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

