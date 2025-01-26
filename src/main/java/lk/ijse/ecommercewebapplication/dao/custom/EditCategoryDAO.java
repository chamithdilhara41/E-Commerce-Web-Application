package lk.ijse.ecommercewebapplication.dao.custom;

import lk.ijse.ecommercewebapplication.dao.CrudDAO;
import lk.ijse.ecommercewebapplication.entity.Category;
import org.apache.commons.dbcp.BasicDataSource;

public interface EditCategoryDAO extends CrudDAO<Category, BasicDataSource> {
    boolean delete(String deleteCategoryId, BasicDataSource ds);
}
