package findwatson.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import findwatson.board.dto.BoardDTO;
import findwatson.configuration.Configuration;

public class BoardDAO {

	private static BoardDAO instance;
	private BasicDataSource bds = new BasicDataSource();
	private BoardDAO() {
		bds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		bds.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
		bds.setUsername("manager");
		bds.setPassword("manager");
		bds.setInitialSize(30);
	}
	private Connection getConnetion() throws Exception{
		return bds.getConnection();
	}	
	public synchronized static BoardDAO getInstance() {
		if(BoardDAO.instance == null) {
			BoardDAO.instance = new BoardDAO();
		}
		return BoardDAO.instance;
	}

	//글 목록 조회
	public List<BoardDTO> selectAll() throws Exception{
		String sql = "select * from board order by seq desc";
		List<BoardDTO> result = new ArrayList<>();
		try(
				Connection con = this.getConnetion();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			while(rs.next()) {
				int boardSeq = rs.getInt(1);
				String writer = rs.getString(2);
				String header = rs.getString(3);
				String title = rs.getString(4);
				String content = rs.getString(5);
				String ipAddr = rs.getString(6);
				int viewCount = rs.getInt(7);
				Timestamp writeDate = rs.getTimestamp(8);

				result.add(new BoardDTO(boardSeq, writer, header, title, content, ipAddr, viewCount, writeDate));
			}
			return result;
		}
	}

	//제목으로 검색하기
	public List<BoardDTO> selectByTitle(String title) throws Exception{
		String sql = "select * from board where title like ? order by seq desc";
		List<BoardDTO> result = new ArrayList<>();
		try(
				Connection con = this.getConnetion();
				PreparedStatement pstat = con.prepareStatement(sql);

				){
			//완전히 같은 제목이 아니라 키워드 포함이면 검색이 되어야 하므로 % 붙인 값을 set
			pstat.setString(1, "%"+title+"%");
			try(
					ResultSet rs = pstat.executeQuery();
					){
				while(rs.next()) {
					int boardSeq = rs.getInt(1);
					String writer = rs.getString(2);
					String header = rs.getString(3);
					String rtitle = rs.getString(4);	//검색어랑 변수 겹쳐서 db에 입력된 real title
					String content = rs.getString(5);
					String ipAddr = rs.getString(6);
					int viewCount = rs.getInt(7);
					Timestamp writeDate = rs.getTimestamp(8);

					result.add(new BoardDTO(boardSeq, writer, header, rtitle, content, ipAddr, viewCount, writeDate));
				}
			}
			return result;
		}
	}

	//글작성자 검색하기
	public List<BoardDTO> selectByWriter(String writer) throws Exception{
		String sql = "select * from board where writer=? order by seq desc";
		List<BoardDTO> result = new ArrayList<>();
		try(
				Connection con = this.getConnetion();
				PreparedStatement pstat = con.prepareStatement(sql);

				){
			pstat.setString(1, writer);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				while(rs.next()) {
					int boardSeq = rs.getInt(1);
					//String writer = rs.getString(2);
					String header = rs.getString(3);
					String title = rs.getString(4);
					String content = rs.getString(5);
					String ipAddr = rs.getString(6);
					int viewCount = rs.getInt(7);
					Timestamp writeDate = rs.getTimestamp(8);

					result.add(new BoardDTO(boardSeq, writer, header, title, content, ipAddr, viewCount, writeDate));
				}
			}
			return result;
		}
	}

	//글번호로 검색하기(primary key 이므로 검색결과는 한개)
	public BoardDTO selectBySeq(int seq) throws Exception{
		String sql = "select * from board where boardSeq=? order by seq desc";
		try(
				Connection con = this.getConnetion();
				PreparedStatement pstat = con.prepareStatement(sql);

				){
			pstat.setInt(1, seq);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				rs.next();
				int boardSeq = rs.getInt(1);
				String writer = rs.getString(2);
				String header = rs.getString(3);
				String title = rs.getString(4);
				String content = rs.getString(5);
				String ipAddr = rs.getString(6);
				int viewCount = rs.getInt(7);
				Timestamp writeDate = rs.getTimestamp(8);

				return new BoardDTO(boardSeq, writer, header, title, content, ipAddr, viewCount, writeDate);
			}
		}
	}
	
	//글쓰기
	public int insert(BoardDTO dto) throws Exception{
		String sql = "insert into board values(boardSeq.nextval,?,?,?,?,?,0,sysdate)";
		try(
				Connection con = this.getConnetion();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getWriter());
			pstat.setString(2, dto.getHeader());
			pstat.setString(3, dto.getTitle());
			pstat.setString(4, dto.getContent());
			pstat.setString(5, dto.getIpAddr());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	//글삭제
	public int delete(int seq) throws Exception{
		String sql = "delete from board where boardSeq=?";
		try(
				Connection con = this.getConnetion();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	//글 수정  제목, 내용, 날짜
	public int update(BoardDTO dto) throws Exception{
		String sql = "update board set title=?, content=?, writeDate=sysdate where boardSeq=?";
		try(
				Connection con = this.getConnetion();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getTitle());
			pstat.setString(2, dto.getContent());
			pstat.setInt(3, dto.getBoardSeq());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	private int getTotalBoard() throws Exception{
		String sql = "select count(*) from board";
		try(
				Connection con = this.getConnetion();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			rs.next();
			return rs.getInt(1);
		}
	}
	public String getPageNavi(int current) throws Exception{
		int recordTotalCount = this.getTotalBoard();
		int pageTotalCount = 0;
		if(recordTotalCount% Configuration.recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage + 1;
		}else {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage;
		}
		int currentPage = current;
		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		int startNavi = (currentPage - 1) / Configuration.naviCountPerPage * Configuration.naviCountPerPage + 1;
		int endNavi = startNavi + (Configuration.naviCountPerPage - 1);
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		boolean needPrev = true;
		if(startNavi == 1) {
			needPrev = false;
		}
		boolean needNext = true;
		if(endNavi == pageTotalCount) {
			needNext = false;
		}
		StringBuilder sb = new StringBuilder();
		
		//이부분 servlet 기능에 따라 수정하기
		if(needPrev) sb.append("<a href='toBoard.bo?currentPage=" + (startNavi - 1) + "'>< </a>");
		
		for(int i = startNavi; i <= endNavi; i++) {
			sb.append("<a href='toBoard.bo?currentPage="+ i +"'>");
			sb.append(i + " ");
			sb.append("</a>");
		}
		
		if(needNext) sb.append("<a href='toBoard.bo?currentPage=" + (endNavi + 1) + "'>> </a>");
	
		return sb.toString();
	}
	
	public List<BoardDTO> selectByPage(int start, int end) throws Exception{
		String sql = "select * from (select board.*, row_number() over(order by seq desc) rown from board) where rown between ? and ?";
		List<BoardDTO> result = new ArrayList<>();
		try(
				Connection con = this.getConnetion();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, start);
			pstat.setInt(2, end);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				while(rs.next()) {
					int boardSeq = rs.getInt(1);
					String writer = rs.getString(2);
					String header = rs.getString(3);
					String title = rs.getString(4);
					String content = rs.getString(5);
					String ipAddr = rs.getString(6);
					int viewCount = rs.getInt(7);
					Timestamp writeDate = rs.getTimestamp(8);

					result.add(new BoardDTO(boardSeq, writer, header, title, content, ipAddr, viewCount, writeDate));
				}
				return result;
			}
			
		}
	}
	public int increViewCnt(int count, int seq) throws Exception{
		String sql = "update board set viewCount=?+1 where boardSeq=?";
		try(
				Connection con = this.getConnetion();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, count);
			pstat.setInt(2, seq);
			pstat.executeUpdate();
			con.commit();
			return count + 1;
		}
	}


}