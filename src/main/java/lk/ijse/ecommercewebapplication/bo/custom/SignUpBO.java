package lk.ijse.ecommercewebapplication.bo.custom;

import lk.ijse.ecommercewebapplication.bo.SuperBO;
import lk.ijse.ecommercewebapplication.dto.UserDTO;
import org.apache.commons.dbcp.BasicDataSource;

public interface SignUpBO extends SuperBO {

    boolean saveUser(UserDTO userDTO, BasicDataSource ds);
    boolean checkUsername(String username, BasicDataSource ds);
}
