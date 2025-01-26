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
import lk.ijse.ecommercewebapplication.bo.custom.EditCategoryBO;
import lk.ijse.ecommercewebapplication.dto.CategoryDTO;
import org.apache.commons.dbcp.BasicDataSource;

import java.io.IOException;
import java.io.InputStream;

@WebServlet(name = "EditCategoryServlet", value = "/editCategory")
@MultipartConfig
public class EditCategoryServlet extends HttpServlet {

    EditCategoryBO editCategoryBO = (EditCategoryBO) BOFactory.getBoFactory().getBO(BOFactory.BOTypes.EDITCATEGORY);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id = req.getParameter("editCategoryId");
        String name = req.getParameter("editCategoryName");

        Part filePart = req.getPart("editCategoryImage");

        InputStream imageInputStream = null;

        if (filePart != null && filePart.getSize() > 0) {
            imageInputStream = filePart.getInputStream();
        }

        // Retrieve the data source from the ServletContext
        ServletContext servletContext = req.getServletContext();
        BasicDataSource ds = (BasicDataSource) servletContext.getAttribute("dataSource");

        CategoryDTO categoryDTO = new CategoryDTO(name, imageInputStream);

        boolean isAddedCategory = editCategoryBO.editCategory(id, categoryDTO, ds);

        System.out.println(isAddedCategory);

        if (isAddedCategory) {
            // Redirect to success page if the category was added
            resp.sendRedirect("adminDashboard.jsp?categoryEditMessage=Category Edited Successfully.");
        } else {
            // Redirect to error page if the operation failed
            resp.sendRedirect("adminDashboard.jsp?categoryEditError=Category Not Edited Successfully.");
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String deleteCategoryId = req.getParameter("deleteCategoryId");
        System.out.println(deleteCategoryId);

        ServletContext servletContext = req.getServletContext();
        BasicDataSource ds = (BasicDataSource) servletContext.getAttribute("dataSource");

        boolean isDeleted = editCategoryBO.deleteCategory(deleteCategoryId,ds);

        System.out.println(isDeleted);
        if (isDeleted) {
            resp.sendRedirect("adminDashboard.jsp?categoryDeleteMessage=Category Deleted Successfully.");
        }else {
            resp.sendRedirect("adminDashboard.jsp?categoryDeleteError=Category Not Deleted Successfully.");
        }

    }
}
