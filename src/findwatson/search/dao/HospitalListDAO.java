package findwatson.search.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import findwatson.admin.dto.HospitalListDTO;


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
	public List<HospitalListDTO> selectAll(String input_city, String input_gu, String input_dong, 
			String input_medicalAnimal, String input_medicalDept, String input_infoRegist) throws Exception{
		String sql = "select * from hospitalList where city=? and gu=? and dong=? and medicalAnimal=? and medicalDept=? and infoRegist=?";
		try (
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, input_city);
			pstat.setString(2, input_gu);
			pstat.setString(3, input_dong);
			pstat.setString(4, input_medicalAnimal);
			pstat.setString(5, input_medicalDept);
			pstat.setString(6, input_infoRegist);

			try(
					ResultSet rs = pstat.executeQuery();
					
					){
				List<HospitalListDTO> list = new ArrayList<HospitalListDTO>();
				while(rs.next()) {
					int seq = rs.getInt(1);
					String hosptName = rs.getString(2);
					int zipcode = rs.getInt(3);
					String city = rs.getString(4);
					String gu = rs.getString(5);
					String dong = rs.getString(6);
					String address = rs.getString(7);
					String phone = rs.getString(8);
					String homepage = rs.getString(9);
					String img = rs.getString(10);
					String medicalAnimal = rs.getString(11);
					String medicalDept = rs.getString(12);
					String infoRegist = rs.getString(13);
				
					HospitalListDTO dto = new HospitalListDTO(seq, hosptName, zipcode, city, gu, dong, address, 
							phone, homepage, img, medicalAnimal, medicalDept, infoRegist);
					list.add(dto);
				}
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
