<%@ page import="module.Trade" %>
<%@ page import="Dao.TradeDao" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: zay19
  Date: 5/27/2016
  Time: 1:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>

<%
    String t_name=request.getParameter("addTradeT_name");
    double t_price= Double.parseDouble(request.getParameter("addTradeT_price"));

    Trade trade=new Trade();
    trade.setT_id(0);
    trade.setT_name(t_name);
    trade.setT_price(t_price);

    try {
        TradeDao.addTrade(trade);
    } catch (SQLException e) {
        e.printStackTrace();
    }

    request.getRequestDispatcher("manage.jsp").forward(request, response);



%>
