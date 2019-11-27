package findwatson.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import findwatson.member.dao.MemberDAO;
import findwatson.member.dto.MemberDTO;


@WebServlet("*.member")
public class memberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String URI = request.getRequestURI(); // ������Ʈ ����� URI����
		String ctxpath = request.getContextPath(); // ������Ʈ�� ����
		String path = URI.substring(ctxpath.length()); // 
		
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO dto = new MemberDTO();
		
		if(path.contentEquals("/login.member")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			System.out.println(id);
			System.out.println(pw);
			
			try {
				boolean result = dao.loginOk(id, pw);
				if(result) {
					request.getSession().setAttribute("logininfo",id);
					response.sendRedirect("/main.jsp");
					
				}else {
					response.sendRedirect("index.jsp");
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if (path.contentEquals("/logout.member")) {
			request.getSession().removeAttribute("loginInfo");
			response.sendRedirect("index.jsp");
		}else if (path.contentEquals("/signup.member")) {
			
		}else if(path.contentEquals("/signup.member")) {
			try {
				int sigup = dao.insert(dto);
				if(sigup >0) {
					response.sendRedirect("../index.jsp");
				}else {
					response.sendRedirect("error.jsp");
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

