/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;
import model.media.Media;

/**
 *
 * @author aluno
 */
public class WatchedList {
    private int id;
    private User user;
    private List<Media> medias;

    public WatchedList(int id, User user) {
        this.id = id;
        this.user = user;
        this.medias = new ArrayList<>();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Media> getMedias() {
        return medias;
    }
    
    public void addMedia(Media media) {
        this.medias.add(media);
    }
}
