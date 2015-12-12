package controller;

import model.User;

import java.io.* ;
import java.sql.SQLException;
import javax.servlet.http.* ;
import javax.servlet.* ;

public class LoginServlet extends HttpServlet implements Servlet {
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
                session.setAttribute("rank",String.valueOf(user.getRank()));
                session.setAttribute("balance",String.valueOf(user.getBalance()));
                session.setAttribute("consumption",String.valueOf(user.getConsumption()));
                resp.sendRedirect("success.jsp") ;
            } else {
                session.setAttribute("message", "用户名和密码不匹配。");
                resp.sendRedirect("fail.jsp") ;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
