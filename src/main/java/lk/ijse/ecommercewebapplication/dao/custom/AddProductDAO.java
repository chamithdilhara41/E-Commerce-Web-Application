package lk.ijse.ecommercewebapplication.dao.custom;

import lk.ijse.ecommercewebapplication.dao.CrudDAO;
import lk.ijse.ecommercewebapplication.entity.Product;
import org.apache.commons.dbcp.BasicDataSource;

public interface AddProductDAO extends CrudDAO<Product, BasicDataSource> {
}
