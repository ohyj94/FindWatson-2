package findwatson.review.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import findwatson.review.dto.ReviewFileDTO;

public class ReviewFileDAO {

	private BasicDataSource bds = new BasicDataSource();
	private static ReviewFileDAO instance;
	
	ReviewFileDAO(){
		bds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		bds.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
		bds.setUsername("watson");
		bds.setPassword("watson");
		bds.setInitialSize(10);
	}
	
	private Connection getConnection() throws Exception{
		return bds.getConnection();
	}
	public synchronized static ReviewFileDAO getInstance() {
		if(instance == null) {
			instance = new ReviewFileDAO();
		}
		return instance;
	}
	
	public int insert(ReviewFileDTO dto)throws Exception{ 
		String sql = "insert into reviewPhoto values (reviewPhotoSeq.nextval,?,?,?)";
		try(
				Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, dto.getHosptReviewSeq());
			pstat.setString(2, dto.getFileName());
			pstat.setString(3, dto.getOriFileName());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	
}
}
