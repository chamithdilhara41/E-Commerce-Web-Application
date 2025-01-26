<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Responsive Sign-In Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="d-flex justify-content-center align-items-center vh-100 bg-light">
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10">
            <div class="card shadow-lg border-0">
                <div class="row g-0">
                    <!-- Left Side: Image -->
                    <div class="col-lg-6 d-none d-lg-block order-lg-2">
                        <img src="assets/images/loginImage.jpg"
                             alt="Sign-Up Illustration"
                             class="img-fluid rounded-end h-100"
                             style="object-fit: cover;">
                    </div>

                    <!-- Right Side: Sign-In Form -->
                    <div class="col-lg-6 col-md-12 p-4">
                        <h1 class="text-center mb-4">Sign In</h1>
                        <p class="text-center mb-4">Welcome to <b>Bulky</b></p>
                        <form method="get" action="signIn">
                            <div class="mb-3">
                                <label for="username" class="form-label">Username</label>
                                <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                            </div>
                            <button type="submit" class="btn mt-3 btn-primary w-100">Sign In</button>
                            <div class="text-center mt-3">
                                <a href="${pageContext.request.contextPath}/forgetPassword.jsp" class="text-decoration-none">Forgot Password?</a>
                            </div>
                            <div class="text-center mt-3">
                                <span>Don't have an account? </span>
                                <a href="signUp.jsp" class="text-decoration-none">Sign Up</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<link rel="stylesheet" href="css/index.css">
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
