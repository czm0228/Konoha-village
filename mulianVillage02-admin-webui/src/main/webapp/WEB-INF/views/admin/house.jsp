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
    <link rel="stylesheet" type="text/css" href="../../../css/style.css">

    <link rel="stylesheet" type="text/css" href="../../../css/bootstrap.min.css">
    <%--<link rel="stylesheet" type="text/css" href="../../css/jquery.selectlist.css">--%>
    <script src="../../../js/jquery.min.js"></script>
    <script src="../../../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="../../../js/bootbox.min.js"></script>
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
                queryHouseList(priceId, squareMeterId, metroId, areaId, search);

            })
        })

        /*查询房源*/
        function queryHouseList(priceId, squareMeterId, metroId, areaId, search) {
            $.ajax({
                url: "/queryHouseList",
                data: {
                    "priceId": priceId,
                    "squareMeterId": squareMeterId,
                    "metroId": metroId,
                    "areaId": areaId,
                    "search": search
                },
                success: function (result) {
                    console.log(result)
                    var str = "";
                    $(result).each(function () {
                        str += "<tr>" +
                            "<td>" + this.id + "</td>" +
                            "<td><img src='" + this.img + "' id='img-span'></td>" +
                            "<td>" + this.price + "元</td>" +
                            "<td>" + this.squareMeter + "m²</td>" +
                            "<td>" + this.status + "</td>" +
                            "<td>" +
                            " <button class='btn btn-primary search_btn' type='button'>查看</button>" +
                            "</td>" +
                            "<td>" +
                            " <button class='btn btn-primary search_btn' type='button' id='updataBtn' onclick='getHouseById("+this.id+")''>修改</button>" +
                            "</td>" +
                            "<td>" +
                            " <button class='btn btn-primary search_btn' type='button' id='delBtn' onclick='delHouse("+this.id+",this)'>删除</button>" +
                            "</td>" +
                            "</tr>"
                    })
                    $("tbody").empty().append(str);
                }
            })
        }
        
        function getHouseById(houseId) {

            window.location.href="/updaHouse?houseId="+houseId;

        }

        function delHouse(id,obj) {

            if (confirm("你确定要删除此房源吗?")){
                $.ajax({
                    url:"/delHouse",
                    data:{"id":id},
                    type:"post",
                    success:function (result) {
                        /*alert("1235346")*/
                       /* console.log(result)*/
                        if (result){
                            alert("删除成功")
                            $(obj).parents("tr").remove();
                        }else {
                            alert("删除失败")
                        }
                    }
                })
            }

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
            width: 100px;
            height: 30px;
        }

        .result-title h1 {
        / position: absolute;
            top: -20px;
            color: #BFBFBF;
            font-size: 15px;
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
                <input id="Ktext" type="text" name="search" class="form-control" placeholder="请输入查询的内容">

                <input type="button" value="查询" id="queryHouse" class="btn btn-primary search_btn"
                       style="position: absolute;top: -5px; right: 130px; width: 100px;">

                <input type="button" value="增加房源" id="addBtn" onclick="window.location.href='addHouse1'" class="btn btn-primary search_btn"
                       style="position: absolute;top: -5px; right: 20px; width: 100px;">
            </div>
        </form>
    </div>

    <!--添加按钮及bootstrap的模态框-->

    <!--表格列表-->
    <table id="tb" class="table">
        <thead>
        <tr>
            <th>序列号</th>
            <th>图片</th>
            <th>价格</th>
            <th>面积</th>
            <th>状态</th>
            <th colspan="3">操作</th>
        </tr>
        </thead>

        <tbody id="show_tbody">
        </tbody>
    </table>

</div>

</body>
</html>