package controller.user;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Cloud on 15/12/14.
 */
public class UserInfoServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().setAttribute("navbarActive", "accountInfo");
        RequestDispatcher dispatcher = req.getRequestDispatcher("/user/userInformation.jsp");
        dispatcher.forward(req, resp);
    }
}
