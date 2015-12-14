package controller.user;

/**
 * Created by user on 2015/12/14.
 */

import model.User;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
public class UserConsumeRecordServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().setAttribute("navbarActive", "consumeRecord");
        RequestDispatcher dispatcher = req.getRequestDispatcher("user/Account/consumeRecord.jsp");
        dispatcher.forward(req, resp);
    }
}
