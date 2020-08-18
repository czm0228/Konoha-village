<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>jQuery滑动星星评分代码 - 站长素材</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">

<script src="${pageContext.request.contextPath}/js/jquery.js"></script>

</head>
<body>

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
<script>
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
            alert('评分：'+(starRating.toFixed(1)+'分'))
        })
        //取消评分
        $('.cancleStar').on('click',function () {
            starRating = 0;
            $('.photo span').find('.high').css('z-index',0);
            $('.starNum').html(starRating.toFixed(1)+'分');
        })
        //确定评分
        $('.sureStar').on('click',function () {
            if(starRating===0) {
                alert('最低一颗星！');
            } else {
               alert('评分：'+(starRating.toFixed(1)+'分'))
            }
        })
    })
</script>

</body>
</html>