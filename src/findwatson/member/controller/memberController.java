package findwatson.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import findwatson.member.dao.MemberDAO;


@WebServlet("*.member")
public class memberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String URI = request.getRequestURI(); // 프로젝트 명부터 URI까지
		String ctxpath = request.getContextPath(); // 프로젝트명만 뗀것
		String path = URI.substring(ctxpath.length()); // 
		
		MemberDAO dao = MemberDAO.getInstance();
		
		if(path.contentEquals("/login.member")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			System.out.println(id);
			System.out.println(pw);
			
			try {
				boolean result = dao.loginOk(id, pw);
				if(result) {
					request.getSession().setAttribute("loginCheck","value");
					request.setAttribute("result",result);
					request.getRequestDispatcher("/main.jsp").forward(request, response);
					
				}else {
					response.sendRedirect("index.jsp");
					System.out.println(id + ": 로그인 실패");
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

