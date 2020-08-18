<%--
  Created by IntelliJ IDEA.
  User: helloworld
  Date: 2020/8/10
  Time: 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/srcipt/docs.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/srcipt/jquery-2.1.1.min.js"></script>

    <script type="text/javascript">
        $(function () {
            $("#btn2").click(function () {
                window.history.back();
            })
        })
    </script>
</head>
<body>
<div class="container" style="text-align: center;">

    <h3>系统信息页面</h3>
    <h4>${requestScope.exception.message }</h4>
    <c:if test="${requestScope.exception.message =='请登录以后再访问！'}">
    <button style="width: 300px;margin: 0px auto 0px auto;" id="btn1" class="btn btn-lg btn-success btn-block" onclick="window.location.href='/login'">去登陆页面</button>
    </c:if>
    <c:if test="${requestScope.exception.message !='请登录以后再访问！'}">
    <button style="width: 300px;margin: 0px auto 0px auto;" id="btn2" class="btn btn-lg btn-success btn-block">返回刚才页面</button>
    </c:if>
</div>
</body>
</html>
