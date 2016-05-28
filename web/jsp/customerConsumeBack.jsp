<%@ page import="Dao.TradeDao" %>
<%@ page import="control.CustomerAction" %>
<%@ page import="module.Customer" %>
<%@ page import="module.Trade" %>
<%@ page import="java.sql.SQLException" %>
<%--
  Created by IntelliJ IDEA.
  User: zay19
  Date: 5/28/2016
  Time: 3:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");

%>
<%
    String customerIdCard = request.getParameter("customerIdCard");
    String buyT_name = request.getParameter("buyT_name");

    /**
     * 查询消费的客户
     */
    CustomerAction customerAction = new CustomerAction();
    Customer customer = null;
    try {
        customer = customerAction.query(customerIdCard);
    } catch (SQLException e) {
        e.printStackTrace();
    }

    /**
     * 查询消费的物品
     */
    Trade trade = null;
    try {
        trade = TradeDao.query(buyT_name);
    } catch (SQLException e) {
        e.printStackTrace();
    }

    /**
     * 消费
     */
    try {
        customerAction.consume(customer.getIdCard(), trade.getT_price());
    } catch (SQLException e) {
        e.printStackTrace();
    }


    request.getRequestDispatcher("customerConsume.jsp").forward(request, response);


%>