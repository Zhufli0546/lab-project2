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
import topic.booking.BookingData;
import topic.booking.BookingFactory;

/**
 * Servlet implementation class UpdateBooking
 */
@WebServlet("/UpdateBooking")
public class UpdateBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBooking() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		BookingData Booking = new topic.booking.BookingData();
		Booking.setBookingid(Integer.parseInt(request.getParameter("id")));
		Booking.setName(request.getParameter("name"));
		Booking.setDate(request.getParameter("date"));
		Booking.setTime(request.getParameter("time"));
		Booking.setPhone(request.getParameter("phone"));
		Booking.setPeople(Integer.parseInt(request.getParameter("people")));
		
		
		try {
			BookingDao Dao = BookingFactory.createBookingDao();
			Dao.createConn();
			Dao.updateBooking(Booking);
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
