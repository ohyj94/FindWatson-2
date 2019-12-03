package findwatson.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import findwatson.member.dao.MemberDAO;
import findwatson.member.dto.MemberDTO;


@WebServlet("*.member")
public class memberController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String URI = request.getRequestURI(); 
		String ctxpath = request.getContextPath(); 
		String path = URI.substring(ctxpath.length()); 
		String ipAddr = request.getRemoteAddr();
		System.out.println(path);

		MemberDAO dao = MemberDAO.getInstance();
		PrintWriter pwriter = response.getWriter();

		if(path.contentEquals("/login.member")) { //로그인
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");

			try {
				boolean result = dao.loginOk(id, pw);
				
				if(result) {
					request.getSession().setAttribute("loginInfo",id);
					//아이피 주소 membertable에 업데이트
					dao.updateMemberIp(id, ipAddr);					
				}
request.setAttribute("result", result);
				
				request.getRequestDispatcher("member/loginResultView.jsp").forward(request, response);;
				
			} catch (Exception e) {
				e.printStackTrace();
			}

		}//로그아웃
		else if (path.contentEquals("/logout.member")) {
			request.getSession().invalidate();
			response.sendRedirect("member/logoutView.jsp");
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
			if(lovePet.contentEquals("on")) {
				lovePet = request.getParameter("otherAnimal");
				System.out.println("기타 관심동물-------"+lovePet);
			}
			String signPath = request.getParameter("signPath");
			if(signPath.contentEquals("on")) {
				signPath = request.getParameter("otherSignPath");
				System.out.println("기타 가입경로----------"+signPath);
			}
			System.out.println(id);

			MemberDTO dto = new MemberDTO(id,pw,name,birth,gender,email,phone,postcode,address1,address2,lovePet,signPath, null,ipAddr);
			try {
				int signup = dao.insert(dto);

				request.setAttribute("result", signup);
				request.getRequestDispatcher("member/signupResultView.jsp").forward(request, response);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}//회원탈퇴
		else if(path.contentEquals("/mypageWithdrawal.member")) {
			String id = (String)request.getSession().getAttribute("loginInfo");
			System.out.println(id);
			try {
				int memberout = dao.delete(id);
				if(memberout > 0) {
					request.getSession().invalidate();
				}

				request.setAttribute("result", memberout);
				RequestDispatcher rd = request.getRequestDispatcher("member/memberOutView.jsp");
				rd.forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

		}//마이페이지
		else if(path.contentEquals("/mypageInfo.member")) {
			String id = (String)request.getSession().getAttribute("loginInfo");
			try {
				MemberDTO dto = dao.selectMyInfo(id);
				request.setAttribute("dto", dto);
				request.getRequestDispatcher("member/mypageInfo.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("main/error.jsp");
			}
		}//1:1문의 글쓰기
		else if(path.contentEquals("/mypageOneByOne.member")) {
			String id = (String)request.getSession().getAttribute("loginInfo");
			try {
				request.setAttribute("id", id);
				request.getRequestDispatcher("member/mypageOneByOne.jsp").forward(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("main/error.jsp");
			}
		}else if(path.contentEquals("/onebyoneInsert.member")) {
			String id = (String)request.getSession().getAttribute("loginInfo");
			
			
		}//정보인포->정보수정으로 이동
		else if(path.contentEquals("/InfoModify.member")) {
			try{String id = request.getParameter("id");
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
			//dto에 담아서 수정페이지로 보내기
			MemberDTO dto = new MemberDTO(id,pw,name,birth,gender,email,phone,postcode,address1,address2,lovePet,signPath,null,"--");
			request.setAttribute("dto", dto);
			System.out.println(id);
			request.getRequestDispatcher("member/mypageModify.jsp").forward(request, response);
			}catch(Exception e) {
				response.sendRedirect("main/error.jsp");
			}
		}//정보수정
		else if(path.contentEquals("/mypageModify.member")) {
			System.out.println("10");
			try {String id = request.getParameter("id");
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

			int modify = dao.modify(pw, name, birth, gender, email, phone, postcode, address1, address2, lovePet, id);
			request.setAttribute("modify", modify);	
			request.getRequestDispatcher("mypageInfo.member").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("main/error.jsp");
			}
		}
		else if(path.contentEquals("/duplCheck.member")) {
			try {
				String id = request.getParameter("id");
				System.out.println(id);
				boolean idCheck = dao.idCheck(id);
				System.out.println(idCheck);
				JsonObject jobj = new JsonObject();
				jobj.addProperty("result", idCheck);
				System.out.println(jobj);
				pwriter.append(jobj.toString());

			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("main/error.jsp");
			}

		}//아이디찾기
		else if(path.contentEquals("/idFind.member")) {
			
			
			try {
				String name = request.getParameter("name");
				String birth = request.getParameter("birth");
				String email = request.getParameter("email");
				int phone = Integer.parseInt(request.getParameter("phone"));
				boolean list = dao.idFind(name, birth, email, phone);
				if(list) {
					request.setAttribute("list", list);
					request.getRequestDispatcher("member/viewIdFind.jsp").forward(request, response);
				}else {
					response.sendRedirect("main/error.jsp");
				}
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("main/error.jsp");
			}
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}

