package topic.member;

import java.io.IOException;

import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/Check")
public class Check extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private TopicDao Dao;


    public Check() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("UTF-8");
				Dao = TopicFactory.createTopicDao();
				UserBean User = new topic.member.UserBean();
				User.setUsername(request.getParameter("username"));
				User.setPassword(request.getParameter("password"));
				
				UserBean checkUser;
				try {
					
					Dao.createConn();
					checkUser = Dao.queryUserBeanDB(User);
					if(checkUser!=null && checkUser.getPermission()==1) {
						HttpSession session1 = request.getSession();
						session1.setAttribute("name", checkUser.getName());
						session1.setAttribute("username", User.getUsername());
						session1.setAttribute("phone",checkUser.getPhone());
						session1.setAttribute("Permission",checkUser.getPermission());
						Dao.closeConn();
						RequestDispatcher rd = request.getRequestDispatcher("#");
						rd.forward(request, response);
					}else if(checkUser!=null) {
						HttpSession session1 = request.getSession();
						session1.setAttribute("name", checkUser.getName());
						session1.setAttribute("username", User.getUsername());
						session1.setAttribute("phone",checkUser.getPhone());
						session1.setAttribute("Permission",checkUser.getPermission());
						Dao.closeConn();
						RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
						rd.forward(request, response);
					
					
					}else {
						Dao.closeConn();
						RequestDispatcher rd = request.getRequestDispatcher("/Login2.html");
						rd.forward(request, response);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (NamingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			


					
			}

	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
