package controller.task;

/**
 * Created by user on 2015/12/18.
 */

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

import javax.servlet.http.HttpServlet;

import common.MainClass;
import common.SendEmail;
import model.Database;
import model.Task;
import model.User;
import sun.applet.Main;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;
import java.io.IOException;
import java.sql.SQLException;

public class TaskModifyServlet extends HttpServlet {
    private int index;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().setAttribute("navbarActive", "taskManage");
        index=Integer.valueOf(req.getParameter("index"));
        RequestDispatcher dispatcher = req.getRequestDispatcher("/user/taskModify.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        HttpSession session = req.getSession();
        String userEmail = (String) String.valueOf(session.getAttribute("email"));
        String receive_mail = req.getParameter("receive_mail");
        String receive_mail_password = req.getParameter("receive_mail_password");
        String date = req.getParameter("time");
        String send_email =req.getParameter("send_email");
        String send_email_password = req.getParameter("send_mail_password");
        String send_to_email = req.getParameter("send_to_mail");
        String weibo_acount = req.getParameter("weibo_acount");
        String weibo_password = req.getParameter("weibo_password");
        String message = req.getParameter("message");

        int timeOrMail = (date != null)?0:((receive_mail==null)?2:1);      // 1: mail ; 0: date;
        int mailOrWeibo = (weibo_acount == null)?0:1;     // 0:mail; 1: weibo;


        System.out.println(receive_mail+"\n"+receive_mail_password+"\n"+date+"\n"+send_email+"\n"+send_email_password+"\n"+weibo_acount+"\n"+weibo_password);
        Task task  = new Task(userEmail,String.valueOf(index),timeOrMail,receive_mail,receive_mail_password,send_email,send_email_password,send_to_email,date,"time",mailOrWeibo,weibo_acount,weibo_password,message);
        System.out.println(task.toString());
        task.update();

        // String _taskName, int _TimeOrMail,String _address,String _password, String _mailFromID,String _mailPassword,String _mailToID,String _strDate,String _strTime,int    _MailOrWeibo,String _weiboID,String _weiboPassword,String _messageContent){
        resp.sendRedirect("/user/taskManage") ;
    }
}
