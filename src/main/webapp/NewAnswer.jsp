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
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <h2 class="text-center mb-3">New Answer</h2>
            <a href="Forum.jsp" class="btn btn-link my-3">Back</a>
            
            <form action="NewAnswerServlet" method="post">
                <div class="form-group">
                    <label for="inputAnswer">Answer</label>
                    <textarea name="answer" class="form-control" id="inputAnswer" placeholder="Enter your answer here" rows="3"></textarea>
                </div>
                <input type="hidden" id="question_id" name="question_id" value="<%= request.getParameter("question") %>">
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    </body>
</html>
