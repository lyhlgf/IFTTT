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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class UserModifyPasswordServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().setAttribute("navbarActive", "modifyPassword");
        RequestDispatcher dispatcher = req.getRequestDispatcher("/user/modifyPassword.jsp");
        dispatcher.forward(req, resp);
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8") ;
        req.setCharacterEncoding("UTF-8") ;

        HttpSession session =  req.getSession() ;
        String email = (String) String.valueOf(session.getAttribute("email"));
        String old_password = req.getParameter("old password");
        String new_password = req.getParameter("new password");


        User user = new User(email, old_password);

        try {
            if (user.getUser()) {
                session.setAttribute("isFail",false);
                user.setPassword(new_password);
                session.setAttribute("password",new_password);              // update session value
                resp.sendRedirect("/user/index") ;
            } else {
                session.setAttribute("isFail",true);
                resp.sendRedirect("/user/modifyPassword") ;

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
