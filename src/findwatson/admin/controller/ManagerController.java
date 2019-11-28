package findwatson.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import findwatson.admin.dao.ManagerDAO;
import findwatson.admin.dto.HListDTO;
import findwatson.admin.dto.NoticeDTO;
import findwatson.board.dto.BoardDTO;
import findwatson.configuration.Configuration;


@WebServlet("*.manager")
public class ManagerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getRequestURI().substring(request.getContextPath().length());
		ManagerDAO dao = ManagerDAO.getInstance();
		request.setCharacterEncoding("utf8");
		response.setContentType("text/html; charset=UTF-8");
		try {
			if(cmd.contentEquals("병원리스트")) {
				List<HListDTO> list = dao.hospitalList();
				request.setAttribute("list", list);


			}
			else if(cmd.contentEquals("병원정보등록")) {
				String hName = request.getParameter("hName");

			}
			else if(cmd.contentEquals("병원정보수정")) {

			}
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
			else if(cmd.contentEquals("1:1문의게시판 목록")) {
				dao.oneByOneList();
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
			else if(cmd.contentEquals("자유게시판 목록")) {
				List<BoardDTO> list = dao.fBoardList();
				request.setAttribute("list", list);
			}
			else if(cmd.contentEquals("자유게시판 글 아이디로 찾기")) {
				String id = request.getParameter("id");
				List<BoardDTO> list = dao.fBoardById(id);
				request.setAttribute("list", list);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
