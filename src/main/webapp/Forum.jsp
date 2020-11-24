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
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Forum: </h2>
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
                    <td><%=res.getString("description")%> </td>
                </tr>
                 <tr>
                     <td> <br> </td>
                </tr>
                <%}%>
 
        </table>
 
    </body>
</html>
