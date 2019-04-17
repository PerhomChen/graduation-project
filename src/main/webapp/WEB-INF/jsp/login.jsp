<%@ page language="java"  pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
    String path = request.getContextPath();
    String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>小艾账号-登陆</title>
    <link rel="shortcut icon" href="http://localhost/images/land/logoAi.png">
    <link rel="stylesheet" href="http://localhost/css/land.css">
    <script src="http://localhost/js/jquery3.3.1.min.js"></script>
    <script src="http://localhost/js/jquery.form.min.js"></script>
</head>
<body>
<!--   首部-->
<!--   首部-->
<div id="main">
    <div id="main_1">
        <div class="logo">
            <img src="http://localhost/images/land/logoAi.png">
        </div>
        <div class="land_header" >
            <p>小艾账号登录</p>
        </div>
        <form  id="login-form" name="login-form" method="post">
            <input id="user_name" type="text" name="phone" required placeholder="  手机号码 ">

            <input id="password" type="password" name="password" required placeholder="   密码" >
            <input id="land_button" type="submit"  value="立即登陆" />
        </form>

        <div>
            <p  id="otherway_land">———————其他方式登陆———————</p>
        </div>
        <div id="land_qq_sina_pay">
            <a href="https://graph.qq.com/oauth/show?which=Login&display=pc&response_type=code&client_id=100284651&redirect_uri=https://account.xiaomi.com/pass/sns/login/load&state=7b22736964223a226d695f6573686f70222c226c6f63616c65223a227a685f434e222c2263616c6c6261636b223a22687474702533412532462532466f726465722e6d692e636f6d2532466c6f67696e25324663616c6c6261636b253346666f6c6c6f777570253344687474702532353341253235324625323532467777772e6d692e636f6d25323532462532367369676e2533444e5755344d7a526d4e6a42685a6d55344d44526d4e6d5a6b597a566a4d545a684d47566c4d47466d4d546c6c4d4759305a544e685a51253243253243222c226170706964223a22313030323834363531227d" target="_blank">
                <img class="logo_land" src="http://localhost/images/land/qqlogo.jpg">
            </a>
            <a href="https://api.weibo.com/oauth2/authorize?response_type=code&client_id=2996826273&redirect_uri=https://account.xiaomi.com/pass/sns/login/load&state=7b22736964223a226d695f6573686f70222c226c6f63616c65223a227a685f434e222c2263616c6c6261636b223a22687474702533412532462532466f726465722e6d692e636f6d2532466c6f67696e25324663616c6c6261636b253346666f6c6c6f777570253344687474702532353341253235324625323532467777772e6d692e636f6d25323532462532367369676e2533444e5755344d7a526d4e6a42685a6d55344d44526d4e6d5a6b597a566a4d545a684d47566c4d47466d4d546c6c4d4759305a544e685a51253243253243222c226170706964223a2232393936383236323733227d" target="_blank">
                <img class="logo_land" src="http://localhost/images/land/sinalogo.jpg">
            </a>
            <a href="https://auth.alipay.com/login/express.htm?goto=https%3A%2F%2Fmemberexprod.alipay.com%3A443%2Fauthorize%2FuserAuthQuickLoginAction.htm%3Fe_i_i_d%3Df3d8ff9a751ba4ab0b3151b3553b1006" target="_blank">
                <img class="logo_land" src="http://localhost/images/land/paylogo.jpg">
            </a>
        </div>
        <div id="enroll_resetpassword">
            <a href="${pageContext.request.contextPath}/user/register" >
                <p id="enroll">注册小艾账号 &nbsp;</p>
            </a>

            <a href="../mi_reset/resetpassword.html" target="_self">
                <p >| &nbsp; &nbsp;忘记密码</p>
            </a>
        </div>


    </div>
    <!--       尾部-->
    <div id="foot">
        <div class="foot_list">&nbsp;&nbsp;简体&nbsp;&nbsp;|&nbsp;&nbsp;繁体&nbsp;&nbsp;|&nbsp;&nbsp;English&nbsp;&nbsp;|&nbsp;&nbsp;常见问题&nbsp;&nbsp;</div>

    </div>


</div>
<canvas id="Mycanvas"></canvas>

<script language="javascript">
    document.getElementById('user_name').focus();
    <!--设置id为name的元素得到焦点-->
</script>
<script>




    var WIDTH = window.innerWidth, HEIGHT = window.innerHeight, POINT = 35;
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

    function drawCricle (cxt, x, y, r, moveX, moveY) {
        var circle = new Circle(x, y, r, moveX, moveY)
        cxt.beginPath()
        cxt.arc(circle.x, circle.y, circle.r, 0, 2*Math.PI)
        cxt.closePath()
        cxt.fill();
        return circle;
    }

    function drawLine (cxt, x, y, _x, _y, o) {
        var line = new Line(x, y, _x, _y, o)
        cxt.beginPath()
        cxt.strokeStyle = 'rgba(0,0,0,'+ o +')'
        cxt.moveTo(line.beginX, line.beginY)
        cxt.lineTo(line.closeX, line.closeY)
        cxt.closePath()
        cxt.stroke();

    }

    function init () {
        circleArr = [];
        for (var i = 0; i < POINT; i++) {
            circleArr.push(drawCricle(context, num(WIDTH), num(HEIGHT), num(15, 2), num(10, -10)/40, num(10, -10)/40));
        }
        draw();
    }

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
<script>

    /* $("#login-form").submit(function(){
         $(this).ajaxSubmit({
             success: function (res) {
                 alert(res)
             }
         })
     })*/


    $("#login-form").submit(function() {
        $.ajax({
            method: "POST",
            /*设置同步*/
            async: false,
         /*  dataType: "json",*/
            contentType: "application/x-www-form-urlencoded;charset=UTF-8",
            url : '${pageContext.request.contextPath}/user/loginCheck',
           /* "phone":$("#phone").val(),"password":$("#password").val()*/
            data:{
                phone : $("#user_name").val(),
                password: $("#password").val()
            },
            success : function(data) {
                console.log(data);

                if(data=="ok"){
                    alert("成功");
                    window.location.href = "${pageContext.request.contextPath}/user/ai";
                }else {
                    alert("用户名或者密码有误");

                }
            },
            error : function() {
                alert("error");
            }
        });
        return false;
    })

</script>

</body>
</html>