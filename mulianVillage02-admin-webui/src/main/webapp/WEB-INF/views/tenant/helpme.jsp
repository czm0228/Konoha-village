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
    <link rel="stylesheet" href="../../../css/pagination.css">
    <script type="text/javascript" src="../../../js/jquery.pagination.js"></script>
    <script type="text/javascript">

        $(function () {

            /*查询好评度*/
            $.ajax({
                url:"/getFavorable",
                type:"post",
                success:function (result) {
                    console.log(result)
                    var str = "<option value='0'>全部</option>";
                    $(result).each(function () {
                        str += "<option value='" + this.favorableId + "'>" + this.favorableText + "</option>";
                    })
                    $("#favorable1").append(str);
                }
            })

            /*查询年龄*/
            $.ajax({
                url:"/getAge",
                type:"post",
                success:function (result) {
                    console.log(result)
                    var str = "<option value='0'>全部</option>";
                    $(result).each(function () {
                        str += "<option value='" + this.ageId + "'>" + this.ageText + "</option>";
                    })
                    $("#age1").append(str);
                }
            })

            /*查询全部业务员*/
            var ageId = getUrlParam("ageId");
            var sex = getUrlParam("sex");
            var favorableId = getUrlParam("favorableId");
            var search = getUrlParam("search");

            if (ageId == null || ageId == "" && sex == null || sex == "" &&
                favorableId == null || favorableId == "" && search == null || search) {
                querySalesman(ageId, sex, favorableId, search);
            }




            /*单继查询按钮时执行模糊查询*/
            $("#search_btn").click(function () {
                var ageId = $("#age1").val();
                var sex = $("#sex1").val();
                var favorableId = $("#favorable1").val();
                var search = $("#Ktext").val();
                querySalesman(ageId,sex,favorableId,search)
                // 调用专门的函数初始化分页导航条
                initPagination();
            })
// 调用专门的函数初始化分页导航条
            initPagination();
        })

        // 生成页码导航条的函数
        function initPagination() {

            var ageId = $("#age1").val();
            var sex = $("#sex1").val();
            var favorableId = $("#favorable1").val();
            var search = $("#Ktext").val();

            $.ajax({
                url:"/querySalesman",
                data:{
                    "ageId": ageId,
                    "sex": sex,
                    "favorableId": favorableId,
                    "search": search,
                },
                success:function (result) {
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
            //调用
            var ageId = $("#age1").val();
            var sex = $("#sex1").val();
            var favorableId = $("#favorable1").val();
            var search = $("#Ktext").val();

            querySalesman(ageId,sex,favorableId,search,pageNum)

            // 由于每一个页码按钮都是超链接，所以在这个函数最后取消超链接的默认行为
            return false;
        }

        function xuan() {
            alert("选择成功，请等待业务员联系")
        }

        function querySalesman( ageId, sex, favorableId, search, pageNum) {
            $.ajax({
                url:"/querySalesman",
                type:"post",
                data:{
                    "ageId":ageId,
                    "sex":sex,
                    "favorableId":favorableId,
                    "search":search,
                    "pageNum":pageNum
                },
                success:function (result) {
                    console.log(result)
                    var str = "";
                    $(result.list).each(function () {
                        if (this.sex==0){
                            this.sex="男"
                        }else if(this.sex){
                            this.sex="女"
                        }
                        str += "<tr>" +
                            "<td>" + this.id + "</td>" +
                            "<td><img src='" + this.img + "' id='img-span'></td>" +
                            "<td>" + this.name + "</td>" +
                            "<td>" + this.sex + "</td>" +
                            "<td>" + this.age + "</td>" +
                            "<td>" + this.favorable + "</td>" +
                            "<td>" +
                            "<button class='btn btn-primary search_btn' type='button' onclick='xuan()'>选他</button>" +
                            "</td>" +
                            "</tr>"
                    })
                    $("tbody").empty().append(str);

                }
            })

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
            width: 140px;
            height: 30px;
        }

        .result-title h1 {
        / position: absolute;
            top: -20px;
            color: #BFBFBF;
            font-size: 15px;
        }
    </style>

</head>
<body>
<%--<div class="result-title">
    <h1>当前位置>房屋列表</h1>
</div>--%>
<div class="box">
    <div class="content">
        <form>
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
                &nbsp; &nbsp; &nbsp; &nbsp;好评率:<select name="favorable" id="favorable1" class="required">

            </select>
                &nbsp; &nbsp; &nbsp; &nbsp;性别:<select name="sex" id="sex1" class="required">
                <option value="2">全部</option>
                <option value="0">男</option>
                <option value="1">女</option>

            </select>
                &nbsp; &nbsp; &nbsp; &nbsp; 年龄:<select name="age" id="age1" class="required">
            </select>
                <input id="Ktext" type="text" name="search" class="form-control" placeholder="请输入查询的内容">
                <input type="button" id="search_btn" value="查询" class="btn btn-primary search_btn"
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
            <th>图片</th>
            <th>姓名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>好评率</th>
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

</body>

</html>