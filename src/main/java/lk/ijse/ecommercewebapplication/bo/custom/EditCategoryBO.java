package lk.ijse.ecommercewebapplication.bo.custom;

import lk.ijse.ecommercewebapplication.bo.SuperBO;
import lk.ijse.ecommercewebapplication.dto.CategoryDTO;
import org.apache.commons.dbcp.BasicDataSource;

public interface EditCategoryBO extends SuperBO {
    boolean editCategory(String id, CategoryDTO categoryDTO, BasicDataSource ds);

    boolean deleteCategory(String deleteCategoryId, BasicDataSource ds);
}
