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
    <title>我的购物车-小艾商城</title>
    <script type="text/javascript" src="/ssm_war_exploded/page/js/jquery.min.js"></script>
    <link rel="stylesheet" href="/ssm_war_exploded/page/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/ssm_war_exploded/page/css/style.css">
    <script type="text/javascript" src="/ssm_war_exploded/page/js/bootstrap.min.js"></script>
</head>
<body>
<div class="banner_x center ">
    <div class="">
        <a href="index.html" target="_blank"><div class="logo fl"></div></a>
        <div class="wdgwc fl ">我的购物车</div>
        <div class="wxts fl ">温馨提示:最终解释权归本公司所有</div>
        <div class="dlzc fr ">
            <ul id="login">
                <li ><a href="./login.html" target="_blank">登录</a></li>
                <li>|</li>
                <li><a href="./register.html" target="_blank">注册</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="xiantiao"></div>
<div class="gwcxqbj " style="height: 500px; ">
    <div class="gwcxd center " style="height: 400px; overflow: scroll;">
        <div class="top2 center ">
            <div class="sub_top fl ">
                <input type="checkbox" value="quanxuan" class="quanxuan" />全选
            </div>
            <div class="sub_top fl " >商品名称</div>
            <div class="sub_top fl " >单价</div>
            <div class="sub_top fl " >数量</div>
            <div class="sub_top fl ">小计</div>
            <div class="sub_top fl">操作</div>
        </div>
    </div>
    <div class="jiesuandan mt20 center row" >
        <div class="tishi fl ml20">
            <ul>
                <li><a href="liebiao.html?typeId=3">继续购物</a></li>
                <li>|</li>
                <li>共<span id="totalNum">2</span>件商品，已选择<span id="selNum">1</span>件</li>
                <div class="clear"></div>
            </ul>
        </div>
        <div class="jiesuan fr col-xs-1">
            <div class="jiesuanjiage fl">合计（不含运费）：<span id="zongjia">2499.00元</span></div>
            <div class="jsanniu fr"><input class="jsan" type="submit" name="jiesuan"  value="去结算"/></div>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<!-- footer -->
<footer class="center">

    <div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
    <div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div>
    <div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
</footer>
</body>
<script type="text/javascript">
    $(function(){
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/cart/myCartList",
            async: false,
            // dataType:"json",
            success:function(data){

                    var allPrice = 0;
                    var infos = data;
                    var cartList = data[0];
                     console.log(cartList.cartId);
                    console.log(infos.cartId);
                    $(".content2").empty();
                    $(infos).each(function () {
                        var goods = this.goods;
                        alert(goods.goodId);
                        var det = this.goods.detail;
                        console.log(det);
                        var html = "";
                        var xiaoji = goods.price * this.goodNum;
                        html += '<div class="content2 center " >';
                        html += '<div class="sub_content fl ">';
                        html += '<input type="checkbox" value="quanxuan" class="quanxuan" checked="checked"  /></div>';
                        html += '<div class="sub_content fl "><img src="'+goods.pic+'"width="60px" height="60px"></div>';
                        html += '<div class="sub_content fl ft10 " id="goodsName" width="60px" height="10px">'+goods.goodName+'</div>';
                        html += '<div class="price fl " id="price" width="60px" height="10px">'+goods.price+'</div>';
                        html += '<div class="sub_content fl ">';
                        html += '<input class="shuliang" type="number" name="" id="shuliang" value="'+this.goodNum+'" step="1" min="1" >';
                        html += '</div>';
                        html += '<div class="xiaoji sub_content fl " id="xiaoji" name="xiaoji">'+xiaoji+'</div>';
                        html += '<div class="sub_content fl "><a href="javascript:delOrderDetail('+det+')">×</a></div>';
                        html += '</div>';
                        allPrice = allPrice + xiaoji;
                        $(".gwcxd").append($(html));
                        $("#zongjia").html(allPrice);
                        $('.quanxuan').attr("checked","checked");
                    })
                    // 设置全选事件
                    $("#quanxuan").click(function(){
                        if(this.checked){
                            $(".quanxuan").prop("checked",true);
                        }else{
                            $(".quanxuan").prop("checked",false);
                        }

                        calTotalMoney();

                    })
                    // 设置选中某个复选框的事件
                    $(".quanxuan").click(function(){
                        if(this.checked == false){
                            $("#quanxuan").prop("checked",false);
                        }
                        // 计算总价
                        calTotalMoney();
                    })
            },
            error:function(){
                alert("网络错误,ajax加载失败");
            }
        })
    });
</script>
<script type="text/javascript">
    $(document).on("click",".shuliang",function(){
        // 定位单价
        var $goP = $(this).parent().prev().text();
        // 定位数量
        var $num = $(this).val();
        // 结果
        var result = $goP*$num;
        // 小计
        $(this).parent().next().text(result);
        // 修改数量后，计算总价
        calTotalMoney();



         // 总价
        var re = 0;
        $(".quanxuan:checked").each(function(){
            var ad = $(this).parent().text();
            re += Number(ad);
        })
        $("#zongjia").html(re);
        $("#totalNum").html(".xiaoji".length);
        $("#selNum").html(".xiaoji:checked".length);
    })
    function calTotalMoney(){
        // 选中的商品
        var arr = $(".quanxuan:checked");
        // 所有的商品
        var checkboxs = $(".quanxuan");
        var prices = $("#price");
        var nums = $(".shuliang");
        var sum = 0;
        for(var i = 0; i < checkboxs.length; i++){
            if(checkboxs[i].checked){
                sum += parseFloat(prices[i].innerHTML) * parseInt(nums[i].value);
            }
        }
        $("#totalNum").html(checkboxs.length);
        $("#selNum").html(arr.length);
        $("#zongjia").html(sum);
    }
</script>


<script type="text/javascript">

    $(function () {
        $.ajax({
            type:"post",
          /*  url:"/xiaomisys/loginOr",*/
            dataType:"json",
            success:function(data){
                if(data.code == 1){
                    var infos = data.info;
                    if(infos != null){
                        $("#login").empty();
                        var html = '<li ><a href="dingdanzhongxin.html" target="_blank">' + infos.username + '</a></li>';
                        html += '<li>|</li>';
                        html += '<li><a href="./login.html" target="_blank">LogOut</a></li>';
                        $("#login").append(html);
                    }
                }else{
                    alert(data.info);
                }
            },
            error:function(){
                alert("网络错误,ajax加载失败");
            }
        })
    })
</script>
<script type="text/javascript">
    function delOrderDetail(){
        $.ajax({
            type:"post",
            url:"/xiaomisys/loginOr",
            dataType:"json",
            success:function(data){
                if(data.code == 1){
                    var infos = data.info;
                    if(infos != null){
                        $("#login").empty();
                        var html = '<li ><a href="dingdanzhongxin.html" target="_blank">' + infos.username + '</a></li>';
                        html += '<li>|</li>';
                        html += '<li><a href="./login.html" target="_blank">LogOut</a></li>';
                        $("#login").append(html);
                    }
                }else{
                    alert(data.info);
                }
            },
            error:function(){
                alert("网络错误,ajax加载失败");
            }
        })
    }

</script>
</html>
