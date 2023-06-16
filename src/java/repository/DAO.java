
package repository;

import java.util.List;


public abstract class DAO<T> {
    
    public static final String DRIVER = "";
    public static final String URL = "";
    public static final String USER = "postgres";
    public static final String PASSWORD = "ufc123";
    
    public abstract void insert(T obj);
    
    public abstract T getOne(long id);
    
    public abstract List<T> getAll();
    
    public abstract void update(T obj);
    
    public abstract void delete(long id);
}
