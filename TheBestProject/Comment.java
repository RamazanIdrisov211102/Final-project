package kz.javaee.javaEE;

import java.sql.Timestamp;

public class Comment {
    private Long id;
    private User user;
    private Product product;
    private String comment;
    protected Timestamp post_date;

    public Comment() {
    }

    public Comment(Long id, User user, Product product, String comment, Timestamp post_date) {
        this.id = id;
        this.user = user;
        this.product = product;
        this.comment = comment;
        this.post_date = post_date;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Timestamp getPost_date() {
        return post_date;
    }

    public void setPost_date(Timestamp post_date) {
        this.post_date = post_date;
    }
}
