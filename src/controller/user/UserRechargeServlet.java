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

public class UserRechargeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/user/accountRecharge.jsp");
        dispatcher.forward(req, resp);
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8") ;
        req.setCharacterEncoding("UTF-8") ;

        HttpSession session =  req.getSession() ;
        String email = (String) String.valueOf(session.getAttribute("email"));
        int money = Integer.parseInt(req.getParameter("money"));
        String password = req.getParameter("password");

        User user = new User(email, password);

        try {
            if (user.getUser()) {
                int newBalance=user.getBalance()+money;
                user.setBalance(newBalance);
                session.setAttribute("balance",newBalance);             // update session value
                session.setAttribute("isFail",false);
                resp.sendRedirect("/user/index") ;
            }
            else {
                session.setAttribute("isFail",true);
                resp.sendRedirect("/user/accountRecharge") ;

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
