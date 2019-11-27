package findwatson.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

public class MemberDAO {
	private BasicDataSource bds = new BasicDataSource();
	private static MemberDAO instance = new MemberDAO();


	public MemberDAO() {
		bds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		bds.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
		bds.setUsername("watson");
		bds.setPassword("watson");
		bds.setInitialSize(30);
	}

	public synchronized static MemberDAO getInstance() {
		if(instance == null) {
			instance = new MemberDAO();
		}
		return instance;
	}

	private Connection getConnection() throws Exception{
		return bds.getConnection();
	}

	public boolean loginOk(String id, String pw) throws Exception{
		String sql = "select * from members where id=? and pw=?";
		try(Connection con = bds.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, id);
			pstat.setString(2, pw);
			ResultSet rs = pstat.executeQuery();
			boolean result = rs.next(); 
					return result;
		}

		
	}
}
