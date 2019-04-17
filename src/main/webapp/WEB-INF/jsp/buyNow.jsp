<%@ page language="java"  import="java.util.*" pageEncoding="utf-8"%>
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
    <title>填写订单信息</title>
    <link rel="stylesheet" href="http://localhost/css/checkOut1.css">
    <script src="http://localhost/js/jquery3.3.1.min.js"></script>
</head>
<body>
<!--标题块-->
<div class="head">
    <div class="mid clear">
        <div class="image">
            <a href="${pageContext.request.contextPath}/user/ai"><img src="http://localhost/images/land/logoAi.png" alt=""></a>
        </div>
        <div class="l">
            <h2>确认订单</h2>
            <jsp:include flush="true" page="include/bar.jsp"/>
        </div>
    </div>
</div>
<hr class="org">
<!--选择块-->
<div class="back">
    <div class="checkbox">
        <!--标题1-->
        <div class="title1">
            <h3>收货地址</h3>
        </div>
        <!--地址块-->
        <div class="adbox clear" id="div-address-list">
        </div>
        <div class="left smbox lastbox" id="div-address-new" onclick="addNewAddress()">
            <div class="addyuan">+</div>
            <span>添加新地址</span>
        </div>

        <!--配送方式-->
        <div class="title2 clear">
            <h3 class="left">配送方式</h3>
            <span class="left">快递配送（免运费）</span>
        </div>
        <!--配送时间-->
        <div class="title2 clear">
            <h3 class="left">配送时间</h3>
            <span class="left">不限送货时间 :周一至周日</span>
        </div>
        <!--发票-->
        <div class="title2 clear fapiao">
            <h3 class="left">发票</h3>
            <span class="left"><span>电子发票</span> <span>个人</span> <span>商品明细</span></span>

        </div>
        <!--支付方式-->
        <div class="title2 clear">
            <h3 class="left">支付方式</h3>
            <div class="left title_box" style="width:135px" onclick="payClick('alipay')">支付宝</div>
            <div class="left title_box" style="width:135px" onclick="payClick('wechat')">微信扫码支付</div>
            <div class="left title_box" style="width:135px" onclick="payClick('qqpay')">QQ扫码支付</div>
            <div class="left title_box" style="width:135px" onclick="payClick('paypal')">PayPal</div>
        </div>
        <div class="title2 clear" style="display:none;height:100%" fiid="div-pay-qrcode">
            <h3 class="left">请扫码</h3>
            <div id="div-pay-qrcode-inner"></div>
        </div>
        <!--商品及优惠券-->
        <div class="title2 clear youhui">
            <h3 class="left">商品及优惠券</h3>
            <a href="${pageContext.request.contextPath}/cart/myCart"class="right">返回购物车<b>></b></a>
        </div>
        <!--商品列表-->
        <div class="goods-body">
            <ul class="goods-list" id="div-item-list">
            </ul>
        </div>
        <!--结算块-->
        <div class="selet clear">
            <div class="left kaquan">
                <div class="yhquan qdiv"><i>+</i>使用优惠券</div>
                <div class="yhqnr">
                    <ul class="clear">
                        <li class="left firli">选择优惠券</li>
                        <li class="left secli">输入优惠券码</li>
                    </ul>
                    <div class="lidiv1"><p>您暂时没有可用的优惠券</p></div>
                    <div class="lidiv2 clear    ">
                        <div class="inbox">
                            <div class="zuoshang">请输入优惠券码</div>
                            <div class="zhongjian">请输入优惠券码</div>
                            <input type="text" >
                        </div>
                        <div class="dianniu">
                            <a href="#" class="shiyong">立即使用</a>
                            <span class="buyong">不使用优惠券</span>
                        </div>
                    </div>
                </div>
                <div class="lpcard qdiv"><i>+</i>使用小米礼品卡</div>
                <div class="xjquan qdiv"><i>+</i>使用现金券</div>
            </div>
            <div class="right moneybox">
                <ul>
                    <li class="money">
                        <b>商品件数:</b>
                        <span id="text-total-count">3件</span>
                    </li>
                    <li class="money">
                        <b>金额合计:</b>
                        <span class="val" id="text-total-price">999.00元</span>
                    </li>
                    <li class="money">
                        <b>活动优惠:</b>
                        <span>-0.00元</span>
                    </li>
                    <li class="money">
                        <b>优惠券折扣:</b>
                        <span>-0元</span>
                    </li>
                    <li class="money">
                        <b>运费:</b>
                        <span>0元</span>
                    </li>
                    <li class="money last">
                        <b>应付总额:</b>
                        <span><em id="text-total-price-2">999</em>元</span>
                    </li>
                </ul>
            </div>
        </div>
        <!--结算按钮-->
        <div class="jiesuan" id="btn-checkout">
            <div class="right rjiesuan">
                去结算
            </div>
        </div>
    </div>

</div>
<%--<jsp:include flush="true" page="include/footer.jsp"/>--%>
<script src="http://localhost/js/dingdan.js"></script>
<script src="http://localhost/js/qrcode.js"></script>
</body>

<script>
    is_in_new_address = false;

    edit_address = [];

    choose_address_id = 0;
    choose_pay_method = '';

    function payClick(pay_method) {
        choose_pay_method = pay_method;
    }

    function editClick(address_id) {
        if(edit_address[address_id] == false) {
            $("#text-name-" + address_id).html('<input maxlength="10" id="text-input-name-' + address_id + '" value="' + $("#text-name-" + address_id).html() + '"></input>');
            $("#text-phone-" + address_id).html('<input maxlength="11" type="number" id="text-input-phone-' + address_id + '" type="number" value="' + $("#text-phone-" + address_id).html() + '"></input>');
            $("#text-address-" + address_id).html('<input maxlength="100" id="text-input-address-' + address_id + '" value="' + $("#text-address-" + address_id).html() + '"></input>');
            $("#address-" + address_id + "-save").show();
            edit_address[address_id] = true;
            showSave(address_id);
        }
    }

    function updateAddress(address_id) {
        if(edit_address[address_id] == true) {
            if($("#text-input-name-" + address_id).val() == "" || $("#text-input-phone-" + address_id).val() == "" || $("#text-input-address-" + address_id).val() == "") {
                alert("请您填完信息再提交。");
                return;
            }
            $("#div-address-" + address_id).off('click');
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/user/updateUserAddress",
                async: false,
                data: JSON.stringify({
                    "addressId": address_id,
                    "username": $("#text-input-name-" + address_id).val(),
                    "phone": $("#text-input-phone-" + address_id).val(),
                    "address": $("#text-input-address-" + address_id).val(),
                }),
                contentType: "application/json; charset=utf-8",
               /* dataType: "json",*/
                success: function(data) {
                    if(data =="ok-updataUserAddress"){

                        //操作成功之后就要变动界面
                        $("#text-name-" + address_id).html($("#text-input-name-" + address_id).val());
                        $("#text-phone-" + address_id).html($("#text-input-phone-" + address_id).val());
                        $("#text-address-" + address_id).html($("#text-input-address-" + address_id).val());
                        $("#address-" + address_id + "-save").hide();

                          edit_address[address_id] = false;
                          showEdit(address_id);
                    }else{
                        alert("网络错误，请重新提交");
                    }

                }
            });


        }
    }

    function deleteAddress(address_id) {
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/user/deleteUserAddress",
            async: false,
            data: JSON.stringify(
                 address_id
            ),
            contentType: "application/json; charset=utf-8",
            /* dataType: "json",*/
            success: function(data) {

                if(data == "ok-deleteAddress"){
                    //操作成功之后就要变动界面
                    $("#div-address-" + address_id).remove();

                }else{
                    alert("网络错误，请重新提交");
                }


            }
        });
    }

    function setChoose(address_id) {
        $("#div-address-" + address_id).addClass("on");
        $("#div-address-" + address_id).siblings().removeClass("on");
        $("#div-address-" + address_id).find("text").css("display","block");
        $("#div-address-" + address_id).siblings().find("text").css("display","none");

        choose_address_id = address_id;
    }

    function showSave(address_id) {
        $("#address-" + address_id + "-save").off("click");
        $("#address-" + address_id + "-save").html("保存");
        $("#address-" + address_id + "-save").click(function() {
            updateAddress(address_id);
        });
    }

    function showEdit(address_id) {
        $("#address-" + address_id + "-save").off("click");
        $("#address-" + address_id + "-save").html("编辑");
        $("#address-" + address_id + "-save").click(function() {
            editClick(address_id);
        });

    }

    function addAddress(address) {
        $('#div-address-list').before('<div class="left smbox" id="div-address-' + address.addressId + '" onclick="setChoose(' + address.addressId + ')"><dl> \
			                        <dt id="text-name-' + address.addressId + '">' + address.username + '</dt> \
			                        <dd id="text-phone-' + address.addressId + '">' + address.phone + '</dd> \
			                        <dd id="text-address-' + address.addressId + '">' + address.address + '</dd> \
			                        <dd><text style="right:215px" id="address-' + address.addressId + '-delete" onclick="deleteAddress(' + address.addressId + ')">删除</text></dd> \
			                        <dd><text id="address-' + address.addressId + '-save" onclick="">编辑</text></dd> \
			                    </dl></div> \
							');

        showEdit(address.addressId);
    }

    function loadAllAddress() {
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/user/addressList",
            async: false,
            data: JSON.stringify({
            }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function(data) {
                    //操作成功之后就要变动界面
                    for(var address_index in data) {
                        var address = data[address_index];

                        addAddress(address);
                        edit_address[address.addressId] = false;
                    }

            }
        });
    }

    /*添加用户地址*/
    function addNewAddress() {
        if(!is_in_new_address) {
            $("#div-address-new").html('<dl> \
                        <dt id="text-name-new"><input maxlength="10" id="text-input-name-new" placeholder="姓名"></input></dt> \
                        <dd id="text-phone-new"><input maxlength="11" type="number" id="text-input-phone-new" placeholder="电话"></input></dd> \
                        <dd id="text-address-new"><input maxlength="100" id="text-input-address-new" placeholder="地址"></input></dd> \
                        <dd><text id="address-new-save">保存</text></dd> \
                    </dl> \
				');
            is_in_new_address = true;
            $('#address-new-save').show();
            $('#address-new-save').click(function() {
                if($("#text-input-name-new").val() == "" || $("#text-input-phone-new").val() == "" || $("#text-input-address-new").val() == "") {
                    alert("请您填完信息再提交。");
                    return;
                }
                $.ajax({
                    type: "post",
                    url: "${pageContext.request.contextPath}/user/addUserAddress",
                    async: false,
                    data: JSON.stringify({
                        "username": $("#text-input-name-new").val(),
                        "phone": $("#text-input-phone-new").val(),
                        "address": $("#text-input-address-new").val(),
                    }),
                    contentType: "application/json; charset=utf-8",
                    /*dataType: "json",*/
                    success: function(data) {
                        if(data == "ok-addUserAddress") {

                            window.location.href="${pageContext.request.contextPath}/order/buyNow"
                            //操作成功之后就要变动界面

                            /*   $("#div-address-list").html('<div class="left smbox lastbox" id="div-address-new" onclick="addNewAddress()"> \
                                                                   <div class="addyuan">+</div> \
                                                                   <span>添加新地址</span> \
                                                               </div>');
                              /!* loadAllAddress();*!/

                               window.setTimeout(function(){is_in_new_address = false;}, 1000);*/
                        }
                    }
                });
            });

    }
    }

    total_price = 0;
    total_count = 0;

    /*重点*/

    function itemModel(item, cart_info) {

        if(item.itemSku == 0) {
            return;
        }
        /*要买的物品数量》物品的库存*/
        if(cart_info.goodNum > item.exNumber) {
            cart_info.goodNum = item.exNumber;
            is_sku = true;//库存不足，缩减购物车
        } else {
            is_sku = false;
        }
        /*计算总价*/
        total_price += item.price * cart_info.goodNum;
        /*计算总数*/
        total_count += 1;
        /*名字，价格，小计，数量*/
        return '<li class="goods clear"> \
                        <img src="' + item.pic + '" alt="" class="left imgoods"> \
                        <div class="left goodsname"><a href="/item/detail?item_id=' + item.goodId + '">' + item.goodName + ' </a></div> \
                        <div class="left goodsprice">' + strip(item.price) + '元 x ' + cart_info.goodNum + '</div> \
                        <div class="left goodsstatus">' + (is_sku ? '库存不足，已为您缩减购物车' : '&nbsp;') + '</div> \
                        <div class="right goodstotal">' + strip(item.price * cart_info.goodNum) + '元</div> \
                    </li> \
		';
    }

    function loadAllItems() {
        var item_array = [];
        $.ajax({
            type: "get",
            url: "${pageContext.request.contextPath}/order/orderDetail",
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function(data) {

                    //操作成功之后就要变动界面
                    /*得到物品的id*/
                    for(var item_index in data) {
                        var item_id = data[item_index].goodId;
                        item_array.push(item_id);
                    }

            }
        });

        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/order/orderDetail",
            async: false,
            data: JSON.stringify({
            }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function(data) {


                for(var cart_index in data) {
                    cart_info = data[cart_index];

                    if(item_array.indexOf(cart_info.goodId) == -1) {
                        continue;
                    }



                    $.ajax({
                        type: "post",
                        url: "${pageContext.request.contextPath}/goods/goodDetail",
                        async: false,
                        data: JSON.stringify(
                            cart_info.goodId
                        ),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function(data) {

                            /*物品的详情*/
                            //$('#div-item-list').append(item_model(cart_info, data));
                            $("#div-item-list").append(itemModel(data, cart_info));
                        }
                    });
                }

                $("#text-total-count").html(total_count);
                $("#text-total-price").html(strip(total_price) + "元");
                $("#text-total-price-2").html(strip(total_price));
            }
        });
    }

    //防止浮点数陷阱
    function strip(num) {
        return parseFloat(num.toPrecision(precision= 12));
    }

    function createPayRequest(order_id) {
        $.ajax({
            type: "post",
            url: "/user/pay/ajax/order",
            async: false,
            data: JSON.stringify({
                "order_id": order_id,
                "pay_method": choose_pay_method
            }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function(data) {
                if(data.result == 1) {
                    if(data.data.type == 1) {
                        //链接支付
                        alert("请在新打开的页面支付，支付完成前请勿关闭该页面！");
                        window.open(data.data.link);
                    } else {
                        //扫码支付
                        $("#div-pay-qrcode").show();
                        $("#div-pay-qrcode-inner").html('<p>' + data.data.tips + '</p> \
            			<div id="qrcode"></div> \
            			');
                        new QRCode(document.getElementById("qrcode"), data.data.qrcode);
                    }

                    //轮询获取支付结果
                    setInterval(function(){checkPayStatus(order_id);},1000);

                }
            }
        });
    }

    function checkPayStatus(order_id) {
        //定时刷新

        $.ajax({
            type: "post",
            url: "/user/pay/ajax/order/check",
            async: true,
            data: JSON.stringify({
                "order_id": order_id
            }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function(data) {
                //检测是否已支付
                if(data.data.is_paid) {
                    alert("感谢您的支付，我们已经收到您的付款！");
                    window.setTimeout(function(){location.href="/user/order"}, 1);
                }
            }
        });

    }

        $(function() {
            /*$("#address-modify").click(function() {
                $("#text-name").html('<input id="text-input-name" value="' + $("#text-name").html() + '"></input>');
                $("#text-phone").html('<input id="text-input-name" type="number" value="' + $("#text-phone").html() + '"></input>');
                $("#text-address").html('<input id="text-input-name" value="' + $("#text-address").html() + '"></input>');
            });*/

            loadAllAddress();

            loadAllItems();

            //下单按钮
            $('#btn-checkout').click(function() {
                if(choose_pay_method == '') {
                    alert("您还没选择支付方式呢！");
                    return;
                }

                if(choose_address_id == 0) {
                    alert("您还没选择地址呢！");
                    return;
                }

                $.ajax({
                    type: "post",
                    url: "${pageContext.request.contextPath}/order/checkOut",
                    async: false,
                    data: JSON.stringify(
                        choose_address_id
                    ),
                    contentType: "application/json; charset=utf-8",
                 /*   dataType: "json",*/
                    success: function(data) {
                        if(data == "ok-checkOut") {
                            alert("下单成功，创建支付请求需要一段时间，请稍候！");
                          /*  createPayRequest(data.data.order_id);*/
                            alert("支付成功，现在为您跳转订单页面");
                           window.setTimeout(function(){location.href="${pageContext.request.contextPath}/order/myOrder"}, 1);
                        }
                    }
                });
            });

        });



</script>
</html>
