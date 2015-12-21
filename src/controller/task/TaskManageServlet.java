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
import model.Task;
import model.User;
import sun.applet.Main;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class TaskManageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
   //     int size=MainClass.tasks.size();
        int size=1;
       System.out.println(size);
        String[] taskNames=new String[size];
        String[] taskThis=new String[size];
        String[] taskThat=new String[size];
        String[] taskRunning=new String[size];
        for(int i=0;i<size;i++) {
         //   Task temp = MainClass.tasks.get(i);
            taskNames[i] ="1";
            taskThis[i] = "mail";
            taskThat[i] = "mail";
            taskRunning[i] = "Running";
        }

        HttpSession session =  req.getSession() ;
        session.setAttribute("taskName", taskNames) ;
        session.setAttribute("This", taskThis) ;
        session.setAttribute("That", taskThat) ;
        session.setAttribute("isRunning", taskRunning) ;

        RequestDispatcher dispatcher = req.getRequestDispatcher("/user/taskManage.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Task task=new Task();
        try {
            task.getFromDatabase();
        }catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("Task"+task.toString());
        Thread thread = new Thread(task);
        thread.run();

        resp.sendRedirect("/user/index") ;
    }
}
