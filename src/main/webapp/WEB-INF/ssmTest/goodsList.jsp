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
    <title>查询商品列表</title>
    <script type="text/javascript">
     /*   function deleteGoods() {
           document.goodsForm.action="${pageContext.request.contextPath}/goods/deleteGoods.action";
            document.goodsForm.submit();
        }*/
  function queryGoods() {
           document.goodsForm.action="${pageContext.request.contextPath}/goods/queryGoods.action";
            document.goodsForm.submit();
        }
    </script>
</head>
<body>
<h1>商品列表</h1>
<form name="goodsForm" action="${pageContext.request.contextPath}/goods/queryGoods.action"  method="post">
    查询条件：
    <table width="100%" border=1>
        <tr>
            <td>
                商品名称：<input name="goodsCustom.goodName"/>
            </td>
        <td>
            <input type="submit" value="查询" onclick="queryGoods"/>
            <input type="button" value="批量删除" onclick="deleteGoods"/>
        </td>
        </tr>
    </table>
    商品列表：
    <table  width="100%" border=1>
        <tr>
            <td>选择</td>
            <td>商品名称</td>
            <td>商品价格</td>
            <td>商品描述</td>
            <td>生产日期</td>
            <td>操作</td>
        </tr>

        <%--传递参数--%>
        <c:forEach items="${goodsList}" var="good">
            <tr>
                <td><input type="checkbox" name="item_id" value="${good.goodId}"/></td>
                <td>${good.goodName}</td>
                <td>${good.price}</td>
                <td>${good.detail}</td>
                <td><fmt:formatDate value="${good.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td><a href="${pageContext.request.contextPath}/goods/editGoods.action?id=${good.goodId}">修改</a> </td>
            </tr>
        </c:forEach>
    </table>
</form>
</body>
</html>