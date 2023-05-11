package kz.javaee.javaEE;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/applications")
public class Applications extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ArrayList<Beauty> beau= DBManager.getAllList();
        req.setAttribute("ad", beau);

        Long id = Long.valueOf(req.getParameter("id"));
        ArrayList<Beauty> beauties = DBManager.getAllApplications(id);
        req.setAttribute("beauties", beauties);


        req.getRequestDispatcher("/applications.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
