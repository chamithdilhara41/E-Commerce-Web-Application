# E-Commerce Web Application

This is a full-featured e-commerce web application developed using JavaEE, JDBC connection pooling, and JSP. The application includes features for both administrators and customers, such as product management, user authentication, order processing, and cart management.

## Features

### Administrator Features
- **Product Management:** Add, view, update, and delete products.
- **Category Management:** Add, view, update, and delete product categories.
- **Order Management:** View all orders placed by customers.
- **User Management:** View, activate, or deactivate customer accounts.

### Customer Features
- **User Authentication:** Registration, login, and logout.
- **Product Browsing:** View products by category, search by name, and sort by price.
- **Shopping Cart:** Add products to the cart, update quantities, and remove products.
- **Order Placement:** Place orders and view order history.
- **User Profile Management:** Update personal information and password.

## Requirements

### Database Setup
- **Database Name:** `ecommerce`
- **Tables:**
  - `products`
  - `categories`
  - `users`
  - `orders`
  - `order_details`
  - `cart`

### JDBC Connection Pool
- Use a DataSource (e.g., Apache DBCP, HikariCP, or Tomcat connection pool) for database connectivity.

### JavaEE Backend
- Create servlets for each feature, such as `AddProductServlet`, `LoginServlet`, `CartServlet`, etc.

### JSP Front-End
- Use JSP pages for the user interface, including `home.jsp`, `product_list.jsp`, `cart.jsp`, `admin_dashboard.jsp`, and others.

### Styling
- Use basic CSS for styling. Optional: Use a front-end framework like Bootstrap for a better UI.

## Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/ecommerce-web-application.git
