<%--
  Created by IntelliJ IDEA.
  User: zay19
  Date: 5/21/2016
  Time: 4:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>会员积分管理系统</title>

    <%--<%@include file="Base/head.jsp" %>--%>
    <link href="../css/my-style.css" rel="stylesheet">

    <%--<link href="http://www.francescomalagrino.com/BootstrapPageGenerator/3/css/bootstrap-combined.min.css" rel="stylesheet" media="screen">--%>

</head>
<body>

<div class="container">
    <form class="form-horizontal form-signin" action="doLogin.jsp" method="post" name="regFrom">
        <h3 class="form-signin-heading"><strong> 会员积分管理系统</strong><br>
            <hr>
            <small>管理员登录界面</small>
        </h3>
        <div class="control-group">
            <div class="controls">
                <div class="input-prepend">
                    <span class="add-on"><i class="icon-user"></i></span>
                    <input class=" input-block-level" type="text" id="inputUsername" placeholder="用户名" name="username"/>
                </div>
            </div>
        </div>

        <div class="control-group">
            <div class="controls">

                <input class=" input-block-level" type="password" id="inputPassword" placeholder="密码" name="password"/>
            </div>
        </div>
        <div class="control-group">
            <div class="controls">
                <label class="checkbox">
                    <input type="checkbox">记住用户名和密码
                </label>
                <button type="submit" class="btn btn-large btn-primary">登录</button>
            </div>
        </div>
    </form>
</div>


</body>
<%--<%@include file="Base/foot.jsp" %>--%>
<script type="text/javascript" src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/jquery-ui"></script>
<script type="text/javascript" src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/bootstrap.min.js"></script>
</html>
