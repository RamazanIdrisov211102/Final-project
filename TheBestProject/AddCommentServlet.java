package kz.javaee.javaEE;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/addComment")
public class AddCommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String red= "/loginBeauty";
        User currentUser = (User) req.getSession().getAttribute("currentUser");
        if (currentUser!= null){
            String commentText= req.getParameter("comment");
            Long blog_id = Long.parseLong(req.getParameter("blog_id"));
            Product product = DBManager.getProduct(blog_id);
            if (product!=null){
            Comment comment = new Comment();
            comment.setComment(commentText);
            comment.setProduct(product);
            comment.setUser(currentUser);
            if (DBManager.addComment(comment)){
                red="/readblog?id="+blog_id;
            }
            }
        }
        resp.sendRedirect(red);
    }
}
