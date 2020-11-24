<%-- 
    Document   : NewAnswer
    Created on : Nov 24, 2020, 12:56:38 PM
    Author     : KresnaAdhiPramana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Answer</title>
    </head>
    <body>
        <h2>New Answer</h2>
   
        <form action="NewAnswerServlet" method="post">
            Answer:<input type="text" name="answer">
            <br>
            <input type="submit" value="Post">
        </form>
    </body>
</html>
