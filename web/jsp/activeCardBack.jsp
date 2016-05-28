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

    <%
        request.setCharacterEncoding("utf-8");
    %>

<%
    Customer customer = new Customer();
    customer.setName(request.getParameter("addCustomerName"));
    customer.setIdCard(request.getParameter("addCustomerIdCard"));
    customer.setPhone(request.getParameter("addCustomerPhone"));
    customer.setMoney(Double.valueOf(request.getParameter("addCustomerMoney")));
    customer.setC_password(request.getParameter("addCustomerPassword"));
    CustomerAction customerAction = new CustomerAction();
    try {
        customerAction.addCustomer(customer);
    } catch (SQLException e) {
        e.printStackTrace();
    }
//    request.setAttribute("isActive", "true");
    request.getRequestDispatcher("manage.jsp").forward(request, response);
    //身份证同号的报错处理
%>



