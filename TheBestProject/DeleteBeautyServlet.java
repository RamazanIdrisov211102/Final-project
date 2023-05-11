package kz.javaee.javaEE;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/deleteBeauty")
public class DeleteBeautyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String red="/deleteBeauty?error";
        Long id = Long.valueOf(req.getParameter("id"));
        if (DBManager.delete(id)){
            red= "/detailsBeauty";
        }
        resp.sendRedirect(red);
    }
}
