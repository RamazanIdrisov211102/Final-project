package kz.javaee.javaEE;

import java.sql.Timestamp;

public class Product {
    Long id;
    String photo;
    String name;
    String description;
    int price;
    User user_id;
    Timestamp post_date;

    public Product() {
    }

    public Product(Long id, String photo, String name, String description, int price, User user_id, Timestamp post_date) {
        this.id = id;
        this.photo = photo;
        this.name = name;
        this.description = description;
        this.price = price;
        this.user_id = user_id;
        this.post_date = post_date;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
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
