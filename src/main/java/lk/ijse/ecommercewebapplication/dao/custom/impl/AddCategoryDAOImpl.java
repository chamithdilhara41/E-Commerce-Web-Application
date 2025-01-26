package lk.ijse.ecommercewebapplication.dao.custom.impl;

import lk.ijse.ecommercewebapplication.dao.custom.AddCategoryDAO;
import lk.ijse.ecommercewebapplication.entity.Category;
import org.apache.commons.dbcp.BasicDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
    public List<String> getAllCategoryNames(BasicDataSource ds) throws Exception {
        List<String> categoryNames = new ArrayList<>();
        String query = "SELECT name FROM categories"; // Fetch only category names

        try (Connection connection = ds.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query);
             ResultSet resultSet = pstmt.executeQuery()) {

            while (resultSet.next()) {
                String name = resultSet.getString("name");
                categoryNames.add(name);
            }
        }

        return categoryNames;
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
