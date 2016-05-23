<%@ page import="control.CustomerAction" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: zay19
  Date: 5/22/2016
  Time: 2:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("utf-8");
%>

<%
    String idCard = "";
    idCard = request.getParameter("idCardDelete");
    CustomerAction customerAction = new CustomerAction();
    try {
        customerAction.delCustomer(idCard);
    } catch (SQLException e) {
        e.printStackTrace();
    }
    request.getRequestDispatcher("manage.jsp").forward(request, response);
%>

