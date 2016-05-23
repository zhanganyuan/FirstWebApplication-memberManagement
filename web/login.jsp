<%--
  Created by IntelliJ IDEA.
  User: zay19
  Date: 5/16/2016
  Time: 8:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>会员积分管理系统</title>
    <%
        request.setCharacterEncoding("utf-8");//防止中文乱码
    %>
</head>
<body>
<h1 align="center">会员积分管理系统</h1><hr>
<form action="jsp/doLogin.jsp" name="regForm" method="post" align="center">
    <table>
        <tr>
            <tb>
                <label align="right">用户名：</label>
            </tb>
            <tb>
                <input type="text" name="username"/>
            </tb>
        </tr>
        <br>
        <br>
        <tr>
            <tb>
                <label align="right">密码：</label>
            </tb>
            <tb>
                <input type="password" name="password"/>
            </tb>
        </tr>
        <br>
        <br>
        <tr colspan="2">
            <input type="submit"  value="登录" />
        </tr>
        <br>
    </table>
</form>
 <h1><%=request.getParameter("hah")%></h1>

</body>
</html>
