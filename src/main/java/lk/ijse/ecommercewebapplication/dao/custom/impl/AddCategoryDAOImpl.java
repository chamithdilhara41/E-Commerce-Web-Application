package lk.ijse.ecommercewebapplication.dao.custom.impl;

import lk.ijse.ecommercewebapplication.dao.custom.AddCategoryDAO;
import lk.ijse.ecommercewebapplication.entity.Category;
import org.apache.commons.dbcp.BasicDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AddCategoryDAOImpl implements AddCategoryDAO {
    @Override
    public boolean add(Category dto, BasicDataSource basicDataSource) throws SQLException {
        Connection connection = basicDataSource.getConnection();
        String query = "INSERT INTO categories (name, image) VALUES (?, ?)";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, dto.getName());
            if (dto.getImage() != null) {
                pstmt.setBlob(2, dto.getImage());
            } else {
                pstmt.setNull(2, java.sql.Types.BLOB);
            }
            return pstmt.executeUpdate() > 0;
        }
    }

    @Override
    public boolean edit(Category dto, BasicDataSource basicDataSource, String id) {
        return false;
    }

    @Override
    public boolean delete(Category dto, BasicDataSource basicDataSource) {
        return false;
    }
}
