package lk.ijse.ecommercewebapplication.dao.custom;

import lk.ijse.ecommercewebapplication.dao.CrudDAO;
import lk.ijse.ecommercewebapplication.entity.Category;
import org.apache.commons.dbcp.BasicDataSource;

public interface AddCategoryDAO extends CrudDAO<Category, BasicDataSource> {
}
