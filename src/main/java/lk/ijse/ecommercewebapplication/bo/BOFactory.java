package lk.ijse.ecommercewebapplication.bo;


import lk.ijse.ecommercewebapplication.bo.custom.impl.AddCategoryBOImpl;
import lk.ijse.ecommercewebapplication.bo.custom.impl.EditCategoryBOImpl;
import lk.ijse.ecommercewebapplication.bo.custom.impl.SignInBOImpl;
import lk.ijse.ecommercewebapplication.bo.custom.impl.SignUpBOImpl;

public class BOFactory {
    private static BOFactory boFactory;
    private BOFactory() {}

    public static BOFactory getBoFactory() {
        return (boFactory == null) ? boFactory = new BOFactory() : boFactory;
    }

    public enum BOTypes {
        SIGNUP,SIGNIN,ADDCATEGORY,EDITCATEGORY
    }

    public SuperBO getBO(BOTypes boType) {

        switch (boType) {
            case SIGNUP -> {
                return new SignUpBOImpl();
            }
            case SIGNIN -> {
                return new SignInBOImpl();
            }
            case ADDCATEGORY -> {
                return new AddCategoryBOImpl();
            }
            case EDITCATEGORY -> {
                return new EditCategoryBOImpl();
            }
            default -> {
                return null;
            }
        }
    }
}

