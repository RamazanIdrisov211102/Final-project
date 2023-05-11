package kz.javaee.javaEE;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/editBeauty")
public class EditBeautyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/editBeauty.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String red="/editBeauty?error";
        Long id = Long.valueOf(req.getParameter("id"));
        String masters = req.getParameter("masters");
        String services = req.getParameter("services");
        int price = Integer.parseInt(req.getParameter("price"));
        String datetime = req.getParameter("datetime");
        String photo = req.getParameter("photo");
        Beauty beauty = new Beauty();
        beauty.setId(id);
        beauty.setMasters(masters);
        beauty.setServices(services);
        beauty.setPrice(price);
        beauty.setDatetime(datetime);
        beauty.setPhoto(photo);
        if (DBManager.editBeauty(beauty)){
            red="/loginBeauty";
        }
        resp.sendRedirect(red);
    }
}
