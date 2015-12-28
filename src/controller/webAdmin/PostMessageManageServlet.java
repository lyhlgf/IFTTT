package controller.webAdmin;

import model.PostMessage;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class PostMessageManageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String type = req.getParameter("type");
        session.setAttribute("navbarActive", "postMessageManage");
        RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/postMessageManage.jsp");
        if (type == null) {
            ArrayList<PostMessage> postMessages = PostMessage.getAllPostMessage();
            session.setAttribute("postMessages", postMessages);
            dispatcher.forward(req, resp);
        } else {
            int id = Integer.parseInt(req.getParameter("ID"));
            PostMessage postMessage = PostMessage.getPostMessage(id);
            switch (type) {
                case "mailDetail" :
                    session.setAttribute("messageDetail", postMessage);
                    dispatcher = req.getRequestDispatcher("/admin/postMessageDetail.jsp");
                    dispatcher.forward(req, resp);
                    break;
                case "edit" :
                    resp.sendRedirect("/admin/newPostMessage?ID="+id);
                    break;
                case "delete" :
                    PostMessage.delete(id);
                    resp.sendRedirect("/admin/postMessageManage");
                    break;
                default : break;
            }
        }
    }
}
