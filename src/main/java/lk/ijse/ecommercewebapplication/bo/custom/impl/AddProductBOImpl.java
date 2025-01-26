package lk.ijse.ecommercewebapplication.bo.custom.impl;

import lk.ijse.ecommercewebapplication.bo.custom.AddProductBO;
import lk.ijse.ecommercewebapplication.dao.DAOFactory;
import lk.ijse.ecommercewebapplication.dao.custom.AddProductDAO;
import lk.ijse.ecommercewebapplication.dto.ProductDTO;
import lk.ijse.ecommercewebapplication.entity.Product;
import org.apache.commons.dbcp.BasicDataSource;

import java.sql.SQLException;

public class AddProductBOImpl implements AddProductBO {

    AddProductDAO addProductDAO = (AddProductDAO) DAOFactory.getDAOFactory().getDAO(DAOFactory.DAOTypes.ADDPRODUCT);

    @Override
    public boolean addCategory(ProductDTO productDTO, BasicDataSource ds) throws SQLException {
        return addProductDAO.add(new Product(productDTO.getName(), productDTO.getCategory(),productDTO.getPrice(),productDTO.getQty(),productDTO.getImage()),ds);
    }
}
