package lk.ijse.ecommercewebapplication.dao.custom.impl;

import lk.ijse.ecommercewebapplication.dao.custom.EditCategoryDAO;
import lk.ijse.ecommercewebapplication.entity.Category;
import org.apache.commons.dbcp.BasicDataSource;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class EditCategoryDAOImpl implements EditCategoryDAO {
    @Override
    public boolean add(Category dto, BasicDataSource basicDataSource) throws SQLException {
        return false;
    }

    @Override
    public boolean edit(Category dto, BasicDataSource basicDataSource, String id) {
        String query = "UPDATE categories SET name = ?, image = ? WHERE id = ?";
        try (Connection connection = basicDataSource.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            // Set the category name
            pstmt.setString(1, dto.getName());

            // Handle the image: if provided, set as Blob, otherwise set NULL
            if (dto.getImage() != null) {
                pstmt.setBlob(2, new ByteArrayInputStream(dto.getImage().readAllBytes()));
            } else {
                pstmt.setNull(2, java.sql.Types.BLOB);
            }

            // Set the category ID for the WHERE condition
            pstmt.setString(3, id);

            // Execute the update query
            System.out.println(pstmt.executeUpdate());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException | IOException e) {
            e.printStackTrace();
            return false;
        }
    }
    @Override
    public boolean delete(String deleteCategoryId, BasicDataSource ds) {
        String query = "DELETE FROM categories WHERE id = ?";
        try (Connection connection = ds.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            // Set the category ID for the WHERE condition
            pstmt.setString(1, deleteCategoryId);

            // Execute the delete query
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    @Override
    public boolean delete(Category dto, BasicDataSource basicDataSource) {
        return false;
    }


}
