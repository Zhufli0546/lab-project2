package topic.booking;

public class BookingFactory {
	public static BookingDao createBookingDao(){
		BookingDao dao = new BookingImpl();
		return dao ;
	}
}
