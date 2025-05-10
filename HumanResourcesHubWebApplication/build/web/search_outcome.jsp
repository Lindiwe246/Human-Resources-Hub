<%-- 
    Document   : search_outcome
    Created on : 10 May 2025, 11:50:22 PM
    Author     : mabhe
--%>
<%-- 
    Document   : search_outcome
    Created on : 10 May 2025, 11:50:22 PM
    Author     : mabhe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Outcome Page</title>
        <link rel="stylesheet" href="CSS/search_outcome.css">
    </head>
    <body>
        <div class="navbar">
            <a href="index.html">Home</a>
            <a href="about.html">About us</a>
            <a href="help.html">Help</a>
            <a href="contact.html">Contact</a>
            <a href="dashboard.jsp">Dashboard</a>
        </div>
        
        <div class="search-container">
            <div class="stat-item">
                <h1>Search Outcome</h1>
            </div>
            <div class="outcome-message">
                <%
                    Long empId = (Long)request.getAttribute("empId");
                %>
                <p>
                    The employee with ID: <span class="highlight-text"><%=empId%></span> has been found
                </p>
                <a href="dashboard.jsp" class="back-button">Back to Dashboard</a>
            </div>
        </div>
    </body>
</html>