package lk.ijse.ecommercewebapplication.db;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import org.apache.commons.dbcp.BasicDataSource;

import java.sql.SQLException;

@WebListener
public class Listener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        BasicDataSource ds = new BasicDataSource();
        ds.setDriverClassName("com.mysql.jdbc.Driver");
        ds.setUrl("jdbc:mysql://localhost:3307/ecommerce");
        ds.setUsername("root");
        ds.setPassword("Ijse@123");
        ds.setInitialSize(5);

        //common interface to all servlets
        ServletContext servletContext = sce.getServletContext();
        servletContext.setAttribute("dataSource", ds);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        ServletContext servletContext = sce.getServletContext();
        BasicDataSource ds = (BasicDataSource) servletContext.getAttribute("dataSource");
        try {
            ds.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
