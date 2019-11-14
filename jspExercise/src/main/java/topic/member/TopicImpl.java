package topic.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class TopicImpl implements TopicDao {

	private Connection conn;
	

	
	@Override
	public UserBean queryUserBeanDB(UserBean user) throws SQLException {
		UserBean checkUser = null;
		String sql = "Select * From Member Where username=? AND password=?";
		PreparedStatement state = conn.prepareStatement(sql);
		state.setString(1,user.getUsername());
		state.setString(2,user.getPassword());
		ResultSet rs = state.executeQuery();
		if(rs.next()) {
			checkUser = new UserBean();
			checkUser.setName(rs.getString("name"));
			checkUser.setPhone(rs.getString("phone"));
			checkUser.setPermission(rs.getInt("permission"));
			
		}
		state.close();
		return checkUser;
		
	}

	@Override
	public void createConn() throws NamingException, SQLException {
		Context context = new InitialContext();
		DataSource ds = (DataSource)context.lookup("java:/comp/env/jdbc/servdb");
		conn = ds.getConnection();
		
	}

	@Override
	public void closeConn() throws SQLException {
		conn.close();
		
	}


	@Override
	public void Register(UserBean user) throws SQLException {
		
		String sql = "Insert Member(name,username,password,phone)Values(?,?,?,?)";
		PreparedStatement state = conn.prepareStatement(sql);
		state.setString(1,user.getName());
		state.setString(2,user.getUsername());
		state.setString(3,user.getPassword());
		state.setString(4,user.getPhone());
		state.execute();
		state.close();
		
	}

	@Override
	public boolean ChechUserName(String username) throws SQLException {
		String sql = "Select * From Member Where username=?";
		PreparedStatement state = conn.prepareStatement(sql);
		state.setString(1,username);
		ResultSet rs = state.executeQuery();
		
		boolean YN ;
		if(rs.next()) {
			YN = false;
		}else {
			
			YN = true ;
		}
		return YN;
	}


	

}
