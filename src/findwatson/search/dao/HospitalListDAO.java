package findwatson.search.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import findwatson.admin.dto.HListDTO;
import findwatson.configuration.Configuration;


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

	// 검색에 따른 목록 내용 반환 
		public List<HListDTO> selectAll(String input_city, String input_gu, String input_animal, String input_time) throws Exception{
			
			System.out.println(1);
			String sql = "select * from hosptList where (address1 like ?) and (address1 like ?) and (medicalAnimal like ?) and (opentime like ?)";
			try (
					Connection con = this.getConnection();
					PreparedStatement pstat = con.prepareStatement(sql);
					){
				
				pstat.setString(1, input_city);
				pstat.setString(2, input_gu);
				pstat.setString(3, input_animal);
				pstat.setString(4, input_time);
				
				System.out.println(input_city);
				System.out.println(input_gu);
				System.out.println(input_animal);
				System.out.println(input_time);
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
						int viewCount = rs.getInt(12);
					System.out.println(3);
						HListDTO dto = new HListDTO(seq, hosptName, postcode, city, gu,
								phone, homepage, img, medicalAnimal, openTime, registDate, viewCount);
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
		
		// 검색에 따른 목록을 페이지 수에 맞춰 반환 
			public List<HListDTO> selectByPage(String input_city, String input_gu, String input_animal, String input_time, int start, int end) throws Exception{
				
				System.out.println(1);
				String sql = "select * from (select hosptList.*, row_number() over (order by seq desc) as rank from hosptList) where (address1 like ?) and (address1 like ?) and (medicalAnimal like ?) and (opentime like ?) and (rank between ? and ?)";
				try (
						Connection con = this.getConnection();
						PreparedStatement pstat = con.prepareStatement(sql);
						){
					System.out.println(input_city);
					pstat.setString(1, input_city);
					pstat.setString(2, input_gu);
					pstat.setString(3, input_animal);
					pstat.setString(4, input_time);
					pstat.setInt(5, start);
					System.out.println("start" + start);
					pstat.setInt(6, end);
					System.out.println("end" + end);
		System.out.println(2);
					try(
							ResultSet rs = pstat.executeQuery();
							
							){
						List<HListDTO> list = new ArrayList<HListDTO>();
						System.out.println(rs.next());
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
							int viewCount = rs.getInt(12);
						System.out.println(3);
							HListDTO dto = new HListDTO(seq, hosptName, postcode, city, gu,
									phone, homepage, img, medicalAnimal, openTime, registDate, viewCount);
							list.add(dto);
						System.out.println(4);
						}
						System.out.println("이게 안되는건가?");
						return list;
					}	
				}
			}
		
		// 병원 검색 결과 페이지 네비게이터
		public String getPageNavi(int currentPage, String input_city, String input_gu, String input_animal, String input_time) throws Exception {
			
			int recordTotalCount = selectAll(input_city, input_gu, input_animal, input_time).size();
			System.out.println(recordTotalCount);
			int pageTotalCount = 0;
		
			if(recordTotalCount % Configuration.recordCountPerPage > 0) {

			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage + 1;
		
			}else{
				pageTotalCount = recordTotalCount / Configuration.recordCountPerPage;
			}

			if(currentPage < 1) {
			currentPage = 1;	
		
			}else if(currentPage > pageTotalCount) {
				currentPage = pageTotalCount;
			}
			
			int startNavi = (currentPage - 1) /  Configuration.naviCountPerPage  * Configuration.naviCountPerPage + 1;
			
			int endNavi = startNavi + Configuration.naviCountPerPage - 1;
			
			if(endNavi > pageTotalCount) {
				endNavi = pageTotalCount;
			}
			boolean needPrev = true;
			boolean needNext = true;
			
			if(startNavi == 1) {
				needPrev = false;
			}
			if(endNavi == pageTotalCount) {
				needNext = false;
			}
		
			StringBuilder sb = new StringBuilder();
			if(needPrev) {sb.append("<a href='searchFrom.s?currentPage="+(startNavi - 1)+"'> < </a>");}
			// 값을 서버에서 만들어서 + 붙여서 프론트로 나가는거니까 
			// 서버에서 이미 앵커태그가 붙어야한다 
			for(int i = startNavi; i <= endNavi; i++) {
				sb.append("<a href = 'searchFrom.s?currentPage="+i+"'> ");
				sb.append(i + " ");
				sb.append("</a>");
			}
			if(needNext) {sb.append(">");}

			System.out.println("현재 페이지 번호 : " + currentPage);
			System.out.println("네비게이터 시작 번호 : " + startNavi);
			System.out.println("네비게이터 끝  페이지 번호 : " + endNavi);
			
			return sb.toString();
			//System.out.println(sb.toString());                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
		}
		
		// 제목 누르면 글 보여주기 
		
				public HListDTO select(int num)  throws Exception{
					String sql = "select * from hosptList where seq=?";
					try ( Connection con = this.getConnection();
							PreparedStatement pstat = con.prepareStatement(sql);
							){ 
						pstat.setInt(1,num);
						try(ResultSet rs = pstat.executeQuery();){
			
							HListDTO dto = null;
							if(rs.next()) {
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
								int viewCount = rs.getInt(12);
								
								medicalAnimal = (medicalAnimal).replace(";",",");
								dto = new HListDTO(seq, hosptName, postcode, city, gu,
										phone, homepage, img, medicalAnimal, openTime, registDate, viewCount);
							}
							return dto; 
						}
					}
				}
					// count 증가하기 
			
					public int plusss(int viewcount, int seq) throws Exception {
						String sql = "update hosptList set viewCount=?+1 where seq=?";
			
						try (
								Connection con = this.getConnection();
								PreparedStatement pstat = con.prepareStatement(sql);
								){
							pstat.setInt(1, viewcount);
							pstat.setInt(2, seq);
							pstat.executeUpdate();
							con.commit();
						}
						return 1;
					}
				
		
		
	
	
}
