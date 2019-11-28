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
		String URI = request.getRequestURI(); 
		String ctxpath = request.getContextPath(); 
		String path = URI.substring(ctxpath.length()); 
		System.out.println(path);
		
		MemberDAO dao = MemberDAO.getInstance();
		
		
		if(path.contentEquals("/login.member")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			System.out.println(id);
			System.out.println(pw);
			
			try {
				boolean result = dao.loginOk(id, pw);
				if(result) {
					request.getSession().setAttribute("logininfo",id);
					response.sendRedirect("main.jsp");
					
				}else {
					response.sendRedirect("index.jsp");
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}//로그아웃
		else if (path.contentEquals("/logout.member")) {
			request.getSession().removeAttribute("loginInfo");
			response.sendRedirect("index.jsp");
		}//회원가입
		else if(path.contentEquals("/signUp.member")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String birth = request.getParameter("birth");
			String gender = request.getParameter("gender");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String postcode =request.getParameter("postcode");
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			String lovePet = request.getParameter("lovePet");
			String signPath = request.getParameter("signPath");
			
			System.out.println(id);
			
			MemberDTO dto = new MemberDTO(id,pw,name,birth,gender,email,phone,postcode,address1,address2,lovePet,signPath,null);
			try {
				int signup = dao.insert(dto);
				if(signup >0) {
					response.sendRedirect("index.jsp");
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

