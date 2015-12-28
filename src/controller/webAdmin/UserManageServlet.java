package controller.webAdmin;

import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class UserManageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.setAttribute("navbarActive", "userManage");
        ArrayList<User> users = User.getAllUser();
        session.setAttribute("users", users);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/userManage.jsp");
        dispatcher.forward(req, resp);
    }
}
