package findwatson.search.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import findwatson.admin.dto.HListDTO;


public class HospitalListDAO {
	private static HospitalListDAO instance;
	private BasicDataSource bds = new BasicDataSource();
	private HospitalListDAO() {
		bds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		bds.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
		bds.setUsername("watson");
		bds.setPassword("watson");
		bds.setInitialSize(30);
	}
	
	public synchronized static HospitalListDAO getInstance() {
		if(instance == null) {
		instance = new HospitalListDAO();
	}
		return instance;
	}
	
	private Connection getConnection() throws Exception{
		return bds.getConnection();
	}

	// 검색에 따른 목록 반환 
		public List<HListDTO> selectAll(String input_city, String input_gu, String input_animal, String input_time) throws Exception{
			
			System.out.println(1);
			String sql = "select * from hospitalList where (address like ?) and (address like ?) and (medicalAnimal like ?) and (opentime like ?)";
			try (
					Connection con = this.getConnection();
					PreparedStatement pstat = con.prepareStatement(sql);
					){
				System.out.println(input_city);
				pstat.setString(1, input_city);
				pstat.setString(2, input_gu);
				pstat.setString(3, input_animal);
				pstat.setString(4, input_time);
	System.out.println(2);
				try(
						ResultSet rs = pstat.executeQuery();
						
						){
					List<HListDTO> list = new ArrayList<HListDTO>();
					System.out.println(5);
					while(rs.next()) {
						System.out.println("ggg");
						int seq = rs.getInt(1);
						System.out.println(seq);
						String hosptName = rs.getString(2);
						int postcode = rs.getInt(3);
						String city = rs.getString(4);
						String gu = rs.getString(5);
						String phone = rs.getString(6);
						String homepage = rs.getString(7);
						String img = rs.getString(8);
						String medicalAnimal = rs.getString(9);
						String openTime = rs.getString(10);
						Timestamp registDate = rs.getTimestamp(11);
						
					System.out.println(3);
						HListDTO dto = new HListDTO(seq, hosptName, postcode, city, gu,
								phone, homepage, img, medicalAnimal, openTime, registDate);
						list.add(dto);
					System.out.println(4);
					}
					System.out.println("dlrjddddd");
					return list;
				}	
			}
		}
		
	
	public List<String> selectGu(String city) throws Exception{
		String sql = "select gu from gutable where city=?";
		List<String> result = new ArrayList<>();
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, city);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				while(rs.next()) {
					result.add(rs.getString(1));
				}
				return result;
			}
		}
	}
	
	
}
