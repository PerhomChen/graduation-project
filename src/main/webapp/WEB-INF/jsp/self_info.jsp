<%@ page language="java"  pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
    String path = request.getContextPath();
    String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>小艾商城-个人中心</title>
    <link rel="stylesheet" type="text/css" href="http://localhost/css/style1.css">
    <script src="http://localhost/js/jquery3.3.1.min.js"></script>
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
            <div class="gouwuche fr"><a href="${pageContext.request.contextPath}/order/myOrder">我的订单</a></div>
            <div class="fr">
                <ul>
                    <li><a href="#top">个人中心</a></li>
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
    <a href="./index.html" target="_blank"><div class="logo fl"></div></a>
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
        <form action="" method="post">
            <div class="text fl">
                <input type="text" class="shuru"  placeholder="小米6&nbsp;小米MIX现货">
            </div>
            <div class="submit fl">
                <input type="submit" class="sousuo" value="搜索"/>
            </div>
            <div class="clear"></div>
        </form>
        <div class="clear"></div>
    </div>
</div>
<!-- end banner_x -->
<!-- self_info -->
<div class="grzxbj">
    <div class="selfinfo center">
        <div class="lfnav fl">
            <div class="ddzx">订单中心</div>
            <div class="subddzx">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/order/myOrder" >我的订单</a></li>
                    <li><a href="">意外保</a></li>
                    <li><a href="">团购订单</a></li>
                    <li><a href="">评价晒单</a></li>
                </ul>
            </div>
            <div class="ddzx">个人中心</div>
            <div class="subddzx">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/myslef/Myself" style="color:#ff6700;font-weight:bold;">我的个人中心</a></li>
                    <li><a href="">消息通知</a></li>
                    <li><a href="">优惠券</a></li>
                    <li><a href="">收货地址</a></li>
                </ul>
            </div>
        </div>
        <div class="rtcont fr" id="myzl">
            <div class="grzlbt ml40">我的资料</div>
            <div class="subgrzl ml40" ><span>昵称</span><span id="zl_username">啦啦维吉尔</span><span id="select_username" onclick="">编辑</span></div>
            <div class="subgrzl ml40" ><span>个性签名</span><span id="zl_signature">一支穿云箭，千军万马来相见！</span><span id="select_signature" onclick="">编辑</span></div>
            <div class="subgrzl ml40" ><span>我的爱好</span><span id="zl_hobby"> 游戏，音乐，旅游，健身</span><span id="select_hobby" onclick="">编辑</span ></div>

        </div>
        <div class="clear"></div>
    </div>
</div>
<!-- self_info -->

<%--<footer class="mt20 center">
    <div class="mt20">小艾商城|MIUI|米聊|多看书城|小米|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
    <div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div>
    <div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
</footer>--%>
<script>
    /*商品选择*/
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
    /**
     *请求用户信息
     */
    $(function() {
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/myself/MyselfInfo",
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function(data) {
                //操作成功之后就要变动界面
                username_info = data.username;
                signature_info = data.signature;
                hobby_info = data.hobby;
                syncData(data);

            }
        });
    })
    var username_info='';
    var signature_info = '';
    var hobby_info = '';

    var username = 'username';
    var signature = 'signature';
    var hobby = 'hobby';
    /*更新内容*/
    function syncData(info) {
        $('#zl_username').html(" " + username_info + " ");
        $('#zl_signature').html(" " + signature_info + " ");
        $('#zl_hobby').html(" " + hobby_info + " ");

        showEdit(username);
        showEdit(signature);
        showEdit(hobby);
    }
    function showEdit(info_select) {
        $("#select_" + info_select + "").off("click");
        $("#select_" + info_select + "").html("编辑");
        $("#select_" + info_select + "").click(function() {
            editClick(info_select);
        });
    }

    function editClick(info_select) {
        /*maxlength="10"*/
            $("#zl_" + info_select).html('<input  id="text_' + info_select + '" value="' + $("#zl_" + info_select).html() + '"></input>');
            $("#select_" + info_select + "").show();
            showSave(info_select);
    }
    function showSave(info_select) {
        $("#select_" + info_select + "").off("click");
        $("#select_" + info_select + "").html("保存");
        $("#select_" + info_select + "").click(function() {
            updateAddress(info_select);
        });
    }

    function updateAddress(info_select) {
            $("#select_" + info_select).off('click');
          /*  var name = $("#text_" + info_select + "").val();
            alert(name);*/
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/myself/updateMyself",
                async: false,
                data: JSON.stringify({
                    "key": info_select,
                    "value": $("#text_" + info_select + "").val(),
                }),
                contentType: "application/json; charset=utf-8",
                success: function(data) {
                        //操作成功之后就要变动界面
                     $("#zl_"+info_select+"").html($("#text_"+info_select+"" ).val());
                        showEdit(info_select);
                    }


            });



    }
</script>

</body>
</html>
