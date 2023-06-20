
package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import model.WatchedList;
import static repository.DAO.DRIVER;
import static repository.DAO.PASSWORD;
import static repository.DAO.URL;
import static repository.DAO.USER;


public class WatchedListDAO extends DAO<WatchedList> {

    @Override
    public boolean insert(WatchedList obj) {
        // CANNOT USE METHOD
        return false;
    }
    
    public boolean insert(String email) {
        boolean result = false;
        try {
            Class.forName(DRIVER);
            Connection c = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement stmt = c.prepareStatement("INSERT INTO whatched_list (user_email) VALUES (?)");
            stmt.setString(1, email);
            result = (stmt.executeUpdate() == 1);
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return result;
    }

    @Override
    public WatchedList getOne(int id) {
        // CANNOT USE METHOD
        return null;
    }
    
    public WatchedList getOne(String email) {
        
        return null;
    }


    @Override
    public List<WatchedList> getAll() {
        // CANNOT USE METHOD
        return null;
    }

    @Override
    public void update(WatchedList obj) {
        // TODO implement method
    }

    @Override
    public boolean delete(int id) {
        // TODO implement method
        return false;
    }
    
}

