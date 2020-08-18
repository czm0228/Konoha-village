<%--
  Created by IntelliJ IDEA.
  User: 陈志明
  Date: 2020/8/17
  Time: 12:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../../../css/style.css">
    <link rel="stylesheet" type="text/css" href="../../../css/bootstrap.min.css">
    <%--<link rel="stylesheet" type="text/css" href="../../css/jquery.selectlist.css">--%>
    <script src="../../../js/jquery.min.js"></script>
    <script src="../../../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="../../../js/bootbox.min.js"></script>
    <script src="../../../js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="../../../js/jquery.js"></script>
    <script type="text/javascript" src="../../../js/birthday.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
</head>
<style>
    .comment {
        width: 700px;
        margin: 200px auto 0px auto;
    }

    .comment-text-area {
        width: 700px;
    }

    .text-area {
        width: 680px;
        max-width: 680px;
        max-height: 150px;
        border: 5px #ebebeb solid;
        height: 150px;
        overflow: hidden;
        padding: 5px 5px 5px 5px;
        color: #999999;
    }

    .text-area-input-length {
        font-size: 12px;
        line-height: 30px;
    }

    .text-area-input-length span {
        margin: 0px 5px 0px 5px;
        color: red;
    }

    .text-area-bottom {
        text-align: right;
        margin: 5px 0px 0px 0px;
        float: right;
        padding: 0px 0px 0px 0px;
    }

    .text-area-bottom a {
        border: #ebebeb 2px solid;
        padding: 10px 20px 10px 20px;
        text-decoration: none;
        color: #000000;
        font-size: 14px;
    }

    .text-area-star {
        overflow: hidden;
        text-align: center;
    }

    .text-area-star label {
        float: left;
        line-height: 35px;
        height: 35px;
        font-size: 12px;
        margin: 0px 10px 10px 0px;
        padding: 0px 5px 0px 5px;
        cursor: pointer;
        border: 1px solid #ebebeb;
    }

    .red {
        color: red;
        border: 1px solid red !important;
    }

    .text-area-star label input {
        filter: alpha(opacity=0);
        -moz-opacity: 0;
        opacity: 0;
        position: absolute;
    }

    .text-area-star label span {
        padding: 10px 10px 10px 10px;
        position: relative;
    }
</style>
<body>
<script type="text/javascript">
    $(function () {
//评分
        var starRating = 0;
        $('.photo span').on('mouseenter',function () {
            var index = $(this).index()+1;
            $(this).prevAll().find('.high').css('z-index',1)
            $(this).find('.high').css('z-index',1)
            $(this).nextAll().find('.high').css('z-index',0)
            $('.starNum').html((index*2).toFixed(1)+'分')
        })
        $('.photo').on('mouseleave',function () {
            $(this).find('.high').css('z-index',0)
            var count = starRating / 2
            if(count == 5) {
                $('.photo span').find('.high').css('z-index',1);
            } else {
                $('.photo span').eq(count).prevAll().find('.high').css('z-index',1);
            }
            $('.starNum').html(starRating.toFixed(1)+'分')
        })
        $('.photo span').on('click',function () {
            var index = $(this).index()+1;
            $(this).prevAll().find('.high').css('z-index',1)
            $(this).find('.high').css('z-index',1)
            starRating = index*2;
            $('.starNum').html(starRating.toFixed(1)+'分');
            /*alert('评分：'+(starRating.toFixed(1)+'分'))*/
        })
       /* //取消评分
        $('.cancleStar').on('click',function () {
            starRating = 0;
            $('.photo span').find('.high').css('z-index',0);
            $('.starNum').html(starRating.toFixed(1)+'分');
        })
        //确定评分
        $('.sureStar').on('click',function () {
            if(starRating===0) {
                alert('最低一颗星！');
            }
               /!* alert('评分：'+(starRating.toFixed(1)+'分'))*!/

        })*/
   /*--------------------------------------------------------------*/

        $('.text-area-input').click(function () {
            if ($(this).val() == '请输入评论内容......') {
                $(this).css({
                    color: '#000000'
                }).val('')
            }
        });

        //离开的时候
        $('.text-area-input').blur(function () {
            var iNum = $(this).val().length;
            var fixedLength = 50;//固定长度
            if (iNum < fixedLength) {
                $('.text-area-input-length span').html(fixedLength - iNum);
            } else {
                $(this).val($(this).val().substr(0, fixedLength - 1));//截取长度
                $('.text-area-input-length span').html(iNum - fixedLength);
            }
        });

        //按下的时候
        $('.text-area-input').keydown(function () {
            var iNum = $(this).val().length;
            var fixedLength = 50;//固定长度
            if (iNum < fixedLength) {
                $('.text-area-input-length span').html(fixedLength - iNum);
            } else {
                $(this).val($(this).val().substr(0, fixedLength - 1));//截取长度
                $('.text-area-input-length span').html(iNum - fixedLength);
            }
        });

        //判断是否在前面加0
        function getNow(s) {
            return s < 10 ? '0' + s : s;
        }

        var myDate = new Date();

        var year = myDate.getFullYear();        //获取当前年
        var month = myDate.getMonth() + 1;   //获取当前月
        var date = myDate.getDate();            //获取当前日


        var h = myDate.getHours();              //获取当前小时数(0-23)
        var m = myDate.getMinutes();          //获取当前分钟数(0-59)
        var s = myDate.getSeconds();

        var now = year + '-' + getNow(month) + "-" + getNow(date) + " " + getNow(h) + ':' + getNow(m) + ":" + getNow(s);


        $('.text-area-bottom a').click(function () {
            var star = $('input[name=star]:checked').val();
            var content = $('textarea[name=content]').val();
            if (content== '请输入评论内容......'||content==""){
                alert("评论不能为空!")
                return false;
            }
            if(starRating===0) {
                alert('最低一颗星！');
                return false;
            }
            /*alert(now)
            alert(content);
            alert('评分：'+(starRating.toFixed(1)+'分'))*/
            $.ajax({
                url:"/addHouseCommentSalesman",
                data:{"grade":starRating.toFixed(1),"time":now,"comment":content,"houseId":${param.houseId},"userId":${sessionScope.user.id},"aid":${param.id}},
                success:function (result) {
                    if(result){
                        alert("评论成功!")
                        window.location.href="/haveToSee";
                    }else {
                        alert("评论失败!")
                    }
                }
            })
        });

        $('.text-area-star label').click(function () {
            var labelLength = $('.text-area-star label').length;
            for (var i = 0; i < labelLength; i++) {
                if (this == $('.text-area-star label').get(i)) {
                    $('.text-area-star label').eq(i).addClass('red');
                } else {
                    $('.text-area-star label').eq(i).removeClass('red');
                }
            }
        });


    });
</script>
<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
    <h3>对业务员和房源评论可获得5积分</h3>

</div>

<div class="comment">
    <div class="comment-level"></div>
    <div class="comment-text-area">
        <div id="starRating">
            <p class="photo" style="display: inline-block" >
                <span><i class="high"></i><i class="nohigh"></i></span>
                <span><i class="high"></i><i class="nohigh"></i></span>
                <span><i class="high"></i><i class="nohigh"></i></span>
                <span><i class="high"></i><i class="nohigh"></i></span>
                <span><i class="high"></i><i class="nohigh"></i></span>
            </p>
            <p class="starNum" style="display: inline-block">0.0分</p>
            <%--   <div class="bottoms">
                   <a class="garyBtn cancleStar">取消评分</a><a class="blueBtn sureStar">确认</a>
               </div>--%>
        </div>
        <div><textarea class="text-area text-area-input" name="content">请输入评论内容......</textarea></div>
        <div class="text-area-input-length">您还可输入<span>50</span>个字</div>
        <div ><a href="javascript:void(0);" onclick="window.history.go(-1)">返回</a></div>
        <div class="text-area-bottom"><a href="javascript:void(0);">提交数据</a></div>
    </div>
</div>

</body>
</html>
