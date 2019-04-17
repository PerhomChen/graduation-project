<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
    String path = request.getContextPath();
    String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<html>
<head>
    <base href="<%=basepath %>" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>修改商品信息</title>
</head>
<body>
<h1>修改商品信息</h1>
<%--${pageContext.request.contextPath}/goods/editGoods.action--%>
<%--enctype="multipart/form-data"--%>
<form id="goodForm" action="${pageContext.request.contextPath}/goods/editGoodsSubmit.action" method="post" >
<input type="hidden" name="id" value="${goodsCustom.goodId}"/>

    修改商品信息:
    <table  width="100%" border=1>
        <tr>
            <td>商品名称</td>
            <td><input type="text" name="goodName" value="${goodsCustom.goodName}"></td>
            <td>商品价格</td>

            <td><input type="text" name="price" value="${goodsCustom.price}"></td>
            <td>商品描述</td>
            <td><input type="text" name="detail" value="${goodsCustom.detail}"></td>

            <td><input type="text" name="createtime" value="<fmt:formatDate value="${goodsCustom.createtime}" pattern="yyyy-MM-dd HH:mm:ss" />"></td>

        </tr>
        <button type="submit" >提交</button>
    </table>
</form>
</body>
</html>