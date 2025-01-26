package lk.ijse.ecommercewebapplication.bo.custom.impl;

import lk.ijse.ecommercewebapplication.bo.custom.SignInBO;
import lk.ijse.ecommercewebapplication.dao.DAOFactory;
import lk.ijse.ecommercewebapplication.dao.custom.SignInDAO;
import org.apache.commons.dbcp.BasicDataSource;

public class SignInBOImpl implements SignInBO {
    SignInDAO signInDAO = (SignInDAO) DAOFactory.getDAOFactory().getDAO(DAOFactory.DAOTypes.SIGNIN);
    @Override
    public String checkCredentials(String username, String password, BasicDataSource ds) {
        return String.valueOf(signInDAO.checkCredentials(username,password,ds));
    }
}
