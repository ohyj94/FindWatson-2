package findwatson.admin.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import findwatson.admin.dto.BanDTO;
import findwatson.admin.dto.MemberDTO;
import findwatson.admin.utils.Util;

public class AdminDAO {
	private static AdminDAO instance;
	private BasicDataSource bds = new BasicDataSource();
	//DBCP
	private AdminDAO () {
		bds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		bds.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
		bds.setUsername("manager");
		bds.setPassword("manager");
		bds.setInitialSize(30);
	}
	public synchronized static AdminDAO getInstance() {
		if(instance == null){									
			instance = new AdminDAO();
		}
		return instance;
	}
	//Connection
	private Connection getConnection() throws Exception{
		return bds.getConnection();
	}
	//관리자 로그인
	public boolean adminLogin(String id,String pw) throws Exception{
		String sql = "select * from admin where id = ? and pw = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, id);
			pstat.setString(2, Util.encrypt(pw));
			try(
					ResultSet rs = pstat.executeQuery();
					){
				boolean result = rs.next();
				return result;
			}
		}
	}
	//관리자 비밀번호 변경
	public int adminInfoPwUpdate(String id, String pw) throws Exception{
		String sql = "update member set pw=? where id=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, Util.encrypt(pw));
			pstat.setString(2, id);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	//회원목록정보
	public List<MemberDTO> selectAll() throws Exception{
		String sql = "select * from member";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List<MemberDTO> memberList = new ArrayList<>();
			while(rs.next()) {
				String id = rs.getString(1);
				String pw = rs.getString(2);
				String name = rs.getString(3);
				Date birth = rs.getDate(4);
				String gender = rs.getString(5);
				String email = rs.getString(6);
				String phone = rs.getString(7);
				int zipcode = rs.getInt(8);
				String address1 = rs.getString(9);
				String address2 = rs.getString(10);
				String lovePet = rs.getString(11);
				String signPath = rs.getString(12);
				MemberDTO dto = new MemberDTO(id,pw,name,birth,gender,email,phone,zipcode,address1,address2,lovePet,signPath);
				memberList.add(dto);
			}
			return memberList;
		}
	}
	//아이디로 회원 찾기
	public List<MemberDTO> selectById (String id) throws Exception{
		String sql = "select * from member where id = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, id);
			try(
					ResultSet rs = pstat.executeQuery();
					){	
				List<MemberDTO> memberList = new ArrayList<>();
				while(rs.next()) {
					String id2 = rs.getString(1);
					String pw = rs.getString(2);
					String name = rs.getString(3);
					Date birth = rs.getDate(4);
					String gender = rs.getString(5);
					String email = rs.getString(6);
					String phone = rs.getString(7);
					int zipcode = rs.getInt(8);
					String address1 = rs.getString(9);
					String address2 = rs.getString(10);
					String lovePet = rs.getString(11);
					String signPath = rs.getString(12);
					MemberDTO dto = new MemberDTO(id2,pw,name,birth,gender,email,phone,zipcode,address1,address2,lovePet,signPath);
					memberList.add(dto);
				}
				return memberList;
			}
		}
	}
	//이름으로 회원 찾기
	public List<MemberDTO> selectByName (String name) throws Exception{
		String sql = "select * from member where name = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, name);
			try(
					ResultSet rs = pstat.executeQuery();
					){	
				List<MemberDTO> memberList = new ArrayList<>();
				while(rs.next()) {
					String id = rs.getString(1);
					String pw = rs.getString(2);
					String name2 = rs.getString(3);
					Date birth = rs.getDate(4);
					String gender = rs.getString(5);
					String email = rs.getString(6);
					String phone = rs.getString(7);
					int zipcode = rs.getInt(8);
					String address1 = rs.getString(9);
					String address2 = rs.getString(10);
					String lovePet = rs.getString(11);
					String signPath = rs.getString(12);
					MemberDTO dto = new MemberDTO(id,pw,name2,birth,gender,email,phone,zipcode,address1,address2,lovePet,signPath);
					memberList.add(dto);
				}
				return memberList;
			}
		}
	}
	//생년월일로 회원찾기
	public List<MemberDTO> selectByBirth (String birth) throws Exception{
		String sql = "select * from member where birth = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, birth);
			try(
					ResultSet rs = pstat.executeQuery();
					){	
				List<MemberDTO> memberList = new ArrayList<>();
				while(rs.next()) {
					String id2 = rs.getString(1);
					String pw = rs.getString(2);
					String name = rs.getString(3);
					Date birth2 = rs.getDate(4);
					String gender = rs.getString(5);
					String email = rs.getString(6);
					String phone = rs.getString(7);
					int zipcode = rs.getInt(8);
					String address1 = rs.getString(9);
					String address2 = rs.getString(10);
					String lovePet = rs.getString(11);
					String signPath = rs.getString(12);
					MemberDTO dto = new MemberDTO(id2,pw,name,birth2,gender,email,phone,zipcode,address1,address2,lovePet,signPath);
					memberList.add(dto);
				}
				return memberList;
			}
		}
	}
	//성별로 회원찾기
	public List<MemberDTO> selectByGender (String gender) throws Exception{
		String sql = "select * from member where gender = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, gender);
			try(
					ResultSet rs = pstat.executeQuery();
					){	
				List<MemberDTO> memberList = new ArrayList<>();
				while(rs.next()) {
					String id = rs.getString(1);
					String pw = rs.getString(2);
					String name2 = rs.getString(3);
					Date birth = rs.getDate(4);
					String gender2 = rs.getString(5);
					String email = rs.getString(6);
					String phone = rs.getString(7);
					int zipcode = rs.getInt(8);
					String address1 = rs.getString(9);
					String address2 = rs.getString(10);
					String lovePet = rs.getString(11);
					String signPath = rs.getString(12);
					MemberDTO dto = new MemberDTO(id,pw,name2,birth,gender2,email,phone,zipcode,address1,address2,lovePet,signPath);
					memberList.add(dto);
				}
				return memberList;
			}
		}
	}
	//관심동물로 회원찾기
	public List<MemberDTO> selectByLovePet (String lovePet) throws Exception{
		String sql = "select * from member where lovePet = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, lovePet);
			try(
					ResultSet rs = pstat.executeQuery();
					){	
				List<MemberDTO> memberList = new ArrayList<>();
				while(rs.next()) {
					String id = rs.getString(1);
					String pw = rs.getString(2);
					String name2 = rs.getString(3);
					Date birth = rs.getDate(4);
					String gender = rs.getString(5);
					String email = rs.getString(6);
					String phone = rs.getString(7);
					int zipcode = rs.getInt(8);
					String address1 = rs.getString(9);
					String address2 = rs.getString(10);
					String lovePet2 = rs.getString(11);
					String signPath = rs.getString(12);
					MemberDTO dto = new MemberDTO(id,pw,name2,birth,gender,email,phone,zipcode,address1,address2,lovePet2,signPath);
					memberList.add(dto);
				}
				return memberList;
			}
		}
	}
	//차단ip 추가
	public int banIp(String id, String ip, String reason) throws Exception{
		String sql = "insert into banIp values(?,?,?)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, id);
			pstat.setString(2, ip);
			pstat.setString(3, reason);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	//차단한 ip 목록
	public List<BanDTO> selectBanList () throws Exception{
		String sql = "select * from banIp";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){				
			List<BanDTO> banList = new ArrayList<>();
			while(rs.next()) {
				String id = rs.getString(1);
				String ip = rs.getString(2);
				String reason = rs.getString(3);		
				BanDTO dto = new BanDTO(id,ip,reason);
				banList.add(dto);
			}
			return banList;
		}
	}
}
