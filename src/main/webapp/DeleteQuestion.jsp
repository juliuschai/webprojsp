<%-- 
    Document   : DeleteQuestion
    Created on : Nov 26, 2020, 2:44:58 PM
    Author     : eric, Julius
--%>

<%@page import="java.sql.*"%>
<%
    // user must be logged in middleware
    Integer userId = (Integer) session.getAttribute("id");
    if (userId == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>

<%
    String qid = request.getParameter("qid");
    String dbURL = System.getenv("JDBC_DATABASE_URL");
    Connection con = null;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection(dbURL);
    PreparedStatement stat = null;
    ResultSet res = null;

    // Owner middleware
    stat = con.prepareStatement("SELECT user_id FROM questions WHERE id = ?");
    stat.setString(1, qid);
    res = stat.executeQuery();

    res.next();
    int ownerId = res.getInt(1);

    if (Integer.valueOf(userId) != ownerId) {
        response.sendRedirect("Forum.jsp");
        return;
    }

    // delete answer
    stat = con.prepareStatement("delete from questions where id= ?");
    stat.setString(1, qid);
    int i = stat.executeUpdate();

    response.sendRedirect("MyQuestions.jsp");
%>