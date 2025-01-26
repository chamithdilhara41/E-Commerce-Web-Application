package lk.ijse.ecommercewebapplication.dao.custom;

import lk.ijse.ecommercewebapplication.dao.CrudDAO;
import lk.ijse.ecommercewebapplication.entity.User;
import org.apache.commons.dbcp.BasicDataSource;

public interface SignInDAO extends CrudDAO<User,BasicDataSource> {
    String checkCredentials(String username, String hashedPassword, BasicDataSource ds);
}
