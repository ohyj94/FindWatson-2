package findwatson.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import findwatson.board.dao.BoardDAO;
import findwatson.board.dao.FilesDAO;
import findwatson.board.dto.BoardDTO;
import findwatson.board.dto.FilesDTO;


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
		String ipAddr = request.getRemoteAddr();
		//String id = (String)request.getSession().getAttribute("loginInfo");
		
		//임시
		System.out.println("cmd : " + cmd);
		String id = "test";
		
		if(cmd.contentEquals("/board/communityQuestionWrite.bo")) {//커뮤니티(질문) - 글쓰기
			String header = request.getParameter("header");
			String animalHeader = request.getParameter("animalHeader");
			String questionTitle = request.getParameter("questionTitle");
			String content = request.getParameter("content");
			
			try {
				dao.insert(new BoardDTO(0,id, header, animalHeader, questionTitle, content, ipAddr, 0, null));
				response.sendRedirect("boardQuestion.bo");
				//이거 아직 안생김
			}catch(Exception e) {
				
			}
			
			
		}else if(cmd.contentEquals("/board/imgUploadQuestion.bo")){//커뮤니티(질문) - 이미지 업로드
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
			
			try {
				fDao.insert(new FilesDTO(0, 0, fileName, oriFileName));
			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect(contextPath + "/error.jsp");
			}
			//서버의 이미지 경로
			String imgPath = "../" + repositoryName + "/" + fileName;
			System.out.println(imgPath);
			
			JsonObject jObj = new JsonObject();
			jObj.addProperty("imgPath", imgPath);
			pwriter.append(jObj.toString());
	
		}else if(cmd.contentEquals("/board/communityFreeWrite.bo")) {//커뮤니티(자유) - 글쓰기
			
		}else if(cmd.contentEquals("/board/imgUploadFree.bo")) {//커뮤니티(자유) - 이미지 업로드
			
		}else{//등롣되지 않은 경로로 입장시
			response.sendRedirect("error.jsp");
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}