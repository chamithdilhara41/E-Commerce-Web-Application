package lk.ijse.ecommercewebapplication.dao;

import lk.ijse.ecommercewebapplication.dao.custom.impl.AddCategoryDAOImpl;
import lk.ijse.ecommercewebapplication.dao.custom.impl.EditCategoryDAOImpl;
import lk.ijse.ecommercewebapplication.dao.custom.impl.SignInDAOImpl;
import lk.ijse.ecommercewebapplication.dao.custom.impl.SignUpDAOImpl;

public class DAOFactory {
    private static DAOFactory daoFactory;
    private DAOFactory() {}

    public static DAOFactory getDAOFactory() {
        if (daoFactory == null) {
            return daoFactory = new DAOFactory();
        }else {
            return daoFactory;
        }
    }

    public enum DAOTypes{
        SIGNUP,SIGNIN,ADDCATEGORY,EDITCATEGORY
    }

    public SuperDAO getDAO(DAOTypes type) {

        switch (type) {
            case SIGNUP:return new SignUpDAOImpl();
            case SIGNIN:return new SignInDAOImpl();
            case ADDCATEGORY:return new AddCategoryDAOImpl();
            case EDITCATEGORY:return new EditCategoryDAOImpl();
            default:return null;
        }

    }
}
