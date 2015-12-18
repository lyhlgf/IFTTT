package controller.task;

import javax.servlet.http.HttpServlet;
import model.User;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class NewTaskServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/user/index.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String receive_mail = req.getParameter("receive_mail");
        String receive_mail_password = req.getParameter("receive_mail_password");
        String date = req.getParameter("time");
        String send_email =req.getParameter("send_email");
        String send_email_password = req.getParameter("send_email_password");
        String weibo_acount = req.getParameter("weibo_acount");
        String weibo_password = req.getParameter("weibo_password");

        System.out.println(receive_mail+"\n"+receive_mail_password+"\n"+date+"\n"+send_email+"\n"+send_email_password+"\n"+weibo_acount+"\n"+weibo_password);
      //  User user = new User(email, password);
       // user.insert();
        resp.sendRedirect("/task/taskManage") ;
    }
}
