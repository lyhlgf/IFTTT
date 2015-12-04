package controller;

import model.Database;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class InitServlet extends HttpServlet {
    @Override
    public void init(ServletConfig config) throws ServletException {
        String dbDriver = config.getInitParameter("dbDriver");
        String dbUrl = config.getInitParameter("dbUrl");
        String dbUserName = config.getInitParameter("dbUserName");
        String dbPassword = config.getInitParameter("dbPassword");
        Database.init(dbDriver, dbUrl, dbUserName, dbPassword);
    }
}
