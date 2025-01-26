package lk.ijse.ecommercewebapplication.dao.custom.impl;

import lk.ijse.ecommercewebapplication.dao.custom.SignUpDAO;
import lk.ijse.ecommercewebapplication.entity.User;
import org.apache.commons.dbcp.BasicDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SignUpDAOImpl implements SignUpDAO {
    @Override
    public boolean save(User user, BasicDataSource ds) {
        String insertQuery = "INSERT INTO users (name, username, email, mobile, password, role) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection connection = ds.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {

            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getUsername());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getMobile());
            preparedStatement.setString(5, user.getPassword());
            preparedStatement.setString(6, user.getRole());

            return preparedStatement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Error saving user: " + e.getMessage(), e);
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

    @Override
    public boolean checkInDB(String username, BasicDataSource ds) {
        String selectQuery = "SELECT username FROM users WHERE username = ?"; // Query to check if username exists

        try (Connection connection = ds.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {

            preparedStatement.setString(1, username); // Set the username parameter

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                return resultSet.next(); // Returns true if a result exists, false otherwise
            }

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Error checking username: " + e.getMessage(), e);
        }
    }


}
