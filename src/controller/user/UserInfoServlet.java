package controller.user;

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

public class UserInfoServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.setAttribute("navbarActive", "accountInfo");
        String email = (String) session.getAttribute("email");
        User user = new User(email);
        user.getUserDetail();
        session.setAttribute("user", user);
        ArrayList<Bill> bills = Bill.getAllBills(email);
        session.setAttribute("bills", bills);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/user/userInformation.jsp");
        dispatcher.forward(req, resp);
    }
}
