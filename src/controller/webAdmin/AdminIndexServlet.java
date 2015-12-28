package controller.webAdmin;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AdminIndexServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().setAttribute("navbarActive", "adminIndex");
        RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/index.jsp");
        dispatcher.forward(req, resp);
    }
}
