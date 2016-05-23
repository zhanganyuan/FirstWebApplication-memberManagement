<%@ page import="Dao.SaleDao" %>
<%@ page import="Dao.SupervisorDao" %>
<%@ page import="control.CustomerAction" %>
<%@ page import="module.Customer" %>
<%@ page import="module.Sale" %>
<%@ page import="module.Supervisor" %>
<%@ page import="module.Trade" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="Dao.TradeDao" %>
<%--
  Created by IntelliJ IDEA.
  User: zay19
  Date: 5/21/2016
  Time: 1:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>会员积分系统</title>
    <%@include file="Base/head.jsp" %>
    <%--<link href="http://www.francescomalagrino.com/BootstrapPageGenerator/3/css/bootstrap-combined.min.css" rel="stylesheet" media="screen">--%>

    <%
        request.setCharacterEncoding("utf-8");//防止中文乱码
    %>
    <link href="../css/my-style.css" rel="stylesheet">
</head>

<body>

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
            <a class="navbar-brand" href="#">会员积分管理系统</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#ad-carousel">会员开卡</a></li>
                <li><a href="#summary-container">会员信息</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">管理操作<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#feature-tab" data-tab="tab-customerInfo">会员信息管理</a></li>
                        <li><a href="#feature-tab" data-tab="tab-supervisorInfo">管理员信息管理</a></li>
                        <li class="divider"></li>
                        <li><a href="#feature-tab" data-tab="tab-saleInfo">积分策略管理</a></li>
                        <li><a href="#feature-tab" data-tab="tab-tradeInfo">销售管理</a></li>
                    </ul>
                </li>
                <li><a href="#" data-toggle="modal" data-target="#about-modal">关于</a></li>
            </ul>
        </div>
    </div>
</div>
<%--图片--%>

<img src="../images/img2.jpg" alt="无法显示图片" class="img-rounded" height="150" width="100%">

<!-- 中部会员信息管理 -->
<div class="container" id="LG">

    <!-- 特性 -->
    <hr class="feature-divider">

    <ul class="nav nav-tabs" role="tablist" id="feature-tab">
        <li class="active"><a href="#tab-customerInfo" role="tab" data-toggle="tab">会员信息</a></li>
        <li><a href="#tab-supervisorInfo" role="tab" data-toggle="tab">管理员信息管理</a></li>
        <li><a href="#tab-saleInfo" role="tab" data-toggle="tab">积分策略管理</a></li>
        <li><a href="#tab-tradeInfo" role="tab" data-toggle="tab">销售管理</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="tab-customerInfo">
            <div class="row feature">
                <!-- 搜索栏 -->
                <form class="form-search form-inline" action="" method="post">
                    <input name="idCard" class="input-medium search-query" type="text" placeholder="身份证号"/>
                    <input name="name" class="input-medium search-query" type="text" placeholder="姓名"/>
                    <input name="phone" class="input-medium search-query" type="text" placeholder="手机号"/>
                    <button type="submit" class="btn">查找</button>
                </form>
                <!-- 表格框 -->
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>
                            <input type="checkbox" value="checkAll">
                            全选
                        </th>
                        <th>
                            身份证号
                        </th>
                        <th>
                            姓名
                        </th>
                        <th>
                            手机号
                        </th>
                        <th>
                            总消费额(元)
                        </th>
                        <th>
                            会员等级(Level)
                        </th>
                        <th>
                            总积分
                        </th>
                        <th>
                            总折扣
                        </th>
                        <th>
                            余额(元)
                        </th>
                        <th>
                            操作
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- 打印会员信息表格 -->
                    <%
                        CustomerAction customerAction = new CustomerAction();
                        List<Customer> customers = null;
                        if (request.getParameter("name") != null) {
                            List<Map<String, Object>> params = new ArrayList<Map<String, Object>>();
                            Map<String, Object> map = new HashMap<String, Object>();
                            String name = request.getParameter("name");
                            String idCard = request.getParameter("idCard");
                            String phone = request.getParameter("phone");
                            if (!name.equals("")) {
                                map.put("name", "name");
                                map.put("relation", "like");
                                String nameValue = "\'%" + name + "%\'";
                                map.put("value", nameValue);
                            }
                            if (!idCard.equals("")) {
                                map.put("name", "idCard");
                                map.put("relation", "like");
                                String idCardValue = "\'%" + idCard + "%\'";
                                map.put("value", idCardValue);
                            }
                            if (!phone.equals("")) {
                                map.put("name", "phone");
                                map.put("relation", "like");
                                String phoneValue = "\'%" + phone + "%\'";
                                map.put("value", phoneValue);
                            }

                            params.add(map);
                            try {
                                customers = customerAction.query(params);
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        } else {
                            try {
                                customers = customerAction.query();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                        for (Customer customer :
                                customers
                                ) {
                            out.write("<tr>");
                            out.write("<td><input type=\"checkbox\" value=\"checkAll\"></td>");
                            out.write("<td>" + customer.getIdCard() + "</td>");
                            out.write("<td>" + customer.getName() + "</td>");
                            out.write("<td>" + customer.getPhone() + "</td>");
                            out.write("<td>" + customer.getConsumption() + "</td>");
                            out.write("<td>" + customer.getLevel() + "</td>");
                            out.write("<td>" + customer.getPoints() + "</td>");
                            out.write("<td>" + customer.getTotalDiscount() + "</td>");
                            out.write("<td>" + customer.getMoney() + "</td>");
//                            out.write("<from >\n" +
//                                    "<input class=\"hidden\" type=\"text\" name=\"idCardCopy\"  />\n" +
//                                    "<input type=\"submit\" value=\"修改会员信息\"/>\n" +
//                                    "</from>");
                    %>
                    <td>
                        <div class="btn-group">
                            <button class="btn dropdown-toggle" data-toggle="dropdown">
                                修改/删除
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li>
                                    <form action="editCustomerInnerPage.jsp" method="post"
                                          class="editCustomerInfo-submit">
                                        <input name="idCardEdit" value="<%=customer.getIdCard()%>" type="text"
                                               class="hidden">
                                        <input name="nameEdit" value="<%=customer.getName()%>" type="text"
                                               class="hidden">
                                        <a href="#" data-toggle="modal" data-target="#editCustomer-modal">
                                            <input type="submit" value="修改信息">
                                        </a>
                                    </form>
                                </li>
                                <li>
                                    <form action="deleteCustomer.jsp" method="post">
                                        <input name="idCardDelete" value="<%=customer.getIdCard()%>" type="text"
                                               class="hidden">
                                        <input type="submit" value="删除信息">
                                    </form>
                                </li>
                            </ul>
                        </div>
                    </td>

                    <%
                            /**
                             * 打印输出的时候赋值会出问题
                             */

                            //                            out.write("<td>" +
//                                    "<div class=\"btn-group\">\n" +
//                                    "                            <button class=\"btn dropdown-toggle\" data-toggle=\"dropdown\">\n" +
//                                    "                                操作\n" +
//                                    "                                <span class=\"caret\"></span>\n" +
//                                    "                            </button>\n" +
//                                    "                            <ul class=\"dropdown-menu\">\n" +
//                                    "                                <li>\n" +
//                                    "                                    <from action=\"editCustomer.jsp\" method=\"post\">\n" +
//                                    "                                        <input name=\"idCardEdit\" value=\"&lt;%=customer.getIdCard()%&gt;\" type=\"text\" class=\"hidden\"/>\n" +
//                                    "                                        <input type=\"submit\"  value=\"修改信息\"/>\n" +
//                                    "                                    </from>\n" +
//                                    "                                </li>\n" +
//                                    "                                <li>\n" +
//                                    "                                    <from action=\"deleteCustomer.jsp\" method=\"post\">\n" +
//                                    "                                        <input name=\"idCardDelete\" value=\"&lt;%customer.getIdCard()%&gt;\" type=\"text\"\n" +
//                                    "                                               class=\"hidden\"/>\n" +
//                                    "                                        <input type=\"submit\" value=\"删除会员\"/>\n" +
//                                    "                                    </from>\n" +
//                                    "                                </li>\n" +
//                                    "                            </ul>\n" +
//                                    "                        </div>" +
//                                    "</td>");
//                            out.write("</tr>");
                        }

                    %>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- 管理员信息管理 -->
        <div class="tab-pane" id="tab-supervisorInfo">
            <div class="row feature">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>
                            管理员编号
                        </th>
                        <th>
                            管理员用户名
                        </th>
                        <th>
                            管理员密码
                        </th>
                        <th>
                            操作
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        List<Supervisor> supervisors = null;
                        try {
                            supervisors = SupervisorDao.query();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                        for (Supervisor supervisor :
                                supervisors
                                ) {
                            out.write("<tr>");
                            out.write("<td>" + supervisor.getMid() + "</td>");
                            out.write("<td>" + supervisor.getManager() + "</td>");
                            out.write("<td>" + supervisor.getPassword() + "</td>");
                    %>
                    <td>
                        <div class="btn-group">
                            <button class="btn dropdown-toggle" data-toggle="dropdown">
                                修改/删除
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li>
                                    <form action="editSupervisor.jsp" method="post">
                                        <input name="midEdit" value="<%=supervisor.getMid()%>" type="text"
                                               class="hidden">
                                        <input type="submit" value="修改管理员信息">
                                    </form>
                                </li>
                                <li>
                                    <form action="deleteCustomer.jsp" method="post">
                                        <input name="midDelete" value="<%=supervisor.getMid()%>" type="text"
                                               class="hidden">
                                        <input type="submit" value="删除管理员信息">
                                    </form>
                                </li>
                            </ul>
                        </div>
                    </td>

                    <%
                            /**
                             * 打印输出value赋值会出问题
                             */
//                            out.write("<td>" +
//                                    "<div class=\"btn-group\">\n" +
//                                    "                            <button class=\"btn dropdown-toggle\" data-toggle=\"dropdown\">\n" +
//                                    "                                操作\n" +
//                                    "                                <span class=\"caret\"></span>\n" +
//                                    "                            </button>\n" +
//                                    "                            <ul class=\"dropdown-menu\">\n" +
//                                    "                                <li>\n" +
//                                    "                                    <from action=\"editSupervisor.jsp\" method=\"post\">\n" +
//                                    "                                        <input name=\"midEdit\" value=\"\"+&lt;%=supervisor.getMid()%&gt;+\"\" type=\"text\"\n" +
//                                    "                                               class=\"hidden\"/>\n" +
//                                    "                                        <input type=\"submit\" value=\"修改管理员\"/>\n" +
//                                    "                                    </from>\n" +
//                                    "                                </li>\n" +
//                                    "                                <li>\n" +
//                                    "                                    <from action=\"deleteSupervisor.jsp\" method=\"post\">\n" +
//                                    "                                        <input name=\"midDelete\" value=\"\"+&lt;%=supervisor.getMid()%&gt;+\"\" type=\"text\"\n" +
//                                    "                                               class=\"hidden\"/>\n" +
//                                    "                                        <input type=\"submit\" value=\"删除管理员\"/>\n" +
//                                    "                                    </from>\n" +
//                                    "                                </li>\n" +
//                                    "                            </ul>\n" +
//                                    "                        </div>" +
//                                    "</td>");
                            out.write("</tr>");
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
        <%-- 积分策略管理  --%>
        <div class="tab-pane" id="tab-saleInfo">
            <div class="row feature">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>
                            会员积分等级
                        </th>
                        <th>
                            会员等级折扣(消费额*this)
                        </th>
                        <th>
                            消费获得积分(消费额/this)
                        </th>
                        <th>
                            该等级积分上限(超过上限，会员等级上升）
                        </th>
                        <th>
                            操作
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        List<Sale> sales = null;
                        try {
                            sales = SaleDao.query();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                        for (Sale sale :
                                sales
                                ) {
                            out.write("<tr>");
                            out.write("<td>" + sale.getLevel() + "</td>");
                            out.write("<td>" + sale.getDiscount() + "</td>");
                            out.write("<td>" + sale.getIncPoints() + "</td>");
                            out.write("<td>" + sale.getTotalDiscount() + "</td>");
                    %>

                    <%--//修改ing--%>
                    <%--<td>--%>
                    <%--<div class="btn-group">--%>
                    <%--<button class="btn dropdown-toggle" data-toggle="dropdown">--%>
                    <%--修改/删除--%>
                    <%--<span class="caret"></span>--%>
                    <%--</button>--%>
                    <%--<ul class="dropdown-menu">--%>
                    <%--<li>--%>
                    <%--<form action="editSupervisor.jsp" method="post">--%>
                    <%--<input name="midEdit" value="<%=supervisor.getMid()%>" type="text"--%>
                    <%--class="hidden">--%>
                    <%--<input type="submit" value="修改管理员信息">--%>
                    <%--</form>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                    <%--<form action="deleteCustomer.jsp" method="post">--%>
                    <%--<input name="midDelete" value="<%=supervisor.getMid()%>" type="text"--%>
                    <%--class="hidden">--%>
                    <%--<input type="submit" value="删除管理员信息">--%>
                    <%--</form>--%>
                    <%--</li>--%>
                    <%--</ul>--%>
                    <%--</div>--%>
                    <%--</td>--%>

                    <%
                            out.write("</tr>");
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>


        <%-- 销售物品管理 --%>
        <div class="tab-pane" id="tab-tradeInfo">
            <div class="row feature">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>
                            消费ID
                        </th>
                        <th>
                            消费名称
                        </th>
                        <th>
                            消费金额
                        </th>
                        <th>
                            操作
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        List<Trade> trades = null;
                        try {
                            trades = TradeDao.query();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                        for (Trade trade :
                                trades
                                ) {
                            out.write("<tr>");
                            out.write("<td>" + trade.getT_id() + "</td>");
                            out.write("<td>" + trade.getT_name() + "</td>");
                            out.write("<td>" + trade.getT_price() + "</td>");
                    %>

                    <%--//修改ing--%>
                    <%--<td>--%>
                    <%--<div class="btn-group">--%>
                    <%--<button class="btn dropdown-toggle" data-toggle="dropdown">--%>
                    <%--修改/删除--%>
                    <%--<span class="caret"></span>--%>
                    <%--</button>--%>
                    <%--<ul class="dropdown-menu">--%>
                    <%--<li>--%>
                    <%--<form action="editSupervisor.jsp" method="post">--%>
                    <%--<input name="midEdit" value="<%=supervisor.getMid()%>" type="text"--%>
                    <%--class="hidden">--%>
                    <%--<input type="submit" value="修改管理员信息">--%>
                    <%--</form>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                    <%--<form action="deleteCustomer.jsp" method="post">--%>
                    <%--<input name="midDelete" value="<%=supervisor.getMid()%>" type="text"--%>
                    <%--class="hidden">--%>
                    <%--<input type="submit" value="删除管理员信息">--%>
                    <%--</form>--%>
                    <%--</li>--%>
                    <%--</ul>--%>
                    <%--</div>--%>
                    <%--</td>--%>

                    <%
                            out.write("</tr>");
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>


    </div>
</div>

<!--   -->


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
                <p>
                    此系统主要面向系统管理员，提供给会员开卡、修改会员信息、查询会员信息、会员退卡、修改积分模式以及消费模式、修改商品种类等功能。并且附带一定的面向
                    用户的功能以测试内部逻辑的正确。
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">了解了</button>
            </div>
        </div>
    </div>
</div>


<!-- 修改用户信息 -->
<div class="modal fade" id="editCustomer-modal" tabindex="-1" role="dialog" aria-labelledby="modal-label"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span
                        aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                <h4 class="modal-title" id="editCustomer-modal-label">修改会员信息</h4>
            </div>
            <div class="modal-body">

                <!-- 修改信息 -->
                <form class="form-horizontal form-signin" action="editCustomer.jsp" method="post" name="regFrom">
                    <!-- 参数无法传递进来 -->
                    <div class="control-group">
                        <div class="controls">
                            <input disabled class=" input-block-level" type="text" id="editCustomerName"
                                   placeholder="<%=request.getParameter("nameEdit")%>" name="editCustomerName"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <input disabled class=" input-block-level" type="text" id="editCustomerIdCard"
                                   placeholder="<%=request.getParameter("idCardEdit")%>" name="editCustomerIdCard"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <input class=" input-block-level" type="text" id="editCustomerPhone" placeholder="修改手机号"
                                   name="editCustomerPhone"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <div class="controls">
                            <input class=" input-block-level" type="text" id="editCustomerPassword" placeholder="修改密码"
                                   name="editCustomerPassword"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <input class=" input-block-level" type="text" id="editCustomerMoney" placeholder="修改余额"
                                   name="editCustomerMoney"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <button type="submit" class="btn btn-large btn-primary">确定修改</button>
                        </div>
                    </div>
                </form>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>


</body>
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
<%--<script type="text/javascript" src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/jquery-2.0.0.min.js"></script>--%>
<%--<script type="text/javascript" src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/jquery-ui"></script>--%>
<%--<script type="text/javascript" src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/bootstrap.min.js"></script>--%>

</html>





