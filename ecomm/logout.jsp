<%@ page import="javax.servlet.*, javax.servlet.http.*" %>
<%
    session.invalidate(); // End the session
    response.sendRedirect("login.html");
%>