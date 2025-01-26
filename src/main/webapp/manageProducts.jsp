<%@ page import="lk.ijse.ecommercewebapplication.entity.Product" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Chamith
  Date: 1/22/2025
  Time: 10:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Manage Products</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#"><b>Bulky</b></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <!-- Center-aligned Links -->
    <ul class="navbar-nav mx-auto">
      <li class="nav-item"><a class="nav-link" href="manageProducts.jsp">Manage Products</a></li>
      <li class="nav-item"><a class="nav-link" href="manage_categories.jsp">Manage Categories</a></li>
      <li class="nav-item"><a class="nav-link" href="manage_orders.jsp">Manage Orders</a></li>
      <li class="nav-item"><a class="nav-link" href="manage_users.jsp">Manage Users</a></li>
    </ul>
    <!-- Right-aligned Logout Link -->
    <ul class="navbar-nav">
      <li class="nav-item"><a class="nav-link text-danger" href="index.jsp">Logout</a></li>
    </ul>
  </div>
</nav>
<%-- Product section --%>
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


<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

