package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import model.User;
import static repository.DAO.DRIVER;
import static repository.DAO.PASSWORD;
import static repository.DAO.URL;
import static repository.DAO.USER;

public class UserDAO extends DAO<User> {

    @Override
    public boolean insert(User obj) {
        boolean result = false;
        try {
            Class.forName(DRIVER);
            Connection c = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement stmt = c.prepareStatement("INSERT INTO user_movie (email, password, first_name, last_name, birth_date) VALUES (?, ?, ?, ?, ?)");
            stmt.setString(1, obj.getEmail());
            stmt.setString(2, obj.getPassword());
            stmt.setString(3, obj.getFisrtName());
            stmt.setString(4, obj.getLastName());
            stmt.setString(5, obj.getBirthDate());
            result = (stmt.executeUpdate() == 1);
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return result;
    }

    @Override
    public User getOne(int id) {
        // CANNOT USE METHOD
        return null;
    }

    public User getOne(String email, String password) {
        User result = null;
        try {
            Class.forName(DRIVER);
            Connection c = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement stmt = c.prepareStatement("SELECT email, password, first_name, last_name, birth_date FROM user_movie WHERE email = ? AND password = ?");
            stmt.setString(1, email);
            stmt.setString(2, password);
            boolean found = false;
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                String u_email = rs.getString("email");
                String u_password = rs.getString("password");
                String first_name = rs.getString("first_name");
                String last_name = rs.getString("last_name");
                String birth_date = rs.getString("birth_date");

                found = true;
                User user = new User(first_name, u_email, last_name, birth_date, u_password);
                result = user;
            }
            rs.close();
            stmt.close();
            c.close();
            if (!found) {
                System.out.println("Nenhum registro encontrado");
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        // TODO implement method
        return result;
    }
    public User getOne(String email) {
        User result = null;
        try {
            Class.forName(DRIVER);
            Connection c = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement stmt = c.prepareStatement("SELECT email, password, first_name, last_name, birth_date FROM user_movie WHERE email = ?");
            stmt.setString(1, email);
            boolean found = false;
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                String u_email = rs.getString("email");
                String u_password = rs.getString("password");
                String first_name = rs.getString("first_name");
                String last_name = rs.getString("last_name");
                String birth_date = rs.getString("birth_date");

                found = true;
                User user = new User(first_name, u_email, last_name, birth_date, u_password);
                result = user;
            }
            rs.close();
            stmt.close();
            c.close();
            if (!found) {
                System.out.println("Nenhum registro encontrado");
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return result;
    }

    @Override
    public List<User> getAll() {
        // CANNOT USE METHOD
        return null;
    }

    @Override
    public boolean update(User obj) {
        boolean result = false;
        try {
            Class.forName(DRIVER);
            Connection c = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement stmt = c.prepareStatement("UPDATE user_movie SET first_name = ?, last_name = ?, birth_date = ? WHERE email = ?");
            stmt.setString(1, obj.getFisrtName());
            stmt.setString(2, obj.getLastName());
            stmt.setString(3, obj.getBirthDate());
            stmt.setString(4, obj.getEmail());
            result = (stmt.executeUpdate() == 1);
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return result;
    }

    @Override
    public boolean delete(int id) {
        // CANNOT USE METHOD
        return false;
    }
    
    public boolean delete(String email) {
        boolean result = false;
        try {
            Class.forName(DRIVER);
            Connection c = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement stmt = c.prepareStatement("DELETE FROM user_movie WHERE email = ?");
            stmt.setString(1, email);
            result = (stmt.executeUpdate() == 1);
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return result;
    }

}
