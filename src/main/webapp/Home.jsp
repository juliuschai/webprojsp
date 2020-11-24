<%-- 
    Document   : Home
    Created on : Nov 22, 2020, 10:51:25 AM
    Author     : Julius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Homepage</title>
    </head>
    <body>
        <%
            String uname = (String) session.getAttribute("name");
            if (uname != null) {
        %>
        <h1>Hello <%= uname%>!</h1>
        <a href="LogoutServlet">Logout</a>
        <% } else { %>
        <h1>Hello Guest!</h1>
        <a href="Login.jsp">Login</a>
        <a href="Register.jsp">Register</a>
        <% } %>
    </body>
</html>