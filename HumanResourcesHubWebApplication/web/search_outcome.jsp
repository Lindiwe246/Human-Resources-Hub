
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
            <a href="LogoutServlet.do">Logout</a>
        </div>
        
        <div class="search-container">
            <div class="stat-item">
                <h1>Search Outcome</h1>
            </div>
            <div class="outcome-message">
                <%
                    Long empId = (Long)request.getAttribute("empId");
                    String message = "";
                   if (empId == null) {
                           message = "There's no employee with that id";
                       } else {
                           message = "The employee with ID: " + empId + " has been found";
                       }
                    
                %>
                <p>
                    <%=message%>
                </p>
                
                <a href="dashboard.jsp" class="back-button">Back to Dashboard</a>
            </div>
        </div>
    </body>
</html>