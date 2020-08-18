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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <%--<link rel="stylesheet" type="text/css" href="../../css/jquery.selectlist.css">--%>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/bootbox.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>
    <script type="text/javascript">

        $(function () {

            moodsHouse();

            // 调用专门的函数初始化分页导航条
            initPagination();
        })

        // 生成页码导航条的函数
        function initPagination() {
            $.ajax({
                url:"/moodsHouse",
                success:function (result) {
                    console.log(result)
                    // 获取总记录数
                    var totalRecord = result.total;

                    // 声明一个JSON对象存储Pagination要设置的属性
                    var properties = {
                        num_edge_entries: 3,								// 边缘页数
                        num_display_entries: 5,								// 主体页数
                        callback: pageSelectCallback,						// 指定用户点击“翻页”的按钮时跳转页面的回调函数
                        items_per_page: result.pageSize,	// 每页要显示的数据的数量
                        current_page: result.pageNum - 1,	// Pagination内部使用pageIndex来管理页码，pageIndex从0开始，pageNum从1开始，所以要减一
                        prev_text: "上一页",									// 上一页按钮上显示的文本
                        next_text: "下一页"									// 下一页按钮上显示的文本
                    };

                    // 生成页码导航条
                    $("#Pagination").pagination(totalRecord, properties);
                }

            })

        }

        // 回调函数的含义：声明出来以后不是自己调用，而是交给系统或框架调用
        // 用户点击“上一页、下一页、1、2、3……”这样的页码时调用这个函数实现页面跳转
        // pageIndex是Pagination传给我们的那个“从0开始”的页码
        function pageSelectCallback(pageIndex, jQuery) {

            // 根据pageIndex计算得到pageNum
            var pageNum = pageIndex + 1;

            // 跳转页面
            moodsHouse(pageNum);

            // 由于每一个页码按钮都是超链接，所以在这个函数最后取消超链接的默认行为
            return false;
        }

        function moodsHouse(pageNum) {

            $.ajax({
                url: "/moodsHouse",
                type: "post",
                data: { "pageNum":pageNum},
                success: function (result) {

/*                    alert(result)*/
                    console.log(result)

                    var str = "";
                    $(result.list).each(function () {
                        str += "<tr>" +
                            "<td>" + this.id + "</td>" +
                            "<td><img src='" + this.img + "' id='img-span'></td>" +
                            "<td>" + this.price + "元</td>" +
                            "<td>" + this.squareMeter + "m²</td>" +
                            "<td>" + this.thumbUpFor + "</td>" +
                            "<td>" + this.status + "</td>" +
                            "<td>" +
                            "<button class='btn btn-primary search_btn' type='button' onclick='queryHouse("+this.id+")'>查看</button>" +
                            "</td>" +
                            "</tr>"
                    })
                    $("tbody").empty().append(str);

                }

            })
        }

        /*查看房源信息*/
        function  queryHouse(id) {
            /* var userId="";*/<%--${sessionScope.user.id}--%>
            /*alert(id+" "+userId);*/
            window.location.href="/housingDetails?id="+id;
        }


        //获取地址栏参数,可以是中文参数
        function getUrlParam(key) {
            // 获取参数
            var url = window.location.search;
            //localhost:8080/doc?name=zhangsan&password=abc123
            // 正则筛选地址栏
            var reg = new RegExp("(^|&)" + key + "=([^&]*)(&|$)");
            // 匹配目标参数
            var result = url.substr(1).match(reg);
            //返回参数值
            return result ? decodeURIComponent(result[2]) : null;
        }

    </script>


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

        .table {
            position: relative;
            top: -130px;
        }


        .result-title h1{
            /position: absolute;
            top: -20px;
            color:  #BFBFBF;
            font-size: 15px;
        }

        /*logo*/
        #logo{
            width: 140px;
            height: 60px;
            margin-top: 35px;
        }
        /*logo说明*/
        #logo_state{
            font-size: 30px;
            color: deepskyblue;
            left: 100px;
            padding-left: 325px;
            font-weight: 700;
            position: absolute;
            top:40px;
        }

    </style>

</head>
<body>

<div class="result-title">
    <h1>当前位置>房屋列表</h1>
</div>
<div class="box">
    <div class="content">

        <%--顶部样式--%>

        <%--logo--%>

        <div><img id="logo" src="${pageContext.request.contextPath}/img/logo.png"> <span id="logo_state">优质好房，人气推荐</span></div>


    </div>

    <!--添加按钮及bootstrap的模态框-->

    <!--表格列表-->
    <!--表格列表-->
    <table id="tb" class="table">
        <thead>
        <tr>
            <th>序列号</th>
            <th>图片</th>
            <th>价格</th>
            <th>面积</th>
            <th>点赞数</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        </thead>

        <tbody id="show_tbody">
        </tbody>
        <tfoot>
        <tr>
            <td colspan="6" align="center">
                <div id="Pagination" class="pagination"><!-- 这里显示分页 --></div>
            </td>
        </tr>

        </tfoot>
    </table>
</div>


<%--
<script src="../../js/mejs.js"></script>
<script src="../../js/jquery-1.9.1.min.js"></script>
<script src="../../js/jquery.selectlist.js"></script>
--%>

</body>
</html>