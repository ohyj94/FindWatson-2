package findwatson.board.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import findwatson.board.dto.FilesDTO;

public class FilesDAO {
	private static FilesDAO instance;
	private BasicDataSource bds = new BasicDataSource();
	private FilesDAO() {
		bds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		bds.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
		bds.setUsername("manager");
		bds.setPassword("manager");
		bds.setInitialSize(30);
	}
	private Connection getConnetion() throws Exception{
		return bds.getConnection();
	}	
	public synchronized static FilesDAO getInstance() {
		if(instance == null) {
			instance = new FilesDAO();
		}
		return instance;
	}
	
	public List<FilesDTO> getFilesBy(int boardSeq) throws Exception{
		String sql = "select * from files where boardSeq=?";
		List<FilesDTO> result = new ArrayList<>();
		try(
				Connection con = this.getConnetion();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, boardSeq);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				while(rs.next()) {
					int filesSeq = rs.getInt(1);
					
					String fileName = rs.getString(3);
					String oriFileName = rs.getString(4);
					
					result.add(new FilesDTO(filesSeq, boardSeq, fileName, oriFileName));
				}
				return result;
			}
		}
	}
	public int insert(FilesDTO dto) throws Exception{
		String sql = "insert into files values(fileSeq.nextval, ?, ?, ?)";
		try(
				Connection con = this.getConnetion();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, dto.getBoardSeq());
			pstat.setString(2, dto.getFileName());
			pstat.setString(3, dto.getOriFileName());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	
	
	
}

