package controller.webAdmin;

<<<<<<< HEAD:src/controller/user/UserConsumeRecordServlet.java
/**
 * Created by user on 2015/12/14.
 */

import model.Consume;

=======
>>>>>>> upstream/master:src/controller/webAdmin/AdminIndexServlet.java
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
<<<<<<< HEAD:src/controller/user/UserConsumeRecordServlet.java
import java.sql.SQLException;

public class UserConsumeRecordServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().setAttribute("navbarActive", "consumeRecord");

        HttpSession session =  req.getSession() ;
        String userEmail = (String) String.valueOf(session.getAttribute("email"));

        Consume consume=new Consume(userEmail);
        Consume[] results=null;
        try {
            results = consume.getConsume();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        session.setAttribute("consumes",results);

        RequestDispatcher dispatcher = req.getRequestDispatcher("consumeRecord.jsp");
=======

public class AdminIndexServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().setAttribute("navbarActive", "adminIndex");
        RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/index.jsp");
>>>>>>> upstream/master:src/controller/webAdmin/AdminIndexServlet.java
        dispatcher.forward(req, resp);
    }
}
