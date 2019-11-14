package topic.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import topic.booking.BookingDao;
import topic.booking.BookingFactory;

/**
 * Servlet implementation class SetTimePeople
 */
@WebServlet("/SetTimePeople")
public class SetTimePeople extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SetTimePeople() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		 TimePeopleBean Set = new topic.admin.TimePeopleBean();
		 Set.setTime1(request.getParameter("time1"));
		 Set.setTime2(request.getParameter("time2"));
		 Set.setTime3(request.getParameter("time3"));
		 Set.setTime4(request.getParameter("time4"));
		 Set.setTime5(request.getParameter("time5"));
		 Set.setTime6(request.getParameter("time6"));
		 Set.setTime7(request.getParameter("time7"));
		 Set.setTime8(request.getParameter("time8"));
		 
		 Set.setPeople1(request.getParameter("people1"));
		 Set.setPeople2(request.getParameter("people2"));
		 Set.setPeople3(request.getParameter("people3"));
		 Set.setPeople4(request.getParameter("people4"));
		 Set.setPeople5(request.getParameter("people5"));
		 Set.setPeople6(request.getParameter("people6"));
		 Set.setPeople7(request.getParameter("people7"));
		 Set.setPeople8(request.getParameter("people8"));
		 
		 
		 try {
			 BookingDao Dao = BookingFactory.createBookingDao();
			 Dao.createConn();
			 Dao.setTimePeople(Set);
			 Dao.closeConn();
			 
				request.getRequestDispatcher("SetTimePeople.jsp")
				.forward(request, response);
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
