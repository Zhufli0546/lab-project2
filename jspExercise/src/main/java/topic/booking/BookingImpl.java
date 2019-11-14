package topic.booking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.sun.corba.se.spi.orbutil.fsm.State;

import topic.admin.TimePeopleBean;

public class BookingImpl implements BookingDao {

	private Connection conn;

	@Override
	public ArrayList<AllTime> PullDateTime() {
		ArrayList<AllTime> Times = new ArrayList<topic.booking.AllTime>();
		try {
			String sql = "Select * From AllTime";
			PreparedStatement state = conn.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			
			while(rs.next()) {
				AllTime time = new topic.booking.AllTime();
				time.setTime(rs.getString("Time"));
				time.setPeople(rs.getInt("people"));
				Times.add(time);
			}

			
			state.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Times;
		
	}

	@Override
	public void createConn() throws NamingException, SQLException {
		Context context = new InitialContext();
		DataSource ds;
		ds = (DataSource)context.lookup("java:/comp/env/jdbc/servdb");
		conn = ds.getConnection();

	}
	@Override
	public void closeConn() throws SQLException {
		conn.close();
		
	}

	@Override
	public void insertBooking(BookingData data) {
		
		try {
			String sql = "Insert BookingData(Date,Time,People,Name,Phone)Values(?,?,?,?,?)";
			PreparedStatement state = conn.prepareStatement(sql);
			state.setString(1,data.getDate());
			state.setString(2,data.getTime());
			state.setInt(3,data.getPeople());
			state.setString(4,data.getName());
			state.setString(5,data.getPhone());
			state.execute();
			state.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	@Override
	public ArrayList<BookingData> queryBooking(){
				ArrayList<BookingData> Bookings = new ArrayList<topic.booking.BookingData>();
				
				
				try {
					String sql = "Select * From BookingData Order by Date ASC";
					PreparedStatement state = conn.prepareStatement(sql);
					ResultSet rs = state.executeQuery();
					while(rs.next()) {
						BookingData Booking = new topic.booking.BookingData();
						Booking.setBookingid(rs.getInt("BookingID"));
						Booking.setDate(rs.getString("Date"));
						Booking.setName(rs.getString("Name"));
						Booking.setPeople(rs.getInt("People"));
						Booking.setPhone(rs.getString("Phone"));
						Booking.setTime(rs.getString("Time"));
						
						Bookings.add(Booking);
					}
					state.close();
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				return Bookings ;
	}

	@Override
	public void cancelBooking(int id) {
		
		try {
			String sql = "Delete  From BookingData Where BookingID=?";
			PreparedStatement state = conn.prepareStatement(sql);
			state.setInt(1,id);
			state.execute();
			state.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void setTimePeople(TimePeopleBean Set) {
		
		try {
			String sql = "Delete From AllTime";
			PreparedStatement state = conn.prepareStatement(sql);
			state.execute();
			state.close();
			
			String sql1 = "Insert into AllTime(Time,people)Values(?,?)";
			PreparedStatement state1 = conn.prepareStatement(sql1);
			state1.setString(1,Set.getTime1());
			state1.setString(2,Set.getPeople1());
			state1.execute();
			state1.setString(1,Set.getTime2());
			state1.setString(2,Set.getPeople2());
			state1.execute();
			state1.setString(1,Set.getTime3());
			state1.setString(2,Set.getPeople3());
			state1.execute();
			state1.setString(1,Set.getTime4());
			state1.setString(2,Set.getPeople4());
			state1.execute();
			state1.setString(1,Set.getTime5());
			state1.setString(2,Set.getPeople5());
			state1.execute();
			state1.setString(1,Set.getTime6());
			state1.setString(2,Set.getPeople6());
			state1.execute();
			state1.setString(1,Set.getTime7());
			state1.setString(2,Set.getPeople7());
			state1.execute();
			state1.setString(1,Set.getTime8());
			state1.setString(2,Set.getPeople8());
			state1.execute();
			state1.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public BookingData queryOneBooking(String phone) {
		BookingData Booking = new topic.booking.BookingData();
		try {
			String sql = "Select * From BookingData Where Phone=? ORDER BY create_time DESC";
			PreparedStatement state = conn.prepareStatement(sql);
			state.setString(1,phone);
			ResultSet rs = state.executeQuery();
			
			if(rs.next()) {
				
				Booking.setBookingid(rs.getInt("BookingID"));
				Booking.setName(rs.getString("Name"));
				Booking.setDate(rs.getString("Date"));
				Booking.setTime(rs.getString("Time"));
				Booking.setPeople(rs.getInt("People"));
				Booking.setPhone(rs.getString("Phone"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Booking;
	}

	@Override
	public ArrayList<BookingData> queryPersonalBooking(String phone) {
		ArrayList<BookingData> Bookings = new ArrayList<topic.booking.BookingData>();
		
		
		try {
			String sql = "Select * From BookingData Where Phone=?  Order by Date ASC";
			PreparedStatement state = conn.prepareStatement(sql);
			state.setString(1,phone);
			ResultSet rs = state.executeQuery();
			while(rs.next()) {
				BookingData Booking = new topic.booking.BookingData();
				Booking.setBookingid(rs.getInt("BookingID"));
				Booking.setDate(rs.getString("Date"));
				Booking.setName(rs.getString("Name"));
				Booking.setPeople(rs.getInt("People"));
				Booking.setPhone(rs.getString("Phone"));
				Booking.setTime(rs.getString("Time"));
				
				Bookings.add(Booking);
			}
			state.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return Bookings ;
	}

	@Override
	public BookingData querySBooking(int id) {
		BookingData Booking = new topic.booking.BookingData();
		try {
			String sql = "Select * From BookingData Where BookingID=?";
			PreparedStatement state = conn.prepareStatement(sql);
			state.setInt(1,id);
			ResultSet rs = state.executeQuery();
			
			if(rs.next()) {
				
				Booking.setBookingid(rs.getInt("BookingID"));
				Booking.setName(rs.getString("Name"));
				Booking.setDate(rs.getString("Date"));
				Booking.setTime(rs.getString("Time"));
				Booking.setPeople(rs.getInt("People"));
				Booking.setPhone(rs.getString("Phone"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Booking;
	}

	@Override
	public void updateBooking(BookingData data) {
		
		
		
		try {
			String sql = "Update BookingData SET Name=? , Date=? , Time=? , People=? , Phone=? Where BookingID=?";
			PreparedStatement state = conn.prepareStatement(sql);
			state.setString(1,data.getName());
			state.setString(2,data.getDate());
			state.setString(3,data.getTime());
			state.setInt(4,data.getPeople());
			state.setString(5,data.getPhone());
			state.setInt(6,data.getBookingid());
			state.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
