package kz.javaee.javaEE;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/editProduct")
public class EditProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getRequestDispatcher("/editProduct.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String redirect = "/editProduct?error";
        Long id = Long.valueOf(req.getParameter("id"));
        String photo = req.getParameter("photo");
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        int price = Integer.parseInt(req.getParameter("price"));
        Product student = new Product();
        student.setId(id);
        student.setPhoto(photo);
        student.setName(name);
        student.setDescription(description);
        student.setPrice(price);
        if (DBManager.editProduct(student)){
            redirect="/editProduct?success";
        }
        resp.sendRedirect(redirect);
    }
}
