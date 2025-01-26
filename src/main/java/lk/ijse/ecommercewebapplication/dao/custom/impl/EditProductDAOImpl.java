package lk.ijse.ecommercewebapplication.dao.custom.impl;

import lk.ijse.ecommercewebapplication.dao.custom.EditProductDAO;
import lk.ijse.ecommercewebapplication.entity.Product;
import org.apache.commons.dbcp.BasicDataSource;

import java.sql.SQLException;

public class EditProductDAOImpl implements EditProductDAO {
    @Override
    public boolean add(Product dto, BasicDataSource dataSource) throws SQLException {
        return false;
    }

    @Override
    public boolean edit(Product dto, BasicDataSource dataSource, String id) {
        return false;
    }

    @Override
    public boolean delete(Product dto, BasicDataSource dataSource) {
        return false;
    }
}
