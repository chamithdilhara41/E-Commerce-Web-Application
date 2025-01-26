package lk.ijse.ecommercewebapplication.bo.custom;

import lk.ijse.ecommercewebapplication.bo.SuperBO;
import lk.ijse.ecommercewebapplication.dto.CategoryDTO;
import org.apache.commons.dbcp.BasicDataSource;

import java.sql.SQLException;

public interface AddCategoryBO extends SuperBO {
    boolean addCategory(CategoryDTO categoryDTO, BasicDataSource ds) throws SQLException;
}
