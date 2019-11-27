package findwatson.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import findwatson.admin.dto.AdminFileDTO;


public class AdminFileDAO {
	private static AdminFileDAO instance;
	private BasicDataSource bds = new BasicDataSource();
	//DBCP
	private AdminFileDAO () {
		bds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		bds.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
		bds.setUsername("manager");
		bds.setPassword("manager");
		bds.setInitialSize(30);
	}
	public synchronized static AdminFileDAO getInstance() {
		if(instance == null){									
			instance = new AdminFileDAO();
		}
		return instance;
	}
	//Connection
	private Connection getConnection() throws Exception{
		return bds.getConnection();
	}
	//파일 업로드
	public int insertFile(AdminFileDTO dto) throws Exception{
		String sql = "insert into files values(files_seq.nextval,?,?,?)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, dto.getArticleSeq());
			pstat.setString(2, dto.getFileName());
			pstat.setString(3, dto.getOriFileName());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	//파일 리스트
	public List<AdminFileDTO> selectAll() throws Exception{
		String sql = "select * from files";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List <AdminFileDTO> list = new ArrayList<>();
			while(rs.next()) {
				int seq = rs.getInt(1);
				int articleSeq = rs.getInt(2);
				String fileName = rs.getString(3);
				String oriFileName = rs.getString(4);
				AdminFileDTO dto = new AdminFileDTO(seq,articleSeq,fileName,oriFileName);
				list.add(dto);
			}
			return list;
		}
	}
	//파일 삭제 article seq로 삭제?
//	public int update(AdminFileDTO dto) throws Exception{
//		
//	}
}
