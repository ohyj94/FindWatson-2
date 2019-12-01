package findwatson.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import findwatson.admin.dto.ExpertDTO;
import findwatson.admin.dto.NoticeDTO;
import findwatson.board.dao.BoardDAO;
import findwatson.board.dao.FilesDAO;
import findwatson.board.dto.BoardDTO;
import findwatson.board.dto.FilesDTO;
import findwatson.configuration.Configuration;


@WebServlet("*.bo")
public class BoardController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter pwriter = response.getWriter();
		FilesDAO fDao = FilesDAO.getInstance();
		BoardDAO dao = BoardDAO.getInstance();
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = requestURI.substring(contextPath.length());
		System.out.println("컨트롤러 : " + cmd);
	 
	    //String id = (String)request.getSession().getAttribute("loginInfo");
	    String id = "test"; // 테스트
	    String ipAddr = request.getRemoteAddr();
	    
		try {
			// 자유게시판 글 목록 출력
			if(cmd.contentEquals("/boardFree.bo")) {
				String pageCategory = "boardFree.bo";
				int cpage = 1;
				String page = request.getParameter("cpage");
				if(page != null) {
					cpage = Integer.parseInt(request.getParameter("cpage"));
				}
				int start = cpage * Configuration.recordCountPerPage - Configuration.recordCountPerPage - 1;
				int end = cpage * Configuration.recordCountPerPage;
				
				List<BoardDTO> list = dao.selectByPage(start, end, "자유");
				String pageNavi = dao.getPageNavi(cpage,pageCategory);
				
				request.setAttribute("list", list);
				request.setAttribute("pageNavi", pageNavi);
				request.getRequestDispatcher("board/boardFree.jsp").forward(request, response);
				
			// 질문게시판 글 목록 출력
			} else if(cmd.contentEquals("/boardQuestion.bo")) {
				String pageCategory = "boardQuestion.bo";
				int cpage = 1;
				String page = request.getParameter("cpage");
				if(page != null) {
					cpage = Integer.parseInt(request.getParameter("cpage"));
				}
				int start = cpage * Configuration.recordCountPerPage - Configuration.recordCountPerPage - 1;
				int end = cpage * Configuration.recordCountPerPage;
				
				List<BoardDTO> list = dao.selectByPage(start, end, "질문");
				String pageNavi = dao.getPageNavi(cpage,pageCategory);
				
				request.setAttribute("list", list);
				request.setAttribute("pageNavi", pageNavi);
				request.getRequestDispatcher("board/boardQuestion.jsp").forward(request, response);
				
			// 전문가Q&A 글 목록 출력			
			} else if(cmd.contentEquals("/boardExpert.bo")) {
				String pageCategory = "boardExpert.bo";
				int cpage = 1;
				String page = request.getParameter("cpage");
				if(page != null) {
					cpage = Integer.parseInt(request.getParameter("cpage"));
				}
				int start = cpage * Configuration.recordCountPerPage - Configuration.recordCountPerPage - 1;
				int end = cpage * Configuration.recordCountPerPage;
				
				List<ExpertDTO> list = dao.selectByPageExpert(start, end);
				String pageNavi = dao.getPageNavi(cpage,pageCategory);
				
				request.setAttribute("list", list);
				request.setAttribute("pageNavi", pageNavi);
				request.getRequestDispatcher("board/boardExpert.jsp").forward(request, response);
				
			// 공지사항 글 목록 출력
			} else if(cmd.contentEquals("/boardNotice.bo")) {
				String pageCategory = "boardNotice.bo";
				int cpage = 1;
				String page = request.getParameter("cpage");
				if(page != null) {
					cpage = Integer.parseInt(request.getParameter("cpage"));
				}
				int start = cpage * Configuration.recordCountPerPage - Configuration.recordCountPerPage - 1;
				int end = cpage * Configuration.recordCountPerPage;
				
				List<NoticeDTO> list = dao.selectByPageNotice(start, end);
				String pageNavi = dao.getPageNavi(cpage,pageCategory);
				
				request.setAttribute("list", list);
				request.setAttribute("pageNavi", pageNavi);
				request.getRequestDispatcher("board/boardNotice.jsp").forward(request, response);
			
			// 커뮤니티(질문) - 글쓰기
			} else if(cmd.contentEquals("/communityQuestionWrite.bo")) {
				
				String header = request.getParameter("header");
				String animalHeader = request.getParameter("animalHeader");
				String questionTitle = request.getParameter("questionTitle");
				String content = request.getParameter("content");
				
				dao.insert(new BoardDTO(0,id, header, animalHeader, questionTitle, content, ipAddr, 0, null));
	            response.sendRedirect("boardQuestion.bo");
	            
	        //커뮤니티(질문) - 이미지 업로드
			} else if(cmd.contentEquals("/imgUploadQuestion.bo")) {
				String repositoryName = "boardQuestImgRepository";
				String uploadPath = request.getServletContext().getRealPath("/" + repositoryName);
				System.out.println(uploadPath);
				
		        File uploadFilePath = new File(uploadPath);
		        if(!uploadFilePath.exists()) {
		           uploadFilePath.mkdir();
		        }
		         
		        int maxSize = 1024 * 1024 * 100;
		        MultipartRequest multi = new MultipartRequest(request,uploadPath, maxSize,"UTF-8",new DefaultFileRenamePolicy());
		         
		        String fileName = multi.getFilesystemName("comQuestionImg");
		        String oriFileName = multi.getOriginalFileName("comQuestionImg");
		        System.out.println("원래 파일 이름 : " + oriFileName);
		        System.out.println("올린 파일 이름 : " + fileName);
				
		        fDao.insert(new FilesDTO(0, 0, fileName, oriFileName));
		        
		        //서버의 이미지 경로
		        String imgPath = "../" + repositoryName + "/" + fileName;
		        System.out.println(imgPath);
		         
		        JsonObject jObj = new JsonObject();
		        jObj.addProperty("imgPath", imgPath);
		        pwriter.append(jObj.toString());
		        
		    // 커뮤니티(자유) - 글쓰기
			} else if(cmd.contentEquals("/communityFreeWrite.bo")) {
				String header = request.getParameter("header");
		        String animalHeader = request.getParameter("animalHeader");
		        String questionTitle = request.getParameter("freeTitle");
		        String content = request.getParameter("content");
		        
		        dao.insert(new BoardDTO(0,id, header, animalHeader, questionTitle, content, ipAddr, 0, null));
	            response.sendRedirect("boardFree.bo");

	        // 커뮤니티(자유) - 이미지 업로드
			} else if(cmd.contentEquals("/imgUploadFree.bo")) {
				String repositoryName = "boardFreeImgRepository";
				String uploadPath = request.getServletContext().getRealPath("/" + repositoryName);

				File uploadFilePath = new File(uploadPath);
		        if(!uploadFilePath.exists()) {
		           uploadFilePath.mkdir();
		        }
		         
		        int maxSize = 1024 * 1024 * 100;
		        MultipartRequest multi = new MultipartRequest(request,uploadPath, maxSize,"UTF-8",new DefaultFileRenamePolicy());
		         
		        String fileName = multi.getFilesystemName("comFreeImg");
		        String oriFileName = multi.getOriginalFileName("comFreeImg");
		        System.out.println("원래 파일 이름 : " + oriFileName);
		        System.out.println("올린 파일 이름 : " + fileName);

		        fDao.insert(new FilesDTO(0, 0, fileName, oriFileName));

				// 서버의 이미지 경로
				String imgPath = "../" + repositoryName + "/" + fileName;
				System.out.println(imgPath);

				JsonObject jObj = new JsonObject();
				jObj.addProperty("imgPath", imgPath);
				pwriter.append(jObj.toString());
			
			// 등록되지 않은 경로로 입장시
			} else {
				response.sendRedirect("main/error.jsp");
			}
		} catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("main/error.jsp");
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}