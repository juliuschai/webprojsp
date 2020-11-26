<%-- 
    Document   : MyQuestions
    Author     : eric
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.interpixel.webprojsp.Question"%>
<%@page import="javax.servlet.http.HttpSession"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>My Questions: </h2>
        <a href="NewQuestion.jsp">Add New Question</a>
        <br>
        <br>
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
                    
                    int logged_user = (Integer) session.getAttribute("id");
                    String data = "select * from questions where user_id='"+logged_user+"'";
                    res = stat.executeQuery(data);
                    
                    while(res.next()){  
                %>
               
                 <tr>
                    <td>Title: <%=res.getString("title")%></td>
                </tr>
                 <tr>
                    <td><%=res.getString("description")%> </td>
                </tr>
                <tr>
                    <td>
                        <a href ='EditQuestion.jsp?qid=<%=res.getString("id")%>' > Edit </a>
                    </td>
                </tr>
                <tr>
                    <td><a href="#">View Answers</a></td>
                </tr>
                <tr>
                    <td> <br> </td>
                </tr>
                <%}%>
 
        </table>
        
    </body>
</html>