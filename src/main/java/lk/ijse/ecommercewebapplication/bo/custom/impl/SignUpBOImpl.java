package lk.ijse.ecommercewebapplication.bo.custom.impl;

import lk.ijse.ecommercewebapplication.bo.custom.SignUpBO;
import lk.ijse.ecommercewebapplication.dao.DAOFactory;
import lk.ijse.ecommercewebapplication.dao.custom.SignUpDAO;
import lk.ijse.ecommercewebapplication.dto.UserDTO;
import lk.ijse.ecommercewebapplication.entity.User;
import org.apache.commons.dbcp.BasicDataSource;
import org.mindrot.jbcrypt.BCrypt;

public class SignUpBOImpl implements SignUpBO {

    SignUpDAO signUPDAO = (SignUpDAO) DAOFactory.getDAOFactory().getDAO(DAOFactory.DAOTypes.SIGNUP);

    @Override
    public boolean saveUser(UserDTO userDTO, BasicDataSource ds) {
        String encryptedPassword = BCrypt.hashpw(userDTO.getPassword(), BCrypt.gensalt());
        return signUPDAO.save(new User(userDTO.getName(), userDTO.getUsername(), userDTO.getEmail(), userDTO.getMobile(), encryptedPassword, userDTO.getRole()),ds);
    }

    @Override
    public boolean checkUsername(String username,BasicDataSource ds) {
        return signUPDAO.checkInDB(username,ds);
    }
}
