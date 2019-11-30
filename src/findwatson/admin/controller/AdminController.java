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
			if(cmd.contentEquals("관리자 로그인")) {
				String idInput = request.getParameter("id");
				String pwInput = request.getParameter("pw");
				boolean result = dao.adminLogin(idInput, pwInput);
				
				if(result) {
					request.getSession().setAttribute("id", idInput);
					request.setAttribute("result", result);
					//request.getRequestDispatcher("관리자 로그인 후 페이지").forward(request, response);
				}
				else {
					response.sendRedirect("관리자 로그인 실패 페이지");
				}
			}else if(cmd.contentEquals("관리자 비밀번호 변경")) {//관리자 비밀번호 변경
				String pw = request.getParameter("pw");
				int result = dao.adminInfoPwUpdate(id, pw);
				if(result > 0) {
					response.sendRedirect("index.jsp");
				}
				
			}else if(cmd.contentEquals("/admin/adminMemberList.admin")) {//회원전체목록
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
				
			}else if(cmd.contentEquals("/admin/adminBanList.admin")) {//차단한 ip 목록
				
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
				
				dao.insert(new ExpertDTO(0, id, title, content, null, 0));
				
				//익태오빠한테 받아서 수정
				response.sendRedirect("exportList.admin");
			}else if(cmd.contentEquals("/expertWriteImgUpload.admin")) {//전문가 Q&A 글쓰기-이미지 업로드
				String repositoryName = "expertImg";
				String uploadPath = request.getServletContext().getRealPath("/" + repositoryName);
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
				
				fDao.insert(new AdminFileDTO(0, 0, fileName, oriFileName));
				
				//서버의 이미지 경로
				String imgPath = "../" + repositoryName + "/" + fileName;
				System.out.println(imgPath);
				
				JsonObject jObj = new JsonObject();
				jObj.addProperty("imgPath", imgPath);
				pwriter.append(jObj.toString());
			}else if(cmd.contentEquals("/noticeWrite.admin")) {//공지사항 글쓰기
				
			}else if(cmd.contentEquals("/noticeWriteImgUpload.admin")) {//공지사항 글쓰기 - 이미지 업로드
				
			}else {
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
