<%-- 
    Document   : update
    Created on : May 4, 2025, 12:25:20 AM
    Author     : Lindi
--%>

<%@page import="za.ac.tut.entities.Employee"%>
<%@page import="za.ac.tut.entities.Contacts"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Employee - HR PRO</title>
    <link rel="stylesheet" href="CSS/update_employee.css">
</head>
<body>
    <div class="dashboard-container">
        <!-- Header -->
        <header class="dashboard-header">
            <div class="logo">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                    <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 3c1.66 0 3 1.34 3 3s-1.34 3-3 3-3-1.34-3-3 1.34-3 3-3zm0 14.2c-2.5 0-4.71-1.28-6-3.22.03-1.99 4-3.08 6-3.08 1.99 0 5.97 1.09 6 3.08-1.29 1.94-3.5 3.22-6 3.22z"/>
                </svg>
                HR PRO
            </div>
            
            <nav class="user-nav">
                <a href="index.html">Home</a>
                <a href="about.html">About Us</a>
                <a href="help.html">Help</a>
                <a href="contact.html">Contact</a>
                <a href="index.html">Logout</a>
                <div class="user-profile">
                    <div class="user-avatar">S</div>
                    <span>Admin</span>
                </div>
            </nav>
        </header>

        <!-- Main Content -->
        <main class="content-wrapper">
            <h1 class="page-title">Update Employee Details</h1>
            
            <div class="card update-card">
                <form action="UpdateServlet" method="POST" id="updateForm">
                    <input type="hidden" name="staffno" value="${employee.id}">
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="fullnames">Full Name</label>
                            <input type="text" id="fullnames" name="fullnames" 
                                   value="${employee.empFullname}" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="salary">Salary</label>
                            <input type="number" id="salary" name="salary" step="0.01" 
                                   value="${employee.salary}" required>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="position">Position</label>
                            <input type="text" id="position" name="position" 
                                   value="${employee.position}">
                        </div>
                        
                        <div class="form-group">
                            <label for="department">Department</label>
                            <input type="text" id="department" name="department" 
                                   value="${employee.department}">
                        </div>
                    </div>
                    
                    <div class="contact-section">
                        <h3>Contact Information</h3>
                        
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" 
                                   value="<%= getContactValue((Employee)request.getAttribute("employee"), "email") %>" required>
                        </div>
                        
                        <div class="form-row">
                            <div class="form-group">
                                <label for="phoneNo">Phone Number</label>
                                <input type="tel" id="phoneNo" name="phoneNo" 
                                       value="<%= getContactValue((Employee)request.getAttribute("employee"), "phone") %>">
                            </div>
                            
                            <div class="form-group">
                                <label for="altPhone">Alternate Phone</label>
                                <input type="tel" id="altPhone" name="altPhone" 
                                       value="<%= getContactValue((Employee)request.getAttribute("employee"), "altPhone") %>">
                            </div>
                        </div>
                    </div>
                    
                    <button type="submit" class="btn btn-update">Update Employee</button>
                </form>
                
                <% if (request.getAttribute("error") != null) { %>
                    <div class="error-message">${error}</div>
                <% } %>
                
                <% if (request.getAttribute("success") != null) { %>
                    <div class="success-message">${success}</div>
                <% } %>
            </div>
        </main>
    </div>
</body>
</html>

<%!
    private String getContactValue(Employee employee, String type) {
        if (employee == null || employee.getContacts() == null) {
            return "";
        }
        
        List<Contacts> contacts = employee.getContacts();
        if (contacts.size() < 3) return "";
        
        switch(type.toLowerCase()) {
            case "email": return contacts.get(2).getContacts(); // Email is third in list
            case "phone": return contacts.get(0).getContacts(); // Phone is first
            case "altphone": return contacts.get(1).getContacts(); // Alt phone is second
            default: return "";
        }
    }
%>
