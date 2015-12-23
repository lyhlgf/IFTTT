package controller.user;

import model.PostMessage;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class UserMailboxServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String email = (String) session.getAttribute("email");
        ArrayList<PostMessage> privateMessage = PostMessage.getPostMessage(email);
        ArrayList<PostMessage> publicMessage = PostMessage.getPostMessage("public");
        session.setAttribute("privateMessage", privateMessage);
        session.setAttribute("publicMessage", publicMessage);
        session.setAttribute("navbarActive", "mailbox");
        RequestDispatcher dispatcher = req.getRequestDispatcher("/user/mailbox.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
