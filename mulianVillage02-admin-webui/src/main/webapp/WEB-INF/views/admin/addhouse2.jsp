<%--
  Created by IntelliJ IDEA.
  User: yanghao
  Date: 2020/8/15
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <script type="text/javascript" src='//webapi.amap.com/maps?v=2.0&key=04a1d0ae22a6b8f61a02da93bd7972f2'></script>
    <script type="text/javascript" src="../../js/jquery-1.8.3.js"></script>

    <!-- UI组件库 1.0 -->
    <script src="//webapi.amap.com/ui/1.1/main.js?v=1.1.1"></script>
    <script type="text/javascript">
        alert("请先在地图标注房屋地址")

        var lat,lng
        AMapUI.loadUI(['misc/PositionPicker','misc/PoiPicker'], function(PositionPicker,PoiPicker) {
            var map = new AMap.Map('container', {
                zoom:18,
                scrollWheel: false
            });
            var poiPicker = new PoiPicker({
                input: 'search',
                placeSearchOptions: {
                    map: map,
                    pageSize: 6 //关联搜索分页
                }

            });



            // 搜索选址

            poiPicker.on('poiPicked', function(poiResult) {
                poiPicker.hideSearchResults();

                lat=poiResult.item.location.lat

                lng=poiResult.item.location.lng

                $('.poi .nearpoi').text(poiResult.item.name)
                $("#position .nearpoi1").text(poiResult.item.location.lng)

                $("#location .location1").text(positionResult.location.lat)
                $('.address .info').text(poiResult.item.address)


                map.panTo([lng,lat]);
            });
            function onComplete(data) {
                $('#address').val(data.formattedAddress)
                $('.address .info').text(data.formattedAddress)
            }
            //解析定位错误信息
            function onError(data) {
                $('.address .info').text('定位失败！');
            }
            var positionPicker = new PositionPicker({
                mode: 'dragMap',
                map: map
            });

            // 拖拽选址

            positionPicker.on('success', function(positionResult) {
                $('.poi .nearpoi').text(positionResult.nearestPOI)
                $('.address .info').text(positionResult.address)
                $("#position .nearpoi1").text(positionResult.position.lng)
                $("#location .location1").text(positionResult.position.lat)


            });
            positionPicker.on('fail', function(positionResult) {
                $('.poi .nearpoi').text('')
                $('.address .info').text('')
                $("#position .nearpoi").text('')
                $("#location .location1").text('')
            });
            var onModeChange = function(e) {
                positionPicker.setMode(e.target.value)
            }
            positionPicker.start();
            map.panBy(0, 1);
            map.addControl(new AMap.ToolBar({
                liteStyle: true
            }))
        });
        $(function () {
            $("#enter").click(function () {
                var lng = $("#position .nearpoi1").text();//$("#position .nearpoi").text(poiResult.item.location)
                var lat = $("#location .location1").text();
                var address= $('.address .info').text();
                window.location.href="/addHouse?lng="+lng+"&lat="+lat+"&address="+address;
                alert(lng+"-->"+lat+address);
            })
        })



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
        body {
            height: 100%;
            margin: 0;
            width: 100%;
            padding: 0;
            overflow: hidden;
            font-size: 13px;
        }
        p{
            margin: 0;
            padding: 0;
        }
        #container{
            height:100vh;
            width: 100vw;
            margin: 0 auto;
        }
        #tip {
            background-color: #fff;
            padding-left: 3%;
            padding-right: 3%;
            position: fixed;
            left: 0;
            top: 0;
            width: 94%;
            line-height: 2.5rem;
            height: 2.5rem;
            border: none;
            border-bottom: 1px solid #eee;
            z-index: 19999;
        }
        #tip input{
            width: 85%;
            height: 2rem;
            line-height: 2rem;
            border: none;
            outline: none;
        }
        #tip span{
            width: 15%;
            text-align: center;
            height: 2.5rem;
            line-height: 2.5rem;
            color: #757575;
        }
        #addressDels{
            position: absolute;
            width: 100%;
            bottom: 0;
            left: 0;
            z-index: 9999;
            background: #fff;
            overflow: hidden;
            list-style: none;
            padding: 0;
            margin: 0;
        }
        #addressDels li{
            width: 100%;
            line-height: 2rem;
            height: 2rem;
        }
        #addressDels .poi span,.left span{
            display: block;
            float: left;
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background: #ea5413;
            line-height: 2rem;
            margin-top: calc(1rem - 4px);
            margin-top: -moz-calc(1rem - 4px);
            margin-top: -webkit-calc(1rem - 4px);
            margin-left: 3%;
            margin-right: 3%;
        }
        .left span{
            margin-left: 2.85vw;
            margin-right: 2.85vw;
        }
        #addressDels li p{
            line-height: 2rem;
            overflow: hidden;
            float: left;
        }
        #addressDels .poi{
            width: 100%;
            line-height: 2rem;
            height: 2rem;
        }
        .left{
            width: 80%;
            line-height: 2rem;
            overflow: hidden;
            float: left;
        }
        .left div,.poi div{
            width: 100%;
            line-height: 2rem;
            overflow: hidden;
        }
        .left .info{
            width: calc(100% - 5.7vw - 8px);
            width: -webkit-calc(100% - 5.7vw - 8px);
            width: -moz-calc(100% - 5.7vw - 8px);
        }
        #addressDels li a{
            display: block;
            float: right;
            margin-right: 2%;
            margin-left: 2%;
            width: 16%;
            height: 1.4rem;
            line-height: 1.4rem;
            background: #ea5413;
            color: #fff;
            text-align: center;
            border-radius: 5px;
            margin-top: 0.3rem;
            text-decoration: none;

        }
    </style>
</head>
<body>

<div id="container" class="map" tabindex="0"></div>
<div id='tip'>
    <input type="text" name="search" id="search" value="" placeholder="输入关键字搜索地址"/>
    <span>取消</span>
</div>
<ul id="addressDels">
    <li class="poi">
        <div>
            <span></span>
            <p class="nearpoi"></p>
        </div>
    </li>


    <li id="position"  hidden="hidden" >

        <div>
            <p class="nearpoi1"></p>
        </div>
    </li>
    <li id="location" hidden="hidden"  >

        <div>
            <p class="location1"></p>
        </div>
    </li>


    <li class="address">
        <div class="left">
            <div>
                <span></span>
                <p class="info"></p>
            </div>

        </div>
        <button type="button" id="enter">确定</button>
        <a onclick="window.history.back()">返回</a>

    </li>

</ul>
</body>
</html>

