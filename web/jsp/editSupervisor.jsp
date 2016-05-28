<%@ page import="module.Supervisor" %>
<%@ page import="Dao.SupervisorDao" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: zay19
  Date: 5/22/2016
  Time: 3:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <%
        request.setCharacterEncoding("utf-8");
    %>

<%
    int mid;
    String manager="";
    String password="";
    mid= Integer.parseInt(request.getParameter("editSupervisorMid"));
    manager=request.getParameter("editSupervisorName");
    password=request.getParameter("editSupervisorPassword");

    Supervisor supervisor=new Supervisor();
    supervisor.setMid(mid);
    supervisor.setPassword(password);
    supervisor.setManager(manager);

    try {
        SupervisorDao.updateSupervisor(supervisor);
    } catch (SQLException e) {
        e.printStackTrace();
    }

    request.getRequestDispatcher("manage.jsp").forward(request, response);


%>