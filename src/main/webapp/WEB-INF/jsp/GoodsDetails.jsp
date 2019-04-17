<%@ page language="java"  pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<%@ page import="entity.user.queryVo.GoodsCustom" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
    String path = request.getContextPath();
    String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<html>
<head>
    <meta charset="UTF-8">
    <title>${goodsDetails.goodName}立即购买-小艾商城</title>
    <link rel="stylesheet" type="text/css" href="http://localhost/css/style1.css">
    <script type="text/javascript" src="http://localhost/js/jquery3.3.1.min.js"></script>
</head>
<body>
<header>
    <div class="top center">
        <div class="left fl">
            <ul>
                <li><a href="${pageContext.request.contextPath}/user/ai" >小艾商城</a></li>
                <li>|</li>
                <li><a href="">MIUI</a></li>
                <li>|</li>
                <li><a href="">米聊</a></li>
                <li>|</li>
                <li><a href="">游戏</a></li>
                <li>|</li>
                <li><a href="">多看阅读</a></li>
                <li>|</li>
                <li><a href="">云服务</a></li>
                <li>|</li>
                <li><a href="">金融</a></li>
                <li>|</li>
                <li><a href="">小艾商城移动版</a></li>
                <li>|</li>
                <li><a href="">问题反馈</a></li>
                <li>|</li>
                <li><a href="">Select Region</a></li>
                <div class="clear"></div>
            </ul>
        </div>
        <div class="right fr">
            <div class="gouwuche fr">
                <a href="${pageContext.request.contextPath}/cart/myCart">购物车</a>
            </div>
            <div class="fr">
                <ul id="login">
                    <li><a href="${pageContext.request.contextPath}/user/login" >登录</a></li>
                    <li>|</li>
                    <li><a href="${pageContext.request.contextPath}/user/register" >注册</a></li>
                    <li>|</li>
                    <li><a href="${pageContext.request.contextPath}/user/Myself" >个人中心</a></li>

                </ul>
            </div>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>
</header>
<!--end header -->

<!-- start banner_x -->
<div class="banner_x center">
<%--    <a  href="${pageContext.request.contextPath}/user/ai" ><img float="left" width="62px" height="62px" src="http://localhost/images/mi/logoAi.png"></a>--%>
    <a  href="${pageContext.request.contextPath}/user/ai" ><div class="logo fl" ></div></a>
    <a href=""><div class="ad_top fl"></div></a>
    <div class="nav fl">
        <ul id="nav_list">
            <li><a >小米9</a></li>
            <li><a >iphone XR</a></li>
            <li><a >荣耀V20</a></li>
            <li><a >华为P30</a></li>
            <li><a >三星S10</a></li>
            <li><a >一加6T</a></li>
            <li><a >华为mate20</a></li>

        </ul>
    </div>
    <div class="search fr">
        <form  method="post">
            <div class="text fl">
                <input type="text" class="shuru" placeholder="小米9&nbsp;小米MIX现货">
            </div>
            <div class="submit fl">
                <input type="submit" class="sousuo" value="搜索" />
            </div>
            <div class="clear"></div>
        </form>
        <div class="clear"></div>
    </div>
</div>
<!-- end banner_x -->


<!-- xiangqing -->
<form action="post" method="">
    <div class="xiangqing">
        <div class="neirong w">
            <div class="xiaomi6 fl">${goodsDetails.goodName}</div>
            <nav class="fr">
                <li><a href="">概述</a></li>
                <li>|</li>
                <li><a href="">变焦双摄</a></li>
                <li>|</li>
                <li><a href="">设计</a></li>
                <li>|</li>
                <li><a href="">参数</a></li>
                <li>|</li>
                <li><a href="">F码通道</a></li>
                <li>|</li>
                <li><a href="">用户评价</a></li>
                <div class="clear"></div>
            </nav>
            <div class="clear"></div>
        </div>
    </div>

    <div class="jieshao mt20 w">
        <div class="left fl">
            <img id="goodsImg" src="${goodsDetails.pic}" width="562px" height="562px"/>
        </div>
        <div class="right fr">
            <div id="goodsName" class="h3 ml20 mt20">${goodsDetails.goodName}</div>
            <div class="jianjie mr40 ml20 mt10">${goodsDetails.detail}</div>
            <div class="jiage ml20 mt10">${goodsDetails.price}</div>
            <div class="xqxq mt20 ml20">
                <div class="bot mt20 ft20 ftbc">
                    总计：<span id="totalPrice">${goodsDetails.price}</span>元
                </div>
            </div>
            <div class="xiadan ml20 mt20">
                <input id="buyId" class="jrgwc" type="button" name="jrgwc" value="立即选购" />
                <input id="carId" class="jrgwc" type="button" name="jrgwc" value="加入购物车" />

            </div>
        </div>
        <div class="clear"></div>
    </div>
</form>
<!-- footer -->
<footer class="mt20 center">

    <div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select
        Region</div>
    <div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号
        京网文[2014]0059-0009号</div>
    <div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>

</footer>
<script>
    $('#nav_list').on('click','li',function(){
        $.ajax({
            type: 'post',
            async: false,
            timeout : 30000,
            url: '${pageContext.request.contextPath}/goods/middle',
            data: {
                goodName: $(this).text(),
            },
            success : function(data) {
                window.location.href = "${pageContext.request.contextPath}/goods/details?goodId="+data;
            },
            error : function() {
                alert("error");
            }

        })
    });
</script>

<script type="text/javascript">
    $("#carId").click(function() {
        $.ajax({
            type : "post",
            async: false,
            url : "${pageContext.request.contextPath}/cart/addCart",
            data : {
                goodId : ${goodsDetails.goodId},
                goodNum : 1
            },
            success : function(data) {
                if (data == "ok-cart") {
                    alert("已加入");
                } else {
                    alert("请先登录！\n" +
                        "现在为您跳转到登录页面");
                    window.location.href = "${pageContext.request.contextPath}/user/login";
                }
            },
            error : function() {
                alert("ajax错误")
            }
        })
    })
</script>
<%--现在购买--%>
<script type="text/javascript">
    $("#buyId").click(function() {
        $.ajax({
            type : "post",
            async: false,
           url : "${pageContext.request.contextPath}/order/buyNowMiddle",
            data : {
                goodId : ${goodsDetails.goodId},
                num : 1,
            },
            success : function(data) {
                 alert(data);
                window.location.href = "${pageContext.request.contextPath}/order/buyNow?orderId="+data;
            },
            error : function() {
                alert("ajax错误")
            }
        })
    })
</script>

</html>
