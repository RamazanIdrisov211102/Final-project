package kz.javaee.javaEE;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/registerBeauty")
public class RegisterBeautyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/registerBeauty.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String red = "/registerBeauty?error";
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String password1 = req.getParameter("password1");
        String city = req.getParameter("city");
        String userName = req.getParameter("userName");
        User checkUser = DBManager.getUser(email);

            if (checkUser == null) {

                User user = new User();
                user.setEmail(email);
                user.setPassword(password);
                user.setCity(city);
                user.setUserName(userName);
                if (password.equals(password1)) {
                if (DBManager.registerBeauty(user)) {
                    red = "/loginBeauty";
                }
            }
        }
            resp.sendRedirect(red);

    }
    }

