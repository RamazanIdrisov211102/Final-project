package kz.javaee.javaEE;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/adminEdit")
public class adminEdit extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id= Long.valueOf(req.getParameter("id"));
        User user= DBManager.getUserr(id);
        req.getSession().setAttribute("user", user);
        req.getRequestDispatcher("/adminEdit.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String red="/adminEdit?error";
        Long id= Long.valueOf(req.getParameter("id"));
        String email= req.getParameter("email");
        String password= req.getParameter("password");
        String city = req.getParameter("city");
        String userName= req.getParameter("userName");
        User user=new User();
        user.setId(id);
        user.setEmail(email);
        user.setPassword(password);
        user.setCity(city);
        user.setUserName(userName);
        if (DBManager.editUser(user)){
            red= "/adminUser?success";
        }
        resp.sendRedirect(red);
    }
}
