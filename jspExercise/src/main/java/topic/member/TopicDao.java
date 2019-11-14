package topic.member;

import java.sql.SQLException;


import javax.naming.NamingException;

public interface TopicDao {
			public void createConn()throws NamingException, SQLException;
			public void closeConn() throws SQLException;
			public UserBean queryUserBeanDB(UserBean user) throws SQLException;
			public void Register(UserBean user) throws SQLException;
			public boolean ChechUserName(String username)throws SQLException;
}
