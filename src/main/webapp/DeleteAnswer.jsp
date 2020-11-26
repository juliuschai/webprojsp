<%-- 
    Document   : DeleteAnswer
    Created on : Nov 26, 2020, 2:53:59 PM
    Author     : KresnaAdhiPramana
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
    String id=request.getParameter("answer");
    String qid=request.getParameter("question");
    try
    {
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
        String data = "delete from answers where id = " + id;
        int i = stat.executeUpdate(data);
        out.println("Data Deleted Successfully!");
        response.sendRedirect("ViewAnswer.jsp?question=" + qid);
    }
    catch(Exception e)
    {
        System.out.print(e);
        e.printStackTrace();
    }
%>
