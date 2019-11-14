package topic.booking;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import topic.admin.TimePeopleBean;

public interface BookingDao {
		public ArrayList<AllTime> PullDateTime();
		public void createConn() throws NamingException, SQLException;
		public void closeConn() throws SQLException;
		public void insertBooking(BookingData data);
		public ArrayList<BookingData> queryBooking();
		public void cancelBooking(int id);
		public void setTimePeople(TimePeopleBean Set);
		public BookingData queryOneBooking(String phone);
		public ArrayList<BookingData> queryPersonalBooking(String phone);
		public BookingData querySBooking(int id);
		public void updateBooking(BookingData data);
}
