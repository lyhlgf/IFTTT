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
import java.sql.Time;

import java.util.*;

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

        int actualIndex=0;
        for(int i=0;actualIndex<size;i++) {
         //   Task temp = MainClass.tasks.get(i);
            Task temp = new Task();
            try {
                boolean ret= temp.getFromDatabase(i,userEmail);
                if(ret==false) {
                    continue;
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
            taskNames[actualIndex] = temp.taskName;
            taskThis[actualIndex] =  (temp.TimeOrMail==1)?"Receive mail from "+temp.address:"Time reach at "+temp.strDate;
            taskThat[actualIndex] = (temp.MailOrWeibo==1)?"Send weibo to "+temp.weiboID+" with content: "+temp.messageContent:"Send mail to "+temp.mailToID+" with content: "+temp.messageContent;
            taskRunning[actualIndex] = (temp.isRunning)?"Running":"Paused";
            actualIndex++;
        }


        session.setAttribute("taskName", taskNames) ;
        session.setAttribute("This", taskThis) ;
        session.setAttribute("That", taskThat) ;
        session.setAttribute("isRunning", taskRunning) ;
        database.closeConnection();
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

      //  Timer timer=new Timer();

        if(task.isRunning==false) {
            task.isRunning=true;
            task.setTaskState(String.valueOf(index),userEmail,1);
            task.timer=new Timer();
            task.timer.schedule(task, 1000, 1000);
        }
        else {
            task.isRunning=false;
            session.setAttribute("taskRunning["+index+"]",0);
            task.setTaskState(String.valueOf(index),userEmail,0);
        }

        resp.sendRedirect("/user/taskManage") ;
    }
}
