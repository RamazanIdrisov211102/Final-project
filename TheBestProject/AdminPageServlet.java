package kz.javaee.javaEE;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/admin")
public class AdminPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String redirect = "/login?emailError";
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        Admin admin = DBManager.getAdmin(email);
        if(admin != null){
            redirect = "/admin?passwordError";
            if(admin.getPassword().equals(password)){
                redirect = "/admin?success";
                req.getSession().setAttribute("currentAdmin",admin);
            }
        }
        resp.sendRedirect(redirect);
    }
}
