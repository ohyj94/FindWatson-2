package findwatson.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import findwatson.admin.dao.ManagerDAO;
import findwatson.admin.dto.ExpertDTO;
import findwatson.admin.dto.HListDTO;
import findwatson.admin.dto.NoticeDTO;
import findwatson.board.dto.BoardDTO;
import findwatson.configuration.Configuration;
import findwatson.search.dao.HospitalListDAO;


@WebServlet("*.manager")
public class ManagerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getRequestURI().substring(request.getContextPath().length());
		ManagerDAO dao = ManagerDAO.getInstance();
		request.setCharacterEncoding("utf8");
		response.setContentType("text/html; charset=UTF-8");
		try {
			if(cmd.contentEquals("/admin/adminBoardHosptList.manager")) {
			
				
				
				
				
				int cpage = 1;
				String param = request.getParameter("cpage");

				if(param!=null) {
					cpage = Integer.parseInt(param);	
				}

				int start = cpage * Configuration.recordCountPerPage - (Configuration.recordCountPerPage-1);	
				int end = cpage * Configuration.recordCountPerPage;

				List<HListDTO> list = dao.hosptListByPage(start, end);

				String pageNavi = dao.getHosptListPageNav(cpage);

				request.setAttribute("pageNavi", pageNavi);
				request.setAttribute("list", list);

				request.getRequestDispatcher("/admin/adminBoardHosptList.jsp").forward(request, response);
		
				
				
				
				
				
				
				
				


			}
			else if(cmd.contentEquals("/admin/adminInsertHospt.manager")) {
				System.out.println("병원등록 진입 성공");
				String name = request.getParameter("name");
				int postcode = Integer.parseInt(request.getParameter("postcode"));
				String address1 = request.getParameter("address1");
				String address2 = request.getParameter("address2");
				String phone = request.getParameter("phone");
				String homepage = request.getParameter("homepage");
				String img = "이미지 아직 안함";
				String [] medicalAnimal = request.getParameterValues("medicalAnimal");
				String [] openTime = request.getParameterValues("openTime");
				
				System.out.println(name + " " +postcode+ " " +address1+ " " +address2+ " " +phone+ " " +homepage+ " " + 
				medicalAnimal[0]+ " " +medicalAnimal[1]+ " " +openTime[0]+ " " +openTime[1]);
	
				String animal = Arrays.toString(medicalAnimal).replace("{","").replace("}","").replace("[","").replace("]","").replace(", ",";");
				System.out.println(animal.contentEquals("null"));
				if(animal.contentEquals("null")) {
					animal = "";
				}
				System.out.println("animal : " + animal);
				
				String time = Arrays.toString(openTime).replace("{","").replace("}","").replace("[","").replace("]","").replace(", ",";");
				//System.out.println( time.equals("null"));
				if(time.contentEquals("null")) {
					time = "";
				}
				System.out.println("time : " + time);
				
				HListDTO dto = new HListDTO(0,name,postcode,address1,address2,phone,homepage,img,animal,time,null,0);
				int result = dao.insertHospital(dto);
				System.out.println(result);
				if(result > 0) {
					System.out.println("db저장 성공");
					
				}
				else {
					System.out.println("db저장 실패");
				}
			}
			else if(cmd.contentEquals("병원정보수정")) {

			}
			//공지사항 네비 적용된 목록
			else if(cmd.contentEquals("/admin/adminBoardNotice.manager")) {
				System.out.println("공지사항 진입 성공");


				int cpage = 1;
				String param = request.getParameter("cpage");

				if(param!=null) {
					cpage = Integer.parseInt(param);	
				}

				int start = cpage * Configuration.recordCountPerPage - (Configuration.recordCountPerPage-1);	
				int end = cpage * Configuration.recordCountPerPage;

				List<NoticeDTO> list = dao.noticeListByPage(start, end);

				String pageNavi = dao.getNoticeListPageNav(cpage);

				request.setAttribute("pageNavi", pageNavi);
				request.setAttribute("list", list);

				request.getRequestDispatcher("/admin/adminBoardNotice.jsp").forward(request, response);
			}
			else if(cmd.contentEquals("/admin/adminBoardExpert.manager")){
				System.out.println("전문가 진입 성공");


				int cpage = 1;
				String param = request.getParameter("cpage");

				if(param!=null) {
					cpage = Integer.parseInt(param);	
				}

				int start = cpage * Configuration.recordCountPerPage - (Configuration.recordCountPerPage-1);	
				int end = cpage * Configuration.recordCountPerPage;

				List<ExpertDTO> list = dao.expertListByPage(start, end);

				String pageNavi = dao.getExpertListPageNav(cpage);

				request.setAttribute("pageNavi", pageNavi);
				request.setAttribute("list", list);

				request.getRequestDispatcher("/admin/adminBoardExpert.jsp").forward(request, response);
			}
			else if(cmd.contentEquals("자유게시판 목록")) {
				List<BoardDTO> list = dao.fBoardList();
				request.setAttribute("list", list);
			}
			else if(cmd.contentEquals("자유게시판 글 아이디로 찾기")) {
				String id = request.getParameter("id");
				List<BoardDTO> list = dao.fBoardById(id);
				request.setAttribute("list", list);
			}
			else if(cmd.contentEquals("질문게시판 목록")) {
				List<BoardDTO> list = dao.qBoardList();
				request.setAttribute("list", list);
			}
			else if(cmd.contentEquals("질문게시판 글 아이디로 찾기")) {
				String id = request.getParameter("id");
				List<BoardDTO> list = dao.qBoardById(id);
				request.setAttribute("list", list);
			}
			else if(cmd.contentEquals("1:1문의게시판 목록")) {
				dao.oneByOneList();
			}


		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
