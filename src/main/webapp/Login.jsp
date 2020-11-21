<%-- 
    Document   : Login
    Created on : Nov 21, 2020, 3:34:48 PM
    Author     : Julius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h2>Login</h2>
        <form action="LoginServlet" method="post">
            Email:<input type="email" name="email">
            <br>
            Password: <input type="password" name="pass">
            <br>
            <input type="submit" value="Login">
        </form>
    </body>
</html>
