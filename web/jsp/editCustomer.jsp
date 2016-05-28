<%@ page import="control.CustomerAction" %>
<%@ page import="module.Customer" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: zay19
  Date: 5/22/2016
  Time: 2:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


    <%
        request.setCharacterEncoding("utf-8");
    %>

<%

    String idCardEdit="";
    String editCustomerPhone="";
    String editCustomerPassword="";
    String editCustomerMoney="";
    idCardEdit=request.getParameter("editCustomerIdCard");
    editCustomerPhone=request.getParameter("editCustomerPhone");
    editCustomerPassword=request.getParameter("editCustomerPassword");
    editCustomerMoney=request.getParameter("editCustomerMoney");
    CustomerAction customerAction=new CustomerAction();
    List<Customer> customers=new ArrayList<Customer>();
    Map<String,Object> param=new HashMap<String, Object>();
    param.put("name","idCard");
    param.put("relation","=");
    param.put("value",idCardEdit);
    List<Map<String,Object>> params=new ArrayList<Map<String, Object>>();
    params.add(param);

    try {
        customers=customerAction.query(params);
    } catch (SQLException e) {
        e.printStackTrace();
    }

    Customer customer=customers.get(0);

    customer.setPhone(editCustomerPhone);
    customer.setC_password(editCustomerPassword);
    customer.setMoney(Double.valueOf(editCustomerMoney));

    try {
        customerAction.editCustomer(customer);
    } catch (SQLException e) {
        e.printStackTrace();
    }
    request.getRequestDispatcher("manage.jsp").forward(request, response);



%>



