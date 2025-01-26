package lk.ijse.ecommercewebapplication.controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommercewebapplication.bo.BOFactory;
import lk.ijse.ecommercewebapplication.bo.custom.SignInBO;
import org.apache.commons.dbcp.BasicDataSource;

import java.io.IOException;

@WebServlet(name = "SignInServlet", value = "/signIn")
public class SignInServlet extends HttpServlet {

    SignInBO signInBO = (SignInBO) BOFactory.getBoFactory().getBO(BOFactory.BOTypes.SIGNIN);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        ServletContext servletContext = req.getServletContext();
        BasicDataSource ds = (BasicDataSource) servletContext.getAttribute("dataSource");

        try {
            String role = signInBO.checkCredentials(username, password, ds);
            if (role != null) {
                if ("Admin".equals(role)) {
                    resp.sendRedirect("adminDashboard.jsp");
                } else if ("User".equals(role)) {
                    resp.getWriter().write("userDashboard.jsp?message=Welcome to Bulky.");
                    resp.sendRedirect("userDashboard.jsp");
                }
            } else {
                // Invalid login credentials
                resp.getWriter().write("signIn.jsp?error=Invalid username or password.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred during login.");
        }
    }
}
