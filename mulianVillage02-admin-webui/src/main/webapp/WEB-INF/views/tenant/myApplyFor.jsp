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
    <script src="../../../js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="../../../js/jquery.js"></script>
    <style type="text/css">
        #show_tbody td {
            font-size: 15px;
            vertical-align: middle
        }

        .form-control {
            width: 200px;
            position: relative;
            top: -34px;
            left: 720px;
        }

        #sub {

            position: absolute;
            top: 52px;
            right: 38px;

        }

        .content {
            height: 200px;
            position: relative;
            top: -40px;
        }

        .table {
            position: relative;
            top: -130px;
        }

        #select-div2 {
            padding-left: 10px;
            font-size: small;
            position: relative;
            right: 0px;
            top: -25px;

        }

        .required {
            width: 120px;
            height: 30px;
        }

        .result-title h1 {
        / position: absolute;
            top: -20px;
            color: #BFBFBF;
            font-size: 15px;
        }
    </style>

    <script type="text/javascript">

        $(function () {


            $.ajax({

                url: "/queryMyApply",
                data: {"userId":${sessionScope.user.id}},
                success: function (result) {
                    var str = "";
                    var i = 1;
                    $(result).each(function () {
                        str += "<tr>" +
                            "<td>" + i + "</td>" +
                            "<td>" + this.house.address + "</td>" +
                            "<td>" + this.state + "</td>" +
                            "<td>" + this.datetime + "</td>" +
                            "<td>";
                        if (this.state == "已同意" || this.state == "已申请") {
                            str += "<button class='btn btn-primary search_btn' type='button' onclick='close("+this.id+")'>取消申请</button>" +
                                "</td>" +
                                "</tr>";
                        } else if (this.state == "不同意") {
                            str += "<button class='btn btn-primary search_btn' type='button' disabled>未同意</button>" +
                                "</td>" +
                                "</tr>";
                        } else if (this.state == "已看房") {
                            str += "<button class='btn btn-primary search_btn' type='button' disabled>已看房</button>" +
                                "</td>" +
                                "</tr>";
                        } else if (this.state == "已取消") {
                            str += "<button class='btn btn-primary search_btn' type='button' disabled>已取消</button>" +
                                "</td>" +
                                "</tr>";
                        } else if (this.state == "已完成") {
                            str += "<button class='btn btn-primary search_btn' type='button' disabled>已完成</button>" +
                                "</td>" +
                                "</tr>";
                        }

                        i++;
                    })
                    $("tbody").empty().append(str);
                }

            })

            function close(applyId) {
                alert(applyId)
            }

        })

    </script>
</head>
<body>
<%--<div class="result-title">
    <h1>当前位置>房屋列表</h1>
</div>--%>
<div class="box">
    <div class="content">
        <form action="/MyApplyForServlet?userId=${sessionScope.user.id}" method="post">
            <!--搜索输入框及查询、重置按钮-->
            <div class="container content_width">

                <div class="person_search">
                    <div class="search_input">
                        <div class="input-group mb-3">

                        </div>
                    </div>
                </div>
            </div>
            <div id="select-div2">
                <%--<input type="date"> 至 <input type="date">--%>
                状态:<select name="state" id="address" class="required">
                <option value="全部">--</option>
                <option value="已申请">已申请</option>
                <option value="已取消">已取消</option>
                <option value="已同意">已同意</option>
            </select>

                <input id="Ktext" type="text" name="search" class="form-control" placeholder="请输入查询的内容">
                <input type="submit" value="查询" class="btn btn-primary search_btn"
                       style="position: absolute;top: -5px; right: 20px; width: 100px;">
            </div>
            <%--<div class="line"></div>--%>
    </div>
    </from>
    <!--添加按钮及bootstrap的模态框-->

    <!--表格列表-->
    <table id="tb" class="table">
        <thead>
        <tr>
            <th>序列号</th>
            <th>房屋地址</th>
            <th>状态</th>
            <th>申请看房日期</th>
            <th>操作</th>
        </tr>
        </thead>

        <tbody id="show_tbody">
        <%
            int i = 1;
            request.setAttribute("i", i);
        %>
        <c:forEach items="${requestScope.list}" var="list">
            <tr>
                <td>${requestScope.i}</td>
                <td>${list.house.address}</td>
                <td>${list.state}</td>
                <td>${list.datetime}</td>
                <c:choose>
                    <c:when test="${list.state=='已申请' || list.state=='已同意'}">
                        <td>
                            <a href="/WithdrawServlet?userId=${sessionScope.user.id}&houseId=${list.houseId}&state=${list.state}"
                               class="edit">
                                <button class="btn btn-primary search_btn" type="button">取消申请</button>
                            </a>
                        </td>
                    </c:when>
                    <c:when test="${list.state=='不同意'}">
                        <td>
                            <button class="btn btn-primary search_btn" type="button" disabled>未同意</button>
                        </td>
                    </c:when>
                    <c:when test="${list.state=='已看房'}">
                        <td>
                            <a href="#" class="edit1">
                                <button class="btn btn-primary search_btn" type="button" disabled>已看房</button>
                            </a>
                        </td>
                    </c:when>
                    <c:when test="${list.state=='已取消'}">
                        <td>
                            <a href="#" class="edit2">
                                <button class="btn btn-primary search_btn" type="button" disabled>已取消</button>
                            </a>
                        </td>
                    </c:when>
                    <c:when test="${list.state=='已完成'}">
                        <td>
                            <a href="#" class="edit2">
                                <button class="btn btn-primary search_btn" type="button" disabled>已完成</button>
                            </a>
                        </td>
                    </c:when>
                </c:choose>

            </tr>
            <% i++;
                request.setAttribute("i", i);
            %>
        </c:forEach>
        <!-- <a href="#" class="edit">编辑</a>
         <a href="#" class="del">删除</a>-->
        </tbody>
    </table>
</div>


<%--
<script src="../../js/mejs.js"></script>
<script src="../../js/jquery-1.9.1.min.js"></script>
<script src="../../js/jquery.selectlist.js"></script>
--%>
<script type="text/javascript" src="./js/birthday.js"></script>
<script type="text/javascript">
    $(function () {
        $(".edit").click(function () {
            if (!confirm("取消申请将会减少你的信用度，确定取消吗？")) {
                return false;
            }
        })

        $.ms_DatePicker({
            YearSelector: ".sel_year",
            MonthSelector: ".sel_month",
            DaySelector: ".sel_day"
        });
        $.ms_DatePicker();
    })

</script>

</body>
</html>