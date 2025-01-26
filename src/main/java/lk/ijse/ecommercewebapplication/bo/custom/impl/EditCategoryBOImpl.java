package lk.ijse.ecommercewebapplication.bo.custom.impl;

import lk.ijse.ecommercewebapplication.bo.custom.EditCategoryBO;
import lk.ijse.ecommercewebapplication.dao.DAOFactory;
import lk.ijse.ecommercewebapplication.dao.custom.EditCategoryDAO;
import lk.ijse.ecommercewebapplication.dto.CategoryDTO;
import lk.ijse.ecommercewebapplication.entity.Category;
import org.apache.commons.dbcp.BasicDataSource;

public class EditCategoryBOImpl implements EditCategoryBO {

    EditCategoryDAO editCategoryDAO = (EditCategoryDAO) DAOFactory.getDAOFactory().getDAO(DAOFactory.DAOTypes.EDITCATEGORY);

    @Override
    public boolean editCategory(String id, CategoryDTO categoryDTO, BasicDataSource ds) {
        return editCategoryDAO.edit(new Category(categoryDTO.getName(), categoryDTO.getImage()), ds, id);
    }

    @Override
    public boolean deleteCategory(String deleteCategoryId, BasicDataSource ds) {
        return editCategoryDAO.delete(deleteCategoryId,ds);
    }
}
