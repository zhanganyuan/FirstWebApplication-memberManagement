<%--
  Created by IntelliJ IDEA.
  User: zay19
  Date: 5/18/2016
  Time: 2:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>会员开卡</title>
</head>
<body>
<h1 align="center">会员开卡</h1>
<hr>
<form action="jsp/activeCardBack.jsp" name="activeCard" method="post" align="center">
    <table>
        <tr>
            <tb>姓名：</tb>
            <tb>
                <input type="text" name="name" />
            </tb>
        </tr>
        <br>
        <br>
        <tr>
            <tb>身份证号：</tb>
            <tb>
                <input type="text" name="idCard"/>
            </tb>
        </tr>
        <br>
        <br>
        <tr>
            <tb>手机号：</tb>
            <tb>
                <input type="tel" name="phone" />
            </tb>
        </tr>
        <br>
        <br>
        <tr>
            <tb colspan="2"><input type="submit" value="开卡" /></tb>
        </tr>
    </table>
</form>
<%
    if("true".equals(request.getParameterValues("isActive"))){
        %>
<script language="JavaScript">
    alert("开卡成功！");
</script>
<%
        request.setAttribute("isActive","false");
    }
%>

</body>
</html>
