package controller.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AdminLoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest)servletRequest;
        HttpServletResponse resp = (HttpServletResponse)servletResponse;
        HttpSession session = req.getSession();
        if (session.getAttribute("login") == null) {
            session.setAttribute("message", "您还没有登录! ");
            resp.sendRedirect("/fail.jsp");
        } else if (!(boolean)session.getAttribute("admin")) {
            session.setAttribute("message", "您无权限访问该页面! ");
            resp.sendRedirect("/fail.jsp");
        } else {
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    @Override
    public void destroy() {

    }
}
