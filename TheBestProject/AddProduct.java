package kz.javaee.javaEE;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/addProduct")
public class AddProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/addProduct.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String red= "/addProduct?error";
        String photo= req.getParameter("photo");
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        int price = Integer.parseInt(req.getParameter("price"));
        User currentUser = (User) req.getSession().getAttribute("currentUser");
        Product product = new Product();
        product.setPhoto(photo);
        product.setName(name);
        product.setDescription(description);
        product.setPrice(price);
        product.setUser_id(currentUser);
        if (DBManager.addProduct(product)){
            red="/addProduct?success";
        }
        resp.sendRedirect(red);
    }
}
