package controller.webAdmin;

import model.Thing;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class ThingManageServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.setAttribute("navbarActive", "thingManage");
        String name = req.getParameter("name");
        if (name != null) {
            Thing thing = new Thing(name);
            thing.getThing();
            if (thing.isEnable()) {
                thing.setEnable(false);
            } else {
                thing.setEnable(true);
            }
            thing.updateEnable();
        }
        ArrayList<Thing> things = Thing.getAllThings();
        session.setAttribute("things", things);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/thingManage.jsp");
        dispatcher.forward(req, resp);
    }
}
