package findwatson.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import findwatson.admin.dto.BoardDTO;
import findwatson.admin.dto.ExpertDTO;
import findwatson.admin.dto.HListDTO;
import findwatson.admin.dto.NoticeDTO;

public class ManagerDAO {
	private static ManagerDAO instance;
	private BasicDataSource bds = new BasicDataSource();
	//DBCP
	private ManagerDAO () {
		bds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		bds.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
		bds.setUsername("watson");
		bds.setPassword("watson");
		bds.setInitialSize(30);
	}
	public synchronized static ManagerDAO getInstance() {
		if(instance == null){									
			instance = new ManagerDAO();
		}
		return instance;
	}
	//Connection
	private Connection getConnection() throws Exception{
		return bds.getConnection();
	}
	//병원 리스트
	public List<HListDTO> hospitalList() throws Exception{
		String sql = "select seq,hosptName from hospitalList";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List<HListDTO> list = new ArrayList<>();
			while (rs.next()) {
				int seq = rs.getInt(1);
				String hosptName = rs.getString(2);
				HListDTO result = new HListDTO(seq,hosptName);
				list.add(result);
			}
			return list;
		}
	}
	//병원 정보 등록
	public int insertHospital(HListDTO dto) throws Exception{
		String sql = "insert into hospitalList values(hospitalList_seq.nextval,?,?,?,?,?,?,?,?,?,?)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getHosptName());
			pstat.setInt(2, dto.getPostcode());
			pstat.setString(3, dto.getAddress1());
			pstat.setString(3, dto.getAddress2());
			pstat.setString(4, dto.getPhone());
			pstat.setString(5, dto.getHomepage());
			pstat.setString(7, dto.getImg());
			pstat.setString(8, dto.getMedicalAnimal());
			pstat.setString(9, dto.getOpenTime());
			pstat.setTimestamp(10, dto.getRegistDate());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	//병원정보 수정
	public int modifyHospital (HListDTO dto, int seq)throws Exception {
		String sql = "update hospitalList set HosptName=?,postcode=?,address1=?,address2=?,phone=?,homepage=?,img=?,medicalAnimal=?,openTime=?,registDate=? where seq=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getHosptName());
			pstat.setInt(2, dto.getPostcode());
			pstat.setString(3, dto.getAddress1());
			pstat.setString(3, dto.getAddress2());
			pstat.setString(4, dto.getPhone());
			pstat.setString(5, dto.getHomepage());
			pstat.setString(7, dto.getImg());
			pstat.setString(8, dto.getMedicalAnimal());
			pstat.setString(9, dto.getOpenTime());
			pstat.setTimestamp(10, dto.getRegistDate());
			pstat.setInt(13, seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	//병원정보 삭제
	public int delHospital(int seq) throws Exception{
		String sql = "delete hospitalList where seq = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	//공지사항 쓰기
	public int writeNotice(NoticeDTO dto) throws Exception{
		String sql = "insert into notice values(notice_seq.nextval,?,?,?,?)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getTitle());
			pstat.setString(2, dto.getContent());
			pstat.setTimestamp(3, dto.getWriteDate());
			pstat.setInt(4, dto.getViewCount());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	//공지사항 수정
	public int modifyNotice (NoticeDTO dto, int seq)throws Exception {
		String sql = "update notice set title=?,content=? where seq=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getTitle());
			pstat.setString(2, dto.getContent());
			pstat.setInt(3, seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	//공지사항 삭제
	public int delNotice(int seq) throws Exception {
		String sql = "delete from notice where seq=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	//1:1문의 게시글 삭제
	public int delOneByOne(int seq) throws Exception {
		String sql = "delete from OneByOne where seq=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	//전문가 Q&A 글쓰기
	public int writeExpert(ExpertDTO dto) throws Exception{
		String sql = "insert into Expert values(expert_seq.nextval,?,?,?,?,?)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getWriter());
			pstat.setString(2, dto.getTitle());
			pstat.setString(3, dto.getContent());
			pstat.setTimestamp(4, dto.getWriteDate());
			pstat.setInt(5, dto.getViewCount());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	//전문가 Q&A 수정
	public int modifyExpert (ExpertDTO dto, int seq)throws Exception {
		String sql = "update Expert set title=?,content=? where seq=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getTitle());
			pstat.setString(2, dto.getContent());
			pstat.setInt(3, seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	//전문가 Q&A 삭제
	public int delExpert(int seq) throws Exception {
		String sql = "delete from Expert where seq=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	//질문게시판 목록
	public List<BoardDTO> qBoardList() throws Exception{
		String sql = "select * from board where header='질문'";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List<BoardDTO> list = new ArrayList<>();
			while (rs.next()) {
				int seq = rs.getInt(1);
				String writer = rs.getString(2);
				String header = rs.getString(3);
				String title = rs.getString(4);
				String content = rs.getString(5);
				String ipAddr = rs.getString(6);
				int viewCount = rs.getInt(7);
				Timestamp writeDate = rs.getTimestamp(8);
				BoardDTO dto = new BoardDTO(seq,writer,header,title,content,ipAddr,viewCount,writeDate);
				list.add(dto);
			}
			return list;
		}
	}
	//질문게시판 글 아이디로 찾기
	public List<BoardDTO> qBoardById (String id) throws Exception{
		String sql = "select * from board where id = ?, header='질문'";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, id);
			try(
					ResultSet rs = pstat.executeQuery();
					){	
				List<BoardDTO> list = new ArrayList<>();
				while(rs.next()) {
					int seq = rs.getInt(1);
					String writer = rs.getString(2);
					String header = rs.getString(3);
					String title = rs.getString(4);
					String content = rs.getString(5);
					String ipAddr = rs.getString(6);
					int viewCount = rs.getInt(7);
					Timestamp writeDate = rs.getTimestamp(8);
					BoardDTO dto = new BoardDTO(seq,writer,header,title,content,ipAddr,viewCount,writeDate);
					list.add(dto);

				}
				return list;
			}
		}
	}
	//커뮤니티관리 게시판 글 삭제
	public int delBoard(int seq) throws Exception {
		String sql = "delete from board where seq=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	//자유게시판 목록
	public List<BoardDTO> fBoardList() throws Exception{
		String sql = "select * from board where header='자유'";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List<BoardDTO> list = new ArrayList<>();
			while (rs.next()) {
				int seq = rs.getInt(1);
				String writer = rs.getString(2);
				String header = rs.getString(3);
				String title = rs.getString(4);
				String content = rs.getString(5);
				String ipAddr = rs.getString(6);
				int viewCount = rs.getInt(7);
				Timestamp writeDate = rs.getTimestamp(8);
				BoardDTO dto = new BoardDTO(seq,writer,header,title,content,ipAddr,viewCount,writeDate);
				list.add(dto);
			}
			return list;
		}
	}
	//자유게시판 글 아이디로 찾기
	public List<BoardDTO> fBoardById (String id) throws Exception{
		String sql = "select * from board where id = ?, header='자유'";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, id);
			try(
					ResultSet rs = pstat.executeQuery();
					){	
				List<BoardDTO> list = new ArrayList<>();
				while(rs.next()) {
					int seq = rs.getInt(1);
					String writer = rs.getString(2);
					String header = rs.getString(3);
					String title = rs.getString(4);
					String content = rs.getString(5);
					String ipAddr = rs.getString(6);
					int viewCount = rs.getInt(7);
					Timestamp writeDate = rs.getTimestamp(8);
					BoardDTO dto = new BoardDTO(seq,writer,header,title,content,ipAddr,viewCount,writeDate);
					list.add(dto);

				}
				return list;
			}
		}
	}
	
}
