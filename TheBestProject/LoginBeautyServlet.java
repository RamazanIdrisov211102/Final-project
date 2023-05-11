package kz.javaee.javaEE;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/loginBeauty")
public class LoginBeautyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie cookie[] = req.getCookies();
        String cookieValue="no value no language";

        if (cookie!= null){
            for (Cookie cookie1 : cookie){
                if (cookie1.getName().equals("language")){
                    cookieValue= cookie1.getValue();
                    break;
                }
            }
        }
        req.setAttribute("language", cookieValue);
        ArrayList<Product> product = DBManager.getAllProducts();
        req.setAttribute("product", product);
        req.getRequestDispatcher("/loginBeauty.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String red= "/loginBeauty?emailError";
        String email= req.getParameter("email");
        String password= req.getParameter("password");
        Admin admin = DBManager.getAdmin(email);
        if(admin != null){
            red = "/admin?passwordError";
            if(admin.getPassword().equals(password)){
                red = "/loginBeauty?success";
                req.getSession().setAttribute("currentAdmin",admin);
            }
        }
        User user = DBManager.getUser(email);
        if (user != null){
            red= "/loginBeauty?passwordError";
            if (user.getPassword().equals(password)){
                red="/loginBeauty?success";
                req.getSession().setAttribute("currentUser", user);
            }
        }
        resp.sendRedirect(red);

    }
}
