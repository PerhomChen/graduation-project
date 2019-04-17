<%@ page language="java"  import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
    String path = request.getContextPath();
    String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>我的购物车-小米商城</title>
    <link rel="stylesheet" href="http://localhost/css/cart.css">
</head>
<body>
<!--标题块-->
<div class="head">
    <div class="mid clear">
        <div class="image">
            <a href="${pageContext.request.contextPath}/user/ai"><img src="http://localhost/images/land/logoAi.png" alt=""></a>
        </div>
        <div class="l">
            <h2>我的购物车</h2>
            <p>温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算</p>
            <jsp:include flush="true" page="include/bar.jsp"/>
        </div>
    </div>
</div>
<hr class="org">
<!--选择块-->
<div class="back">
    <table id="table-item-list" class="list-head clear" style="text-align: center;  ">
        <tr style="border-bottom:1px solid #E0E0E0">
            <td><input type="checkbox" id="checkbox-select-all" onclick="selectAll(this.checked)"/>全选</td>
            <td>商品名称</td>
            <td>单价</td>
            <td>数量</td>
            <td>小计</td>
            <td>操作</td>
        </tr>
    </table>

    <!--结算块-->
    <div class="jiesuan">
        <div class="left jixu">
            <a href="${pageContext.request.contextPath}/user/ai">继续购物</a>
            <span class="shu">|</span>
            <span>
                    共<i id="text-total-item-count"> 1 </i>件商品,已选择<i id="text-selected-item-count"> 0 </i>件
                </span>
        </div>
        <div class="right rjiesuan" id="btn-checkout"  >
            去结算
        </div>
        <span class="right heji">
                合计:<strong id="text-total-price">0</strong>元
            </span>
    </div>
    <!--分割块-->

    <!--十小块-->

</div>

<jsp:include flush="true" page="include/footer.jsp"/>


<script src="http://localhost/js/gouwuche.js"></script>

<script>

    function selectAll(selectStatus){//传入参数（全选框的选中状态）
        //根据name属性获取到单选框的input，使用each方法循环设置所有单选框的选中状态
        $("input[name='check']").each(function(i,n){
            if(n.checked && !selectStatus) {
                var item_id = parseInt(n.getAttribute('data-item-id'));
                var item_total_price = getItemTotalPrice(item_id);
                total_price -= item_total_price;
                selected_item_count -= 1;
            }

            if(!n.checked && selectStatus) {
                var item_id = parseInt(n.getAttribute('data-item-id'));
                var item_total_price = getItemTotalPrice(item_id);
                total_price += item_total_price;
                selected_item_count += 1;
            }

            n.checked = selectStatus;
        });

        syncData();
    }

    total_item_count = 0;
    selected_item_count = 0;
    total_price = 0;
    function checkboxChecked(item_id, checked) {
        if(checked) {
            total_price += getItemTotalPrice(item_id);
            selected_item_count += 1;
        } else {
            total_price -= getItemTotalPrice(item_id);
            selected_item_count -= 1;
        }

        syncData();
    }

    function getItemChecked(item_id) {
        return document.getElementById("checkbox-" + item_id).checked;
    }

    function modifyItem(item_id, is_add) {
        if(getItemAmount(item_id) - 1 == 0 && !is_add) {
            deleteItem(item_id);
            return;
        }

        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/cart/modifyGoodNum",
            async: false,
            data: {
                //购物车id
                cartId: item_id,
                is_add: is_add
            },

            success: function(data) {
                if(data == "ok-modifyGoodNum") {
                    //操作成功之后就要变动界面
                    if(is_add) {
                        //添加
                        setItemAmount(item_id, getItemAmount(item_id) + 1);

                        setItemTotalPrice(item_id);

                        if(getItemChecked(item_id)) {
                            total_price += getItemPrice(item_id);
                        }
                        syncData();
                    } else {
                        //添加
                        setItemAmount(item_id, getItemAmount(item_id) - 1);

                        setItemTotalPrice(item_id);

                        if(getItemChecked(item_id)) {
                            total_price -= getItemPrice(item_id);
                        }
                        syncData();
                    }
                }
            }
        });
    }

    /*从购物车中删除商品*/

    function deleteItem(item_id) {

        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/cart/deleteCart",
            async: false,
            data: {
                cartId: item_id
            },
         /*   contentType: "application/json; charset=utf-8",
            dataType: "json",*/
            success: function(data) {
                if(data == "ok-deleteCart") {
                    //操作成功之后就要变动界面
                    total_price -= getItemTotalPrice(item_id);
                    selected_item_count -= 1;
                    syncData();
                    $('#table-row-' + item_id).remove();
                }else{
                    alert("网络错误");
                }
            }
        });
    }

    //解决浮点数精度问题
    function strip(num) {
        return parseFloat(num.toPrecision(precision=12));
    }

    function syncData() {
        $('#text-selected-item-count').html(" " + selected_item_count + " ");
        $('#text-total-price').html(strip(total_price));
        $('#text-total-item-count').html(" " + total_item_count + " ");

        if(selected_item_count <= 0) {
            //灰按钮
            $('#btn-checkout').css({"background": "#e0e0e0", "color": "#B0B0B0"});
            $('#btn-checkout').attr("disabled", "disabled");
        } else {
            //橙按钮
            $('#btn-checkout').css({"background": "#ff6700", "color": "#ffffff"});
            $('#btn-checkout').removeAttr("disabled");
        }
    }

    function getItemPrice(item_id) {
        return parseFloat($('#text-' + item_id + '-price').text());
    }

    function setItemPrice(item_id, price) {
        $('#text-' + item_id + '-price').text(strip(price));
    }

    function getItemAmount(item_id) {
        return parseInt($('#text-' + item_id + '-amount').text());
    }

    function setItemAmount(item_id, amount) {
        $('#text-' + item_id + '-amount').text(strip(amount));
    }

    function getItemTotalPrice(item_id) {
        return parseFloat($('#text-' + item_id + '-total-price').text());
    }

    function setItemTotalPrice(item_id) {
        $('#text-' + item_id + '-total-price').text(strip(getItemAmount(item_id) * getItemPrice(item_id)));
    }

    function  item_model(cart_info, item) {
        total_item_count += 1;
        $('#table-item-list  > tbody').after('<tr style="border-bottom:1px solid #E0E0E0" id="table-row-' + cart_info.cartId + '"><td><input type="checkbox"  id="checkbox-' + cart_info.cartId + '" name="check" id="tect-item-checkbox" data-item-id="' + cart_info.cartId + '" onclick="checkboxChecked(' + cart_info.cartId + ', this.checked)"/></td> \
    		<td class="name imga"><a href="/goods/details?goodId=' + cart_info.cartId + '"><img src="' + item.pic + '" alt="" width="70px" height="70px">' + item.goodName +'</a></td> \
    		<td id="text-' + cart_info.cartId + '-price">' + strip(item.price) + '</td> \
    		<td><button onclick="modifyItem(' + cart_info.cartId + ', true)">+</button><div id="text-' + cart_info.cartId + '-amount">' + cart_info.goodNum + '</div><button onclick="modifyItem(' + cart_info.cartId + ', false)">-</button></td> \
    		<td id="text-' + cart_info.cartId + '-total-price">' + strip(item.price * cart_info.goodNum) + '</td> \
    		<td><button onclick="deleteItem(' + cart_info.cartId + ', ' + item.price +');">X</button></td> \
    		<tr> \
    		');
        /*var table = $('#table-item-list');
        var row = table.insertRow(0);
        row.insertCell(1).innerHTML = '<a href="/item/detail?id=' + cart_info.itemId + '"><img src="' + item.itemImgUri + '" alt=""></a>';
        return '<div class="item"> \
            <div class="left check"> \
                <i class="sele sele2">√</i> \
            </div> \
            <div class="left imag"> \
                <a href="/item/detail?id=' + cart_info.itemId + '"><img src="' + item.itemImgUri + '" alt=""></a> \
            </div> \
            <div class="left name"> \
                <a href=""> ' + item.itemName + ' </a> \
            </div> \
            <div class="left price"> ' + item.itemPrice + ' </div> \
            <div class="left num"> \
                <form action="" class="for"> \
                    <input type="button" value="-" class="button1"> \
                    <input type="text"  class="text" value="1"> \
                    <input type="button" value="+" class="button2"> \
                </form> \
            </div> \
            <div class="left total"> <span>999</span>元 </div> \
            <div class="left bigx"><div class="x">x</div></div> \
        </div> \
        ';*/
    }

    /*获得购物车列表*/
    $(function() {
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/cart/myCartList",
            async: false,
            success: function(data) {
                for(var cart_index in data) {
                    var cart_info = data[cart_index];
                           var item1 = cart_info.goods;
                            item_model(cart_info, item1);
                }

                syncData();
            }
        });

        //自动勾选所有
        document.getElementById("checkbox-select-all").checked = true;
        selectAll(true);

    });

    $('#btn-checkout').click(function() {
        var checkout_list = [];
        $("input[name='check']").each(function(i,n){
            if(n.checked) {
                /*购物车的id*/
                var cartId = parseInt(n.getAttribute('data-item-id'));
                checkout_list.push(cartId);
            }
        });

        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/order/checkOutMiddle",
            async: false,
            data: JSON.stringify(checkout_list),
             contentType: "application/json; charset=utf-8",
           /*  dataType: "json",*/
            success: function(data) {

                /*生产订单成功*/
                alert(data);
                if(data == "ok-checkOut") {
                    alert(data);

                    /*一秒后跳转到支付页面*/
                    window.setTimeout(function(){location.href="${pageContext.request.contextPath}/order/buyNow"}, 1);
                }else{
                    alert("您所选的商品库存不足！！");
                }
            }
        });
    });
</script>