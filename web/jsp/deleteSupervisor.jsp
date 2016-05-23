<%@ page import="Dao.SupervisorDao" %>
<%@ page import="module.Supervisor" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%--
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
    Integer midDelete;
    midDelete = Integer.valueOf(request.getParameter("midDelete"));
    List<Supervisor> supervisors = null;
    try {
        supervisors = SupervisorDao.query();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    /**
     * 管理员数目大于1时才允许删除
     */
    if (supervisors.size() > 1) {
        try {
            SupervisorDao.delSupervisor(midDelete);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    request.getRequestDispatcher("manage.jsp").forward(request, response);
%>


