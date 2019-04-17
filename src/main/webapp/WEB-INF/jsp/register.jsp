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
    <title>小艾账号-注册</title>
    <link rel="shortcut icon" href="http://localhost/images/enroll/logo-ai.png">
    <link rel="stylesheet" href="http://localhost/css/register1.css">
    <script src="http://localhost/js/jquery3.3.1.min.js"></script>
    <script src="http://localhost/js/jquery.form.min.js"></script>
</head>
<body>
<!--   首部-->
<div id="mian_1">
    <div id="main">
        <div id="logo">
            <img src="http://localhost/images/enroll/logo-ai.png">
        </div>
        <div id="enroll">
            <p>注册小艾账号</p>
        </div>
        <form   id="register-form" name="register-form" method="post">


            <input id="phone" type="text" name="phone" required placeholder="  请输入手机号码" pattern="[0-9]{11}">
            <input id="mail" type="text" name="mail" required placeholder= "请输入您的邮箱" >

            <input id="pwd" type="password" name="password" required placeholder="  请输入密码">

            <input id="submit_button" type="submit" value="立即注册"/>
            <div id="attention">点击“立即注册”，即表示您同意并愿意遵守小艾<span>用户协议</span> 和<span>隐私政策</span></div>
        </form>

    </div>
    <!--       尾部-->
    <div id="foot">
        <div id="foot_1">&nbsp;&nbsp;简体&nbsp;&nbsp;|&nbsp;&nbsp;繁体&nbsp;&nbsp;|&nbsp;&nbsp;English&nbsp;&nbsp;|&nbsp;&nbsp;常见问题&nbsp;&nbsp;</div>
        <div id="foot_2">
            公司版权所有-粤ICP备10046444-粤公网<img src="http://localhost/images/enroll/logo1.jpg">安备11010802020134号-粤ICP证110507号
        </div>
    </div>
</div>
<canvas id="Mycanvas"></canvas>

<script language="javascript">
    document.getElementById('phone').focus();
    <!--设置id为name的元素得到焦点-->
</script>

<script>

    $("#register-form").submit(function() {
        $.ajax({
            method: "POST",
            /*dataType: "json",*/
            contentType: "application/x-www-form-urlencoded;charset=UTF-8",
            timeout : 300000,
            async: false,
            url : '${pageContext.request.contextPath}/user/registerUser',
            data:{
                phone : $("#phone").val(),
                mail : $("#mail").val(),
                password: $("#pwd").val()
            },
            success :function(data){
                alert(data);
                if(data=="ok-register"){
                    alert("注册成功");
                    window.location.href = "${pageContext.request.contextPath}/user/login";
                }else{
                    alert("该手机号已注册");

                }
            },
            error : function() {
                alert("error");
            }
        });
        return false;
    })
</script>

<script>
    var WIDTH = window.innerWidth, HEIGHT = window.innerHeight, POINT =35;
    var canvas = document.getElementById('Mycanvas');
    canvas.width = WIDTH,
        canvas.height = HEIGHT;
    var context = canvas.getContext('2d');
    context.strokeStyle = 'rgba(0,0,0,0.1)',
        context.strokeWidth = 1,
        context.fillStyle = 'rgba(0,0,0,0.1)';
    var circleArr = [];


    function Line (x, y, _x, _y, o) {
        this.beginX = x,
            this.beginY = y,
            this.closeX = _x,
            this.closeY = _y,
            this.o = o;
    }

    function Circle (x, y, r, moveX, moveY) {
        this.x = x,
            this.y = y,
            this.r = r,
            this.moveX = moveX,
            this.moveY = moveY;
    }

    function num (max, _min) {
        var min = arguments[1] || 0;
        return Math.floor(Math.random()*(max-min+1)+min);
    }
    //原点
    function drawCricle (cxt, x, y, r, moveX, moveY) {
        var circle = new Circle(x, y, r, moveX, moveY)
        cxt.beginPath()
        cxt.arc(circle.x, circle.y, circle.r, 0, 2*Math.PI)
        cxt.closePath()
        cxt.fill();
        return circle;
    }
    //绘制
    function drawLine (cxt, x, y, _x, _y, o) {
        var line = new Line(x, y, _x, _y, o)
        cxt.beginPath()
        cxt.strokeStyle = 'rgba(0,0,0,'+ o +')'
        cxt.moveTo(line.beginX, line.beginY)
        cxt.lineTo(line.closeX, line.closeY)
        cxt.closePath()
        cxt.stroke();

    }
    //初始化
    function init () {
        circleArr = [];
        for (var i = 0; i < POINT; i++) {
            circleArr.push(drawCricle(context, num(WIDTH), num(HEIGHT), num(15, 2), num(10, -10)/40, num(10, -10)/40));
        }
        draw();
    }

    //绘制
    function draw () {
        context.clearRect(0,0,canvas.width, canvas.height);
        for (var i = 0; i < POINT; i++) {
            drawCricle(context, circleArr[i].x, circleArr[i].y, circleArr[i].r);
        }
        for (var i = 0; i < POINT; i++) {
            for (var j = 0; j < POINT; j++) {
                if (i + j < POINT) {
                    var A = Math.abs(circleArr[i+j].x - circleArr[i].x),
                        B = Math.abs(circleArr[i+j].y - circleArr[i].y);
                    var lineLength = Math.sqrt(A*A + B*B);
                    var C = 1/lineLength*7-0.009;
                    var lineOpacity = C > 0.03 ? 0.03 : C;
                    if (lineOpacity > 0) {
                        drawLine(context, circleArr[i].x, circleArr[i].y, circleArr[i+j].x, circleArr[i+j].y, lineOpacity);
                    }
                }
            }
        }
    }


    window.onload = function () {
        init();
        setInterval(function () {
            for (var i = 0; i < POINT; i++) {
                var cir = circleArr[i];
                cir.x += cir.moveX;
                cir.y += cir.moveY;
                if (cir.x > WIDTH) cir.x = 0;
                else if (cir.x < 0) cir.x = WIDTH;
                if (cir.y > HEIGHT) cir.y = 0;
                else if (cir.y < 0) cir.y = HEIGHT;

            }
            draw();
        }, 16);
    }

</script>
</body>
</html>
