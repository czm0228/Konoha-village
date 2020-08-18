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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="../../../js/bootstrap-3.3.7-dist/js/bootstrap.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


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

            /*查询价格*/
            $.ajax({
                url: "/getHousePrice",
                success: function (result) {
                    /*console.log(result)*/
                    var str = "<option value='0'>全部</option>";
                    $(result).each(function () {
                        str += "<option value='" + this.id + "'>" + this.price + "</option>";
                    })
                    $("#price").append(str);
                }

            })

            /*查询面积*/
            $.ajax({
                url: "/getHouseSquareMeter",
                success: function (result) {
                    /*console.log(result)*/
                    var str = "<option value='0'>全部</option>";
                    $(result).each(function () {
                        str += "<option value='" + this.id + "'>" + this.squareMeter + "</option>";
                    })
                    $("#area").append(str);
                }

            })

            /*查询区域*/
            $.ajax({
                url: "/getArea",
                success: function (result) {
                    /*console.log(result)*/
                    var str = "<option value='0'>全部</option>";
                    $(result).each(function () {
                        str += "<option value='" + this.id + "'>" + this.district + "</option>";
                    })
                    $("#region").append(str);
                }

            })

            /*查询地铁*/
            $.ajax({
                url: "/getHouseMetro",
                success: function (result) {
                    /*console.log(result)*/
                    var str = "<option value='0'>全部</option>";
                    $(result).each(function () {
                        str += "<option value='" + this.id + "'>" + this.metro + "</option>";
                    })
                    $("#address").append(str);
                }

            })


            /*加载页面 查询全部房源*/
            var priceId = getUrlParam("priceId");
            var squareMeterId = getUrlParam("squareMeterId");
            var metroId = getUrlParam("metroId");
            var areaId = getUrlParam("areaId");
            var search = getUrlParam("search");

            if (priceId == null || priceId == "" && squareMeterId == null || squareMeterId == "" &&
                metroId == null || metroId == "" && areaId == null || areaId == "" && search == null || search) {
                queryHouseList(priceId, squareMeterId, metroId, areaId, search);
            }

            /*单击查询按钮时时 模糊查询*/
            $("#queryHouse").click(function () {
                var priceId = $("#price").val();
                var squareMeterId = $("#area").val();
                var metroId = $("#address").val();
                var areaId = $("#region").val();
                var search = $("#Ktext").val();
               /* alert(priceId+" "+squareMeterId+" "+metroId+" "+areaId+" "+search)*/
                queryHouseList(priceId, squareMeterId, metroId, areaId, search);
                // 调用专门的函数初始化分页导航条
                initPagination();
            })

           // 调用专门的函数初始化分页导航条
            initPagination();
        })



        // 生成页码导航条的函数
        function initPagination() {

            var priceId = $("#price").val();
            var squareMeterId = $("#area").val();
            var metroId = $("#address").val();
            var areaId = $("#region").val();
            var search = $("#Ktext").val();

         $.ajax({
             url:"/queryHouseList",
             data:{
                 "priceId": priceId,
                 "squareMeterId": squareMeterId,
                 "metroId": metroId,
                 "areaId": areaId,
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
            //调用queryHouseList()；
            var priceId = $("#price").val();
            var squareMeterId = $("#area").val();
            var metroId = $("#address").val();
            var areaId = $("#region").val();
            var search = $("#Ktext").val();
            /* alert(priceId+" "+squareMeterId+" "+metroId+" "+areaId+" "+search)*/
            queryHouseList(priceId, squareMeterId, metroId, areaId, search,pageNum);
            // 由于每一个页码按钮都是超链接，所以在这个函数最后取消超链接的默认行为
            return false;
        }





        /*查询房源*/
        function queryHouseList(priceId, squareMeterId, metroId, areaId, search,pageNum) {
            $.ajax({
                url: "/queryHouseList",
                data: {
                    "priceId": priceId,
                    "squareMeterId": squareMeterId,
                    "metroId": metroId,
                    "areaId": areaId,
                    "search": search,
                    "pageNum":pageNum
                },
                success: function (result) {
                    /*console.log(result)*/

//                       if(result == null || result == undefined || result.list == null || result.list.length == 0){
//                           $("tbody").empty();
//                           $("#rolePageBody").empty().append("<td colspan='4' align='center'>抱歉！没有查询到您搜索的数据！</td>");
//                           return false;
//                       }

                    if(result == null || result == undefined || result.list == null || result.list.length == 0){

                        $("#rolePageBody1").hide();
                        $("#rolePageBody2").show();
                        $("tbody").empty();
                        return false;
                    }
                        var str = "";
                        $(result.list).each(function () {
                            str += "<tr>" +
                                "<td style='overflow:hidden'>" + this.id + "</td>" +
                                "<td style='max-width:400px'><img src='" + this.img + "' id='img-span'></td>" +
                                "<td>" + this.price + "元</td>" +
                                "<td>" + this.squareMeter + "m²</td>" +
                                "<td>" + this.status + "</td>" +
                                "<td>" +
                                "<button class='btn btn-info  cha'  type='button' style='font-size: 14px' onclick='queryHouse("+this.id+")'>查看</button>" +
                                "</td>" +
                                "</tr>"
                        })
                        $("#rolePageBody1").show();
                        $("#rolePageBody2").hide();
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

        .cha{
            height: 33px;
            width: 68px;

        }
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
            top: -40px;

        }

        .required {
            width: 100px;
            height: 30px;
        }

        .result-title h1 {
        / position: absolute;
            top: -20px;
            color: #BFBFBF;
            font-size: 15px;
        }

        #rolePageBody1{
            position: fixed;
            left: 480px;
            bottom:0px;
            border-bottom:0px hidden;
        }

        #ktext{
            position: relative;
            top:-32px;
        }
        #queryHouse{
            position: relative;
            bottom: 1px;
        }

        /*====================================*/


    </style>

</head>
<body>
<%--<div class="result-title">
    <h1>当前位置>房屋列表</h1>
</div>--%>
<div class="box">
    <div class="content">
        <form action="#" method="post">
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
                &nbsp; &nbsp; &nbsp; &nbsp;房屋价格:<select name="price" id="price" class="required">
            </select>
                &nbsp; &nbsp; &nbsp; &nbsp;房屋面积:<select name="squareMeter" id="area" class="required">
            </select>
                &nbsp; &nbsp; &nbsp; &nbsp; 地铁线路:<select name="metro" id="address" class="required">
            </select>
                &nbsp; &nbsp; &nbsp; &nbsp; 地区:<select name="region" id="region" class="required">
            </select>
                <input id="Ktext" type="text" name="search" class="form-control" placeholder="请输入查询的内容" style="height:31px ">

               <button id="queryHouse"  type="button" class="btn btn-info"   style=" font-size: 14px; position: absolute;top: -5px; right:20px; width: 100px; height: 33px ">
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;查询 &nbsp;</button>
            </div>
        </form>
    </div>

    <!--添加按钮及bootstrap的模态框-->

    <!--表格列表-->
    <table id="tb" class="table">
        <thead>
        <tr>
            <th>序号</th>
            <th>图片</th>
            <th>价格</th>
            <th>面积</th>
            <th>状态</th>
            <th colspan="2">操作</th>
        </tr>
        </thead>

        <tbody id="show_tbody">
        </tbody>
        <tfoot align="center">

        <tr>
            <td colspan="6" align="center" id="rolePageBody1">
                <div id="Pagination" class="pagination" style="margin: 0px auto"><!-- 这里显示分页 --></div>
            </td>
            <td id="rolePageBody2" colspan="6"  align="center">
                <div style="margin: 0px auto">抱歉没有你查找的内容</div>
            </td>
        </tr>

        </tfoot>
    </table>


</div>

</body>
</html>