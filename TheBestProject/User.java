package kz.javaee.javaEE;

public class User {
    Long id;
    String email;
    String password;
    String city;

    String userName;

    public User() {
    }

    public User(Long id, String email, String password, String city, String userName) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.city = city;
        this.userName= userName;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
