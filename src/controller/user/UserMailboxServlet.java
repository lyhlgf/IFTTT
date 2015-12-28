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
        session.setAttribute("navbarActive", "mailbox");
        String type = req.getParameter("type");
        RequestDispatcher dispatcher = req.getRequestDispatcher("/user/mailbox.jsp");
        if (type == null) {
            String email = (String) session.getAttribute("email");
            ArrayList<PostMessage> privateMessage = PostMessage.getPostMessage(email);
            ArrayList<PostMessage> publicMessage = PostMessage.getPostMessage("public");
            session.setAttribute("privateMessage", privateMessage);
            session.setAttribute("publicMessage", publicMessage);
            dispatcher.forward(req, resp);
        } else {
            int id = Integer.parseInt(req.getParameter("ID"));
            PostMessage postMessage = PostMessage.getPostMessage(id);
            switch (type) {
                case "mailDetail" :
                    if (!postMessage.isRead()) {
                        PostMessage.mark(id, "Read", true);
                    }
                    if (postMessage.getEmail().equals("public")) {
                        session.setAttribute("hideButtons", "hide");
                    } else {
                        session.setAttribute("hideButtons", "");
                    }
                    session.setAttribute("messageDetail", postMessage);
                    dispatcher = req.getRequestDispatcher("/user/mailDetail.jsp");
                    dispatcher.forward(req, resp);
                    break;
                case "important" :
                    if (postMessage.isImportant()) {
                        PostMessage.mark(id, "Important", false);
                    } else {
                       PostMessage.mark(id, "Important", true);
                    }
                    resp.sendRedirect("/user/mailbox?ID="+id+"&type=mailDetail");
                    break;
                case "delete" :
                    PostMessage.delete(id);
                    resp.sendRedirect("/user/mailbox");
                    break;
                default : break;
            }
        }
    }
}
