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

public class TaskDeleteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().setAttribute("navbarActive", "taskManage");
        int index=Integer.valueOf(req.getParameter("index"));
        HttpSession session = req.getSession();
        String userEmail = (String) String.valueOf(session.getAttribute("email"));
        Task.deleteTask(index,userEmail);
       // RequestDispatcher dispatcher = req.getRequestDispatcher("/user/taskManage.jsp");
    //    dispatcher.forward(req, resp);
        resp.sendRedirect("/user/taskManage");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.sendRedirect("/user/taskManage");
    }
}
