package kz.javaee.javaEE;

import java.sql.Timestamp;

public class Beauty {
    Long id;
    String masters;
    String services;
    int price;
    String datetime;
    String photo;

    User user_id;

    Timestamp post_date;

    public Beauty() {
    }

    public Beauty(Long id, String masters, String services, int price, String datetime, String photo, User user_id, Timestamp post_date) {
        this.id = id;
        this.masters = masters;
        this.services = services;
        this.price = price;
        this.datetime = datetime;
        this.photo = photo;
        this.user_id = user_id;
        this.post_date = post_date;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMasters() {
        return masters;
    }

    public void setMasters(String masters) {
        this.masters = masters;
    }

    public String getServices() {
        return services;
    }

    public void setServices(String services) {
        this.services = services;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public User getUser_id() {
        return user_id;
    }

    public void setUser_id(User user_id) {
        this.user_id = user_id;
    }

    public Timestamp getPost_date() {
        return post_date;
    }

    public void setPost_date(Timestamp post_date) {
        this.post_date = post_date;
    }
}
