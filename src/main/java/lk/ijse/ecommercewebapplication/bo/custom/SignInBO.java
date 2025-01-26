package lk.ijse.ecommercewebapplication.bo.custom;

import lk.ijse.ecommercewebapplication.bo.SuperBO;
import org.apache.commons.dbcp.BasicDataSource;

public interface SignInBO extends SuperBO {
    String checkCredentials(String username, String password, BasicDataSource ds);
}
