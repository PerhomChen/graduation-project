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
    <meta charset="UTF-8">
    <title>小艾商城，手机热卖</title>
    <link rel="shortcut icon" href="http://localhost/images/land/logoAi.png">
    <link rel="stylesheet" href="http://localhost/css/ai.css">
    <script src="http://localhost/js/jquery3.3.1.min.js"></script>
    <script src="http://localhost/js/jquery.form.min.js"></script>
    <script type="text/javascript" src="http://localhost/js/jquery18.js"></script>
    <script type="text/javascript" src="http://localhost/js/slides.js"></script>
    <script type="text/javascript">
        $(function() {
            $("#xmSlide").xmSlide({
                width: 950,
                height: 460,
                responsiveWidth: 710,
                pagination: {
                    effect: "fade"
                },
                effect: {
                    fade: {
                        speed: 400
                    }
                },
                play: {
                    effect: "fade",
                    interval: 2500,
                    auto: true,
                    pauseOnHover: true,
                    restartDelay: 2500
                }
            });
        });

    </script>
</head>
<body>
<div class="site-topbar">
    <div class="container">
        <div class="top-nav">
            <a href="" >小艾商城</a>
            <span class="sep">|</span>
            <a href="" >MIUI</a>
            <span class="sep">|</span>
            <a href="" >米聊</a>
            <span class="sep">|</span>
            <a href="" >游戏</a>
            <span class="sep">|</span>
            <a href="" >多看阅读</a>
            <span class="sep">|</span>
            <a href="" >云服务</a>
            <span class="sep">|</span>
            <a href="" >金融</a>
            <span class="sep">|</span>
            <a href="" >小艾商城移动版</a>
            <span class="sep">|</span>
            <a href="" >问题反馈</a>
            <span class="sep">|</span>
            <a href="" >Select Region</a>
        </div>
        <div class="top-cart">
            <a class="cart-mini" href="${pageContext.request.contextPath}/cart/myCart">
                <img id="shoppinglogo" src="http://localhost/images/mi/shoppingcar.png">
                <span class="cart-mini-num" id="cart-mini-num"><a href="${pageContext.request.contextPath}/cart/myCart" style='text-decoration:none'>购物车</a></span>

                <script type="text/javascript">
                    function chang4() {
                        var m1 = document.getElementById("cart-mini-num");
                        var m1t = document.getElementById("cart-mini-numItem");

                        m1.onmouseover = function() {
                            m1t.style.display = "block";
                        }
                        m1.onmouseout = function() {
                            m1t.style.display = "none";
                        }
                    }
                    window.onload = chang4();

                </script>
            </a>
        </div>
        <div class="topbar-info">
            <%--target="_blank"::新开窗口--%>
            <a href="${pageContext.request.contextPath}/user/login" >登陆</a>
            <span class="sep">|</span>
            <a href="${pageContext.request.contextPath}/user/register" >注册</a>
            <span class="sep">|</span>
            <a href="${pageContext.request.contextPath}/myself/Myself" >个人中心</a>
        </div>
    </div>
</div>
<div class="site-header">
    <div class="container">
        <div class="header-logo" ><img width="62px" height="62px" src="http://localhost/images/mi/logoAi.png"></div>
        <div class="header-nav">
            <ul class="nav_list" id="nav_list">
                <li  id="nav_list1">小米9</li>
                <li id="nav_list2">iphone XR</li>
                <li id="nav_list3">荣耀V20</li>
                <li id="nav_list4">华为P30</li>
                <li id="nav_list5">三星S10</li>
                <li id="nav_list6">一加6T</li>
                <li id="nav_list8">华为mate20</li>


            </ul>
        </div>

        <div class="header-seach">
            <form id="searchForm">

                <input type="button" class="search_into" value="">
                <input type="text" id="search_window">
                <div class="search-hot-word">
                    <a href="">红米Note4</a>
                    <a href="">小米笔记本Air</a>
                </div>
            </form>
        </div>
    </div>
    <script>
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
    </script>
    <script type="text/javascript">

        //小米手机的点击事件
        function chang2() {
            var t1 = document.getElementById("nav_list1");
            var t1t = document.getElementById("nav_list1Item");
            t1.onmouseover = function() {
                $(t1t).slideDown();
            }
            t1.onmouseout = function() {
                $(t1t).slideUp();
            }
        }
        window.onload = chang2()
    </script>
</div>

<div class="focus">
    <div id="xmSlide" class="xmSlide">
        <a href="${pageContext.request.contextPath}/goods/details?goodId=3"><div class="xmSlide_01"></div></a>
        <a href="${pageContext.request.contextPath}/goods/details?goodId=5"><div class="xmSlide_02"></div></a>
        <a href="${pageContext.request.contextPath}/goods/details?goodId=6"><div class="xmSlide_03"></div></a>
        <a href="${pageContext.request.contextPath}/goods/details?goodId=8"><div class="xmSlide_04"></div></a>
        <a href="${pageContext.request.contextPath}/goods/details?goodId=9"><div class="xmSlide_05"></div></a>
    </div>
    <div class="focus_list">

        <ul class="focus_mainlistmenu">
            <li id="sd">手机   <span>></span></li>
            <li id="ipad">笔记本 <span>></span></li>
            <li id="tvbox">电视 <span>></span></li>
            <li id="harddriver">平板  <span>></span></li>
            <li id="ele">移动电源 <span>></span></li>
            <li id="musicer">耳机 <span>></span></li>
            <li id="proction">路由器 <span>></span></li>
            <li id="zhijia">盒子 <span>></span></li>
            <li id="cloth">箱包 服饰<span>></span></li>
            <li id="mitu">智能硬件 <span>></span></li>
        </ul>

    </div>
    <div id="sdItem">
        <table class="sdItemtable">
            <%-- <li id="nav_list3">荣耀V20</li>
                <li id="nav_list4">华为P30</li>
                <li id="nav_list5">三星S10</li>
                <li id="nav_list6">一加6T</li>
                <li id="nav_list8">华为mate20</li>--%>
            <tr>
                <td><img src="http://localhost/images/goodsDetails/mi-9.jpg" ><sup><sup><sup><a class="sdItemtable1">小米9</a></sup></sup>
                </sup>
                    <sup><sup><sup><span class="sdItemtable2">选购</span></sup></sup>
                    </sup>
                </td>
                <td><img src="http://localhost/images/goodsDetails/iphone-xr.jpg"><sup><sup><sup><a class="sdItemtable1">iphone XR</a></sup></sup>
                </sup>
                    <sup><sup><sup><span class="sdItemtable2">选购</span></sup></sup>
                    </sup>
                </td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/goodsDetails/HONOR-V20.jpg"><sup><sup><sup><a class="sdItemtable1">荣耀V20</a></sup></sup>
                </sup>
                    <span class="sdItemtable2">选购</span></td>
                <td><img src="http://localhost/images/goodsDetails/HUAWEI-P30.png"><sup><sup><sup><a class="sdItemtable1">华为P30</a></sup></sup>
                </sup>
                    <sup><sup><sup><span class="sdItemtable2">选购</span></sup></sup>
                    </sup>
                </td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/goodsDetails/samsang-S10.jpg"><sup><sup><sup><a class="sdItemtable1">三星S10</a></sup></sup>
                </sup>
                    <sup><sup><sup><span class="sdItemtable2">选购</span></sup></sup>
                    </sup>
                </td>
                <td><img src="http://localhost/images/goodsDetails/ONEPULS-6T.png"><sup><sup><sup><a class="sdItemtable1">一加6T</a></sup></sup>
                </sup>
                    <sup><sup><sup><span class="sdItemtable2">选购</span></sup></sup>
                    </sup>
                </td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/goodsDetails/HUAWEI-mate20.jpg"><sup><sup><sup><a class="sdItemtable1">华为mate20</a></sup></sup>
                </sup>
                    <sup><sup><sup><span class="sdItemtable2">选购</span></sup></sup>
                    </sup>
                </td>
            </tr>




        </table>
    </div>
    <script>
        $('.sdItemtable').on('click','td',function(){
            var value = $(this).find('a').text();
            $.ajax({
                type: 'post',
                async: false,
                timeout : 30000,
                url: '${pageContext.request.contextPath}/goods/middle',
                data: {
                    goodName: value,
                },
                success : function(data) {

                    window.location.href = "${pageContext.request.contextPath}/goods/details?goodId="+data;
                },
                error : function() {
                    alert("error");
                }

            })
        });
    </script>
    <div id="ipadItem">
        <table class="ipadItemtable">
            <tr>
                <td><img src="http://localhost/images/mi/ipad1.png"><sup><sup><a class="ipadItemtable1">小米笔记本Air</a></sup></sup>
                    <sup><sup><sup><a class="ipadItemtable2">选购</a></sup></sup>
                    </sup>
                </td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/ipad2.png"><sup><sup><sup><a class="ipadItemtable1">小米平板2</a></sup></sup>
                </sup>
                    <sup><sup><sup><a class="ipadItemtable2">选购</a></sup></sup>
                    </sup>
                </td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/ipad3.png"><sup><sup><sup><a class="ipadItemtable1">USB-C转接器</a></sup></sup>
                </sup>
                    <sup><sup><sup><a class="ipadItemtable2">选购</a></sup></sup>
                    </sup>
                </td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/ipad4.png"><sup><sup><a class="ipadItemtable1">笔记本内胆包</a></sup></sup>
                    <sup><sup><sup><a class="ipadItemtable2">选购</a></sup></sup>
                    </sup>
                </td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td></td>
            </tr>
        </table>
    </div>
    <div id="tvboxItem">
        <table class="tvboxItemtable">
            <tr>
                <td><img src="http://localhost/images/mi/tv1.png"><sup><a class="tvboxItemtable1">小米电视 43英寸</a></sup>
                </td>
                <td><img src="http://localhost/images/mi/tv2.png"><sup><a class="tvboxItemtable1">小米电视主机</a></sup>
                </td>
                <td><img src="http://localhost/images/mi/tv3.png"><sup><a class="tvboxItemtable1">家庭音响</a></sup>
                </td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/tv4.png"><sup><a class="tvboxItemtable1">小米电视 48英寸</a></sup>
                </td>
                <td><img src="http://localhost/images/mi/tv5.png" style="padding-left:10px;"><sup><a class="tvboxItemtable1">小米盒子3 增强版</a></sup>
                </td>
                <td><img src="http://localhost/images/mi/tv6.png"><sup><a class="tvboxItemtable1">电视盒子配件</a></sup>
                </td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/tv7.png"><sup><a class="tvboxItemtable1">小米电视 55英寸</a></sup>
                </td>
                <td><img src="http://localhost/images/mi/tv8.png" style="padding-left:10px;"><sup><a class="tvboxItemtable1">小米盒子3</a></sup>
                </td>
                <td></td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/tv9.png"><sup><a class="tvboxItemtable1">小米电视 60英寸</a></sup>
                </td>
                <td><img src="http://localhost/images/mi/tv10.png" style="padding-left:20px;"><sup><a class="tvboxItemtable1">小米盒子 mini</a></sup>
                </td>
                <td></td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/tv11.png"><sup><a class="tvboxItemtable1">小米电视 65英寸</a></sup>
                </td>
                <td><img src="http://localhost/images/mi/tv12.png" style="padding-left:28px;"><sup><a class="tvboxItemtable1">小米低音炮</a></sup>
                </td>
                <td></td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/tv13.png"><sup><a class="tvboxItemtable1">小米电视 70英寸</a></sup>
                </td>
                <td><img src="http://localhost/images/mi/tv14.png" style="padding-left:10px;"><sup></sup><sup><a class="tvboxItemtable1">蓝牙手柄</a></sup>
                </td>
                <td></td>
            </tr>
        </table>
    </div>
    <div id="harddriverItem">
        <table class="harddriverItemtable">
            <tr>
                <td><img src="http://localhost/images/mi/harddriver1.png"><sup><a class="harddriverItemtable1">米家扫地机器人</a></sup>
                </td>
                <td><img src="http://localhost/images/mi/harddriver2.png"><sup><a class="harddriverItemtable1">米家压力IH电饭煲</a></sup>
                </td>
                <td><img src="http://localhost/images/mi/harddriver3.png"><sup><a class="harddriverItemtable1">米兔智能故事机</a></sup>
                </td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/harddriver4.png"><sup><a class="harddriverItemtable1">小米VR眼镜玩具版</a></sup>
                </td>
                <td><img src="http://localhost/images/mi/harddriver5.png"><sup><a class="harddriverItemtable1">摄像机</a></sup>
                </td>
                <td><img src="http://localhost/images/mi/harddriver6.png"><sup><a class="harddriverItemtable1">智能家庭组合</a></sup>
                </td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/harddriver7.png"><sup><a class="harddriverItemtable1">小米路由器</a></sup>
                </td>
                <td><img src="http://localhost/images/mi/harddriver8.png"><sup><a class="harddriverItemtable1">净化器及滤芯</a></sup>
                </td>
                <td><img src="http://localhost/images/mi/harddriver9.png"><sup><a class="harddriverItemtable1">手环及配件</a></sup></td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/harddriver10.png"><sup><a class="harddriverItemtable1">九号平衡车</a></sup>
                </td>
                <td><img src="http://localhost/images/mi/harddriver11.png"><sup><a class="harddriverItemtable1">净水器及滤芯</a></sup>
                </td>
                <td><img src="http://localhost/images/mi/harddriver12.png"><sup><a class="harddriverItemtable1">体重秤</a></sup></td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/harddriver13.png"><sup><a class="harddriverItemtable1">电动力折叠自行车</a></sup>
                </td>
                <td><img src="http://localhost/images/mi/harddriver14.png"><sup><a class="harddriverItemtable1">血压计</a></sup>
                </td>
                <td><img src="http://localhost/images/mi/harddriver15.png"><sup><a class="harddriverItemtable1">米兔儿童电话手表</a></sup></td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/harddriver16.png"><sup><a class="harddriverItemtable1">米家恒温电水壶</a></sup>
                </td>
                <td><img src="http://localhost/images/mi/harddriver17.png"><a class="harddriverItemtable1">智能灯</a></sup>
                </td>
                <td><img src="http://localhost/images/mi/harddriver18.png"><sup><a class="harddriverItemtable1">全部智能硬件</a></sup></td>
            </tr>
        </table>
    </div>
    <div id="eleItem">
        <table class="eleItemtable">
            <tr>
                <td><img src="http://localhost/images/mi/ele1.png"><sup><a class="eleItemtable1" style="padding-left:35px;">小米移动电源</a></sup></td>
                <td><img src="http://localhost/images/mi/ele2.png"><sup><a class="eleItemtable1">彩虹5号电池</a></sup></td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/ele3.png"><sup><a class="eleItemtable1">小米插线板</a></sup></td>
                <td><img src="http://localhost/images/mi/ele4.png"><sup><a class="eleItemtable1">彩虹7号电池</a></sup></td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/ele5.png"><sup><a class="eleItemtable1" >品牌移动电源</a></sup></td>
                <td></td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/ele6.png"><sup><a class="eleItemtable1" style="padding-left:35px;">移动电源附件</a></sup></td>
                <td></td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/ele7.png"><sup><a class="eleItemtable1" style="padding-left:35px;">电池</a></sup></td>
                <td></td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/ele8.png"><sup><a class="eleItemtable1" style="padding-left:35px;">充电器</a></sup></td>
                <td></td>
            </tr>
        </table>
    </div>
    <div id="musicerItem">
        <table class="musicerItemtable">
            <tr>
                <td><img src="http://localhost/images/mi/music1.png"><sup><a class="musicerItemtable1" style="padding-left:40px;">小米头戴耳机</a></sup></td>
                <td><img src="http://localhost/images/mi/music2.png"><sup><a class="musicerItemtable1" style="padding-left:40px;">小米随身蓝牙耳机</a></sup></td>
                <td><img src="http://localhost/images/mi/music3.png"><sup><a class="musicerItemtable1" style="padding-left:40px;">品牌音响</a></sup></td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/music4.png"><sup><a class="musicerItemtable1" style="padding-left:40px;">小米圈铁耳机</a></sup></td>
                <td><img src="http://localhost/images/mi/music5.png"><sup><a class="musicerItemtable1" style="padding-left:40px;">小钢炮音响 2</a></sup></td>
                <td></td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/music6.png"><sup><a class="musicerItemtable1" style="padding-left:40px;">小米胶囊耳机</a></sup></td>
                <td><img src="http://localhost/images/mi/music7.png"><sup><a class="musicerItemtable1" style="padding-left:40px;">小钢炮音箱 青春版</a></sup></td>
                <td></td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/music8.png"><sup><a class="musicerItemtable1" style="padding-left:40px;">小米蓝牙耳机</a></sup></td>
                <td><img src="http://localhost/images/mi/music9.png"><sup><a class="musicerItemtable1" style="padding-left:40px;">小米方盒子音箱</a></sup></td>
                <td></td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/music10.png"><sup><a class="musicerItemtable1" style="padding-left:40px;">品牌耳机</a></sup></td>
                <td><img src="http://localhost/images/mi/music11.png"><sup><a class="musicerItemtable1" style="padding-left:40px;">小米米兔音箱</a></sup></td>
                <td></td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/music12.png"><sup><a class="musicerItemtable1" style="padding-left:40px;">小米蓝牙音箱</a></sup></td>
                <td><img src="http://localhost/images/mi/music13.png"><sup><a class="musicerItemtable1" style="padding-left:40px;">网络收音机</a></sup></td>
                <td></td>
            </tr>
        </table>
    </div>
    <div id="proctionItem">
        <table class="proctionItemtable">
            <tr>
                <td><img src="http://localhost/images/mi/proction1.png"><sup><sup><sup><a class="proctionItemtable1" style="padding-left:40px;">贴膜</a></sup></sup>
                </sup>
                </td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/proction2.png"><sup><sup><sup><a class="proctionItemtable1" style="padding-left:40px;">保护套、保护壳</a></sup></sup>
                </sup>
                </td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/proction3.png"><sup><sup><sup><a class="proctionItemtable1" style="padding-left:40px;">后盖</a></sup></sup>
                </sup>
                </td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/proction4.png"><sup><sup><sup><a class="proctionItemtable1" style="padding-left:40px;">背贴</a></sup></sup>
                </sup>
                </td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td></td>
            </tr>
        </table>
    </div>
    <div id="zhijiaItem">
        <table class="zhijiaItemtable">
            <tr>
                <td><img src="http://localhost/images/mi/zhijia1.png"><sup><sup><sup><a class="zhijiaItemtable1" style="padding-left:30px;">线材</a></sup></sup>
                </sup>
                </td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/zhijia2.png"><sup><sup><sup><a class="zhijiaItemtable1" style="padding-left:30px;">自拍杆</a></sup></sup>
                </sup>
                </td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/zhijia3.png"><sup><sup><sup><a class="zhijiaItemtable1" style="padding-left:30px;">手机支架</a></sup></sup>
                </sup>
                </td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/zhijia4.png"><sup><sup><a class="zhijiaItemtable1" style="padding-left:30px;">存储卡</a></sup></sup>
                </td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td></td>
            </tr>
        </table>
    </div>
    <div id="clothItem">
        <table class="clothItemtable">
            <tr>
                <td><img src="http://localhost/images/mi/cloth1.png"><sup><sup><sup><a class="clothItemtable1" style="padding-left:30px;">箱包</a></sup></sup>
                </sup>
                </td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/cloth2.png"><sup><sup><sup><a class="clothItemtable1" style="padding-left:30px;">90分旅行箱</a></sup></sup>
                </sup>
                </td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/cloth1.png"><sup><sup><a class="clothItemtable1" style="padding-left:30px;">服饰</a></sup></sup>
                </td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td></td>
            </tr>
        </table>
    </div>
    <div id="mituItem">
        <table class="mituItemtable">
            <tr>
                <td><img src="http://localhost/images/mi/mitu1.png"><sup><sup><sup><a class="mituItemtable1" style="padding-left:27px;">米兔玩偶</a></sup></sup>
                </sup>
                </td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/mitu2.png"><sup><sup><sup><a class="mituItemtable1" style="padding-left:30px;">鼠标垫</a></sup></sup>
                </sup>
                </td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/mitu3.png"><sup><sup><a class="mituItemtable1" style="padding-left:30px;">服生活周边</a></sup></sup>
                </td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/mitu4.png"><sup><sup><sup><a class="mituItemtable1" style="padding-left:30px;">《小米》目录杂志</a></sup></sup>
                </sup>
                </td>
            </tr>
            <tr>
                <td><img src="http://localhost/images/mi/mitu5.png"><sup><sup><a class="mituItemtable1" style="padding-left:24px;">8H乳胶枕</a></sup></sup>
                </td>
            </tr>
            <tr>
                <td></td>
            </tr>
        </table>
    </div>
    <script type="text/javascript">
        function chang3() {
            var z1 = document.getElementById("sd");

            z1.onmouseover = function() {
                sdItem.style.display = "block";
            }
            z1.onmouseout = function() {
                var z1t = document.getElementById("sdItem");
                z1t.onmouseover = function() {
                    sdItem.style.display = "block";
                }
                z1t.onmouseout = function() {
                    sdItem.style.display = "none";
                }
                sdItem.style.display = "none";
            }

            var z2 = document.getElementById("ipad");

            z2.onmouseover = function() {
                ipadItem.style.display = "block";
            }
            z2.onmouseout = function() {
                var z2t = document.getElementById("ipadItem");
                z2t.onmouseover = function() {
                    ipadItem.style.display = "block";
                }
                z2t.onmouseout = function() {
                    ipadItem.style.display = "none";
                }
                ipadItem.style.display = "none";
            }

            var z3 = document.getElementById("tvbox");
            z3.onmouseover = function() {
                tvboxItem.style.display = "block";
            }
            z3.onmouseout = function() {
                var z3t = document.getElementById("tvboxItem");
                z3t.onmouseover = function() {
                    tvboxItem.style.display = "block";
                }
                z3t.onmouseout = function() {
                    tvboxItem.style.display = "none";
                }
                tvboxItem.style.display = "none";
            }

            var z4 = document.getElementById("harddriver");
            z4.onmouseover = function() {
                harddriverItem.style.display = "block";
            }
            z4.onmouseout = function() {
                var z4t = document.getElementById("harddriverItem");
                z4t.onmouseover = function() {
                    harddriverItem.style.display = "block";
                }
                z4t.onmouseout = function() {
                    harddriverItem.style.display = "none";
                }
                harddriverItem.style.display = "none";
            }

            var z5 = document.getElementById("ele");
            z5.onmouseover = function() {
                eleItem.style.display = "block";
            }
            z5.onmouseout = function() {
                var z5t = document.getElementById("eleItem");
                z5t.onmouseover = function() {
                    eleItem.style.display = "block";
                }
                z5t.onmouseout = function() {
                    eleItem.style.display = "none";
                }
                eleItem.style.display = "none";
            }

            var z6 = document.getElementById("musicer");
            z6.onmouseover = function() {
                musicerItem.style.display = "block";
            }
            z6.onmouseout = function() {
                var z6t = document.getElementById("musicerItem");
                z6t.onmouseover = function() {
                    musicerItem.style.display = "block";
                }
                z6t.onmouseout = function() {
                    musicerItem.style.display = "none";
                }
                musicerItem.style.display = "none";
            }

            var z7 = document.getElementById("proction");
            z7.onmouseover = function() {
                proctionItem.style.display = "block";
            }
            z7.onmouseout = function() {
                var z7t = document.getElementById("proctionItem");
                z7t.onmouseover = function() {
                    proctionItem.style.display = "block";
                }
                z7t.onmouseout = function() {
                    proctionItem.style.display = "none";
                }
                proctionItem.style.display = "none";
            }

            var z8 = document.getElementById("zhijia");
            z8.onmouseover = function() {
                zhijiaItem.style.display = "block";
            }
            z8.onmouseout = function() {
                var z8t = document.getElementById("zhijiaItem");
                z8t.onmouseover = function() {
                    zhijiaItem.style.display = "block";
                }
                z8t.onmouseout = function() {
                    zhijiaItem.style.display = "none";
                }
                zhijiaItem.style.display = "none";
            }

            var z9 = document.getElementById("cloth");
            z9.onmouseover = function() {
                clothItem.style.display = "block";
            }
            z9.onmouseout = function() {
                var z9t = document.getElementById("clothItem");
                z9t.onmouseover = function() {
                    clothItem.style.display = "block";
                }
                z9t.onmouseout = function() {
                    clothItem.style.display = "none";
                }
                clothItem.style.display = "none";
            }

            var z10 = document.getElementById("mitu");
            z10.onmouseover = function() {
                mituItem.style.display = "block";
            }
            z10.onmouseout = function() {
                var z10t = document.getElementById("mituItem");
                z10t.onmouseover = function() {
                    mituItem.style.display = "block";
                }
                z10t.onmouseout = function() {
                    mituItem.style.display = "none";
                }
                mituItem.style.display = "none";
            }


        }
        window.onload = chang3();

    </script>

    <!--   智能硬件-->
</div>
<div class="miStar-box">
    <div class="miStar-boxheader">
        <div class="miStartext">小米明星单品</div>
        <div class="miStar_button">
            <a id="miStar_lbutton" class="miStar_button1">
                <</a>
            <a id="miStar_rbutton" class="miStar_button2">></a>
        </div>
    </div>
    <div class="miStar-content1" id="miStar-content1">
        <div class="miStar_photo1">
            <a href=""><img src="http://localhost/images/mi/miStar1.png"></a>
        </div>
        <div class="miStar_photo1">
            <a href=""><img src="http://localhost/images/mi/miStar2.png"></a>
        </div>
        <div class="miStar_photo1">
            <a href=""><img src="http://localhost/images/mi/miStar3.png"></a>
        </div>
        <div class="miStar_photo1">
            <a href=""><img src="http://localhost/images/mi/miStar4.png"></a>
        </div>
        <div class="miStar_photo1" style="margin-right:-14px;">
            <a href=""><img src="http://localhost/images/mi/miStar5.png"></a>
        </div>
        <div style="clear:both;"></div>
    </div>
    <div class="miStar-content2" id="miStar-content2">
        <div class="miStar_photo2"><img src="http://localhost/images/mi/miStar6.png"></div>
        <div class="miStar_photo2"><img src="http://localhost/images/mi/miStar7.png"></div>
        <div class="miStar_photo2"><img src="http://localhost/images/mi/miStar8.png"></div>
        <div class="miStar_photo2"><img src="http://localhost/images/mi/miStar9.png"></div>
        <div class="miStar_photo2" style="margin-right:-14px;"><img src="http://localhost/images/mi/miStar10.png"></div>
        <div style="clear:both;"></div>
    </div>
</div>
<script>
    function chang5() {
        var b3 = document.getElementById("miStar_lbutton");
        var b3t = document.getElementById("miStar-content1");
        var b4 = document.getElementById("miStar_rbutton");
        var b4t = document.getElementById("miStar-content2");
        b3.onclick = function() {
            b3t.style.display = "block";
            b4t.style.display = "none";
        }
        b4.onclick = function() {
            b3t.style.display = "none";
            b4t.style.display = "block";
        }
    }
    window.onload = chang5();

</script>

<!-- 搭配-->
<div class="accessories">
    <div class="accessories_title">
        <div class="accessoriestext">搭配</div>
        <div class="accessories_button">
            <a class="accessories_button1">查看全部</a>
            <div class="accessories_button2"></div>
        </div>
    </div>
    <div class="accessories_content">
        <table class="accessories_table" cellspacing="14px">
            <tr>
                <td class="accessoriesbox1">
                    <a href="#" class="accessories1">
                        <div class="accessoriesdiv1">
                            <img src="http://localhost/images/mi/accessories1.png">
                        </div>
                    </a>
                </td>
                <td class="accessoriesbox1">
                    <a href="" class="accessories1">
                        <div class="accessoriesdiv1">
                            <img src="http://localhost/images/mi/accessories2.jpg">
                            <div class="accessoriesbox1p">
                                <p style="margin:10px 20px;">(⊙o⊙)...呃。我敢说被人抢了么。这都第三个了。第一...
                                    <br>
                                    <span style="color:#FFC299;">来自于 糖糖果果儿 的评价</span>
                                </p>
                            </div>
                        </div>
                    </a>
                </td>
                <td class="accessoriesbox1">
                    <a href="" class="accessories1">
                        <div class="accessoriesdiv1">
                            <img src="http://localhost/images/mi/accessories5.jpg">
                            <div class="accessoriesbox1p">
                                <p style="margin:10px 20px;">东西不错，特别轻，以前买过别的蓝牙耳机，带几天就不带...
                                    <br>
                                    <span style="color:#FFC299;">来自于 A@然 的评价</span>
                                </p>
                            </div>
                        </div>
                    </a>
                </td>
                <td class="accessoriesbox1">
                    <a href="#" class="accessories1">
                        <div class="accessoriesdiv1">
                            <img src="http://localhost/images/mi/accessories4.jpg">

                            <div class="accessoriesbox1p">
                                <p style="margin:10px 20px;">客服妹子实话说吧!永远支持国产，永远支持小米。这圈铁...
                                    <br>
                                    <span style="color:#FFC299;">来自于 894039435 的评价</span>
                                </p>
                            </div>
                        </div>
                    </a>
                </td>
                <td class="accessoriesbox1">
                    <a href="#" class="accessories1">
                        <div class="accessoriesdiv1">
                            <img src="http://localhost/images/mi/accessories3.jpg">
                            <div class="accessoriesbox1p">
                                <p style="margin:10px 20px;">比我以前买的小米充电宝砖头好要多了！放在包里不占位置...
                                    <br>
                                    <span style="color:#FFC299;">来自于 龚毅祥 的评价</span>

                                </p>
                            </div>
                        </div>
                    </a>
                </td>
            </tr>
            <tr>
                <td class="accessoriesbox1">
                    <a href="#" class="accessories1">
                        <div class="accessoriesdiv1">
                            <img src="http://localhost/images/mi/accessories6.jpg">

                        </div>
                    </a>
                </td>
                <td class="accessoriesbox1">
                    <a href="#" class="accessories1">
                        <div class="accessoriesdiv1">
                            <img src="http://localhost/images/mi/accessories7.jpg">
                            <div class="accessoriesbox1p">
                                <p style="margin:10px 20px;">手感超舒服，有USB输入充电，以后不用到处换插头了
                                    <br> 来自于 玻璃樽81 的评价
                                </p>
                            </div>
                        </div>
                    </a>
                </td>
                <td class="accessoriesbox1">
                    <a href="#" class="accessories1">
                        <div class="accessoriesdiv1">
                            <img src="http://localhost/images/mi/accessories8.jpg">
                            <div class="accessoriesbox1p">
                                <p style="margin:10px 20px;">3个usb插头正好给手机和pad充电，隐藏式白色指示...
                                    <br> 来自于 prinoac 的评价
                                </p>
                            </div>
                        </div>
                    </a>
                </td>
                <td class="accessoriesbox1">
                    <a href="#" class="accessories1">
                        <div class="accessoriesdiv1">
                            <img src="http://localhost/images/mi/accessories9.jpg">
                            <div class="accessoriesbox1p">
                                <p style="margin:10px 20px;">很精致，小巧可爱，连接成功是女声说话提示。音质很纯很...
                                    <br> 来自于 Cc大坏 的评价
                                </p>
                            </div>
                        </div>
                    </a>
                </td>
                <td class="accessoriesbox1">
                    <a href="#" class="accessories1">
                        <div class="accessoriesdiv1">
                            <a href="#" style="margin-bottom:10px;"><img src="http://localhost/images/mi/accessories11.png"></a>
                            <a href="#" style="margin-top:10px;"><img src="http://localhost/images/mi/accessories12.png"></a>

                        </div>
                    </a>
                </td>

            </tr>
        </table>
    </div>
</div>
<!-- 配件-->

<!-- 周边-->

<!-- 为你推荐-->

<!-- 底部-->
<div class="footer">
    <ul class="foot_top">
        <li><a href="#">1小时快修服务<span class="line"></span></a></li>
        <li><a href="#">7天无理由退货</a></li>
        <li><a href="#">15天免费换货</a></li>
        <li><a href="#">满150元包邮</a></li>
        <li><a href="#">520余家售后网点</a></li>
    </ul>


    <ul class="foot_middle">
        <li class="foot_middle_left">
            <table class="foot_table">
                <tr>
                    <th>帮助中心</th>
                    <th>服务支持</th>
                    <th>线下门店</th>
                    <th>关于小米</th>
                    <th>关注我们</th>
                    <th>特色服务</th>
                </tr>
                <tr>
                    <td><a href="#">账户管理</a></td>
                    <td><a href="#">售后政策</a></td>
                    <td><a href="#">小米之家</a></td>
                    <td><a href="#">了解小米</a></td>
                    <td><a href="#">新浪微博</a></td>
                    <td><a href="#">F码通道</a></td>
                </tr>
                <tr>
                    <td><a href="#">购物指南</a></td>
                    <td><a href="#">自助服务</a></td>
                    <td><a href="#">服务网点</a></td>
                    <td><a href="#">加入小米</a></td>
                    <td><a href="#">小米部落</a></td>
                    <td><a href="#">小米移动</a></td>
                </tr>
                <tr class="last">
                    <td><a href="#">订单操作</a></td>
                    <td><a href="#">相关下载</a></td>
                    <td><a href="#">零售网点</a></td>
                    <td><a href="#">联系我们</a></td>
                    <td><a href="#">官方微信</a></td>
                    <td><a href="#">防伪查询</a></td>
                </tr>
            </table>

        </li>

        <li class="foot_middle_right">
            <h2>400-100-5678</h2>
            <p>周一至周日 8:00-18:00</p>
            <p class="last">（仅收市话费）</p>
            <div></div>
        </li>
    </ul>

    <div class="footer_bottom">
        <img src="http://localhost/images/mi/logo.jpg">
        <table>
            <tr>
                <td><a href="#">小米商城</a></td>
                <td><a href="#">米聊</a></td>
                <td><a href="#">多看书城</a></td>
                <td><a href="#">小米路由器</a></td>
                <td><a href="#">小米后院</a></td>
                <td><a href="#">小米天猫店</a></td>
                <td><a href="#">小米淘宝直营店</a></td>
                <td><a href="#">小米网盟</a></td>
                <td><a href="#">问题反馈</a></td>
                <td><a href="#">Select Region</a></td>
            </tr>
        </table>

        <p>
            <a href="#"> ©mi.com</a> 京ICP证110507号京ICP备10046444号 <a href="# ">京公网安备11010802020134号</a>
            <a href="#">京网文[2014]0059-0009号</a> 违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室
        </p>

        <ul>
            <li><img src="http://localhost/images/mi/seal.png"></li>
            <li><img src="http://localhost/images/mi/v-logo-1.png"></li>
            <li><img src="http://localhost/images/mi/v-logo-2.png"></li>
            <li><img src="http://localhost/images/mi/v-logo-3.png"></li>
        </ul>

        <h2>探索黑科技，小米为发烧而生</h2>

    </div>

</div>
</body>
</html>
