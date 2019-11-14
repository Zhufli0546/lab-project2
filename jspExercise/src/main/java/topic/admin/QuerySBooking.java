package topic.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import topic.booking.BookingDao;
import topic.booking.BookingData;
import topic.booking.BookingFactory;

/**
 * Servlet implementation class QueryOneBooking
 */
@WebServlet("/QuerySBooking")
public class QuerySBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuerySBooking() {
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
			BookingDao Dao = BookingFactory.createBookingDao();
			Dao.createConn();
			BookingData Booking = Dao.querySBooking(id);
			Dao.closeConn();
			request.setAttribute("Booking",Booking);
			RequestDispatcher rd = request.getRequestDispatcher("/UpdateBooking.jsp");
			rd.forward(request, response);
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
