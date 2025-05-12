<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Outcome</title>
    <!-- Link to External CSS File -->
    <link rel="stylesheet" href="CSS/update_employee.css">
</head>
<body>

    <!-- Header Section -->
    <header>
        <div class="logo">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 3c1.66 0 3 1.34 3 3s-1.34 3-3 3-3-1.34-3-3 1.34-3 3-3zm0 14.2c-2.5 0-4.71-1.28-6-3.22.03-1.99 4-3.08 6-3.08 1.99 0 5.97 1.09 6 3.08-1.29 1.94-3.5 3.22-6 3.22z"/>
            </svg>
            HR PRO
        </div>
        <div class="navbar">
            <a href="index.html">Home</a>
            <a href="about.html">About us</a>
            <a href="help.html">Help</a>
            <a href="contact.html">Contact</a>
            <a href="dashboard.jsp">Dashboard</a>
            <a href="LogoutServlet.do">Logout</a>
        </div>
    </header>

 
    <div class="outcome-container">
        <h1>Employee Update Successful</h1>
        <p>The information for employee <strong>${fullName}</strong> has been successfully updated.</p>
        <p><strong>Employee ID:</strong> ${empId}</p>
        <p><strong>Position:</strong> ${position}</p>
        <p><strong>Department:</strong> ${department}</p>
        <p><strong>Salary:</strong> ${salary}</p>
        <p><strong>Contact 1:</strong> ${contact1}</p>
        <p><strong>Contact 2:</strong> ${contact2}</p>
        <p><strong>Email:</strong> ${email}</p>

        <a href="update.html" class="button">Go Back to Update Form</a>
    </div>

</body>
</html>
