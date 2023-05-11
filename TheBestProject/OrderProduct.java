package kz.javaee.javaEE;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/orderProduct")
public class OrderProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String red="/loginBeauty?errorP";
        String photo = req.getParameter("photo");
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        int price = Integer.parseInt(req.getParameter("price"));
        User currentUser = (User) req.getSession().getAttribute("currentUser");
        if (currentUser!=null){
            Product product= new Product();
            product.setPhoto(photo);
            product.setName(name);
            product.setDescription(description);
            product.setPrice(price);
            product.setUser_id(currentUser);
            if (DBManager.order(product)){
                red= "/loginBeauty?successP";
            }
        }
        resp.sendRedirect(red);
    }
}
