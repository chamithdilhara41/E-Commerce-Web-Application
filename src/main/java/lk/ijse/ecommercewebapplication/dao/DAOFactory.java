package lk.ijse.ecommercewebapplication.dao;

import lk.ijse.ecommercewebapplication.dao.custom.impl.*;

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
        SIGNUP,SIGNIN,ADDCATEGORY,EDITCATEGORY,ADDPRODUCT,EDITPRODUCT
    }

    public SuperDAO getDAO(DAOTypes type) {

        switch (type) {
            case SIGNUP:return new SignUpDAOImpl();
            case SIGNIN:return new SignInDAOImpl();
            case ADDCATEGORY:return new AddCategoryDAOImpl();
            case EDITCATEGORY:return new EditCategoryDAOImpl();
            case ADDPRODUCT:return new AddProductDAOImpl();
            case EDITPRODUCT:return new EditCategoryDAOImpl();
            default:return null;
        }

    }
}
