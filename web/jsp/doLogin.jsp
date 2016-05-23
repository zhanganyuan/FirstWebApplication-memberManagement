<%@ page import="Dao.SupervisorDao" %>
<%@ page import="java.sql.SQLException" %>
<%--
  Created by IntelliJ IDEA.
  User: zay19
  Date: 5/18/2016
  Time: 12:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("utf-8");
%>

<%
    String username = "";
    String password = "";
    username = request.getParameter("username");
    password = request.getParameter("password");

    Boolean isRight = null;//查询用户名和密码是非正确
    try {
        isRight = SupervisorDao.query(username, password);
    } catch (SQLException e) {
        e.printStackTrace();
    }
    if (isRight) {
        request.getRequestDispatcher("manage.jsp").forward(request, response);
    } else {
        response.sendRedirect("loginFailure.jsp");
    }
%>


