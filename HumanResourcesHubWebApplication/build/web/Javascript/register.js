document.getElementById('registrationForm').addEventListener('submit', function (e) {
    e.preventDefault();

    // Reset error messages
    document.querySelectorAll('.error-message').forEach(el => {
        el.style.display = 'none';
    });

    let isValid = true;

    const employeeId = document.getElementById('employeeId').value.trim();
    const fullName = document.getElementById('fullName').value.trim();
    const email = document.getElementById('email').value.trim();
    const password = document.getElementById('password').value;

    if (!/^[A-Za-z0-9-]{5,}$/.test(employeeId)) {
        document.getElementById('idError').style.display = 'block';
        isValid = false;
    }

    if (fullName.length < 3) {
        document.getElementById('nameError').style.display = 'block';
        isValid = false;
    }

    if (!/\S+@\S+\.\S+/.test(email)) {
        document.getElementById('emailError').style.display = 'block';
        isValid = false;
    }

    if (password.length < 8) {
        document.getElementById('passwordError').style.display = 'block';
        isValid = false;
    }

    if (isValid) {
        e.target.submit();
    }
});

document.getElementById('password').addEventListener('input', function () {
    const strengthBar = document.getElementById('passwordStrength');
    const val = this.value;
    let strength = 0;

    if (val.length >= 8) strength += 1;
    if (/[A-Z]/.test(val)) strength += 1;
    if (/[0-9]/.test(val)) strength += 1;
    if (/[\W]/.test(val)) strength += 1;

    const colors = ['#e74c3c', '#f39c12', '#3498db', '#27ae60'];
    const widths = ['25%', '50%', '75%', '100%'];

    strengthBar.style.width = widths[strength - 1] || '0';
    strengthBar.style.backgroundColor = colors[strength - 1] || '#e74c3c';
});
