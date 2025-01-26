package lk.ijse.ecommercewebapplication.bo.custom;

import lk.ijse.ecommercewebapplication.bo.SuperBO;
import lk.ijse.ecommercewebapplication.dto.ProductDTO;
import org.apache.commons.dbcp.BasicDataSource;

import java.sql.SQLException;

public interface AddProductBO extends SuperBO {
    boolean addCategory(ProductDTO productDTO, BasicDataSource ds) throws SQLException;
}
