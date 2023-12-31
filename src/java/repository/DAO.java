
package repository;

import java.util.List;


public abstract class DAO<T> {
    
    public static final String DRIVER = "org.postgresql.Driver";
    public static final String URL = "jdbc:postgresql://localhost:5432/movies";
    public static final String USER = "postgres";
    public static final String PASSWORD = "ufc123";
    
    public abstract boolean insert(T obj);
    
    public abstract T getOne(int id);
    
    public abstract List<T> getAll();
    
    public abstract boolean update(T obj);
    
    public abstract boolean delete(int id);
}
