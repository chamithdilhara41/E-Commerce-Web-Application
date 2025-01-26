package lk.ijse.ecommercewebapplication.bo;


import lk.ijse.ecommercewebapplication.bo.custom.impl.*;

public class BOFactory {
    private static BOFactory boFactory;
    private BOFactory() {}

    public static BOFactory getBoFactory() {
        return (boFactory == null) ? boFactory = new BOFactory() : boFactory;
    }

    public enum BOTypes {
        SIGNUP,SIGNIN,ADDCATEGORY,EDITCATEGORY,ADDPRODUCT,EDITPRODUCT
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
            case ADDPRODUCT -> {
                return new AddProductBOImpl();
            }
            case EDITPRODUCT -> {
                return new EditCategoryBOImpl();
            }
            default -> {
                return null;
            }
        }
    }
}

