<%@ page import="control.CustomerAction" %>
<%@ page import="module.Customer" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%--
  Created by IntelliJ IDEA.
  User: zay19
  Date: 5/27/2016
  Time: 2:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>会员消费页面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@include file="Base/head.jsp" %>
    <%
        request.setCharacterEncoding("utf-8");//防止中文乱码
    %>
    <%
        String userPhone = request.getParameter("customerUserPhone");
        String userPassword = request.getParameter("customerUserPassword");

        List<Map<String, Object>> params = new ArrayList<Map<String, Object>>();
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("name", "phone");
        param.put("relation", "=");
        param.put("value", userPhone);
        params.add(param);
        param = new HashMap<String, Object>();
        param.put("name", "c_password");
        param.put("relation", "=");
        param.put("value", userPassword);
        params.add(param);

        List<Customer> customers = null;
        CustomerAction customerAction = new CustomerAction();
        try {
            customers = customerAction.query(params);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Customer customer = customers.get(0);


    %>
</head>

<body>
<link href="../css/customer.css" rel="stylesheet">
<!-- 顶部导航 -->
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation" id="menu-nav">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">切换导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">客户消费页面</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#ad-carousel">综述</a></li>
                <li><a href="#summary-container">简述</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">商品<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#feature-tab" data-tab="tab-surfaceBook">surfaceBook</a></li>
                        <li><a href="#feature-tab" data-tab="tab-Lumia650">lumia650</a></li>
                        <li><a href="#feature-tab" data-tab="tab-ipadPro">ipadPro</a></li>
                        <li><a href="#feature-tab" data-tab="tab-iPhone6s">iphone6s</a></li>
                        <li><a href="#feature-tab" data-tab="tab-iWatch">iWatch</a></li>
                    </ul>
                </li>
                <li><a href="#" data-toggle="modal" data-target="#about-modal">关于</a></li>
                <li>
                <li><a href="#" data-toggle="modal" data-target="#customerLoginInfo-modal"><%=customer.getName()%>
                </a></li>
                </li>
            </ul>
        </div>
    </div>
</div>


<!-- 广告轮播 -->
<div id="ad-carousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#ad-carousel" data-slide-to="0" class="active"></li>
        <li data-target="#ad-carousel" data-slide-to="1"></li>
        <li data-target="#ad-carousel" data-slide-to="2"></li>
        <li data-target="#ad-carousel" data-slide-to="3"></li>
        <li data-target="#ad-carousel" data-slide-to="4"></li>
    </ol>
    <div class="carousel-inner">
        <div class="item active">
            <img src="../images/hero-central-surface-1088x572.jpg" alt="1 slide">

            <div class="container">
                <div class="carousel-caption">
                    <h1>surfaceBook</h1>

                    <p>无论您喜爱编辑照片、信手涂画、制作音乐或创作精彩视频，Surface Book 总能在您灵感迸发时为您准备好所需的多项功能。</p>

                    <form action="customerConsumeBack.jsp" method="post">
                        <input type="submit" class="btn btn-primary" value="点击购买"/>
                        <input type="text" value="surfaceBook" name="buyT_name" class="hidden" />
                        <input type="text" value="<%=customer.getIdCard()%>" name="customerIdCard" class="hidden"/>
                        <input type="text" value="<%=customer.getPhone()%>" name="customerUserPhone" class="hidden"/>
                        <input type="text" value="<%=customer.getC_password()%>" name="customerUserPassword" class="hidden"/>
                    </form>
                </div>
            </div>
        </div>
        <div class="item">
            <img src="../images/Lumia650.PNG" alt="2 slide">

            <div class="container">
                <div class="carousel-caption">
                    <h1>Lumia650</h1>

                    <p>纤薄机身轻巧设计 金属Logo精致优雅,金属边框钻石切割 品质外观璀璨光华,搭载全新Windows系统。</p>

                    <form action="customerConsumeBack.jsp" method="post">
                        <input type="submit" class="btn btn-primary" value="点击购买"/>
                        <input type="text" value="Lumia650" name="buyT_name" class="hidden" />
                        <input type="text" value="<%=customer.getIdCard()%>" name="customerIdCard" class="hidden"/>
                        <input type="text" value="<%=customer.getPhone()%>" name="customerUserPhone" class="hidden"/>
                        <input type="text" value="<%=customer.getC_password()%>" name="customerUserPassword" class="hidden"/>
                    </form>
                </div>
            </div>
        </div>
        <div class="item">
            <img src="../images/ipadPro.PNG" alt="3 slide">

            <div class="container">
                <div class="carousel-caption">
                    <h1>ipadPro</h1>

                    <p>iPad Pro 不只是新一代的iPad，更体现了在个人电脑的新时代中，我们所执着的远景。它将一种超乎寻常的强大力量放到你的指尖之上，让即使是处理复杂的工作，也只需要点一点、扫一扫，或是动动笔就能完成。</p>

                    <form action="customerConsumeBack.jsp" method="post">
                        <input type="submit" class="btn btn-primary" value="点击购买"/>
                        <input type="text" value="ipadPro" name="buyT_name" class="hidden" />
                        <input type="text" value="<%=customer.getIdCard()%>" name="customerIdCard" class="hidden"/>
                        <input type="text" value="<%=customer.getPhone()%>" name="customerUserPhone" class="hidden"/>
                        <input type="text" value="<%=customer.getC_password()%>" name="customerUserPassword" class="hidden"/>
                    </form>
                </div>
            </div>
        </div>
        <div class="item">
            <img src="../images/iPhone6s.PNG" alt="4 slide">

            <div class="container">
                <div class="carousel-caption">
                    <h1>iPhone6s</h1>

                    <p>从你开始使用 iPhone 6s 的那一刻起，你就会感觉到它是如此不同。指尖一按，3D Touch 就能让你实现更多精彩。Live Photos 能以生动的方式，让你的回忆鲜活呈现。</p>

                    <form action="customerConsumeBack.jsp" method="post">
                        <input type="submit" class="btn btn-primary"  value="点击购买"/>
                        <input type="text" value="iPhone6s" name="buyT_name" class="hidden" />
                        <input type="text" value="<%=customer.getIdCard()%>" name="customerIdCard" class="hidden"/>
                        <input type="text" value="<%=customer.getPhone()%>" name="customerUserPhone" class="hidden"/>
                        <input type="text" value="<%=customer.getC_password()%>" name="customerUserPassword" class="hidden"/>
                    </form>
                </div>
            </div>
        </div>
        <div class="item">
            <img src="../images/iwatch.PNG" alt="5 slide">

            <div class="container">
                <div class="carousel-caption">
                    <h1>iWatch</h1>

                    <p>从功能到外观，Apple Watch 都不仅仅是一件你戴在手腕上的设备，更是一种不可或缺的自我表达。</p>

                    <form action="customerConsumeBack.jsp" method="post">
                        <input type="submit" class="btn btn-primary" value="点击购买"/>
                        <input type="text" value="iWatch" name="buyT_name" class="hidden" />
                        <input type="text" value="<%=customer.getIdCard()%>" name="customerIdCard" class="hidden"/>
                        <input type="text" value="<%=customer.getPhone()%>" name="customerUserPhone" class="hidden"/>
                        <input type="text" value="<%=customer.getC_password()%>" name="customerUserPassword" class="hidden"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <a class="left carousel-control" href="#ad-carousel" data-slide="prev"></a>
    <a class="right carousel-control" href="#ad-carousel" data-slide="next"></a>
</div>


<!-- 主要内容 -->
<div class="container summary">

    <!-- 简介 -->
    <div class="row" id="summary-container">
        <div class="col-md-4">
            <img class="img-rounded" src="../images/surfaceBook-logo.png" alt="surfaceBook">

            <h2>surfaceBook</h2>

            <p>无论您喜爱编辑照片、信手涂画、制作音乐或创作精彩视频，Surface Book 总能在您灵感迸发时为您准备好所需的多项功能。</p>

            <form action="customerConsumeBack.jsp" method="post">
                <input type="submit" class="btn btn-primary" value="点击购买"/>
                <input type="text" value="surfaceBook" name="buyT_name" class="hidden" />
                <input type="text" value="<%=customer.getIdCard()%>" name="customerIdCard" class="hidden"/>
                <input type="text" value="<%=customer.getPhone()%>" name="customerUserPhone" class="hidden"/>
                <input type="text" value="<%=customer.getC_password()%>" name="customerUserPassword" class="hidden"/>
            </form>
        </div>
        <div class="col-md-4">
            <img class="img-rounded" src="../images/Lumia650-logo.png" alt="Lumia650">

            <h2>Lumia650</h2>

            <p>纤薄机身轻巧设计 金属Logo精致优雅,金属边框钻石切割 品质外观璀璨光华,搭载全新Windows系统。</p>

            <form action="customerConsumeBack.jsp" method="post">
                <input type="submit" class="btn btn-primary" value="点击购买"/>
                <input type="text" value="Lumia650" name="buyT_name" class="hidden" />
                <input type="text" value="<%=customer.getIdCard()%>" name="customerIdCard" class="hidden"/>
                <input type="text" value="<%=customer.getPhone()%>" name="customerUserPhone" class="hidden"/>
                <input type="text" value="<%=customer.getC_password()%>" name="customerUserPassword" class="hidden"/>
            </form>
        </div>
        <div class="col-md-4">
            <img class="img-rounded" src="../images/ipadPro-logo-small.jpg" alt="ipadPro">

            <h2>ipadPro</h2>

            <p>iPad Pro 不只是新一代的iPad，更体现了在个人电脑的新时代中，我们所执着的远景。它将一种超乎寻常的强大力量放到你的指尖之上，让即使是处理复杂的工作，也只需要点一点、扫一扫，或是动动笔就能完成。</p>

            <form action="customerConsumeBack.jsp" method="post">
                <input type="submit" class="btn btn-primary" value="点击购买"/>
                <input type="text" value="ipadPro" name="buyT_name" class="hidden" />
                <input type="text" value="<%=customer.getIdCard()%>" name="customerIdCard" class="hidden"/>
                <input type="text" value="<%=customer.getPhone()%>" name="customerUserPhone" class="hidden"/>
                <input type="text" value="<%=customer.getC_password()%>" name="customerUserPassword" class="hidden"/>
            </form>
        </div>
    </div>

    <!-- 特性 -->

    <hr class="feature-divider">

    <ul class="nav nav-tabs" role="tablist" id="feature-tab">
        <li class="active"><a href="#tab-surfaceBook" role="tab" data-toggle="tab">surfaceBook</a></li>
        <li><a href="#tab-Lumia650" role="tab" data-toggle="tab">Lumia650</a></li>
        <li><a href="#tab-ipadPro" role="tab" data-toggle="tab">ipadPro</a></li>
        <li><a href="#tab-iPhone6s" role="tab" data-toggle="tab">iPhone6s</a></li>
        <li><a href="#tab-iWatch" role="tab" data-toggle="tab">iWatch</a></li>
    </ul>

    <div class="tab-content">
        <div class="tab-pane active" id="tab-surfaceBook">
            <div class="row feature">
                <div class="col-md-7">

                    <h2 class="feature-heading">surfaceBook<span
                            class="text-muted">新一代笔记本</span></h2>

                    <p class="lead">无论您喜爱编辑照片、信手涂画、制作音乐或创作精彩视频，Surface Book 总能在您灵感迸发时为您准备好所需的多项功能。</p>
                </div>
                <div class="col-md-5">
                    <img class="feature-image img-responsive" src="../images/surfaceBook-logo.png"
                         alt="surfaceBook">
                </div>
            </div>
        </div>
        <div class="tab-pane" id="tab-Lumia650">
            <div class="row feature">
                <div class="col-md-5">
                    <img class="feature-image img-responsive" src="../images/Lumia650-logo.png"
                         alt="Lumia650">
                </div>
                <div class="col-md-7">

                    <h2 class="feature-heading">Lumia650 <span class="text-muted">轻巧且方便</span>
                    </h2>

                    <p class="lead">纤薄机身轻巧设计 金属Logo精致优雅,金属边框钻石切割 品质外观璀璨光华,搭载全新Windows系统。</p>
                </div>
            </div>
        </div>
        <div class="tab-pane" id="tab-ipadPro">
            <div class="row feature">
                <div class="col-md-7">

                    <h2 class="feature-heading">ipadPro <span class="text-muted">不一样的iPad</span></h2>

                    <p class="lead">iPad Pro 不只是新一代的iPad，更体现了在个人电脑的新时代中，我们所执着的远景。它将一种超乎寻常的强大力量放到你的指尖之上，让即使是处理复杂的工作，也只需要点一点、扫一扫，或是动动笔就能完成。</p>
                </div>
                <div class="col-md-5">
                    <img class="feature-image img-responsive" src="../images/ipadPro-logo.jpg"
                         alt="ipadPro">
                </div>
            </div>
        </div>
        <div class="tab-pane" id="tab-iPhone6s">
            <div class="row feature">
                <div class="col-md-5">
                    <img class="feature-image img-responsive" src="../images/iPhone6s-logo.jpg"
                         alt="iPhone6s">
                </div>
                <div class="col-md-7">

                    <h2 class="feature-heading">iPhone6s <span class="text-muted">精美设计</span>
                    </h2>

                    <p class="lead">从你开始使用 iPhone 6s 的那一刻起，你就会感觉到它是如此不同。指尖一按，3D Touch 就能让你实现更多精彩。Live Photos 能以生动的方式，让你的回忆鲜活呈现。.</p>
                </div>
            </div>
        </div>
        <div class="tab-pane" id="tab-iWatch">
            <div class="row feature">
                <div class="col-md-7">

                    <h2 class="feature-heading">iWatch <span class="text-muted">小巧但实用</span></h2>

                    <p class="lead">从功能到外观，Apple Watch 都不仅仅是一件你戴在手腕上的设备，更是一种不可或缺的自我表达。</p>
                </div>
                <div class="col-md-5">
                    <img class="feature-image img-responsive" src="../images/iWatch-logo.jpg"
                         alt="iWatch">
                </div>
            </div>
        </div>
    </div>

    <!-- 关于 -->
    <div class="modal fade" id="about-modal" tabindex="-1" role="dialog" aria-labelledby="modal-label"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span
                            aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                    <h4 class="modal-title" id="modal-label">关于</h4>
                </div>
                <div class="modal-body">
                    <p>此页面属于一个测试页面，主要功能在于测试会员积分管理系统的内部逻辑是否正确。此页面包括几种样品商品信息，供客户选购，选购之后，通过管理系统查看客户的信息变化是否符合内部逻辑！</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">了解了</button>
                </div>
            </div>
        </div>
    </div>
</div>

<%--customerLoginInfo会员登录信息对话框--%>
<div class="modal fade" id="customerLoginInfo-modal" tabindex="-1" role="dialog" aria-labelledby="modal-label"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span
                        aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                <h4 class="customerLoginInfo-modal-title" id="customerLoginInfo-modal-label">登陆客户信息</h4>
            </div>
            <div class="modal-body" align="center">
                    <div class="control-group">
                        <label class="control-label" for="customerLoginInfoName">用户名</label>
                        <div class="controls">
                            <input disabled id="customerLoginInfoName" type="text" value="<%=customer.getName()%>"/><br>
                        </div>
                    </div>
                     <div class="control-group">
                         <label class="control-label" for="customerLoginInfoLevel">会员等级</label>
                         <div class="controls">
                             <input disabled id="customerLoginInfoLevel" type="text" value="<%=customer.getLevel()%>"/><br>
                         </div>
                    </div>
                     <div class="control-group">
                         <label class="control-label" for="customerLoginInfoMoney">余额</label>
                         <div class="controls">
                             <input disabled id="customerLoginInfoMoney" type="text" value="<%=customer.getMoney()%>"/><br>
                        </div>
                    </div>
                     <div class="control-group">
                         <label class="control-label" for="customerLoginInfoPoints">积分</label>
                        <div class="controls">
                            <input disabled id="customerLoginInfoPoints" type="text" value="<%=customer.getPoints()%>"/><br>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="customerLoginInfoDiscount">总折扣</label>
                        <div class="controls">
                            <input disabled id="customerLoginInfoDiscount" type="text" value="<%=customer.getTotalDiscount()%>"/>
                        </div>
                    </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>


<%@include file="Base/foot.jsp" %>
<script>
    $(function () {
        $('#ad-carousel').carousel();
        $('#menu-nav .navbar-collapse a').click(function (e) {
            var href = $(this).attr('href');
            var tabId = $(this).attr('data-tab');
            if ('#' !== href) {
                e.preventDefault();
                $(document).scrollTop($(href).offset().top - 70);
                if (tabId) {
                    $('#feature-tab a[href=#' + tabId + ']').tab('show');
                }
            }
        });
    });
</script>
</body>
</html>

