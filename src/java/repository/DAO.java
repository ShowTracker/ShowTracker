
package repository;

import java.util.List;


public abstract class DAO<T> {
    
    public static final String DRIVER = "org.postgresql.Driver";
    public static final String URL = "jdbc:postgresql://localhost:5432/movies";
    public static final String USER = "postgres";
    public static final String PASSWORD = "ufc123";
    
    public abstract void insert(T obj);
    
    public abstract T getOne(int id);
    
    public abstract List<T> getAll();
    
    public abstract void update(T obj);
    
    public abstract void delete(int id);
}
