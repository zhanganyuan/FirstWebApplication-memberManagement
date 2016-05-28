<%--
  Created by IntelliJ IDEA.
  User: zay19
  Date: 5/27/2016
  Time: 2:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>客户登陆界面</title>
        <%@include file="Base/head.jsp" %>
        <link href="../css/my-style.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <form class="form-horizontal form-signin" action="customerDoLogin.jsp" method="post" name="regFrom">
        <h3 class="form-signin-heading"><strong>会员积分管理系统</strong><br>
            <hr>
            <small>客户登陆界面</small>
        </h3>
        <div class="control-group">
            <div class="controls">
                <div class="input-prepend">
                    <span class="add-on"><i class="icon-user"></i></span>
                    <input class=" input-block-level" type="text" id="inputUserPhone" placeholder="手机号" name="customerUserPhone"/>
                </div>
            </div>
        </div>

        <div class="control-group">
            <div class="controls">

                <input class=" input-block-level" type="password" id="inputPassword" placeholder="密码" name="customerUserPassword"/>
            </div>
        </div>
        <div class="control-group">
            <div class="controls">
                <button type="submit" class="btn btn-large btn-primary">登录</button>
            </div>
        </div>
    </form>
</div>


</body>
<%@include file="Base/foot.jsp" %>
</html>
