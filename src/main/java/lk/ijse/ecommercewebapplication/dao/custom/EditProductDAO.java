package lk.ijse.ecommercewebapplication.dao.custom;

import lk.ijse.ecommercewebapplication.dao.CrudDAO;
import lk.ijse.ecommercewebapplication.entity.Product;
import org.apache.commons.dbcp.BasicDataSource;

public interface EditProductDAO extends CrudDAO<Product, BasicDataSource> {
}
