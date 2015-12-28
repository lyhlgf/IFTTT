package controller.webAdmin;

import model.PostMessage;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class NewPostMessageServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.setAttribute("navbarActive", "postMessageManage");
        String idString = req.getParameter("ID");
        String email = req.getParameter("email");
        if (idString != null) {
            int id = Integer.parseInt(idString);
            PostMessage postMessage = PostMessage.getPostMessage(id);
            session.setAttribute("edit", true);
            session.setAttribute("postMessage", postMessage);
        } else {
            session.setAttribute("edit", false);
        }
        if (email != null) {
            session.setAttribute("email", email);
            session.setAttribute("hasEmail", true);
        } else {
            session.setAttribute("hasEmail", false);
        }
        RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/newPostMessage.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        HttpSession session = req.getSession();
        session.setAttribute("navbarActive", "postMessageManage");
        String email = req.getParameter("email");
        String subject = req.getParameter("subject");
        String content = req.getParameter("content");
        String idStr = req.getParameter("ID");
        if (idStr == null) {
            PostMessage postMessage = new PostMessage(email, subject, content);
            postMessage.insert();
        } else {
            int id = Integer.parseInt(idStr);
            PostMessage.update(id, "Subject", subject);
            PostMessage.update(id, "Content", content);
        }
        resp.sendRedirect("/admin/postMessageManage");
    }
}
