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


@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TopicDao Dao;
       

    public Register() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		UserBean User = new topic.member.UserBean();
		User.setName(request.getParameter("name"));
		User.setUsername(request.getParameter("username"));
		User.setPassword(request.getParameter("password"));
		User.setPhone(request.getParameter("phone"));
		
		try {
			    Dao = TopicFactory.createTopicDao();
				Dao.createConn();
			
				Dao.Register(User);
				
				Dao.closeConn();
				RequestDispatcher rd = request.getRequestDispatcher("/Login3.html");
				rd.forward(request, response);
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
