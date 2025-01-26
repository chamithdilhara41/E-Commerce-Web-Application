package lk.ijse.ecommercewebapplication.controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommercewebapplication.bo.BOFactory;
import lk.ijse.ecommercewebapplication.bo.custom.impl.SignUpBOImpl;
import lk.ijse.ecommercewebapplication.dto.UserDTO;
import org.apache.commons.dbcp.BasicDataSource;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "SignUpServlet", value = "/signUp")
public class SignUpServlet extends HttpServlet {

    SignUpBOImpl signUpBO = (SignUpBOImpl) BOFactory.getBoFactory().getBO(BOFactory.BOTypes.SIGNUP);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String mobileNumber = req.getParameter("mobileNumber");
        String password = req.getParameter("confirmPassword");
        String role ="User";


        UserDTO userDTO = new UserDTO(name, username, email, mobileNumber, password, role);

        ServletContext servletContext = req.getServletContext();
        BasicDataSource ds = (BasicDataSource) servletContext.getAttribute("dataSource");

        try {

            boolean ed = signUpBO.saveUser(userDTO,ds);

            if (ed) {
                resp.sendRedirect("signUp.jsp?message=Sign up Successful");
            }else {
                resp.sendRedirect("signUp.jsp?error=Fail to Sign up");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");

        ServletContext servletContext = req.getServletContext();
        BasicDataSource ds = (BasicDataSource) servletContext.getAttribute("dataSource");

        try {
            boolean exists  = signUpBO.checkUsername(username,ds);
            System.out.println(exists);

            // Respond with true or false as plain text
            resp.setContentType("text/plain");
            resp.getWriter().write(String.valueOf(exists));

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while checking the username.");
        }

    }
}
