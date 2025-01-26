package lk.ijse.ecommercewebapplication.dao.custom.impl;

import lk.ijse.ecommercewebapplication.dao.custom.AddProductDAO;
import lk.ijse.ecommercewebapplication.entity.Product;
import org.apache.commons.dbcp.BasicDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AddProductDAOImpl implements AddProductDAO {
    @Override
    public boolean add(Product dto, BasicDataSource basicDataSource) throws SQLException {
        String query = "INSERT INTO products (name, category, price, qty, image) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = basicDataSource.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            // Set product data into the prepared statement
            pstmt.setString(1, dto.getName());       // Product name
            pstmt.setString(2, dto.getCategory());  // Product category
            pstmt.setDouble(3, dto.getPrice());     // Product price
            pstmt.setInt(4, dto.getQty());          // Product quantity

            // Handle image: if provided, set as Blob, otherwise set NULL
            if (dto.getImage() != null) {
                pstmt.setBlob(5, dto.getImage());
            } else {
                pstmt.setNull(5, java.sql.Types.BLOB);
            }

            // Execute the query
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }


    @Override
    public boolean edit(Product dto, BasicDataSource basicDataSource, String id) {
        return false;
    }

    @Override
    public boolean delete(Product dto, BasicDataSource basicDataSource) {
        return false;
    }
}
