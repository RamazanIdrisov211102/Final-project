package kz.javaee.javaEE;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/deleteAppProduct")
public class DeleteAppProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String red= "/appProduct?error";
        Long id= Long.valueOf(req.getParameter("id"));
        if (DBManager.deleteAppProduct(id)){
            red= "/appProduct?deleteSuccess";
        }
        resp.sendRedirect(red);
    }
}
