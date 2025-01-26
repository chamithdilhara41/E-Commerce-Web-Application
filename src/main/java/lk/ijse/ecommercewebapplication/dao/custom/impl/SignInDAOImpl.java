package lk.ijse.ecommercewebapplication.dao.custom.impl;

import lk.ijse.ecommercewebapplication.dao.custom.SignInDAO;
import lk.ijse.ecommercewebapplication.entity.User;
import org.apache.commons.dbcp.BasicDataSource;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SignInDAOImpl implements SignInDAO {

    @Override
    public String checkCredentials(String username, String password, BasicDataSource ds) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = ds.getConnection();

            String query = "SELECT password, role FROM users WHERE username = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                // Get the stored hashed password and role from the database
                String storedHashedPassword = resultSet.getString("password");
                String role = resultSet.getString("role");

                if (BCrypt.checkpw(password, storedHashedPassword)) {
                    return role; // Return the role if credentials are valid
                } else {
                    return null; // Password does not match
                }
            } else {
                return null; // Username does not exist
            }

        } catch (Exception e) {
            e.printStackTrace();
            return null; // In case of any error, return null
        } finally {
            // Clean up database resources
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public boolean add(User dto, BasicDataSource basicDataSource) {
        return false;
    }

    @Override
    public boolean edit(User dto, BasicDataSource basicDataSource, String id) {
        return false;
    }

    @Override
    public boolean delete(User dto, BasicDataSource basicDataSource) {
        return false;
    }
}
