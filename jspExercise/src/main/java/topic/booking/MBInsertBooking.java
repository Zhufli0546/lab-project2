package topic.booking;

import java.io.IOException;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class InsertBooking
 */
@WebServlet("/MBInsertBooking")
public class MBInsertBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MBInsertBooking() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession(false);
		String name =(String) session.getAttribute("name");
		String phone = (String) session.getAttribute("phone");
		BookingData BookingData = new topic.booking.BookingData();
		BookingData.setName(name);
		BookingData.setDate(request.getParameter("date"));
		
		BookingData.setTime(request.getParameter("time"));
		BookingData.setPeople(Integer.parseInt(request.getParameter("people")));
		BookingData.setPhone(phone);
		
		BookingDao Dao = BookingFactory.createBookingDao();
		try {
			Dao.createConn();
			Dao.insertBooking(BookingData);
			BookingData Booking = Dao.queryOneBooking(BookingData.getPhone());
			Dao.closeConn();
			request.setAttribute("Booking",Booking);
			request.getRequestDispatcher("/MBconfirm.jsp")
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
