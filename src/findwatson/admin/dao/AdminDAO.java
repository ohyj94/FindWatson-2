package findwatson.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import findwatson.admin.dto.BanDTO;
import findwatson.admin.utils.Util;
import findwatson.configuration.Configuration;
import findwatson.member.dto.MemberDTO;

public class AdminDAO {
	private static AdminDAO instance;
	private BasicDataSource bds = new BasicDataSource();
	//DBCP
	private AdminDAO () {
		bds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		bds.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
		bds.setUsername("watson");
		bds.setPassword("watson");
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
				String birth = rs.getString(4);
				String gender = rs.getString(5);
				String email = rs.getString(6);
				String phone = rs.getString(7);
				String postcode = rs.getString(8);
				String address1 = rs.getString(9);
				String address2 = rs.getString(10);
				String lovePet = rs.getString(11);
				String signPath = rs.getString(12);
				Timestamp date = rs.getTimestamp(13);
				MemberDTO dto = new MemberDTO(id,pw,name,birth,gender,email,phone,postcode,address1,address2,lovePet,signPath,date);
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
					
					String pw = rs.getString(2);
					String name = rs.getString(3);
					String birth = rs.getString(4);
					String gender = rs.getString(5);
					String email = rs.getString(6);
					String phone = rs.getString(7);
					String postcode = rs.getString(8);
					String address1 = rs.getString(9);
					String address2 = rs.getString(10);
					String lovePet = rs.getString(11);
					String signPath = rs.getString(12);
					Timestamp date = rs.getTimestamp(13);
					MemberDTO dto = new MemberDTO(id,pw,name,birth,gender,email,phone,postcode,address1,address2,lovePet,signPath,date);
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
					
					String birth = rs.getString(4);
					String gender = rs.getString(5);
					String email = rs.getString(6);
					String phone = rs.getString(7);
					String postcode = rs.getString(8);
					String address1 = rs.getString(9);
					String address2 = rs.getString(10);
					String lovePet = rs.getString(11);
					String signPath = rs.getString(12);
					Timestamp date = rs.getTimestamp(13);
					MemberDTO dto = new MemberDTO(id,pw,name,birth,gender,email,phone,postcode,address1,address2,lovePet,signPath,date);
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
					String id = rs.getString(1);
					String pw = rs.getString(2);
					String name = rs.getString(3);
					
					String gender = rs.getString(5);
					String email = rs.getString(6);
					String phone = rs.getString(7);
					String postcode = rs.getString(8);
					String address1 = rs.getString(9);
					String address2 = rs.getString(10);
					String lovePet = rs.getString(11);
					String signPath = rs.getString(12);
					Timestamp date = rs.getTimestamp(13);
					MemberDTO dto = new MemberDTO(id,pw,name,birth,gender,email,phone,postcode,address1,address2,lovePet,signPath,date);
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
					String name = rs.getString(3);
					String birth = rs.getString(4);
					
					String email = rs.getString(6);
					String phone = rs.getString(7);
					String postcode = rs.getString(8);
					String address1 = rs.getString(9);
					String address2 = rs.getString(10);
					String lovePet = rs.getString(11);
					String signPath = rs.getString(12);
					Timestamp date = rs.getTimestamp(13);
					MemberDTO dto = new MemberDTO(id,pw,name,birth,gender,email,phone,postcode,address1,address2,lovePet,signPath,date);
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
					String name = rs.getString(3);
					String birth = rs.getString(4);
					String gender = rs.getString(5);
					String email = rs.getString(6);
					String phone = rs.getString(7);
					String postcode = rs.getString(8);
					String address1 = rs.getString(9);
					String address2 = rs.getString(10);
					
					String signPath = rs.getString(12);
					Timestamp date = rs.getTimestamp(13);
					MemberDTO dto = new MemberDTO(id,pw,name,birth,gender,email,phone,postcode,address1,address2,lovePet,signPath,date);
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
	//게시판 내의 총 글의 개수
	public int recordTotalCount () throws Exception {
		String sql = "select count(id) from member";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			ResultSet rs = pstat.executeQuery();
			rs.next();
			return rs.getInt(1);
		}
	}
	//페이지 네비게이터
	public String getPageNav(int currentPage) throws Exception {
		//게시판 내의 총 글의 개수
		int recordTotalCount = this.recordTotalCount();
		//한 페이지에 몇개의 글을 보여줄건지
		//int recordCountPerPage = 10;
		//한 페이지에서 몇개의 네비게이터를 보여줄건지
		//int naviCountPerPage = 10;
		//총 몇개의 페이지인지
		int pageTotalCount = 0;
		if(recordTotalCount % Configuration.recordCountPerPage > 0) {
			//총 글의 개수를 페이지당 보여줄 개수로 나누었을 때, 나머지가 생기면 총페이지의 개수 +1
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage + 1;
		}else {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage;
		}

		//현재 페이지 값이 비정상 값일 때, 조정하는 보안 코드
		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		//현재 내가 위치하고 있는 페이지에 따라 네비게이터 시작 페이지 값을 구하는 공식
		int startNavi = ((currentPage-1) / Configuration.naviCountPerPage) * Configuration.naviCountPerPage + 1;
		int endNavi = startNavi + Configuration.naviCountPerPage - 1;

		//페이지 끝값이 비정상 값일 때, 조정하는 보안 코드
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		System.out.println("현재 페이지 번호 : " + currentPage);
		System.out.println("네비게이터 시작 번호 : " + startNavi);
		System.out.println("네비게이터 끝 번호 : " + endNavi);

		boolean needPrev = true;
		boolean needNext = true;

		if(currentPage == 1) {
			needPrev = false;
		}
		if(currentPage == pageTotalCount) {
			needNext = false;
		}
		StringBuilder sb = new StringBuilder();

		if(needPrev) {sb.append("<a href='adminMemberList.admin?cpage="+(currentPage-1)+"'> < </a>");}

		for(int i = startNavi; i <= endNavi;i++) {
			sb.append("<a href='adminMemberList.admin?cpage="+i+"'>");
			sb.append(i + " ");
			sb.append("</a>");
		}
		if(needNext) {sb.append("<a href='adminMemberList.admin?cpage="+(currentPage+1)+"'> > </a>");}
		return sb.toString();
	}
	//게시판 목록 10개씩
	public List<MemberDTO> listByPage(int start, int end) throws Exception{
		String sql = "select * from"
				+ "(select member.*, row_number() over (order by name) as rown from member)"
				+ " where rown between ? and ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, start);
			pstat.setInt(2, end);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				List<MemberDTO> result = new ArrayList<>();
				while(rs.next()) {
					String id = rs.getString(1);
					String pw = rs.getString(2);
					String name = rs.getString(3);
					String birth = rs.getString(4);
					String gender = rs.getString(5);
					String email = rs.getString(6);
					String phone = rs.getString(7);
					String postcode = rs.getString(8);
					String address1 = rs.getString(9);
					String address2 = rs.getString(10);
					String lovePet = rs.getString(11);
					String signPath = rs.getString(12);
					Timestamp date = rs.getTimestamp(13);
					MemberDTO dto = new MemberDTO(id,pw,name,birth,gender,email,phone,postcode,address1,address2,lovePet,signPath,date);
					result.add(dto);
				}
				return result;
			}
		}
	}
}
