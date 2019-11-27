package findwatson.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import findwatson.admin.dao.AdminDAO;
import findwatson.admin.dto.BanDTO;
import findwatson.admin.dto.MemberDTO;

@WebServlet("/AdminController")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getRequestURI().substring(request.getContextPath().length());
		AdminDAO dao = AdminDAO.getInstance();
		request.setCharacterEncoding("utf8");
		response.setContentType("text/html; charset=UTF-8");
		try {
			if(cmd.contentEquals("관리자 로그인")) {
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				boolean result = dao.adminLogin(id, pw);
				
				if(result) {
					request.getSession().setAttribute("id", id);
					request.setAttribute("result", result);
					//request.getRequestDispatcher("관리자 로그인 후 페이지").forward(request, response);
				}
				else {
					response.sendRedirect("관리자 로그인 실패 페이지");
				}
			}
			else if(cmd.contentEquals("관리자 비밀번호 변경")) {
				
			}
			else if(cmd.contentEquals("회원목록조회")) {
				List<MemberDTO> list = dao.selectAll();
				request.setAttribute("list", list);
				
			}
			else if(cmd.contentEquals("차단한ip목록")) {
				List<BanDTO> list = dao.selectBanList();
				request.setAttribute("list", list);
				
			}
			else if(cmd.contentEquals("아이디로 회원 검색")) {
				String id = request.getParameter("id");
				List<MemberDTO> list = dao.selectById(id);
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
