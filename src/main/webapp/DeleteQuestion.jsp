<%-- 
    Document   : DeleteQuestion
    Created on : Nov 26, 2020, 2:44:58 PM
    Author     : eric
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
  String qid = request.getParameter("qid");
  int num_qid = Integer.parseInt(qid);
  String dbURL = "jdbc:mysql://localhost:3306/webprojsp?serverTimezone=UTC";
   // Database name to access 
  String dbUsername = "root";
  String dbPassword = "";
  Connection con = null;
  Class.forName("com.mysql.jdbc.Driver"); 
  con = DriverManager.getConnection(dbURL, dbUsername, dbPassword);  

  Statement stat = con.createStatement();
  stat.executeUpdate("delete from questions where id='"+num_qid+"'");
  response.sendRedirect("MyQuestions.jsp");
%>