package lk.ijse.ecommercewebapplication.dao.custom;

import lk.ijse.ecommercewebapplication.dao.CrudDAO;
import lk.ijse.ecommercewebapplication.entity.User;
import org.apache.commons.dbcp.BasicDataSource;

public interface SignUpDAO extends CrudDAO<User,BasicDataSource> {
    boolean save(User user, BasicDataSource ds);

    boolean checkInDB(String username,BasicDataSource ds);
}
