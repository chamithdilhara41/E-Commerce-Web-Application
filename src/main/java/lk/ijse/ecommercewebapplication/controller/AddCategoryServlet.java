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
import lk.ijse.ecommercewebapplication.bo.custom.AddCategoryBO;
import lk.ijse.ecommercewebapplication.dto.CategoryDTO;
import org.apache.commons.dbcp.BasicDataSource;

import java.io.IOException;
import java.io.InputStream;

@WebServlet(name = "AddCategoryServlet", value = "/addCategory")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class AddCategoryServlet extends HttpServlet {

    AddCategoryBO addCategoryBO = (AddCategoryBO) BOFactory.getBoFactory().getBO(BOFactory.BOTypes.ADDCATEGORY);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            String categoryName = req.getParameter("categoryName");

            Part filePart = req.getPart("categoryImage");
            InputStream imageInputStream = null;

            if (filePart != null && filePart.getSize() > 0) {
                imageInputStream = filePart.getInputStream();
            }

            // Retrieve the data source from the ServletContext
            ServletContext servletContext = req.getServletContext();
            BasicDataSource ds = (BasicDataSource) servletContext.getAttribute("dataSource");

            CategoryDTO categoryDTO = new CategoryDTO(categoryName, imageInputStream);

            boolean isAddedCategory = addCategoryBO.addCategory(categoryDTO, ds);

            if (isAddedCategory) {
                // Redirect to success page if the category was added
                resp.sendRedirect("adminDashboard.jsp?categoryAddMessage=Category Added Successfully.");
            } else {
                // Redirect to error page if the operation failed
                resp.sendRedirect("adminDashboard.jsp?categoryAddError=Category Not Added Successfully.");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
