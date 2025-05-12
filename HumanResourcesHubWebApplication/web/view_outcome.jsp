
<%@page import="za.ac.tut.entities.Contacts"%>
<%@page import="za.ac.tut.entities.Employee"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Employees</title>
    <link rel="stylesheet" href="CSS/view_all_outcome.css">
</head>
<body class="employee-view-page">
    <div class="employee-navbar">
        <a href="index.html">Home</a>
        <a href="about.html">About us</a>
        <a href="help.html">Help</a>
        <a href="contact.html">Contact</a>
        <a href="dashboard.html">Dashboard</a>
        <a href="LogoutServlet.do">Logout</a>
    </div>
    
    <div class="employee-view-container">
        <h1 class="employee-view-title">All Employees</h1>

        <table class="employee-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Full Name</th>
                    <th>Department</th>
                    <th>Salary</th>
                    <th>Position</th>
                    <th>Creation Date</th>
                    <th>Email</th>
                    <th>Contact 1</th>
                    <th>Contact 2</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Employee> employeeList = (List<Employee>)request.getAttribute("employee");
                    for(Employee emp : employeeList){
                        List<Contacts> contacts = emp.getContacts();
                        String email = contacts.size() > 0 ? contacts.get(0).getContacts() : "N/A";
                        String contact1 = contacts.size() > 1 ? contacts.get(1).getContacts() : "N/A";
                        String contact2 = contacts.size() > 2 ? contacts.get(2).getContacts() : "N/A";
                %>
                <tr>
                    <td><%=emp.getId()%></td>
                    <td><%=emp.getEmpFullname()%></td>
                    <td><%=emp.getDepartment()%></td>
                    <td><%=emp.getSalary()%></td>
                    <td><%=emp.getPosition()%></td>
                    <td><%=emp.getCreationDate()%></td>
                    <td><%=email%></td>
                    <td><%=contact1%></td>
                    <td><%=contact2%></td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <a href="dashboard.jsp" class="employee-back-link">Back to Dashboard</a>
    </div>
</body>
</html>