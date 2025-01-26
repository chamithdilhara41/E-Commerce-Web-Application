<%@ page import="java.util.List" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.ecommercewebapplication.entity.Product" %>
<%@ page import="lk.ijse.ecommercewebapplication.entity.Category" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Base64" %><%--
  Created by IntelliJ IDEA.
  User: Chamith
  Date: 1/21/2025
  Time: 10:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <!-- Include Bootstrap CSS for styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

    <%-- sweetalert2 --%>
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.14.4/dist/sweetalert2.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        .card {
            margin: 15px 0;
        }
        .stats-card {
            text-align: center;
            background-color: #f8f9fa;
            border: 1px solid #e3e6f0;
            border-radius: 5px;
            padding: 20px;
            color: #4e73df;
        }
        .stats-card h5 {
            font-size: 18px;
            margin-bottom: 10px;
        }
        .stats-card p {
            font-size: 24px;
            font-weight: bold;
        }
        .section-title {
            margin-top: 30px;
            margin-bottom: 20px;
            color: #333;
            font-weight: 600;
        }
    </style>
</head>
<body>
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <!-- Brand Text (Centered in Navbar) -->
        <a class="navbar-brand mx-auto" id="manageDashboardLink" style="font-size: 1.2rem;">
            <b>Bulky</b>
        </a>
        <!-- Toggle for Mobile -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
            <!-- Center-aligned Links -->
            <ul class="navbar-nav mx-auto justify-content-center">
                <li class="nav-item"><a class="nav-link" id="manageProductsLink">Manage Products</a></li>
                <li class="nav-item"><a class="nav-link" id="manageCategoriesLink">Manage Categories</a></li>
                <li class="nav-item"><a class="nav-link" id="manageOrdersLink">Manage Orders</a></li>
                <li class="nav-item"><a class="nav-link" id="manageUsersLink">Manage Users</a></li>
            </ul>
            <!-- Right-aligned Logout Link -->
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link text-danger" href="index.jsp">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Main Content -->
<section id="dashboard" class="section-content">
<div class="container mt-5">
    <h1 class="text-center">Welcome, Admin!</h1>

    <!-- Statistics Section -->
    <div class="row mt-4">
        <div class="col-md-3">
            <div class="stats-card">
                <h5>Total Products</h5>
                <p>${productCount}</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stats-card">
                <h5>Total Categories</h5>
                <p>${categoryCount}</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stats-card">
                <h5>Total Orders</h5>
                <p>${orderCount}</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stats-card">
                <h5>Total Customers</h5>
                <p>${userCount}</p>
            </div>
        </div>
    </div>

    <!-- Manage Sections -->
    <h2 class="section-title">Manage Your Platform</h2>
    <div class="row">
        <div class="col-md-6 mb-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Manage Products</h5>
                    <p class="card-text">Add, update, delete, or view all products in the catalog.</p>
                    <a href="manage_products.jsp" class="btn btn-primary">Go to Products</a>
                </div>
            </div>
        </div>
        <div class="col-md-6 mb-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Manage Categories</h5>
                    <p class="card-text">Add, update, delete, or view all product categories.</p>
                    <a href="manage_categories.jsp" class="btn btn-primary">Go to Categories</a>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 mb-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Manage Orders</h5>
                    <p class="card-text">View and manage all customer orders.</p>
                    <a href="manage_orders.jsp" class="btn btn-primary">Go to Orders</a>
                </div>
            </div>
        </div>
        <div class="col-md-6 mb-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Manage Users</h5>
                    <p class="card-text">View, activate, or deactivate customer accounts.</p>
                    <a href="manage_users.jsp" class="btn btn-primary">Go to Users</a>
                </div>
            </div>
        </div>
    </div>
</div>
</section>

<%-- Product section --%>
<section id="manage-products" class="section-content">
    <div class="container mt-5">
        <!-- Page Header -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1 class="h3">Manage Products</h1>
            <button class="btn btn-primary" data-bs-toggle="modal" onclick="loadCategories()" data-bs-target="#addProductModal">Add New Product</button>
        </div>

        <!-- Product Table -->
        <table class="table table-striped table-hover" border="1">
            <thead class="table-dark">
            <tr>
                <th>#Id</th>
                <th>Product Name</th>
                <th>Category</th>
                <th>Price</th>
                <th>QTY</th>
                <th>Image</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                // Database connection setup
                String dbUrl = "jdbc:mysql://localhost:3307/ecommerce";
                String dbUser = "root";
                String dbPassword = "Ijse@123";

                Connection connection = null;
                PreparedStatement pstmt = null;
                ResultSet resultSet = null;

                String query1 = "SELECT id, name, category, price, qty, image FROM products";
                try {
                    // Initialize the connection
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

                    // Execute query
                    pstmt = connection.prepareStatement(query1);
                    resultSet = pstmt.executeQuery();

                    // Loop through results and generate rows
                    while (resultSet.next()) {
                        int id = resultSet.getInt("id");
                        String name = resultSet.getString("name");
                        String category = resultSet.getString("category");
                        double price = resultSet.getDouble("price");
                        int qty = resultSet.getInt("qty");
                        Blob imageBlob = resultSet.getBlob("image");

                        // Convert image blob to Base64 string
                        String base64Image = "";
                        if (imageBlob != null) {
                            byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                            base64Image = Base64.getEncoder().encodeToString(imageBytes);
                        }
            %>
            <tr>
                <td><%= id %></td>
                <td><%= name %></td>
                <td><%= category %></td>
                <td>$<%= String.format("%.2f", price) %></td>
                <td><%= qty %></td>
                <td>
                    <% if (!base64Image.isEmpty()) { %>
                    <img src="data:image/jpeg;base64,<%= base64Image %>" alt="<%= name %> Image" style="max-width: 100px;">
                    <% } else { %>
                    No Image
                    <% } %>
                </td>
                <td>
                    <button class="btn btn-warning btn-sm edit-product-btn"
                            data-id="<%= id %>"
                            data-name="<%= name %>"
                            data-category="<%= category %>"
                            data-price="<%= price %>"
                            data-stock="<%= qty %>"
                            data-image="<%= base64Image %>"
                            data-bs-toggle="modal"
                            data-bs-target="#editProductModal"
                    >
                        Edit
                    </button>
                    <button class="btn btn-danger btn-sm delete-btn" data-id="<%= id %>">Delete</button>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    //out.println("<tr><td colspan='7' style='color: red;'>Error loading products: " + e.getMessage() + "</td></tr>");
                } finally {
                    // Close resources
                    if (resultSet != null) try { resultSet.close(); } catch (SQLException ignored) {}
                    if (pstmt != null) try { pstmt.close(); } catch (SQLException ignored) {}
                    if (connection != null) try { connection.close(); } catch (SQLException ignored) {}
                }
            %>
            </tbody>
        </table>

        <!-- Edit Product Modal -->
        <div class="modal fade" id="editProductModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="editProduct" method="POST" enctype="multipart/form-data">
                        <div class="modal-header">
                            <h5 class="modal-title">Edit Product</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" name="productId" id="editProductId">
                            <div class="mb-3">
                                <label for="editProductName" class="form-label">Product Name</label>
                                <input type="text" class="form-control" name="productName" id="editProductName" required>
                            </div>
                            <div class="mb-3">
                                <label for="editCategory" class="form-label">Category</label>
                                <select name="category" id="editCategory" class="form-control" required>
                                    <option value="" disabled>Select a category</option>
                                    <%--<%
                                        String categoryQuery = "SELECT id, name FROM categories";
                                        pstmt = connection.prepareStatement(categoryQuery);
                                        resultSet = pstmt.executeQuery();
                                        while (resultSet.next()) {
                                            int categoryId = resultSet.getInt("id");
                                            String categoryName = resultSet.getString("name");
                                    %>
                                    <option value="<%= categoryId %>"><%= categoryName %></option>
                                    <%  }
                                    %>--%>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="editPrice" class="form-label">Price</label>
                                <input type="number" class="form-control" name="price" id="editPrice" step="0.01" required>
                            </div>
                            <div class="mb-3">
                                <label for="editQTY" class="form-label">Stock</label>
                                <input type="number" class="form-control" name="qty" id="editQTY" required>
                            </div>
                            <div class="mb-3">
                                <label for="editProductImage" class="form-label">Product Image</label>
                                <input type="file" class="form-control" name="productImage" id="editProductImage" accept="image/*">
                                <div class="mt-2">
                                    <img id="editProductImagePreview" src="#" alt="Image Preview" style="max-width: 100px; display: none;">
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-success">Save Changes</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Add Product Modal -->
        <div class="modal fade" id="addProductModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addProduct" method="POST" enctype="multipart/form-data">
                        <div class="modal-header">
                            <h5 class="modal-title">Add New Product</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="addProductName" class="form-label">Product Name</label>
                                <input type="text" class="form-control" name="productName" id="addProductName" required>
                            </div>
                            <div class="mb-3">
                                <label for="addProductCategory" class="form-label">Category</label>
                                <select name="category" id="addProductCategory" class="form-control" required>
                                    <option value="" disabled selected>Select a category</option>
                                    <!-- Categories will be dynamically populated here -->

                                </select>
                            </div>

                            <script>
                                function loadCategories() {
                                    // Fetch categories from the servlet
                                    fetch("addCategory")
                                        .then(response => response.json())
                                        .then(data => {
                                            const categorySelect = document.getElementById("addProductCategory");

                                            // Clear previous options
                                            categorySelect.innerHTML = "";

                                            // Add default "Select Category" option
                                            const defaultOption = document.createElement("option");
                                            defaultOption.value = "";
                                            defaultOption.text = "Select Category";
                                            defaultOption.disabled = true;
                                            defaultOption.selected = true;
                                            categorySelect.appendChild(defaultOption);

                                            // Add fetched categories to the dropdown
                                            if (data.categorySelect && data.categorySelect.length > 0) {
                                                data.categorySelect.forEach(category => {
                                                    const option = document.createElement("option");
                                                    option.value = category;
                                                    option.text = category;
                                                    categorySelect.appendChild(option);
                                                });
                                            } else {
                                                // If no categories are found, add "No Categories Available"
                                                const noCategoriesOption = document.createElement("option");
                                                noCategoriesOption.value = "";
                                                noCategoriesOption.text = "No Categories Available";
                                                noCategoriesOption.disabled = true;
                                                categorySelect.appendChild(noCategoriesOption);
                                            }
                                        })
                                        .catch(error => console.error("Error fetching categories:", error));
                                }
                            </script>
                            <div class="mb-3">
                                <label for="addPrice" class="form-label">Price</label>
                                <input type="number" class="form-control" name="price" id="addPrice" step="0.01" required>
                            </div>
                            <div class="mb-3">
                                <label for="addStock" class="form-label">Stock</label>
                                <input type="number" class="form-control" name="qty" id="addStock" required>
                            </div>
                            <div class="mb-3">
                                <label for="addProductImage" class="form-label">Product Image</label>
                                <input type="file" class="form-control" name="productImage" id="addProductImage" accept="image/*" required>
                                <div class="mt-2">
                                    <img id="addProductImagePreview" src="#" alt="Image Preview" style="max-width: 100px; display: none;">
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Add Product</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    // Function to preview the image before upload
    document.getElementById("addProductImage").addEventListener("change", function(event) {
        const file = event.target.files[0];
        const reader = new FileReader();
        reader.onload = function(e) {
            const imagePreview = document.getElementById("addProductImagePreview");
            imagePreview.src = e.target.result;
            imagePreview.style.display = "block";
        };
        if (file) {
            reader.readAsDataURL(file);
        }
    });
</script>

<%-- Catagery section --%>
<section id="manage-categories" class="section-content">
    <div class="container mt-5">
        <!-- Page Header -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1 class="h3">Manage Categories</h1>
            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addCategoryModal">Add New Category</button>
        </div>

        <!-- Categories Table -->
        <table class="table table-striped table-hover" border="1">
            <thead class="table-dark">
            <tr>
                <th>#Id</th>
                <th>Category Name</th>
                <th>Image</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <%


                try {
                    // Load the MySQL driver
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Connect to the database
                    connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

                    // SQL query to fetch categories
                    String query = "SELECT id, name, image FROM categories";
                    pstmt = connection.prepareStatement(query);
                    resultSet = pstmt.executeQuery();

                    // Loop through the result set and display rows
                    while (resultSet.next()) {
                        int id = resultSet.getInt("id");
                        String name = resultSet.getString("name");
                        Blob imageBlob = resultSet.getBlob("image");

                        // Convert Blob to Base64 string
                        String base64Image = "";
                        if (imageBlob != null) {
                            byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                            base64Image = java.util.Base64.getEncoder().encodeToString(imageBytes);
                        }
            %>
            <tr>
                <td><%= id %></td>
                <td><%= name %></td>
                <td>
                    <% if (!base64Image.isEmpty()) { %>
                    <img src="data:image/jpeg;base64,<%= base64Image %>" alt="<%= name %> Image" style="max-width: 100px;">
                    <% } else { %>
                    No Image
                    <% } %>
                </td>
                <td>
                    <!-- Edit Button -->
                    <button class="btn btn-warning btn-sm edit-btn"
                            data-id="<%= id %>"
                            data-name="<%= name %>"
                            data-image="<%= base64Image %>"
                            data-bs-toggle="modal"
                            data-bs-target="#editCategoryModal">
                        Edit
                    </button>

                    <!-- Delete Button -->
                    <form id="deleteForm" action="editCategory" method="GET" style="display: inline;">
                        <input type="hidden" name="deleteCategoryId" value="<%= id %>">
                        <button type="submit" class="btn btn-danger btn-sm delete-btn">Delete</button>
                    </form>

                    <!-- SweetAlert2 Library -->
                    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

                    <script>
                        // Add an event listener to the delete button
                        document.querySelector('.delete-btn').addEventListener('click', function (event) {
                            // Prevent the default form submission
                            event.preventDefault();

                            // Show SweetAlert2 confirmation dialog
                            Swal.fire({
                                title: 'Are you sure?',
                                text: "You won't be able to revert this!",
                                icon: 'warning',
                                showCancelButton: true,
                                confirmButtonColor: '#d33',
                                cancelButtonColor: '#3085d6',
                                confirmButtonText: 'Yes, delete it!'
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    // Submit the form programmatically
                                    document.getElementById('deleteForm').submit();
                                }
                            });
                        });
                    </script>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (resultSet != null) try { resultSet.close(); } catch (SQLException e) {}
                    if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
                    if (connection != null) try { connection.close(); } catch (SQLException e) {}
                }
            %>
            </tbody>
        </table>

        <!-- Edit Category Modal -->
        <div class="modal fade" id="editCategoryModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">

                    <form action="editCategory" method="POST" enctype="multipart/form-data">

                        <div class="modal-header">
                            <h5 class="modal-title">Edit Category</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="editCategoryId" class="form-label">Category ID</label>
                                <input type="text" class="form-control" name="editCategoryId" id="editCategoryId" readonly>
                            </div>

                            <div class="mb-3">
                                <label for="editCategoryName" class="form-label">Category Name</label>
                                <input type="text" class="form-control" name="editCategoryName" id="editCategoryName" required>
                            </div>

                            <div class="mb-3">
                                <label for="editCategoryImage" class="form-label">Insert Category Image</label>
                                <input type="file" class="form-control" name="editCategoryImage" id="editCategoryImage" accept="image/*">
                                <div class="mt-2">
                                    <!-- Small image preview -->
                                    <img id="modalCategoryImagePreview" src="#" alt="Image Preview" style="max-width: 100px; display: none;">
                                </div>
                            </div>
                        </div>
                        <script>
                            $('.edit-btn').on('click', function () {
                                // Get data attributes from the clicked button
                                const id = $(this).data('id');
                                const name = $(this).data('name');
                                const image = $(this).data('image');

                                // Log values for debugging
                                console.log("ID:", id);
                                console.log("Name:", name);
                                console.log("Image Base64:", image);

                                // Populate modal fields with data
                                $('#editCategoryId').val(id);
                                $('#editCategoryName').val(name);

                                // Handle image src
                                if (image && image !== 'null') {
                                    $('#modalCurrentImage').attr('src', `data:image/jpeg;base64,${image}`);
                                } else {
                                    $('#modalCurrentImage').attr('src', '#'); // Placeholder for no image
                                }
                            });
                        </script>

                        <div class="modal-footer">
                            <button type="submit" class="btn btn-success">Save Changes</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            document.getElementById("editCategoryImage").addEventListener("change", function(event) {
                const file = event.target.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        const imagePreview = document.getElementById("modalCategoryImagePreview");
                        imagePreview.src = e.target.result;
                        imagePreview.style.display = "block"; // Make the preview visible
                    };
                    reader.readAsDataURL(file); // Read the file and trigger the onload event
                }
            });
        </script>

        <!-- Add Category Modal -->
    <div class="modal fade" id="addCategoryModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- SweetAlert Message -->
                <%
                    String message = request.getParameter("categoryAddMessage");
                    String error = request.getParameter("categoryAddError");

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
                <form action="addCategory" method="POST" enctype="multipart/form-data">
                    <div class="modal-header">
                        <h5 class="modal-title">Add New Category</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="categoryName" class="form-label">Category Name</label>
                            <input id="categoryName" type="text" class="form-control" name="categoryName" required>
                        </div>
                        <div class="mb-3">
                            <label for="categoryImageInput" class="form-label">Category Image</label>
                            <input type="file" class="form-control" name="categoryImage" accept="image/*" id="categoryImageInput" required>
                            <!-- Image Preview -->
                            <div class="mt-2">
                                <img id="categoryImagePreview" src="" alt="Image Preview" style="max-width: 100px; display: none;">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Add Category</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    </div>
</section>

<%-- User section --%>
<section id="manage-users" class="section-content">
    <div class="container mt-5">
        <h2>User Management</h2>
        <table class="table table-striped table-hover" border="1">
            <thead class="table-dark">
            <tr>
                <th>#Id</th>
                <th>Name</th>
                <th>Username</th>
                <th>Email</th>
                <th>Mobile</th>
                <th>Role</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                String query = "SELECT id, name, username, email, mobile, role FROM users";

                try {
                    // Initialize the connection
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

                    // Execute query
                    pstmt = connection.prepareStatement(query);
                    resultSet = pstmt.executeQuery();

                    // Loop through results and generate rows
                    while (resultSet.next()) {
                        int id = resultSet.getInt("id");
                        String name = resultSet.getString("name");
                        String username = resultSet.getString("username");
                        String email = resultSet.getString("email");
                        String mobile = resultSet.getString("mobile");
                        String role = resultSet.getString("role");
            %>
            <tr>
                <td><%= id %></td>
                <td><%= name %></td>
                <td><%= username %></td>
                <td><%= email %></td>
                <td><%= mobile %></td>
                <td><%= role %></td>
                <td>
                    <button class="btn btn-warning btn-sm edit-user-btn"
                            data-id="<%= id %>"
                            data-name="<%= name %>"
                            data-username="<%= username %>"
                            data-email="<%= email %>"
                            data-mobile="<%= mobile %>"
                            data-role="<%= role %>"
                            data-bs-toggle="modal"
                            data-bs-target="#editUserModal"
                    >
                        Edit
                    </button>
                    <button class="btn btn-danger btn-sm delete-user-btn" data-id="<%= id %>">Delete</button>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    //out.println("<tr><td colspan='7' style='color: red;'>Error loading users: " + e.getMessage() + "</td></tr>");
                } finally {
                    // Close resources
                    if (resultSet != null) try { resultSet.close(); } catch (SQLException ignored) {}
                    if (pstmt != null) try { pstmt.close(); } catch (SQLException ignored) {}
                    if (connection != null) try { connection.close(); } catch (SQLException ignored) {}
                }
            %>
            </tbody>
        </table>
    </div>
</section>


<%-- single page --%>
<script>
    $(document).ready(function() {

        $('.section-content').hide();
        $('#dashboard').show();

        $('#manageDashboardLink').click(function() {
            $('.section-content').hide();
            $('#dashboard').show();
        });

        $('#manageProductsLink').click(function() {
            $('.section-content').hide();
            $('#manage-products').show();
        });

        $('#manageCategoriesLink').click(function() {
            $('.section-content').hide();
            $('#manage-categories').show();
        });
        $('#manageOrdersLink').click(function() {
            $('.section-content').hide();
            $('#manage-orders').show();
        });

        $('#manageUsersLink').click(function() {
            $('.section-content').hide();
            $('#manage-users').show();
        });
    });
</script>

<%-- image preview --%>
<script>
    document.getElementById("categoryImageInput").addEventListener("change", function(event) {
        const file = event.target.files[0];
        const reader = new FileReader();
        reader.onload = function(e) {
            const imagePreview = document.getElementById("categoryImagePreview");
            imagePreview.src = e.target.result;
            imagePreview.style.display = "block";
        };
        if (file) {
            reader.readAsDataURL(file);
        }
    });
</script>

<!-- Bootstrap JS and Dependencies -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>