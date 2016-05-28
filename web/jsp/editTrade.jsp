<%@ page import="module.Trade" %>
<%@ page import="Dao.TradeDao" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: zay19
  Date: 5/27/2016
  Time: 1:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<%
    int t_id;
    String t_name;
    double t_price;
    t_id= Integer.parseInt(request.getParameter("editTradeT_id"));
    t_name=request.getParameter("editTradeT_name");
    t_price= Double.parseDouble(request.getParameter("editTradeT_price"));

    Trade trade=new Trade();
    trade.setT_id(t_id);
    trade.setT_name(t_name);
    trade.setT_price(t_price);

    try {
        TradeDao.updateTrade(trade);
    } catch (SQLException e) {
        e.printStackTrace();
    }

    request.getRequestDispatcher("manage.jsp").forward(request, response);


%>
