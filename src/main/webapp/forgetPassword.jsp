<%--
  Created by IntelliJ IDEA.
  User: Chamith
  Date: 1/19/2025
  Time: 9:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forget Password</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="d-flex justify-content-center align-items-center vh-100 bg-light">
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-10 col-md-12">
            <div class="card shadow-lg border-0">
                <div class="row g-0">
                    <!-- Right Side: Image -->
                    <div class="col-lg-6 d-none d-lg-block order-lg-2">
                        <img src="assets/images/forgotPassword.png"
                             alt="Forget Password Illustration"
                             class="img-fluid rounded-end h-100"
                             style="object-fit: cover;">
                    </div>

                    <!-- Left Side: Forget Password Form -->
                    <div class="col-lg-6 col-md-12 p-4 order-lg-1 d-flex flex-column justify-content-center align-items-center">
                        <h3 class="text-center mb-4">Forget Password</h3>
                        <p class="text-center mb-4">Enter your email address, and we’ll send you a OTP code to reset your password.</p>
                        <form class="w-100" style="max-width: 400px;">
                            <div class="mb-3">
                                <label for="email" class="form-label">Email Address</label>
                                <input type="email" class="form-control" id="email" placeholder="Enter your email" required>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Reset Password</button>
                            <div class="text-center mt-3">
                                <a href="index.jsp" class="text-decoration-none">Back to Login</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
