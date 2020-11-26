<%-- 
    Document   : EditQuestion
    Author     : eric
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
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
    
        
                  <%  
                   String dbURL = "jdbc:mysql://localhost:3306/webprojsp?serverTimezone=UTC";
                    // Database name to access 
                    String dbUsername = "root";
                    String dbPassword = "";
                    Connection con = null;
                    Statement stat = null;
                    PreparedStatement stmt = null;
                    ResultSet res = null;

                    Class.forName("com.mysql.jdbc.Driver"); 
                    con = DriverManager.getConnection(dbURL,
                            dbUsername, dbPassword);
        
                %>
        
         <form action="updateQuestionServlet" method="post">
             <%
                 stat = con.createStatement();
                 String qid = request.getParameter("qid");
                 int num = Integer.parseInt(qid);
                 String data = "select * from questions where id='"+num+"'";
                 res = stat.executeQuery(data);
                 while(res.next()) {
                 %>
             <input type="hidden" name="id" value='<%=res.getString("id") %>' />
             <input type="hidden" name="user_id" value='<%=res.getString("user_id") %>' />
            New Title:<input type="text" name="title" value='<%=res.getString("title") %>'>
            <br>
            New Description:<input type="text" name="description" value='<%=res.getString("description") %>'>
            <br>
            <input type="submit" value="Update">
         </form>
            <% } %>
           
    </body>
</html>


