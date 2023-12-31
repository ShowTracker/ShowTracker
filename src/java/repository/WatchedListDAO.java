package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.WatchedList;
import model.media.Film;
import model.media.Media;
import model.media.TvShow;
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
        WatchedList result = null;
        try {
            Class.forName(DRIVER);
            Connection c = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement stmt = c.prepareStatement("SELECT id, user_email FROM whatched_list WHERE user_email = ?");
            stmt.setString(1, email);
            boolean found = false;
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String u_email = rs.getString("user_email");
                found = true;
                WatchedList wl = new WatchedList(id, u_email);
                result = wl;
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
    public List<WatchedList> getAll() {
        // CANNOT USE METHOD
        return null;
    }

    public List<Media> getAllUserMedia(int id) {

        List<Media> resultado = new ArrayList<>();
        try {
            Class.forName(DRIVER);
            Connection c = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement stmt = c.prepareStatement("SELECT me.id, me.title, title_type, duration, is_adult, year, end_year FROM media AS me, wl_media AS wm WHERE me.id = wm.media_id AND wm.wl_id = ?");
            stmt.setInt(1, id);
            boolean encontrou = false;
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                String title_type = rs.getString("title_type");
                if ("movie".equals(title_type)) {
                    int codigo = rs.getInt("id");
                    String title = rs.getString("title");
                    String year = rs.getString("year");
                    boolean isAdult = rs.getBoolean("is_adult");
                    String duration = rs.getString("duration");

                    encontrou = true;

                    Media f = new Film(duration, codigo, year, title, isAdult);
                    resultado.add(f);
                } else {
                    int codigo = rs.getInt("id");
                    String title = rs.getString("title");
                    String year = rs.getString("year");
                    boolean isAdult = rs.getBoolean("is_adult");
                    String endYear = rs.getString("end_year");

                    encontrou = true;

                    Media ts = new TvShow(endYear, codigo, year, title, isAdult);
                    resultado.add(ts);
                }

            }
            rs.close();
            stmt.close();
            c.close();
            if (!encontrou) {
                System.out.println("Nenhum registro encontrado");
            }

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return resultado;
    }

    public boolean addUserMedia(int media_id, int wl_id) {
        boolean resultado = false;
        try {
            Class.forName(DRIVER);
            Connection c = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement stmt = c.prepareStatement("INSERT INTO wl_media (wl_id, media_id) VALUES (?, ?)");
            stmt.setInt(1, wl_id);
            stmt.setInt(2, media_id);
            resultado = (stmt.executeUpdate() == 1);
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return resultado;
    }

    @Override
    public boolean update(WatchedList obj) {
        // TODO implement method
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }
    
    public boolean delete(String email) {
        boolean result = false;
        try {
            Class.forName(DRIVER);
            Connection c = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement stmt = c.prepareStatement("DELETE FROM whatched_list WHERE user_email = ?");
            stmt.setString(1, email);
            result = (stmt.executeUpdate() == 1);
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return result;
    }

    public boolean deleteAllUserMedia(int id) {
        boolean resultado = false;
        try {
            Class.forName(DRIVER);
            Connection c = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement stmt = c.prepareStatement(
                            "DELETE FROM wl_media WHERE wl_id =  ?");
            stmt.setInt(1, id);
            resultado = (stmt.executeUpdate() == 1);
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Erro: " + ex.getMessage());
        }

        return resultado;
    }


    public boolean deleteUserMedia(int media_id, int wl_id) {
        boolean resultado = false;
        try {
            Class.forName(DRIVER);
            Connection c = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement stmt = c.prepareStatement("DELETE FROM wl_media WHERE wl_id = ? AND media_id = ?");
            stmt.setInt(1, wl_id);
            stmt.setInt(2, media_id);
            resultado = (stmt.executeUpdate() == 1);
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return resultado;
    }

}
