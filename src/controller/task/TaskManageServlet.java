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

public class TaskManageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().setAttribute("navbarActive", "taskManage");
   //     int size=MainClass.tasks.size();
        Database database = new Database();
        HttpSession session =  req.getSession() ;
        String userEmail = (String) String.valueOf(session.getAttribute("email"));

        int size= 0;
        try {
            size = database.getNumberOfTasks(userEmail);
        } catch (SQLException e) {
            e.printStackTrace();
        }


        System.out.println(size);
        String[] taskNames=new String[size];
        String[] taskThis=new String[size];
        String[] taskThat=new String[size];
        String[] taskRunning=new String[size];
        for(int i=0;i<size;i++) {
         //   Task temp = MainClass.tasks.get(i);
            Task temp = new Task();
            try {
                temp.getFromDatabase(i,userEmail);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            taskNames[i] = temp.taskName;
            taskThis[i] =  (temp.TimeOrMail==1)?"Receive mail from "+temp.address:"Time reach at "+temp.strDate;
            taskThat[i] = (temp.MailOrWeibo==1)?"Send weibo to "+temp.weiboID+" with content: "+temp.messageContent:"Send mail to "+temp.mailToID+" with content: "+temp.messageContent;
            taskRunning[i] = (temp.isRunning)?"Running":"Paused";
        }


        session.setAttribute("taskName", taskNames) ;
        session.setAttribute("This", taskThis) ;
        session.setAttribute("That", taskThat) ;
        session.setAttribute("isRunning", taskRunning) ;

        RequestDispatcher dispatcher = req.getRequestDispatcher("/user/taskManage.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().setAttribute("navbarActive", "taskManage");
        Task task=new Task();
     //   System.out.println(req.getParameter("index"));
        int index=Integer.valueOf(req.getParameter("index"));
        HttpSession session =  req.getSession() ;
        String userEmail = (String) String.valueOf(session.getAttribute("email"));
        try {
            task.getFromDatabase(index,userEmail);
        }catch (Exception e) {
            e.printStackTrace();
        }

        Database database = new Database();
        if(task.isRunning==false) {
            task.isRunning=true;

            String sql = "update `IFTTT`.`Task`\n" +
                    "set isRunning = 1\n" +
                    "where taskName=\""+index+"\"; ";
            database.executeSQL(sql);
            Thread thread = new Thread(task);
            thread.start();
        }
        else {
            task.isRunning=false;
            String sql = "update `IFTTT`.`Task`\n" +
                    "set isRunning = 0\n" +
                    "where taskName=\""+index+"\"; ";
            database.executeSQL(sql);
        }
        database.closeConnection();

        resp.sendRedirect("/user/taskManage") ;
    }
}
