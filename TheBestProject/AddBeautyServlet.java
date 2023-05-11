package kz.javaee.javaEE;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/addBeauty")
public class AddBeautyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User currentUser = (User) req.getSession().getAttribute("currentUser");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String red="/loginBeauty";
        String masters = req.getParameter("masters");
        String services = req.getParameter("services");
        int price = Integer.parseInt(req.getParameter("price"));
        String datetime = req.getParameter("datetime");
        String photo = req.getParameter("photo");
        User currentUser = (User) req.getSession().getAttribute("currentUser");
        if (currentUser!=null){
            Beauty beauty= new Beauty();
            beauty.setMasters(masters);
            beauty.setServices(services);
            beauty.setPrice(price);
            beauty.setDatetime(datetime);
            beauty.setPhoto(photo);
            beauty.setUser_id(currentUser);
            if (DBManager.add(beauty)){
                red="/listOfServices?success";
            }
        }
        resp.sendRedirect(red);
    }
}
