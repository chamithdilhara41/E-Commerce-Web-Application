<%@ page import="java.util.List" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.ecommercewebapplication.entity.Product" %>
<%@ page import="lk.ijse.ecommercewebapplication.entity.Category" %>
<%@ page import="java.sql.*" %><%--
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
            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addProductModal">Add New Product</button>
        </div>

        <!-- Product Table -->
        <table class="table table-striped table-hover">
            <thead class="table-dark">
            <tr>
                <th>#Id</th>
                <th>Product Name</th>
                <th>Category</th>
                <th>Price</th>
                <th>Stock</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <!-- Dynamic rows for products -->
            <%
                // Sample loop to display products (replace with dynamic data from backend)
                List<Product> products = (List<Product>) request.getAttribute("products");
                if (products != null) {
                    for (Product product : products) {
            %>
            <tr>
                <td><%= product.getId() %></td>
                <td><%= product.getName() %></td>
                <td><%= product.getCategory() %></td>
                <td><%= product.getPrice() %></td>
                <td><%= product.getStock() %></td>
                <td>
                    <button class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#editProductModal<%= product.getId() %>">Edit</button>
                    <button class="btn btn-danger btn-sm" onclick="deleteProduct(<%= product.getId() %>)">Delete</button>
                </td>
            </tr>

            <!-- Edit Product Modal -->
            <div class="modal fade" id="editProductModal<%= product.getId() %>" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="EditProductServlet" method="post">
                            <div class="modal-header">
                                <h5 class="modal-title">Edit Product</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">
                                <input type="hidden" name="productId" value="<%= product.getId() %>">
                                <div class="mb-3">
                                    <label for="productName" class="form-label">Product Name</label>
                                    <input type="text" class="form-control" name="productName" value="<%= product.getName() %>" required>
                                </div>
                                <div class="mb-3">
                                    <label for="category" class="form-label">Category</label>
                                    <input type="text" class="form-control" name="category" value="<%= product.getCategory() %>" required>
                                </div>
                                <div class="mb-3">
                                    <label for="price" class="form-label">Price</label>
                                    <input type="number" class="form-control" name="price" value="<%= product.getPrice() %>" required>
                                </div>
                                <div class="mb-3">
                                    <label for="stock" class="form-label">Stock</label>
                                    <input type="number" class="form-control" name="stock" value="<%= product.getStock() %>" required>
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
            <%      }
            }
            %>
            </tbody>
        </table>
    </div>

    <!-- Add Product Modal -->
    <div class="modal fade" id="addProductModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="AddProductServlet" method="post" enctype="multipart/form-data">
                    <div class="modal-header">
                        <h5 class="modal-title">Add New Product</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="productName" class="form-label">Product Name</label>
                            <input type="text" class="form-control" name="productName" required>
                        </div>
                        <div class="mb-3">
                            <label for="category" class="form-label">Category</label>
                            <input type="text" class="form-control" name="category" required>
                        </div>
                        <div class="mb-3">
                            <label for="price" class="form-label">Price</label>
                            <input type="number" class="form-control" name="price" required>
                        </div>
                        <div class="mb-3">
                            <label for="stock" class="form-label">Stock</label>
                            <input type="number" class="form-control" name="stock" required>
                        </div>
                        <!-- Image Input -->
                        <div class="mb-3">
                            <label for="productImage" class="form-label">Product Image</label>
                            <input type="file" class="form-control" name="productImage" accept="image/*" id="productImageInput" required>
                            <!-- Image Preview -->
                            <div class="mt-2">
                                <img id="imagePreview" src="" alt="Image Preview" style="max-width: 150px; display: none;">
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
</section>
<script>
    // Function to preview the image before upload
    document.getElementById("productImageInput").addEventListener("change", function(event) {
        const file = event.target.files[0];
        const reader = new FileReader();
        reader.onload = function(e) {
            const imagePreview = document.getElementById("imagePreview");
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
                // Database connection setup
                String dbUrl = "jdbc:mysql://localhost:3307/ecommerce";
                String dbUser = "root";
                String dbPassword = "Ijse@123";

                Connection connection = null;
                PreparedStatement pstmt = null;
                ResultSet resultSet = null;

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
                        <button type="button" class="btn btn-danger btn-sm delete-btn">Delete</button>
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