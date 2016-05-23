<%--
  Created by IntelliJ IDEA.
  User: zay19
  Date: 5/18/2016
  Time: 1:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>会员积分管理系统</title>
    <style>
        ul
        {
            list-style-type:none;
            margin:0;
            padding:0;
            overflow:hidden;
        }
        li
        {
            float:left;
        }
        a:link,a:visited
        {
            display:block;
            width:120px;
            font-weight:bold;
            color:#FFFFFF;
            background-color:#bebebe;
            text-align:center;
            padding:4px;
            text-decoration:none;
            text-transform:uppercase;
        }
        a:hover,a:active
        {
            background-color:#cc0000;
        }

    </style>
</head>
<body>
<h1 align="center">会员积分管理系统</h1>
<hr>
<form>
<ul>
    <li><a href="#home">首页</a></li>
    <li><a href="activeCard.jsp">会员开卡</a></li>
    <li><a href="#contact">会员信息</a></li>
    <li><a href="#about">会员退卡</a></li>
</ul>
</form>



</body>
</html>


