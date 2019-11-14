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
 * Servlet implementation class cancelBooking
 */
@WebServlet("/cancelBooking")
public class cancelBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookingDao Dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cancelBooking() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int id =Integer.parseInt(request.getParameter("id"));
		
		
		try {
			Dao = BookingFactory.createBookingDao();
			Dao.createConn();
			Dao.cancelBooking(id);
			Dao.closeConn();
			request.getRequestDispatcher("QueryBooking")
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
