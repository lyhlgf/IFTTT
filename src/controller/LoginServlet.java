package controller;

import model.User;
import java.io.* ;
import java.sql.SQLException;
import javax.servlet.http.* ;
import javax.servlet.* ;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        RequestDispatcher dispatcher = req.getRequestDispatcher("/login.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8") ;
        req.setCharacterEncoding("UTF-8") ;

        String email = req.getParameter("email");
        String password = req.getParameter("password");
        HttpSession session =  req.getSession() ;
        session.setAttribute("email", email) ;
        User user = new User(email, password);

        try {
            if (user.getUser()) {
                session.setAttribute("login", true);
                session.setAttribute("rank",String.valueOf(user.getRank()));
                session.setAttribute("balance",String.valueOf(user.getBalance()));
                session.setAttribute("consumption",String.valueOf(user.getConsumption()));
                resp.sendRedirect("/user/index") ;
            } else {
                session.setAttribute("message", "用户名或密码错误。");
                session.setAttribute("isFail", true);
                resp.sendRedirect("/login") ;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
