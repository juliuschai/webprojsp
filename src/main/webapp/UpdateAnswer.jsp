<%-- 
    Document   : UpdateAnswer
    Created on : Nov 26, 2020, 11:23:01 AM
    Author     : KresnaAdhiPramana
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.interpixel.webprojsp.Answer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Answer</title>
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body>
        <%  
            String answer = request.getParameter("answer");
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
            String data = "select * from answers where id = " + answer;
            res = stat.executeQuery(data);
            
            while(res.next()){
        %>
        <div class="container">
            <h2 class="text-center mb-3">Update Answer</h2>
            <a href="ViewAnswer.jsp?question=<%=res.getString("question_id")%>" class="btn btn-link my-3">Back</a>
            
            <form action="UpdateAnswerServlet" method="post">
                <div class="form-group">
                    <label for="inputAnswer">Answer</label>
                    <textarea name="answer" class="form-control" id="inputAnswer" rows="3" value="<%=res.getString("answer")%>" placeholder="<%=res.getString("answer")%>"></textarea>
                </div>
                <input type="hidden" id="answer_id" name="answer_id" value="<%=res.getString("id")%>">
                <input type="hidden" id="question_id" name="question_id" value="<%=res.getString("question_id")%>">
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>   
        <%}%>
        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    </body>
</html>
