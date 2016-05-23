<%@ page import="module.Customer" %>
<%@ page import="control.CustomerAction" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: zay19
  Date: 5/18/2016
  Time: 2:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>activeCard</title>
    <%
        request.setCharacterEncoding("utf-8");
    %>
</head>
<body>
<%
    Customer customer = new Customer();
    customer.setName(request.getParameter("name"));
    customer.setIdCard(request.getParameter("idCard"));
    customer.setPhone(request.getParameter("phone"));
    CustomerAction customerAction = new CustomerAction();
    try {
        customerAction.addCustomer(customer);
    } catch (SQLException e) {
        e.printStackTrace();
    }
    request.setAttribute("isActive", "true");
    request.getRequestDispatcher("activeCard.jsp").forward(request, response);
    //身份证同号的报错处理
%>


</body>
</html>
