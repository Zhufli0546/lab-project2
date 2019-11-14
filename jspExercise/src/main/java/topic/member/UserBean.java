package topic.member;

public class UserBean {
	String name;
	String username;
	String password;
	String phone;
	String date;
	int permission;
	
	
	public void setName(String name) {
		this.name = name;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public void setPermission(int permission) {
		this.permission = permission ;
	}

	
	
	
	public String getName() {
		return name;
	}
	public String getUsername() {
		return username;
	}
	public String getPassword() {
		return password;
	}
	public String getPhone() {
		return phone;
	}
	public String getDate() {
		return date;
	}
	public int getPermission() {
		return permission ;
	}
	


}
