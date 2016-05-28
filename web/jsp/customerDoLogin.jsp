<%@ page import="Dao.CustomerDao" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: zay19
  Date: 5/27/2016
  Time: 2:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<%
    String userPhone = "";
    String password = "";
    userPhone = request.getParameter("customerUserPhone");
    password = request.getParameter("customerUserPassword");

    Boolean isRight = null;//查询用户名和密码是非正确

    try {
        isRight= CustomerDao.query(userPhone,password);
    } catch (SQLException e) {
        e.printStackTrace();
    }

    if(isRight){
        request.getRequestDispatcher("customerConsume.jsp").forward(request, response);
    }
    else {
        response.sendRedirect("customerLoginFailure.jsp");
    }


%>
