package topic.booking;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PullDateTime
 */
@WebServlet("/PullDateTime")
public class PullDateTime extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookingDao Dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PullDateTime() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		try {
			Dao = BookingFactory.createBookingDao();
			Dao.createConn();
			ArrayList<AllTime> PullTime = Dao.PullDateTime();
			
			String date = request.getParameter("date");
			int people = Integer.parseInt(request.getParameter("people"));

			
			
			Dao.closeConn();

			request.setAttribute("date",date);
			request.setAttribute("people",people);
			request.setAttribute("PullTime",PullTime);
			request.getRequestDispatcher("/pulltime.jsp")
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
