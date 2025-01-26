<%--
  Created by IntelliJ IDEA.
  User: Chamith
  Date: 1/19/2025
  Time: 7:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <%-- sweetalert2 --%>
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.14.4/dist/sweetalert2.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script src="${pageContext.request.contextPath}/assets/lib/jquery-3.7.1.min.js"></script>

</head>
<body class="d-flex justify-content-center align-items-center vh-100 bg-light">
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-10 col-md-12">
            <div class="card shadow-lg border-0">
                <div class="row g-0">
                    <!-- Right Side: Image -->
                    <div class="col-lg-6 d-none d-lg-block order-lg-2">
                        <img src="assets/images/signUpImage.jpg"
                             alt="Sign-Up Illustration"
                             class="img-fluid rounded-end h-100"
                             style="object-fit: cover;">
                    </div>

                    <!-- Left Side: Sign-Up Form -->
                    <div class="col-lg-6 col-md-12 p-4 order-lg-1">
                        <h3 class="text-center mb-4">Sign Up</h3>
                        <p class="text-center mb-4">Create your account at <b>Bulky</b></p>

                        <!-- SweetAlert Message -->
                        <%
                            String message = request.getParameter("message");
                            String error = request.getParameter("error");

                            if (message != null) {
                        %>
                        <script>
                            Swal.fire({
                                icon: 'success',
                                title: 'Success',
                                text: '<%= message %>',
                                confirmButtonText: 'OK'
                            });
                        </script>
                        <%
                            }
                            if (error != null) {
                        %>
                        <script>
                            Swal.fire({
                                icon: 'error',
                                title: 'Error',
                                text: '<%= error %>',
                                confirmButtonText: 'OK'
                            });
                        </script>
                        <%
                            }
                        %>

                        <form action="signUp" method="post">
                            <div class="mb-2">
                                <label for="name" class="form-label">Name</label>
                                <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name" required>
                            </div>
                            <div class="mb-2">
                                <label for="username" class="form-label">Username</label>
                                <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required>
                                <small id="usernameMessage" style="color: red;"></small> <!-- Placeholder for dynamic messages -->
                            </div>
                            <div class="mb-2">
                                <label for="email" class="form-label">Email Address</label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                            </div>
                            <div class="mb-3">
                                <label for="mobileNumber" class="form-label">Mobile Number</label>
                                <div class="input-group">
                                    <!-- Country Code Dropdown -->
                                    <select class="form-select" id="countryCode" style="max-width: 150px;">
                                        <option value="+94" selected>+94 (Sri Lanka)</option>
                                        <option value="+1">+1 (USA)</option>
                                        <option value="+44">+44 (UK)</option>
                                        <option value="+91">+91 (India)</option>
                                        <option value="+81">+81 (Japan)</option>
                                        <option value="+61">+61 (Australia)</option>
                                        <option value="+86">+86 (China)</option>
                                        <option value="+33">+33 (France)</option>
                                    </select>
                                    <!-- Mobile Number Input -->
                                    <input type="tel" class="form-control" id="mobileNumber" name="mobileNumber" placeholder="Enter your mobile number" required pattern="[0-9]{4,12}">
                                </div>
                            </div>
                            <div class="mb-2">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                            </div>
                            <div class="mb-3">
                                <label for="confirmPassword" class="form-label">Confirm Password</label>
                                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm your password" required>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Sign Up</button>
                            <div class="text-center mt-3">
                                <span>Already have an account?</span> <a href="index.jsp" class="text-decoration-none">Sign In</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $("#username").on("keyup", function () {
            const username = $(this).val().trim();

            if (username.length > 0) {

                $.ajax({
                    url: "http://localhost:8080/E_Commerce_Web_Application_war_exploded/signUp", // Target the servlet
                    type: "GET",
                    data: { username: username }, // Pass the username as a query parameter
                    success: function (response) {
                        console.log("Server Response:", response);

                        const messageElement = $("#usernameMessage");

                        // Handle the server response (plain text response expected)
                        if (response === "true") {
                            messageElement.text("Username already exists!");
                        } else {
                            messageElement.text(""); // Clear the message if username is available
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error("Error occurred:", error);

                        // Show an error message for unexpected failures
                        $("#usernameMessage").text("Error checking username. Please try again later.");
                    },
                });
            } else {
                // Clear the message if the input field is empty
                $("#usernameMessage").text("");
            }
        });
    });
</script>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
