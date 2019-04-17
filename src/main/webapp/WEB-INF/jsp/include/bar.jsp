<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
    String path = request.getContextPath();
    String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<div class="r">
    <div class="rl clear">
     <%--   <a href=""><span>${user.username}</span></a>--%>
        <ul>
            <li class="li"><b><a href="/user/login/logout">退出登录</a></b></li>
        </ul>
    </div>
    <div class="rr">
        <a href="${pageContext.request.contextPath}/order/myOrder" class="dingd">我的订单</a>
    </div>
</div>