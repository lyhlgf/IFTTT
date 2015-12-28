package controller.webAdmin;

import model.Bill;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class UserDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.setAttribute("navbarActive", "userManage");
        String email = req.getParameter("email");
        User user = new User(email);
        user.getUserDetail();
        session.setAttribute("user", user);
        ArrayList<Bill> bills = Bill.getAllBills(email);
        session.setAttribute("bills", bills);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/userDetail.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.setAttribute("navbarActive", "userManage");
        String email = req.getParameter("email");
        int rank = Integer.parseInt(req.getParameter("rank"));
        User user = new User(email);
        user.getUserDetail();
        user.setRank(rank);
        session.setAttribute("user", user);
        resp.sendRedirect("/admin/userDetail?email="+email);
    }
}
