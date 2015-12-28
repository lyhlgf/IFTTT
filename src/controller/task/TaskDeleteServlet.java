package controller.task;

/**
 * Created by user on 2015/12/18.
 */

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

import javax.servlet.http.HttpServlet;

import model.Task;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class TaskDeleteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().setAttribute("navbarActive", "taskManage");
        int index=Integer.valueOf(req.getParameter("index"));
        HttpSession session = req.getSession();

        String userEmail = (String) String.valueOf(session.getAttribute("email"));
        Task.deleteTask(index,userEmail);

        resp.sendRedirect("/user/taskManage");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.sendRedirect("/user/taskManage");
    }
}
