package kz.javaee.javaEE;

import java.sql.*;
import java.util.ArrayList;

public class DBManager {
    private static Connection connection;
    static {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        try {
            connection= DriverManager.getConnection("jdbc:postgresql://localhost:5432/shop", "postgres", "qwerty123");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static User getUser(String email){
        User user = null;
        try {
            PreparedStatement stmt= connection.prepareStatement("select * from login where email=?");
            stmt.setString(1, email);
        ResultSet resultSet= stmt.executeQuery();
        if (resultSet.next()){
            user = new User();
            user.setId(resultSet.getLong("id"));
            user.setEmail(resultSet.getString("email"));
            user.setPassword(resultSet.getString("password"));
            user.setCity(resultSet.getString("city"));
            user.setUserName(resultSet.getString("user_name"));

        }
        stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }

    public static boolean registerBeauty(User user){
        int rows=0;
        try {
            PreparedStatement stmt = connection.prepareStatement("insert into login (email, password, city, user_name) values (?, ?, ?, ?)");
        stmt.setString(1, user.getEmail());
        stmt.setString(2, user.getPassword());
        stmt.setString(3, user.getCity());
        stmt.setString(4, user.getUserName());
        rows= stmt.executeUpdate();
        stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rows>0;
    }

    public static boolean add(Beauty beauty){
        int rows=0;
        try {
            PreparedStatement stmt = connection.prepareStatement("insert into beauty (masters, services, price, datetime, photo, user_id, post_date) values (?, ?, ?, ?, ?, ?, NOW())");
            stmt.setString(1, beauty.getMasters());
            stmt.setString(2, beauty.getServices());
            stmt.setInt(3, beauty.getPrice());
            stmt.setString(4, beauty.getDatetime());
            stmt.setString(5,beauty.getPhoto());
            stmt.setLong(6, beauty.getUser_id().getId());
            rows=stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rows>0;
    }



    public static ArrayList<Beauty> getAllList(){
        ArrayList<Beauty> list = new ArrayList<>();
        try {
            PreparedStatement stmt = connection.prepareStatement("select b.id, b.masters, b.services, b.price, b.datetime, b.photo, b.post_date, l.email, l.user_name  from beauty b join login l on b.user_id=l.id  order by post_date desc " );
            ResultSet resultSet = stmt.executeQuery();
            while (resultSet.next()){
                Beauty beauty = new Beauty();
                beauty.setId(resultSet.getLong("id"));
                beauty.setMasters(resultSet.getString("masters"));
                beauty.setServices(resultSet.getString("services"));
                beauty.setPrice(resultSet.getInt("price"));
                beauty.setDatetime(resultSet.getString("datetime"));
                beauty.setPhoto(resultSet.getString("photo"));
                beauty.setPost_date(resultSet.getTimestamp("post_date"));
                User user= new User();
                user.setEmail(resultSet.getString("email"));
                user.setUserName(resultSet.getString("user_name"));
                beauty.setUser_id(user);
                list.add(beauty);
            }
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public static ArrayList<Beauty> getAllApplications(Long id){
        ArrayList<Beauty> list = new ArrayList<>();
        try {
            PreparedStatement stmt = connection.prepareStatement("select b.id, b.masters, b.services, b.price, b.datetime, b.photo, b.post_date, l.email, l.user_name  from beauty b join login l on b.user_id=l.id where l.id=?  order by post_date desc " );
            stmt.setLong(1, id);
            ResultSet resultSet = stmt.executeQuery();
            while (resultSet.next()){
                Beauty beauty = new Beauty();
                beauty.setId(resultSet.getLong("id"));
                beauty.setMasters(resultSet.getString("masters"));
                beauty.setServices(resultSet.getString("services"));
                beauty.setPrice(resultSet.getInt("price"));
                beauty.setDatetime(resultSet.getString("datetime"));
                beauty.setPhoto(resultSet.getString("photo"));
                beauty.setPost_date(resultSet.getTimestamp("post_date"));
                User user= new User();
                user.setEmail(resultSet.getString("email"));
                user.setUserName(resultSet.getString("user_name"));
                beauty.setUser_id(user);
                list.add(beauty);
            }
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public static ArrayList<Product> getAllProducts(){
        ArrayList<Product> list = new ArrayList<>();
        try {
            PreparedStatement stmt = connection.prepareStatement("select p.id, p.photo, p.name, p.price, p.user_id, p.post_date, l.email, l.user_name  " +
                    "from product p " +
                    "join login l on l.id= p.user_id " +
                    "order by p.post_date desc ");
            ResultSet resultSet= stmt.executeQuery();
            while (resultSet.next()){
                Product product = new Product();
                product.setId(resultSet.getLong("id"));
                product.setPhoto(resultSet.getString("photo"));
                product.setName(resultSet.getString("name"));
                product.setPrice(resultSet.getInt("price"));
                product.setPost_date(resultSet.getTimestamp("post_date"));
                User user= new User();
                user.setEmail(resultSet.getString("email"));
                user.setUserName(resultSet.getString("user_name"));
                product.setUser_id(user);
                list.add(product);
            }
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public static Product getProduct(Long id){
        Product product = null;
        try {
            PreparedStatement stmt = connection.prepareStatement("select p.id, p.photo, p.name, p.description, p.price, p.user_id, p.post_date, l.email, l.user_name  " +
                    "from product p " +
                    "join login l on p.user_id= l.id " +
                    "where p.id=?");
            stmt.setLong(1, id);
            ResultSet resultSet = stmt.executeQuery();
            if (resultSet.next()){
                product = new Product();
                product.setId(resultSet.getLong("id"));
                product.setPhoto(resultSet.getString("photo"));
                product.setName(resultSet.getString("name"));
                product.setDescription(resultSet.getString("description"));
                product.setPrice(resultSet.getInt("price"));
                product.setPost_date(resultSet.getTimestamp("post_date"));
                User user = new User();
                user.setId(resultSet.getLong("user_id"));
                user.setEmail(resultSet.getString("email"));
                user.setUserName(resultSet.getString("user_name"));
                product.setUser_id(user);

            }
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
            return product;
    }


    public static boolean addComment(Comment comment){
        int rows=0;
        try {
            PreparedStatement stmt = connection.prepareStatement("insert into comments (user_id, product_id, comment, post_date)  " +
                    " values (?, ?, ?, NOW())");
            stmt.setLong(1, comment.getUser().getId());
            stmt.setLong(2, comment.getProduct().getId());
            stmt.setString(3, comment.getComment());
            rows=stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rows>0;
    }

    public static ArrayList<Comment> getAllComments(Long blogId){
        ArrayList<Comment> comments= new ArrayList<>();
        try {
           PreparedStatement stmt = connection.prepareStatement("select c.id, c.user_id, c.product_id, c.comment, c.post_date, l.email, l.user_name  " +
                    "from comments c  " +
                    "join login l on c.user_id=l.id  " +
                    "where c.product_id=?  " +
                    "order by c.post_date desc ");
            stmt.setLong(1, blogId);
            ResultSet resultSet = stmt.executeQuery();
            while (resultSet.next()){
                Comment comment = new Comment();
                comment.setId(resultSet.getLong("id"));
                comment.setComment(resultSet.getString("comment"));
                comment.setPost_date(resultSet.getTimestamp("post_date"));
                User user = new User();
                user.setId(resultSet.getLong("user_id"));
                user.setEmail(resultSet.getString("email"));
                user.setUserName(resultSet.getString("user_name"));
                comment.setUser(user);

                Product product = new Product();
                product.setId(resultSet.getLong("product_id"));
                comment.setProduct(product);

                comments.add(comment);
            }
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return comments;
    }

    public static Admin getAdmin(String email){
        Admin admin = null;
        try {
            PreparedStatement stmt = connection.prepareStatement("select * from admin where email = ?");
            stmt.setString(1, email);
            ResultSet resultSet = stmt.executeQuery();
            if(resultSet.next()){
                admin = new Admin();
                admin.setId(resultSet.getLong("id"));
                admin.setEmail(resultSet.getString("email"));
                admin.setPassword(resultSet.getString("password"));
            }
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return admin;
    }




    public static boolean editBeauty(Beauty beauty){
        int rows=0;
        try {
            PreparedStatement stmt = connection.prepareStatement("update beauty set masters=?, services=?, price=?, datetime=? photo=? where id=?");
            stmt.setString(1, beauty.getMasters());
            stmt.setString(2, beauty.getServices());
            stmt.setInt(3, beauty.getPrice());
            stmt.setString(4, beauty.getDatetime());
            stmt.setString(5, beauty.getPhoto());
            stmt.setLong(6, beauty.getId());

            rows=stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rows>0;
    }


    public static boolean editProduct(Product beauty){
        int rows=0;
        try {
            PreparedStatement stmt = connection.prepareStatement("update product set photo=?, name=?, description=?, price=?  where id=?");
            stmt.setString(1, beauty.getPhoto());
            stmt.setString(2, beauty.getName());
            stmt.setString(3, beauty.getDescription());
            stmt.setInt(4, beauty.getPrice());
            stmt.setLong(5, beauty.getId());
            rows=stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rows>0;
    }

    public static boolean delete(Long id){
        int rows=0;
        try {
            PreparedStatement stmt = connection.prepareStatement("delete from beauty where id=?");
        stmt.setLong(1, id);
        rows=stmt.executeUpdate();
        stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rows>0;
    }

    public static boolean deleteProduct(Long id){
        int rows=0;
        try {
            PreparedStatement stmt = connection.prepareStatement("delete from product where id=?");
            stmt.setLong(1, id);
            rows=stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rows>0;
    }


    public static boolean addUser(User user){
        int rows=0;
        try {
            PreparedStatement stmt = connection.prepareStatement("insert into login (email, password, city, user_name) values (?, ?, ?, ?)");
        stmt.setString(1, user.email);
        stmt.setString(2, user.password);
        stmt.setString(3, user.city);
        stmt.setString(4, user.userName);
        rows=stmt.executeUpdate();
        stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rows>0;
    }

    public static boolean addProduct(Product product){
        int rows=0;
        try {
            PreparedStatement stmt = connection.prepareStatement("insert into product (photo, name, description, price, user_id, post_date) values (?, ?, ?, ?, ?,  now())");
        stmt.setString(1, product.photo);
        stmt.setString(2, product.name);
        stmt.setString(3, product.description);
        stmt.setInt(4, product.price);
        stmt.setLong(5, product.getUser_id().getId());
        rows= stmt.executeUpdate();
        stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rows>0;
    }

    public static boolean order(Product product){
        int rows=0;
        try {
            PreparedStatement stmt = connection.prepareStatement("insert into orderproduct (photo, name, description, price, user_id, postdate) values (?, ?, ?, ?, ?, now())");
        stmt.setString(1, product.getPhoto());
        stmt.setString(2, product.getName());
        stmt.setString(3, product.getDescription());
        stmt.setInt(4, product.getPrice());
        stmt.setLong(5, product.getUser_id().getId());
        rows= stmt.executeUpdate();
        stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rows>0;
    }

    public static ArrayList<Product> getOrders(){
        ArrayList<Product> list =new ArrayList<>();
        try {
            PreparedStatement stmt = connection.prepareStatement("select o.id, o.photo, o.name, o.description, o.price, o.postdate, l.email, l.user_name " +
                    "from orderproduct o " +
                    "join login l on o.user_id=l.id " +
                    "order by o.postdate desc ");
        ResultSet resultSet = stmt.executeQuery();
        while (resultSet.next()){
            Product product=new Product();
            product.setId(resultSet.getLong("id"));
            product.setPhoto(resultSet.getString("photo"));
            product.setName(resultSet.getString("name"));
            product.setDescription(resultSet.getString("description"));
            product.setPrice(resultSet.getInt("price"));
            product.setPost_date(resultSet.getTimestamp("postdate"));
            User user= new User();
            user.setEmail(resultSet.getString("email"));
            user.setUserName(resultSet.getString("user_name"));
            product.setUser_id(user);
            list.add(product);
        }
        stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }


    public static ArrayList<Product> getOrdersP(Long id){
        ArrayList<Product> list =new ArrayList<>();
        try {
            PreparedStatement stmt = connection.prepareStatement("select o.id, o.photo, o.name, o.description, o.price, o.postdate, l.email, l.user_name " +
                    "from orderproduct o " +
                    "join login l on o.user_id=l.id  " +
                    "where l.id=? " +
                    "order by o.postdate desc ");
            stmt.setLong(1, id);
            ResultSet resultSet = stmt.executeQuery();
            while (resultSet.next()){
                Product product=new Product();
                product.setId(resultSet.getLong("id"));
                product.setPhoto(resultSet.getString("photo"));
                product.setName(resultSet.getString("name"));
                product.setDescription(resultSet.getString("description"));
                product.setPrice(resultSet.getInt("price"));
                product.setPost_date(resultSet.getTimestamp("postdate"));
                User user= new User();
                user.setEmail(resultSet.getString("email"));
                user.setUserName(resultSet.getString("user_name"));
                product.setUser_id(user);
                list.add(product);
            }
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }


     public static boolean deleteAppProduct(Long id){
        int rows=0;
         try {
             PreparedStatement stmt = connection.prepareStatement("delete from orderproduct where id=?");
         stmt.setLong(1, id);
         rows= stmt.executeUpdate();
         stmt.close();
         } catch (SQLException e) {
             throw new RuntimeException(e);
         }
         return rows>0;
     }


     public static ArrayList<User> getAllUsers(){
        ArrayList<User> users = new ArrayList<>();
         try {
             PreparedStatement stmt = connection.prepareStatement("select * from login");
             ResultSet resultSet = stmt.executeQuery();
             while (resultSet.next()){
                 User user = new User();
                 user.setId(resultSet.getLong("id"));
                 user.setEmail(resultSet.getString("email"));
                 user.setPassword(resultSet.getString("password"));
                 user.setCity(resultSet.getString("city"));
                 user.setUserName(resultSet.getString("user_name"));
                 users.add(user);
             }
             stmt.close();
         } catch (SQLException e) {
             throw new RuntimeException(e);
         }
         return users;
     }


     public static User getUserr(Long id){
        User user= null;
         try {
             PreparedStatement stmt = connection.prepareStatement("select * from login where id=?");
        stmt.setLong(1, id);
        ResultSet resultSet= stmt.executeQuery();
        if (resultSet.next()){
            user=new User();
            user.setId(resultSet.getLong("id"));
            user.setEmail(resultSet.getString("email"));
            user.setPassword(resultSet.getString("password"));
            user.setCity(resultSet.getString("city"));
            user.setUserName(resultSet.getString("user_name"));

        }
        stmt.close();
         } catch (SQLException e) {
             throw new RuntimeException(e);
         }
         return user;
     }

     public static boolean editUser(User user){
        int rows=0;
         try {
             PreparedStatement stmt = connection.prepareStatement("update login set email=?, password=?, city=?, user_name=? where id=? ");
             stmt.setString(1, user.getEmail());
             stmt.setString(2, user.getPassword());
             stmt.setString(3, user.getCity());
             stmt.setString(4, user.getUserName());
             stmt.setLong(5, user.getId());
             rows=stmt.executeUpdate();
             stmt.close();
         } catch (SQLException e) {
             throw new RuntimeException(e);
         }
         return rows>0;
     }

     public static boolean deleteU(Long id){
        int rows=0;
         try {
             PreparedStatement stmt = connection.prepareStatement("delete from login where id=?");
         stmt.setLong(1, id);
         rows=stmt.executeUpdate();
         } catch (SQLException e) {
             throw new RuntimeException(e);
         }
         return rows>0;
     }





}
