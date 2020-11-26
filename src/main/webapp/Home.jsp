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
        <h5>Welcome to our website</h5>
        <a href="Forum.jsp">Forum</a>
        <a href="LogoutServlet">Logout</a>
        <% } else { %>
        <h1>Hello Guest!</h1>
        <h5>Please login or register first</h5>
        <a href="Login.jsp">Login</a>
        <a href="Register.jsp">Register</a>
        <% } %>
    </body>
</html>
