package lk.ijse.ecommercewebapplication.controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import lk.ijse.ecommercewebapplication.bo.BOFactory;
import lk.ijse.ecommercewebapplication.bo.custom.AddProductBO;
import lk.ijse.ecommercewebapplication.dto.CategoryDTO;
import lk.ijse.ecommercewebapplication.dto.ProductDTO;
import org.apache.commons.dbcp.BasicDataSource;

import java.io.IOException;
import java.io.InputStream;

@WebServlet(name = "AddProductServlet", value = "/addProduct")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class AddProductServlet extends HttpServlet {

    AddProductBO addProductBO = (AddProductBO) BOFactory.getBoFactory().getBO(BOFactory.BOTypes.ADDPRODUCT);


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Retrieve form parameters directly from the request
            String name = req.getParameter("productName");
            String category = req.getParameter("category");
            String price = req.getParameter("price");
            String qty = req.getParameter("qty");

            System.out.println(name + " " + category + " " + price + " " + qty);

            // Validate required fields
            if (name == null || name.isEmpty() ||
                    category == null || category.isEmpty() ||
                    price == null || price.isEmpty() ||
                    qty == null || qty.isEmpty()) {
                resp.sendRedirect("adminDashboard.jsp?error=All fields are required.");
                return;
            }

            // Parse numeric fields
            double priceValue;
            int qtyValue;
            try {
                priceValue = Double.parseDouble(price);
                qtyValue = Integer.parseInt(qty);
            } catch (NumberFormatException e) {
                resp.sendRedirect("adminDashboard.jsp?error=Invalid number format for price or quantity.");
                return;
            }

            // Retrieve file part for the product image
            Part filePart = req.getPart("productImage");
            InputStream imageInputStream = null;

            if (filePart != null && filePart.getSize() > 0) {
                imageInputStream = filePart.getInputStream();
            } else {
                resp.sendRedirect("adminDashboard.jsp?error=Product image is required.");
                return;
            }

            // Log parameters (optional, for debugging)
            System.out.println("Product Name: " + name);
            System.out.println("Category: " + category);
            System.out.println("Price: " + priceValue);
            System.out.println("Quantity: " + qtyValue);

            // Use the provided BasicDataSource to get a database connection
            ServletContext servletContext = req.getServletContext();
            BasicDataSource ds = (BasicDataSource) servletContext.getAttribute("dataSource");

            // Create a ProductDTO and call the business logic to add the product
            ProductDTO productDTO = new ProductDTO(name, category, priceValue, qtyValue, imageInputStream);

            boolean isAddedProduct = addProductBO.addCategory(productDTO, ds);

            // Redirect based on the operation result
            if (isAddedProduct) {
                resp.sendRedirect("adminDashboard.jsp?productAddMessage=Product Added Successfully.");
            } else {
                resp.sendRedirect("adminDashboard.jsp?productAddError=Product Not Added Successfully.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("adminDashboard.jsp?error=An unexpected error occurred.");
        }
    }
}