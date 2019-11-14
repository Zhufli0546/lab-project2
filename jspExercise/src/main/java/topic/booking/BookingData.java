package topic.booking;

public class BookingData {
		int bookingid;
		String name;
		int people ;
		String time;
		String phone;
		String date;
		
		public String getDate() {
			return date;
		}
		public void setDate(String date) {
			this.date = date;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public int getPeople() {
			return people;
		}
		public void setPeople(int people) {
			this.people = people;
		}
		public String getTime() {
			return time;
		}
		public void setTime(String time) {
			this.time = time;
		}
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
		}
		public int getBookingid() {
			return bookingid;
		}
		public void setBookingid(int bookingid) {
			this.bookingid = bookingid;
		}
}
