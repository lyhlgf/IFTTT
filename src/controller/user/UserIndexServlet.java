package controller.user;

import model.Thing;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class UserIndexServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.setAttribute("navbarActive", "userIndex");
        ArrayList<Thing> things = Thing.getAllThings();
        session.setAttribute("things", things);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/user/index.jsp");
        dispatcher.forward(req, resp);
    }
}
