document.addEventListener('DOMContentLoaded', function() {
    // Set user profile info (you can get this from your session)
    const manager = JSON.parse(sessionStorage.getItem('manager') || { 
        fullNames: 'Admin', 
        email: 'admin@hrpro.com' 
    };
    
    if (manager) {
        document.getElementById('userAvatar').textContent = manager.fullNames.charAt(0);
        document.getElementById('usernameDisplay').textContent = manager.fullNames;
    }

    const searchForm = document.getElementById('searchForm');
    const updateForm = document.getElementById('updateForm');
    
    if (searchForm) {
        searchForm.addEventListener('submit', function(e) {
            e.preventDefault();
            const employeeId = document.getElementById('employeeId').value;
            
            fetch('FindEmployeeServlet', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: `employeeId=${encodeURIComponent(employeeId)}`
            })
            .then(response => response.json())
            .then(data => {
                const messageContainer = document.getElementById('messageContainer');
                messageContainer.innerHTML = '';
                
                if (data.error) {
                    showMessage(data.error, 'error');
                } else {
                    // Populate form with employee data
                    document.getElementById('updateEmployeeId').value = data.id;
                    document.getElementById('fullName').value = data.fullName || '';
                    document.getElementById('email').value = data.email || '';
                    document.getElementById('phone').value = data.phone || '';
                    document.getElementById('department').value = data.department || '';
                    document.getElementById('position').value = data.position || '';
                    document.getElementById('salary').value = data.salary || '';
                    document.getElementById('gender').value = data.gender || 'Male';
                    
                    // Show update section
                    document.getElementById('updateSection').style.display = 'block';
                    showMessage('Employee found. Please update the details below.', 'success');
                }
            })
            .catch(error => {
                showMessage('An error occurred while searching for the employee', 'error');
                console.error('Error:', error);
            });
        });
    }
    
    if (updateForm) {
        updateForm.addEventListener('submit', function(e) {
            e.preventDefault();
            const formData = new FormData(this);
            
            fetch('UpdateEmployeeServlet', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                const messageContainer = document.getElementById('messageContainer');
                messageContainer.innerHTML = '';
                
                if (data.success) {
                    showMessage(data.success, 'success');
                } else if (data.error) {
                    showMessage(data.error, 'error');
                }
            })
            .catch(error => {
                showMessage('An error occurred while updating the employee', 'error');
                console.error('Error:', error);
            });
        });
    }
    
    function showMessage(message, type) {
        const container = document.getElementById('messageContainer');
        const messageDiv = document.createElement('div');
        messageDiv.className = `message ${type}-message`;
        messageDiv.textContent = message;
        container.appendChild(messageDiv);
        
        // Clear message after 5 seconds
        setTimeout(() => {
            messageDiv.remove();
        }, 5000);
    }
});