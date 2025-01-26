package lk.ijse.ecommercewebapplication.dao;

import java.sql.SQLException;

public interface CrudDAO<T,DS> extends SuperDAO{
    boolean add(T dto,DS ds) throws SQLException;
    boolean edit(T dto, DS ds, String id);
    boolean delete(T dto,DS ds);
}
