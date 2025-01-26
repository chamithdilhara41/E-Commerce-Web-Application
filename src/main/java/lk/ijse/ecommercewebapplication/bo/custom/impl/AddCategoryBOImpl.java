package lk.ijse.ecommercewebapplication.bo.custom.impl;

import lk.ijse.ecommercewebapplication.bo.custom.AddCategoryBO;
import lk.ijse.ecommercewebapplication.dao.DAOFactory;
import lk.ijse.ecommercewebapplication.dao.custom.AddCategoryDAO;
import lk.ijse.ecommercewebapplication.dto.CategoryDTO;
import lk.ijse.ecommercewebapplication.entity.Category;
import org.apache.commons.dbcp.BasicDataSource;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AddCategoryBOImpl implements AddCategoryBO {

    AddCategoryDAO addCategoryDAO = (AddCategoryDAO) DAOFactory.getDAOFactory().getDAO(DAOFactory.DAOTypes.ADDCATEGORY);

    @Override
    public boolean addCategory(CategoryDTO categoryDTO, BasicDataSource ds) throws SQLException {
        return addCategoryDAO.add(new Category(categoryDTO.getName(), categoryDTO.getImage()),ds);
    }

    @Override
    public List<String> getAllCategoryNames(BasicDataSource ds) throws Exception {
        return addCategoryDAO.getAllCategoryNames(ds);
    }
}
