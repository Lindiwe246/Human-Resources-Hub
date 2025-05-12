<%@page import="za.ac.tut.entities.Manager" %>
<%
    Manager manager = (Manager) session.getAttribute("manager");
    if (manager == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HR PRO - Admin Dashboard</title>
    <link rel="stylesheet" href="CSS/dashboard.css">
</head>
<body>
    <div class="dashboard-container">
        <!-- Header -->
        <header class="dashboard-header">
            <div class="logo">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                    <path d="M12 2C6.48 2 2 6.48..."/>
                </svg>
                HR PRO
            </div>
            
            <nav class="user-nav">
                <a href="index.html">Home</a>
                <a href="about.html">About Us</a>
                <a href="help.html">Help</a>
                <a href="contact.html">Contact</a>
                <a href="LogoutServlet.do">Logout</a>
                <div class="user-profile">
                    <div class="user-avatar"><%= manager.getFullNames().charAt(0) %></div>
                    <span><%= manager.getFullNames() %></span>
                </div>
            </nav>
        </header>
        
        <!-- Welcome Section -->
        <section class="welcome-section">
            <h1 class="welcome-title">Welcome, <%= manager.getFullNames() %></h1>
            <p class="welcome-subtitle">HR Admin Dashboard</p>
        </section>
        
        <!-- Dashboard Actions -->
        <div class="dashboard-grid">
            <div class="dashboard-card" onclick="location.href='create.html'">
                <div class="card-icon">+</div>
                <h3 class="card-title">Add Employee</h3>
                <p class="card-description">Add new employees to the system</p>
            </div>
            
            <div class="dashboard-card" onclick="location.href='update.html'">
                <div class="card-icon">?</div>
                <h3 class="card-title">Update Records</h3>
                <p class="card-description">Edit existing employee information</p>
            </div>
            
            <div class="dashboard-card" onclick="location.href='search.html'">
                <div class="card-icon">?</div>
                <h3 class="card-title">Search</h3>
                <p class="card-description">Find employee records</p>
            </div>
            
            <div class="dashboard-card" onclick="location.href='view_all.html'">
                <div class="card-icon">##</div>
                <h3 class="card-title">View All Employees</h3>
                <p class="card-description">View all employees records</p>
            </div>
            
            <div class="dashboard-card" onclick="location.href='delete.html'">
                <div class="card-icon">??</div>
                <h3 class="card-title">Delete</h3>
                <p class="card-description">Remove employee records</p>
            </div>
        </div>
        
        <!-- Profile Section -->
        <section class="profile-section">
            <div class="profile-picture">
                <div class="profile-avatar"><%= manager.getFullNames().charAt(0) %></div>
            </div>
            <div class="profile-info">
                <h2 class="profile-name"><%= manager.getFullNames() %></h2>
                <p class="profile-role">HR Administrator</p>
                <p class="profile-email"><%= manager.getEmail() %></p>
                
                <div class="profile-stats">
                    <div class="stat-item">
                        <div class="stat-number">142</div>
                        <div class="stat-label">Employees</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">8</div>
                        <div class="stat-label">Departments</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">24</div>
                        <div class="stat-label">New Hires</div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</body>
</html>