<%-- 
    Document   : NewQuestion
    Created on : Nov 23, 2020, 9:38:51 PM
    Author     : eric
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Question</title>
    </head>
    <body>
        <h2>New Question</h2>
   
        <form action="newQuestionServlet" method="post">
            Title:<input type="text" name="title">
            <br>
            Description:<input type="text" name="description">
            <br>
            <input type="submit" value="Post">
        </form>
    </body>
</html>

