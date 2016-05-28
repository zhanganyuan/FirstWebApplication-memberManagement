<%@ page import="Dao.TradeDao" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: zay19
  Date: 5/27/2016
  Time: 1:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<%
    int t_id= Integer.parseInt(request.getParameter("t_idDelete"));
    try {
        TradeDao.deleteTrade(t_id);
    } catch (SQLException e) {
        e.printStackTrace();
    }

    request.getRequestDispatcher("manage.jsp").forward(request, response);



%>
