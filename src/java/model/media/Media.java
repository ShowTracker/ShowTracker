/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.media;

import java.util.ArrayList;
import java.util.List;
import model.Genre;

/**
 *
 * @author aluno
 */
public abstract class Media {
    protected long id;
    protected String year;
    protected String title;
    protected boolean isAdult;
    protected List<Genre> genres;

    public Media() {
    }

    public Media(long id, String year, String title, boolean isAdult) {
        this.id = id;
        this.year = year;
        this.title = title;
        this.isAdult = isAdult;
        this.genres = new ArrayList<>();
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public boolean isIsAdult() {
        return isAdult;
    }

    public void setIsAdult(boolean isAdult) {
        this.isAdult = isAdult;
    }

    public List<Genre> getGenres() {
        return genres;
    }
    
    public void addGenre(Genre genre) {
        this.genres.add(genre);
    }
}
