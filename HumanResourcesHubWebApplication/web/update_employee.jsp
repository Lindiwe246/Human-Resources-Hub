<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Employee</title>
    <link rel="stylesheet" href="CSS/update_employee.css">
</head>
<body>

    <header>
        <div class="logo">
            HR PRO
        </div>
    </header>


    <div class="form-container">
        <h2>Edit Employee Details</h2>
        <form action="UpdateServlet" method="POST">
            <input type="hidden" name="empId" value="${employee.id}" />
            
            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName" value="${employee.empFullname}" required />
            
            <label for="salary">Salary:</label>
            <input type="number" id="salary" name="salary" value="${employee.salary}" required />
            
            <label for="position">Position:</label>
            <input type="text" id="position" name="position" value="${employee.position}" required />
            
            <label for="department">Department:</label>
            <input type="text" id="department" name="department" value="${employee.department}" required />

            <label for="contact1">Contact 1:</label>
            <input type="text" id="contact1" name="contact1" value="${employee.contacts[2].contacts}" />

            <label for="contact2">Contact 2:</label>
            <input type="text" id="contact2" name="contact2" value="${employee.contacts[1].contacts}" />

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="${employee.contacts[0].contacts}" />

            <button type="submit">Update Employee</button>
        </form>
    </div>
</body>
</html>
