

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Outcome Page</title>
        <link rel="stylesheet" href="CSS/delete_outcome.css">
    </head>
    <%
        Long empId = (Long)request.getAttribute("empId");
        String message;
        if (empId != null){
            message = " The employee was successfully deleted.";
        }
        else{
            message = "Sorry! there's no employee with that ID.";
        }
    %>
    <body>
        <div class="navbar">
            <a href="index.html">Home</a>
            <a href="about.html">About us</a>
            <a href="help.html">Help</a>
            <a href="contact.html">Contact</a>
            <a href="dashboard.jsp">Dashboard</a>
            <a href="LogoutServlet.do">Logout</a>
        </div>
        
        <div class="delete-container">
            <div class="stat-item">
                <h1>Delete Outcome</h1>
            </div>
            <div class="outcome-message">
                <p>
                    <%=message%>
                </p>
                <a href="dashboard.jsp">Back to Dashboard</a>
            </div>
        </div>
    </body>
</html>