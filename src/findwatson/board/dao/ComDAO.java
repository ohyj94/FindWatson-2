package findwatson.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import findwatson.board.dto.ComDTO;

public class ComDAO {
	private static ComDAO instance;
	private BasicDataSource bds = new BasicDataSource();
	private ComDAO() {
		bds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		bds.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
		bds.setUsername("manager");
		bds.setPassword("manager");
		bds.setInitialSize(30);
	}
	private Connection getConnetion() throws Exception{
		return bds.getConnection();
	}	
	public synchronized static ComDAO getInstance() {
		if(instance == null) {
			instance = new ComDAO();
		}
		return instance;
	}
	
	public List<ComDTO> selectAll(int boardSeq) throws Exception{
		String sql = "select * from comments wehre boardSeq=?";
		List<ComDTO> result = new ArrayList<>();
		try(
				Connection con = this.getConnetion();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, boardSeq);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				while(rs.next()) {
					int comSeq = rs.getInt(1);
					String writer = rs.getString(3);
					String content = rs.getString(4);
					String ipAddr = rs.getString(5);
					Timestamp writeDate = rs.getTimestamp(6);
					
					result.add(new ComDTO(comSeq, boardSeq, writer, content, ipAddr, writeDate));
				}
				return result;
			}
		}
	}
	
	public int insert(ComDTO dto) throws Exception{
		String sql = "insert into comments values(comSeq.nextval, ?, ?, ?, ?, sysdate)";
		try(
				Connection con = this.getConnetion();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, dto.getBoardSeq());
			pstat.setString(2, dto.getWriter());
			pstat.setString(3, dto.getContent());
			pstat.setString(4, dto.getIpAddr());
			
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	

	public int update(ComDTO dto) throws Exception{
		String sql = "update comments set content=?, writeDate=sysdate where comSeq=?";
		try(
				Connection con = this.getConnetion();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getContent());
			pstat.setInt(2, dto.getComSeq());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int delete(int comSeq) throws Exception{
		String sql = "delete from comments where comSeq=?";
		try(
				Connection con = this.getConnetion();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, comSeq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	//게시글 삭제 메서드 실행하고 댓글 삭제 메서드 실행하기
	public int deleteNoBoard(int boardSeq) throws Exception{
		String sql = "delete from comments where boardSeq=?";
		try(
				Connection con = this.getConnetion();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, boardSeq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	//내가 쓴 가장 최신 댓글
	public ComDTO selectLatest(String writer) throws Exception{
		String sql = "select * from (select comments.*, row_number() over(order by comSeq desc) rown from comments) where writer=? and rown = 1";
		try(
				Connection con = this.getConnetion();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, writer);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				rs.next();
				int comSeq = rs.getInt(1);
				int boardSeq = rs.getInt(2);
				String content = rs.getString(4);
				String ipAddr = rs.getString(5);
				Timestamp writeDate = rs.getTimestamp(6);
				
				ComDTO result = new ComDTO(comSeq, boardSeq, writer, content, ipAddr, writeDate);
				return result;				
			}
		}
	
	}
	
	
}
