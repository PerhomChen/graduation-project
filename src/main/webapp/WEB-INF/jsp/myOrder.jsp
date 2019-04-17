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
    <title>我的订单-小米商城</title>
    <link rel="stylesheet" href="http://localhost/css/cart.css">
    <script src="http://localhost/js/jquery3.3.1.min.js"></script>
</head>
<body>

<!--标题块-->
<div class="head">
    <div class="mid clear">
        <div class="image">
            <a href="${pageContext.request.contextPath}/user/ai"><img src="http://localhost/images/land/logoAi.png" ></a>
        </div>
        <div class="l">
            <h2>我的订单</h2>
            <jsp:include flush="true" page="include/bar.jsp"/>
        </div>
    </div>
</div>
<hr class="org">
<!--选择块-->
<div class="back">
    <table id="table-order-list" class="list-head clear" style="text-align: center;">
        <tr style="border-bottom:1px solid #E0E0E0">
            <td>订单号</td>
            <td>商品内容</td>
            <td>小计</td>
            <td>时间</td>
            <td>送货信息</td>
            <td>状态</td>
        </tr>
    </table>
    <!--十小块-->

</div>

<jsp:include flush="true" page="include/footer.jsp"/>

<script>

    function getDateTime(timeStamp) {
        var date = new Date(timeStamp);
        Y = date.getFullYear() + '-';
        M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
        D = date.getDate() < 10 ? '0' + date.getDate() + ' ':  date.getDate() + ' ';
        h = date.getHours() + ':';
        m = date.getMinutes() + ':';
        s = date.getSeconds();
        return Y+M+D+h+m+s;
    }
    function item_model(order, items,orderAddress) {
        var str = '';
        str += '<tr id="table-row-' + order.orderId + '" style="border-bottom:1px solid #E0E0E0"> \
    		<td>' + order.orderId + '</td> \
    		<td class="name">';

        for(var item_index in items) {
            var item = items[item_index];
            str += '<p><a href="${pageContext.request.contextPath}/goods/details?goodId=' + item.goodId + '"><img src="' + item.pic + '"  width="70px" height="70px">' + item.goodName + '</a> X ' + item.exNumber + ' (' + item.price + ' X ' + item.exNumber + ')元</p>';
        }

        status = '';

        switch(order.status) {
            case 1:
                status = '未付款';
                break;
            case 2:
                status = '已付款，等待发货';
                break;
            default:
                status = '未知状态';
        }

        str += '</td> \
    		<td>' + order.totalprice + '元</td> \
    		<td>' + getDateTime(order.createtime) + '</td>\
    		<td>' + orderAddress.username + '<br>' + orderAddress.phone + '<br>'+ orderAddress.address + '</td> \
    		<td>' + status + '</td> \
    		</tr> \
    		';

        $('#table-order-list  > tbody').after(str);
    }

    $(function() {
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/order/myOrderList",
            async: false,
            data: JSON.stringify({
            }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function(data) {

                for(var order_index in data) {
                    var order = data[order_index];

                    var orderAddressId = order.addressId;
                    var orderAddress;


                    $.ajax({
                        type: "post",
                        url: "${pageContext.request.contextPath}/user/selectAddress",
                        async: false,
                        data: JSON.stringify(
                            orderAddressId
                        ),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function(data) {
                            orderAddress  = data;
                        }
                    });

                    //请求detail
                    $.ajax({
                        type: "post",
                        url: "${pageContext.request.contextPath}/order/myOrderListDetail",
                        async: false,
                        data: JSON.stringify(
                             order.orderId
                        ),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function(data) {
                            var item_list = [];
                            for(var order_item_index in data) {
                                var order_item = data[order_item_index];

                                //请求good
                                $.ajax({
                                    type: "post",
                                    url: "${pageContext.request.contextPath}/goods/goodDetail",
                                    async: false,
                                    data: JSON.stringify(
                                         order_item.goodId
                                    ),
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function(data) {
                                        //数量
                                        data.exNumber = order_item.goodNum;
                                        //价格
                                       /* data.itemPrice = order_item.itemCurrentPrice;*/
                                        item_list.push(data);
                                    }
                                });


                            }

                            item_model(order, item_list,orderAddress);
                        }
                    });
                }
            }
        });

    });
</script>


</body>

</html>
