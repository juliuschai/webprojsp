<%-- 
    Document   : Forum
    Created on : Nov 24, 2020, 9:53:43 PM
    Author     : eric
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.interpixel.webprojsp.Question"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forum</title>
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body>
        <h2>Forum: </h2>
        <a href="NewQuestion.jsp" class="btn btn-primary">Add New Question</a>
        <a href="MyQuestions.jsp" class="btn btn-danger">My Questions</a>
        <table>
                <%  
                   String dbURL = "jdbc:mysql://localhost:3306/webprojsp?serverTimezone=UTC";
                    // Database name to access 
                    String dbUsername = "root";
                    String dbPassword = "";
                    Connection con = null;
                    Statement stat = null;
                    ResultSet res = null;

                    Class.forName("com.mysql.jdbc.Driver"); 
                    con = DriverManager.getConnection(dbURL,
                            dbUsername, dbPassword);
                    
                    stat = con.createStatement();
                    String data = "select * from questions";
                    res = stat.executeQuery(data);
                    
                    while(res.next()){  
                %>
                <tr>
                    <td>Id: <%=res.getString("id")%></td>
                 </tr>
                 <tr>
                    <td>Title: <%=res.getString("title")%></td>
                </tr>
                 <tr>
                    <td><%=res.getString("description")%></td>
                </tr>
                <tr>
                    <td><a href="ViewAnswer.jsp?question=<%=res.getString("id")%>" class="btn btn-success">View Answers</a></td>
                </tr>
                <tr>
                    <td> <br> </td>
                </tr>
                <%}%>
        </table>    
        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    </body>
</html>
