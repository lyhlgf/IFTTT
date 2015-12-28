package controller.task;

import javax.servlet.http.*;

import model.Database;
import model.Task;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import java.io.IOException;
import java.sql.SQLException;


public class NewTaskServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/user/index.jsp");
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
        String listen_weibo_id=req.getParameter("listen_weibo_id");
        String listen_weibo_password=req.getParameter("listen_weibo_password");
        String listen_weibo_message=req.getParameter("listen_weibo_message");

        int timeOrMail = (listen_weibo_id != null)?2:((receive_mail==null)?0:1);      // 1: mail ; 0: date; 2: weibo;
        int mailOrWeibo = (weibo_acount == null)?0:1;     // 0:mail; 1: weibo;

        Database database=new Database();
        int[] indexs= null;
        try {
            indexs = database.getIndex(userEmail);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        database.closeConnection();

        int count=0;
        if(indexs!=null) {
            for (int i = 0; i < indexs.length; i++) {
                if (i < indexs[i]) {
                    count = i;
                    break;
                }
            }
            if(count==0) {
                count=indexs.length;
            }
          //  System.out.println("index: "+indexs.length+" "+count);
        }


        Task task  = new Task(userEmail,String.valueOf(count),timeOrMail,receive_mail,receive_mail_password,send_email,
                send_email_password,send_to_email,date,"time",mailOrWeibo,weibo_acount,weibo_password,message,
                listen_weibo_id,listen_weibo_password,listen_weibo_message);

        task.insert();
        resp.sendRedirect("/user/index") ;
    }
}
