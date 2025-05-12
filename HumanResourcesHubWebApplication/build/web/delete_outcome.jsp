<%-- 
    Document   : delete_outcome
    Created on : 10 May 2025, 5:20:15 PM
    Author     : mabhe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Outcome Page</title>
        <link rel="stylesheet" href="CSS/delete_outcome.css">
    </head>
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
                    The employee was <span class="success-text">successfully</span> deleted.
                </p>
                <a href="dashboard.jsp">Back to Dashboard</a>
            </div>
        </div>
    </body>
</html>