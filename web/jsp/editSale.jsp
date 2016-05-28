<%@ page import="module.Sale" %>
<%@ page import="Dao.SaleDao" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: zay19
  Date: 5/27/2016
  Time: 1:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<%
    int level;
    float discount;
    int incPoints;
    double totalDiscount;

    level= Integer.parseInt(request.getParameter("editSaleLevel"));
    discount= Float.parseFloat(request.getParameter("editSaleDiscount"));
    incPoints= Integer.parseInt(request.getParameter("editSaleIncPoints"));
    totalDiscount= Double.parseDouble(request.getParameter("editSaleTotalDiscount"));

    Sale sale=new Sale();
    sale.setLevel(level);
    sale.setDiscount(discount);
    sale.setIncPoints(incPoints);
    sale.setTotalDiscount(totalDiscount);

    try {
        SaleDao.updateSale(sale);
    } catch (SQLException e) {
        e.printStackTrace();
    }

    request.getRequestDispatcher("manage.jsp").forward(request, response);



%>
