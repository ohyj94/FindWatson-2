package findwatson.admin.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import findwatson.admin.dao.AdminDAO;
import findwatson.admin.dao.AdminFileDAO;
import findwatson.admin.dto.AdminFileDTO;
import findwatson.admin.dto.BanDTO;
import findwatson.admin.dto.ExpertDTO;
import findwatson.admin.dto.NoticeDTO;
import findwatson.board.dao.BoardDAO;
import findwatson.board.dto.BoardDTO;
import findwatson.configuration.Configuration;
import findwatson.member.dto.MemberDTO;

@WebServlet("*.admin")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		Scanner sc = new Scanner(System.in);
		
		String ipAddr = request.getRemoteAddr();
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = requestURI.substring(contextPath.length());
		//String id = (String)request.getSession().getAttribute("loginInfo");
		String id = "test";
		
		AdminDAO dao = AdminDAO.getInstance();
		AdminFileDAO fDao = AdminFileDAO.getInstance();
		PrintWriter pwriter = response.getWriter();
		
		System.out.println("cmd - " + cmd);
		try {
			//관리자 로그인
			if(cmd.contentEquals("/login.admin")) {
				String idInput = request.getParameter("id");
				String pwInput = request.getParameter("pw");
				boolean result = dao.adminLogin(idInput, pwInput);
				
				if(result) {
					request.getSession().setAttribute("id", idInput);
					response.sendRedirect("main/mainAdmin.jsp");
				}
				else {
					response.sendRedirect("main/error.jsp");
				}
			}else if(cmd.contentEquals("관리자 비밀번호 변경")) {//관리자 비밀번호 변경
				String pw = request.getParameter("pw");
				int result = dao.adminInfoPwUpdate(id, pw);
				if(result > 0) {
					response.sendRedirect("index.jsp");
				}
				
			}else if(cmd.contentEquals("/adminMemberList.admin")) {//회원전체목록
				//List<MemberDTO> list = dao.selectAll();
				//request.setAttribute("list", list);
				System.out.println("admincontroller 연결 성공");
				//네비
				int cpage = 1;
				String param = request.getParameter("cpage");
				
				if(param!=null) {
					cpage = Integer.parseInt(param);	
				}
				
				int start = cpage * Configuration.recordCountPerPage - (Configuration.recordCountPerPage-1);	
				int end = cpage * Configuration.recordCountPerPage;
				
				List<MemberDTO> list = dao.MemberListByPage(start, end);
				
				String pageNavi = dao.getMemberListPageNav(cpage);
				
				request.setAttribute("pageNavi", pageNavi);
				request.setAttribute("list", list);
				
				//
				
				request.getRequestDispatcher("/admin/adminMemberList.jsp").forward(request, response);
				
			}else if(cmd.contentEquals("/adminBanList.admin")) {//차단한 ip 목록
				
				//List<BanDTO> list = dao.selectBanList();
				//request.setAttribute("list", list);
				int cpage = 1;
				String param = request.getParameter("cpage");
				
				if(param!=null) {
					cpage = Integer.parseInt(param);	
				}
				
				int start = cpage * Configuration.recordCountPerPage - (Configuration.recordCountPerPage-1);	
				int end = cpage * Configuration.recordCountPerPage;
				
				List<BanDTO> list = dao.BanListByPage(start, end);
				
				String pageNavi = dao.getBanListPageNav(cpage);
				
				request.setAttribute("pageNavi", pageNavi);
				request.setAttribute("list", list);
				
				//
				request.getRequestDispatcher("/admin/adminBanList.jsp").forward(request, response);
			}else if(cmd.contentEquals("아이디로 회원 검색")) {//회원목록에서 아이디로 회원 검색
				List<MemberDTO> list = dao.selectById(id);
				request.setAttribute("list", list);
				
			}else if(cmd.contentEquals("/expertWrite.admin")){ //전문가 Q&A 글쓰기
				String title = request.getParameter("boardTitle");
				String content = request.getParameter("content");
				System.out.println(content);
				
				dao.insertToExpert(new ExpertDTO(0, id, title, content, null, 0));
				
				response.sendRedirect(contextPath + "/boardExpert.admin");
			}else if(cmd.contentEquals("/expertWriteImgUpload.admin")) {//전문가 Q&A 글쓰기-이미지 업로드
				String repositoryName = "expertImg";
				String uploadPath = request.getServletContext().getRealPath( "/" + repositoryName);
				System.out.println(uploadPath);
				File uploadFilePath = new File(uploadPath);
				if(!uploadFilePath.exists()) {
					uploadFilePath.mkdir();
				}
				
				int maxSize = 1024 * 1024 * 100;
				MultipartRequest multi = new MultipartRequest(request,uploadPath, maxSize,"UTF-8",new DefaultFileRenamePolicy());
				
				String fileName = multi.getFilesystemName("expertImg");
				String oriFileName = multi.getOriginalFileName("expertImg");
				System.out.println("원래 파일 이름 : " + oriFileName);
				System.out.println("올린 파일 이름 : " + fileName);
				
				fDao.insertImgToExpert(new AdminFileDTO(0, 0, fileName, oriFileName));
				
				//서버의 이미지 경로
				String imgPath = contextPath + "/" + repositoryName + "/" + fileName;
				System.out.println(imgPath);
				
				JsonObject jObj = new JsonObject();
				jObj.addProperty("imgPath", imgPath);
				pwriter.append(jObj.toString());
			}else if(cmd.contentEquals("/noticeWrite.admin")) {//공지사항 글쓰기
				String title = request.getParameter("boardTitle");
				String content = request.getParameter("content");
				System.out.println(content);
				
				dao.insertToNotice(new ExpertDTO(0, id, title, content, null, 0));
				
				response.sendRedirect(contextPath + "/boardNotice.admin");
			}else if(cmd.contentEquals("/noticeWriteImgUpload.admin")) {//공지사항 글쓰기 - 이미지 업로드
				String repositoryName = "noticeImg";
				String uploadPath = request.getServletContext().getRealPath("/" + repositoryName);
				System.out.println(uploadPath);
				File uploadFilePath = new File(uploadPath);
				if(!uploadFilePath.exists()) {
					uploadFilePath.mkdir();
				}
				int maxSize = 1024 * 1024 * 100;
				MultipartRequest multi = new MultipartRequest(request,uploadPath, maxSize,"UTF-8",new DefaultFileRenamePolicy());
				
				String fileName = multi.getFilesystemName("noticeImg");
				String oriFileName = multi.getOriginalFileName("noticeImg");
				System.out.println("원래 파일 이름 : " + oriFileName);
				System.out.println("올린 파일 이름 : " + fileName);
				
				fDao.insertImgToNotice(new AdminFileDTO(0, 0, fileName, oriFileName));
				
				//서버의 이미지 경로
				String imgPath = contextPath + "/" + repositoryName + "/" + fileName;
				System.out.println(imgPath);
				
				JsonObject jObj = new JsonObject();
				jObj.addProperty("imgPath", imgPath);
				pwriter.append(jObj.toString());
			}else if(cmd.contentEquals("/boardExpert.admin")){// 전문가Q&A 글 목록 출력
				String pageCategory = "boardExpert.bo";
				int cpage = 1;
				String page = request.getParameter("cpage");
				if(page != null) {
					cpage = Integer.parseInt(request.getParameter("cpage"));
				}
				int start = cpage * Configuration.recordCountPerPage - Configuration.recordCountPerPage - 1;
				int end = cpage * Configuration.recordCountPerPage;
				List<ExpertDTO> list = BoardDAO.getInstance().selectByPageExpert(start, end);
				String pageNavi = BoardDAO.getInstance().getPageNavi(cpage,pageCategory);
				request.setAttribute("list", list);
				request.setAttribute("pageNavi", pageNavi);
				request.getRequestDispatcher("admin/adminBoardExpert.jsp").forward(request, response);
				
			}else if(cmd.contentEquals("/boardNotice.admin")){// 공지사항 글 목록 출력
				String pageCategory = "boardNotice.bo";
				int cpage = 1;
				String page = request.getParameter("cpage");
				if(page != null) {
					cpage = Integer.parseInt(request.getParameter("cpage"));
				}
				int start = cpage * Configuration.recordCountPerPage - Configuration.recordCountPerPage - 1;
				int end = cpage * Configuration.recordCountPerPage;
				
				List<NoticeDTO> list = BoardDAO.getInstance().selectByPageNotice(start, end);
				String pageNavi =  BoardDAO.getInstance().getPageNavi(cpage,pageCategory);
				
				request.setAttribute("list", list);
				request.setAttribute("pageNavi", pageNavi);
				request.getRequestDispatcher("admin/adminBoardNotice.jsp").forward(request, response);
			
			}else if(cmd.contentEquals("/boardFree.admin")){//자유게시판 글 출력
				String pageCategory = "boardFree.bo";
				int cpage = 1;
				String page = request.getParameter("cpage");
				if(page != null) {
					cpage = Integer.parseInt(request.getParameter("cpage"));
				}
				int start = cpage * Configuration.recordCountPerPage - Configuration.recordCountPerPage - 1;
				int end = cpage * Configuration.recordCountPerPage;
				
				List<BoardDTO> list = BoardDAO.getInstance().selectByPage(start, end, "자유");
				String pageNavi = BoardDAO.getInstance().getPageNavi(cpage,pageCategory);
				
				request.setAttribute("list", list);
				request.setAttribute("pageNavi", pageNavi);
				request.getRequestDispatcher("admin/adminBoardFree.jsp").forward(request, response);
			}else if(cmd.contentEquals("/boardQuestion.admin")) { //질문게시판 글 출력
				String pageCategory = "boardQuestion.bo";
				int cpage = 1;
				String page = request.getParameter("cpage");
				if(page != null) {
					cpage = Integer.parseInt(request.getParameter("cpage"));
				}
				int start = cpage * Configuration.recordCountPerPage - Configuration.recordCountPerPage - 1;
				int end = cpage * Configuration.recordCountPerPage;
				
				List<BoardDTO> list = BoardDAO.getInstance().selectByPage(start, end, "질문");
				String pageNavi = BoardDAO.getInstance().getPageNavi(cpage,pageCategory);
				
				request.setAttribute("list", list);
				request.setAttribute("pageNavi", pageNavi);
				request.getRequestDispatcher("admin/adminBoardQuestion.jsp").forward(request, response);
			}else if(cmd.contentEquals("/admin/adminDeleteMember.admin")) {//회원 삭제
				String idInput = request.getParameter("id");
				int result = dao.deleteMember(idInput);
				if(result > 0) {
					System.out.println("아이디 삭제 성공");
					response.sendRedirect("adminMemberList.admin");
				}
			}else if(cmd.contentEquals("/admin/adminSearchMember.admin")) {//회원목록에서 회원아이디 검색
				System.out.println("회원아이디검색 진입성공");
				String idInput = request.getParameter("search");
				List<MemberDTO> list = dao.selectById(idInput);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/admin/adminMemberList.jsp").forward(request, response);
//<<<<<<< HEAD
			}
			else if(cmd.contentEquals("/adminMemberChart.admin")) {//회원통계
				System.out.println("회원차트 진입성공");
				//회원정보
				int totalCount = dao.recordMemberListTotalCount();
				int memberMCount = dao.recordMemberMTotalCount();
				int memberWCount = dao.recordMemberWTotalCount();
				request.setAttribute("totalCount", totalCount);
				request.setAttribute("memberMCount", memberMCount);
				request.setAttribute("memberWCount", memberWCount);
				//관심동물
				int bird = dao.recordBirdTotalCount();
				int fish = dao.recordFishTotalCount();
				int hamster = dao.recordHamsterTotalCount();
				int rabbit = dao.recordRabbitTotalCount();
				int dochi = dao.recordDochiTotalCount();
				int reptile = dao.recordReptileTotalCount();
				int bug = dao.recordBugTotalCount();
				int other = dao.recordOtherTotalCount();
				request.setAttribute("bird", bird);
				request.setAttribute("fish", fish);
				request.setAttribute("hamster", hamster);
				request.setAttribute("rabbit", rabbit);
				request.setAttribute("dochi", dochi);
				request.setAttribute("reptile", reptile);
				request.setAttribute("bug", bug);
				request.setAttribute("other", other);
				//가입경로
				int directSearch = dao.recordDirectSearchTotalCount();
				int keywordSearch = dao.recordKeywordSearchTotalCount();
				int introduce = dao.recordIntroduceTotalCount();
				int otherSearch = dao.recordOtherSearchTotalCount();
				request.setAttribute("directSearch", directSearch);
				request.setAttribute("keywordSearch", keywordSearch);
				request.setAttribute("introduce", introduce);
				request.setAttribute("otherSearch", otherSearch);
				request.getRequestDispatcher("/admin/adminMemberChart.jsp").forward(request, response);
				
			}
			else if(cmd.contentEquals("/adminMemberChart.admin")) {//관심동물통계
				
				
			}
			
//=======
			else if(cmd.contentEquals("/adminNoticeDetailView.admin")) { //관리자 - 공지에서 글 클릭했을때
				int noticeSeq = Integer.parseInt(request.getParameter("seq"));
				NoticeDTO dto = dao.getNoticeBySeq(noticeSeq);
				request.setAttribute("dto", dto);
				request.getRequestDispatcher("admin/adminNoticeDetailView.jsp").forward(request, response);
			}else if(cmd.contentEquals("/adminExpertDetailView.admin")) {//관리자 - 전문가 Q&A에서 글 클릭했을때
				int expertSeq = Integer.parseInt(request.getParameter("seq"));
				ExpertDTO dto = dao.getExpertBySeq(expertSeq);
				request.setAttribute("dto", dto);
				request.getRequestDispatcher("admin/adminExpertDetailView.jsp").forward(request, response);
			}else if(cmd.contentEquals("/adminFreeDetailView.admin")) {//관리자 - 자유게시판에서 글 클릭했을때
				
			}else if(cmd.contentEquals("/adminQuestionDetailView.admin")) {//관리자 - 질문게시판에서 글 클릭했을때
				
			}else {
//>>>>>>> 777b692b8b23db56023ece9d4b34eb22544f767b
				response.sendRedirect(contextPath + "/error.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(contextPath + "/error.jsp");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
