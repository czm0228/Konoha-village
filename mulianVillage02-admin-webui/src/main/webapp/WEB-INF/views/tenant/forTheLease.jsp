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
    <script type="text/javascript" src="../../../js/birthday.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>
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


            $.ms_DatePicker({
                YearSelector: ".sel_year",
                MonthSelector: ".sel_month",
                DaySelector: ".sel_day"
            });
            $.ms_DatePicker();




            var year=getUrlParam("year");
            var month=getUrlParam("month");
            var day=getUrlParam("day");
            var rentWay=getUrlParam("rentWay");
            var search=getUrlParam("search");
            if(year == "" || year==null && month=="" || month==null && day=="" || day==null && rentWay=="" || rentWay==null&& search=="" || search==null){
                queryMyApply(0,0,0,"","");
            }


           $("#queryMyapplyfor").click(function () {
               var year=$("#sel_year").val();
             var month=$("#sel_month").val();
             var day=$("#sel_day").val();
             var rentWay=$("#address").val();
               var search=$("#Ktext").val();
             queryMyApply(year,month,day,rentWay,search);
               // 调用专门的函数初始化分页导航条
               initPagination();
           })

            // 调用专门的函数初始化分页导航条
            initPagination();
        })


        // 生成页码导航条的函数
        function initPagination() {
            var year=$("#sel_year").val();
            var month=$("#sel_month").val();
            var day=$("#sel_day").val();
            var rentWay=$("#address").val();
            var search=$("#Ktext").val();
            $.ajax({
                url:"/queryToLookAt",
                data: {"userId":${sessionScope.user.id},"year":year,"month":month,"day":day,"rentWay":rentWay,"search":search},
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
            var year=$("#sel_year").val();
            var month=$("#sel_month").val();
            var day=$("#sel_day").val();
            var rentWay=$("#address").val();
            var search=$("#Ktext").val();
            queryMyApply(year,month,day,rentWay,search,pageNum);

            // 由于每一个页码按钮都是超链接，所以在这个函数最后取消超链接的默认行为
            return false;
        }



         /*查询申请*/
         function queryMyApply(year,month,day,rentWay,search,pageNum) {
             var i = 1;
             $.ajax({
                 url: "/queryToLookAt",
                 data: {"userId":${sessionScope.user.id},"year":year,"month":month,"day":day,"rentWay":rentWay,"search":search,"pageNum":pageNum},
                 success: function (result) {
                    /* console.log(result)*/
                     if(result == null || result == undefined || result.list == null || result.list.length == 0){

                         $("#rolePageBody1").hide();
                         $("#rolePageBody2").show();
                         $("tbody").empty();
                         return false;
                     }
                     var str = "";

                     $(result.list).each(function () {
                         str += "<tr>" +
                             "<td>" + i + "</td>" +
                             "<td>" + this.house.address + "</td>" +
                             "<td>" + this.house.rentWay + "</td>" +
                             "<td>" + this.datetime + "</td>" +
                             "<td>"+
                             "<button class='btn btn-primary search_btn edit' type='button' onclick='toSee("+this.id+",this)'>已看</button>" +
                             "<button class='btn btn-primary search_btn edit' type='button' onclick='particulars("+this.houseId+")'>详情</button>" +
                             "</td>" +
                                 "</tr>";

                         i++;
                     })
                     $("#rolePageBody1").show();
                     $("#rolePageBody2").hide();
                     $("tbody").empty().append(str);
                 }

             })
         }

         /*已看单击事件*/
         function toSee(id,obj) {
             /*alert($(obj).parents("tbody").children().length==1)*/
             var userId = "${sessionScope.user.id}";
             if(confirm("确定已看房吗!")){
                 $.ajax({
                     url:"/toSeeHouse",
                     data:{"id":id,"userId":userId},
                     success:function (result) {
                        $(obj).parents("tr").remove();
                     }
                 })
                 if($(obj).parents("tbody").children().length==1){
                    /* alert("123")*/
                     $("#rolePageBody1").hide();
                     $("#rolePageBody2").show();
                 }
             }
         }

         /*详情单击事件*/
         function  particulars(houseId) {
             window.location.href="/housingDetails?id="+houseId;
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
</head>
<body>

<div class="box">
    <div class="content">
        <form >
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
                &nbsp; &nbsp; &nbsp; &nbsp;<select id="sel_year" class="required" name="year"></select>年
                &nbsp; &nbsp; &nbsp; &nbsp; <select id="sel_month" class="required" name="month"></select>月
                &nbsp; &nbsp; &nbsp; &nbsp; <select id="sel_day" class="required" name="day"></select>日
                &nbsp; &nbsp; &nbsp; &nbsp;类型:<select name="state" id="address" class="required">
                <option value="">--</option>
                <option value="合租">合租</option>
                <option value="整租">整租</option>
            </select>

                </select>

                <input id="Ktext" type="text" name="search" class="form-control" placeholder="请输入查询的内容">
                <input type="button" value="查询" id="queryMyapplyfor" class="btn btn-primary search_btn" style="position: absolute;top: -5px; right: 20px; width: 100px;">
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
            <th>类型</th>
            <th>申请看房日期</th>
            <th>操作</th>
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