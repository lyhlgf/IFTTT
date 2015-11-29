/**
 * Created by user on 2015/11/27.
 */

import java.sql.* ;
import java.io.* ;
import javax.servlet.http.* ;
import javax.servlet.* ;
public class LoginServlet extends HttpServlet implements Servlet{
    public LoginServlet(){
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.setContentType("text/html;charset=gb2312") ;
        request.setCharacterEncoding("gb2312") ;
        String result = "" ;
        //获取用户名
        String username = request.getParameter("username") ;
        String psw = request.getParameter("password") ;
        if ((username == "") || (username==null) || (username.length() > 20 )){
            try{
                result = "请输入用户名(不能超过20个字符)!" ;
                request.setAttribute("message" ,result) ;
                response.sendRedirect("login.jsp") ;
            }catch(Exception e){
                e.printStackTrace() ;
            }
        }
        if ((psw == "") || (psw==null) || (psw.length() > 20 )){
            try{
                result = "请输入密码(不能超过20个字符)!" ;
                request.setAttribute("message" ,result) ;
                response.sendRedirect("login.jsp") ;
            }catch(Exception e){
                e.printStackTrace() ;
            }
        }

        //登记JDBC驱动程序
        try{
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("加载驱动成功 . ") ;
        }catch(ClassNotFoundException e){
            e.printStackTrace() ;
            System.out.println("加载驱动失败. ") ;
        }

        //连接URL
        String url ="jdbc:mysql://localhost:3306/mysql" ;
        Connection conn = null ;
        Statement stmt = null ;
        ResultSet rs = null ;

        try{
            conn = DriverManager.getConnection(url, "root", "root") ;
            stmt = conn.createStatement() ;
            System.out.print("成功连接到数据库！");
            //SQL语句
            String sql ="select * from userInfo where username='"+username+"' and userpsw= '"+psw+"'" ;
            rs = stmt.executeQuery(sql) ;//返回查询结果
        }catch(SQLException e){

            e.printStackTrace() ;
        }
        HttpSession session =  request.getSession() ;
        session.setAttribute("username", username) ;
        //System.out.println("+++++++++++++++++++++++"+ username) ;
        try{
            if (rs.next()){
                System.out.println("Succeed!");

                session.setAttribute("age",rs.getString("age")) ;
                session.setAttribute("sex",rs.getString("sex")) ;
                session.setAttribute("weight",rs.getString("weight")) ;
                response.sendRedirect("success.jsp") ;
            }else{
                System.out.println("failed!");
                session.setAttribute("message", "用户名或密码不匹配。");
                response.sendRedirect("fail.jsp") ;
            }
        }catch(SQLException e){
            e.printStackTrace() ;
        }
    }

    private static final long serialVersionUID = 1L;
}
