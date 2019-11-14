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
 * Servlet implementation class InsertBooking
 */
@WebServlet("/AdminInsertBooking")
public class AdminInsertBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInsertBooking() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		BookingData BookingData = new topic.booking.BookingData();
		BookingData.setName(request.getParameter("name"));
		BookingData.setDate(request.getParameter("date"));
		
		BookingData.setTime(request.getParameter("time"));
		BookingData.setPeople(Integer.parseInt(request.getParameter("people")));
		BookingData.setPhone(request.getParameter("phone"));
		
		BookingDao Dao = BookingFactory.createBookingDao();
		try {
			Dao.createConn();
			Dao.insertBooking(BookingData);
			BookingData Booking = Dao.queryOneBooking(BookingData.getPhone());
			Dao.closeConn();
			request.setAttribute("BookingData",Booking);
			request.getRequestDispatcher("/AdminconfirmOk.jsp")
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
