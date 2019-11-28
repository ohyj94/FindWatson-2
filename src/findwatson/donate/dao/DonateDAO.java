package findwatson.donate.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import findwatson.donate.dto.DonateDTO;


public class DonateDAO {
	private static DonateDAO instance;
	private BasicDataSource bds = new BasicDataSource();
	private DonateDAO() {
		bds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		bds.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
		bds.setUsername("watson");
		bds.setPassword("watson");
		bds.setInitialSize(30);
	}
	private Connection getConnection() throws Exception{
		return bds.getConnection();
	}
	public synchronized static DonateDAO getInstance() {
		if(instance == null) {
			instance = new DonateDAO();
		}
		return instance;
	}

	public String getDonateId() throws Exception{
		String sql = "SELECT TO_CHAR(SYSTIMESTAMP, 'YYYYMMDDHH24MISSFF1') FROM DUAL";
		
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			rs.next();
			return rs.getString(1);
		}
	}
	
	public int setDonateInfo(DonateDTO dto) throws Exception{
		String sql = "insert into donate values(?,?,?,?,?,?,?,?,?)";
		
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getDonateId());
			pstat.setInt(2, dto.getSupport());
			pstat.setInt(3, dto.getRealPayment());
			pstat.setString(4, dto.getEmail());
			pstat.setString(5, dto.getUserId());
			pstat.setString(6, dto.getPhone());
			pstat.setString(7, dto.getAddr());
			pstat.setString(8, dto.getPostcode());
			pstat.setString(9, dto.getPassFail());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	//금액이 일치하면 pass로 바꾸고 아니면 fail 유지
	public int updatePass(String merchant_uid, int paid_amount) throws Exception{
		String sql = "update donate set passFail='P', realPayment=support where donateId=? and support=?";
		
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, merchant_uid);
			pstat.setInt(2, paid_amount);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}		
	}
	
	public int realPayment(String merchant_uid, int paid_amount) throws Exception{
		String sql = "update donate set realPayment=? where donateId=?";
		
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, paid_amount);
			pstat.setString(2, merchant_uid);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int delDonateInfo(String merchant_uid) throws Exception{
		String sql = "delete from donate where donateId=?";
		
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, merchant_uid);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
		
	}

}
