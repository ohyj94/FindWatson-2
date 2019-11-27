package findwatson.review.controller;

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

import findwatson.configuration.Configuration;
import findwatson.review.dao.ReviewDAO;
import findwatson.review.dao.ReviewFileDAO;
import findwatson.review.dto.ReviewDTO;
import findwatson.review.dto.ReviewFileDTO;

@WebServlet("*.re")
public class reviewController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("utf8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter pwriter = response.getWriter();
		ReviewDAO dao = ReviewDAO.getInstance();
		ReviewFileDAO fDao = ReviewFileDAO.getInstance();
		
		String ipAddr = request.getRemoteAddr();
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = requestURI.substring(contextPath.length());
		System.out.println("cmd : " + cmd);
		
		if(cmd.contentEquals("/search/imgUpload.re")) {//리뷰작성시 사진 업로드
			String repositoryName = "reviewImg";
			String uploadPath = request.getServletContext().getRealPath("/" + repositoryName);
			System.out.println(uploadPath);
			File uploadFilePath = new File(uploadPath);
			if(!uploadFilePath.exists()) {
				uploadFilePath.mkdir();
			}
			
			int maxSize = 1024 * 1024 * 100;
			MultipartRequest multi = new MultipartRequest(request,uploadPath, maxSize,"UTF-8",new DefaultFileRenamePolicy());
			
			String fileName = multi.getFilesystemName("reviewImg");
			String oriFileName = multi.getOriginalFileName("reviewImg");
			System.out.println("원래 파일 이름 : " + oriFileName);
			System.out.println("최종 파일 이름 : " + fileName);
			
			try {
				fDao.insert(new ReviewFileDTO(0, 7777, fileName, oriFileName));//게시글시뭔스 안넣어도 될거같음
			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect(contextPath + "error.jsp");
			}
			//서버에 저장된 이미지의 경로 
			String imgPath = "../" + repositoryName + "/" + fileName;
			System.out.println(imgPath);
			
			JsonObject jObj = new JsonObject();
			jObj.addProperty("imgPath", imgPath);
			pwriter.append(jObj.toString());
		}else if(cmd.contentEquals("/search/reviewWrite.re")){ //리뷰작성
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			try {
				dao.insert(new ReviewDTO(0,7777,5,title,content,"앵무새", "test", null, ipAddr, 0 , 0));
				response.sendRedirect("hospitalSearchDetail2.re");
				
			}catch(Exception e){
				e.printStackTrace();
				response.sendRedirect(contextPath + "error.jsp");
			}
		}else if(cmd.contentEquals("/search/hospitalSearchDetail2.re")) { //디테일뷰2들어왔을때
			try {               
				int cpage = 1;
				String cpageInput = request.getParameter("cpage");
				if(cpageInput != null) {
					cpage = Integer.parseInt(request.getParameter("cpage"));
				}
				String navi = dao.getPageNavi(cpage, 7777);
				request.setAttribute("cpage", cpage);
				request.setAttribute("navi", navi); //네비바 넘기기
				
				//리스트 잘라서 넘기기
				int startRecord = cpage*Configuration.recordCountPerPage - (Configuration.recordCountPerPage - 1);
				int endRecord = cpage*Configuration.recordCountPerPage;
				
				List<ReviewDTO> reviewList = dao.selectByPage(startRecord, endRecord);
				request.setAttribute("reviewList", reviewList);
				request.getRequestDispatcher("hospitalSearchDetail2.jsp").forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect(contextPath + "error.jsp");
			}
		}else {
			response.sendRedirect(contextPath+"/error.jsp");
		}
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
