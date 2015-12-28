package controller.task;

/**
 * Created by user on 2015/12/18.
 */

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

import javax.servlet.http.HttpServlet;

import common.ListenWeibo;

import model.Bill;
import model.Database;
import model.Task;
import model.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.SQLException;


import java.util.*;

public class TaskManageServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().setAttribute("navbarActive", "taskManage");

        Database database = new Database();
        HttpSession session =  req.getSession() ;
        String userEmail = (String) String.valueOf(session.getAttribute("email"));

        int size= 0;
        try {
            size = database.getNumberOfTasks(userEmail);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        String[] taskNames=new String[size];
        String[] taskThis=new String[size];
        String[] taskThat=new String[size];
        String[] taskRunning=new String[size];
        int[]  taskThisEvents=new int[size];
        int[]  taskThatEvents=new int[size];

        int actualIndex=0;
        for(int i=0;actualIndex<size;i++) {
            Task temp = new Task();
            try {
                boolean ret= temp.getFromDatabase(i,userEmail);
                if(ret==false) {
                    continue;
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
            // 1: mail ; 0: date; 2: weibo;
            taskNames[actualIndex] = temp.taskName;
            taskThis[actualIndex] =  (temp.TimeOrMail==1)?"Receive mail from "+temp.address:(temp.TimeOrMail==0?"Time reach at "+temp.strDate:"Listen weibo "+temp.listenWeiBoID);
            taskThat[actualIndex] = (temp.MailOrWeibo==1)?"Send weibo to "+temp.weiboID+" with content: "+temp.messageContent:"Send mail to "+temp.mailToID+" with content: "+temp.messageContent;
            taskRunning[actualIndex] = (temp.isRunning)?"Running":"Paused";
            taskThisEvents[actualIndex]=(temp).TimeOrMail;
            taskThatEvents[actualIndex]=(temp).MailOrWeibo;
            actualIndex++;
        }


        session.setAttribute("taskName", taskNames) ;
        session.setAttribute("This", taskThis) ;
        session.setAttribute("That", taskThat) ;
        session.setAttribute("isRunning", taskRunning) ;
        session.setAttribute("thisEvents",taskThisEvents);
        session.setAttribute("thatEvents",taskThatEvents);


        if(session.getAttribute("balanceNotEnough")==null)
            session.setAttribute("balanceNotEnough",0);
        database.closeConnection();

        RequestDispatcher dispatcher = req.getRequestDispatcher("/user/taskManage.jsp");
        dispatcher.forward(req, resp);    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().setAttribute("navbarActive", "taskManage");
        Task task=new Task();

        // 根据index从数据库中获取对应的任务内容
        int index=Integer.valueOf(req.getParameter("index"));
        HttpSession session =  req.getSession() ;
        String userEmail = (String) String.valueOf(session.getAttribute("email"));
        String password = (String)String.valueOf(session.getAttribute("password"));
        try {
            task.getFromDatabase(index,userEmail);
        }catch (Exception e) {
            e.printStackTrace();
        }
        // 运行任务
        if(task.isRunning==false) {
            // 20: mail ; 10: date; 30: weibo;  // 40:mail; 50: weibo;
            int totalConsume = ((task.TimeOrMail+1)*10 + (task.MailOrWeibo+4)*10);
            User user=new User(userEmail,password);
            try {
               user.getUser();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            totalConsume *= (User.MAX_RANK-(double)user.getRank()+1)/User.MAX_RANK;

            // 余额不足
            if(user.getBalance() < totalConsume) {
                session.setAttribute("balanceNotEnough",1);
            }
            // 正式运行
            else {
                // 更新任务状态
                task.isRunning = true;
                task.setTaskState(String.valueOf(index), userEmail, 1);

                // 更新用户余额和消费额
                int newBalance=user.getBalance()-totalConsume;
                user.setPoint(user.getPoint()+totalConsume);
                user.setRank(user.getPoint()/1000+1);
                user.setBalance(newBalance);
                user.setConsumption(user.getConsumption()+totalConsume);

                // 更新消费记录
                Bill bill = new Bill(user.getEmail(), totalConsume, totalConsume, newBalance);
                bill.insert();

                // 更新session中对应的值
                session.setAttribute("balance",newBalance);
                session.setAttribute("consumption",user.getConsumption());
                session.setAttribute("balanceNotEnough",0);

                if(task.TimeOrMail==2)
                    task.listenWeibo = new ListenWeibo(task.currentTime,task.listenWeiBoMessage,task.listenWeiBoID,task.listenWeiBoPassword);

                task.timer = new Timer();
                task.timer.schedule(task, 1000, 1000);
            }
        }
        else {
            task.isRunning=false;
            session.setAttribute("taskRunning["+index+"]",0);
            session.setAttribute("balanceNotEnough",0);
            task.setTaskState(String.valueOf(index),userEmail,0);
        }

        resp.sendRedirect("/user/taskManage") ;
    }
}
