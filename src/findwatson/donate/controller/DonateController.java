package findwatson.donate.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import findwatson.donate.dao.DonateDAO;
import findwatson.donate.dto.DonateDTO;


@WebServlet("*.do")
public class DonateController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = requestURI.substring(contextPath.length());
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		System.out.println("컨트롤러 : " + cmd);
		
		try {
			
			if(cmd.contentEquals("/donate.do")) {
				//결제 넘어가기 전에 결제 시도 정보 입력하기
				int support = Integer.parseInt(request.getParameter("support"));
				
				//이 부분 로그인 연동 후 다시 확인하기
				String userId = (String)request.getSession().getAttribute("userId");
				if(userId.contentEquals("null")) {
					userId = "비회원 후원자";
				}
				System.out.println(userId);
				String name = request.getParameter("name");
				
				String birth = request.getParameter("birth");
				String phone = request.getParameter("phone");
				String email = request.getParameter("email");
				String postcode = request.getParameter("postcode");
				String addr1 = request.getParameter("addr1");
				String addr2 = request.getParameter("addr2");
				String payMethod = request.getParameter("payMethod");
				

				//후원 고유 번호 부여하기
				DonateDAO dao = DonateDAO.getInstance();
				String donateId = dao.getDonateId();
				request.setAttribute("dId", donateId);
				
				//결제 전 결제 정보 입력, request에 담기
				DonateDTO dto = new DonateDTO(donateId, userId, name, support, 0, payMethod, email, birth, postcode, addr1, addr2, phone, "F");
				int result = dao.setDonateInfo(dto);
				
				
				if(result > 0) {
					request.setAttribute("dto", dto);
					request.getRequestDispatcher("donate/ingDonateView.jsp").forward(request, response);
				}else {
					response.sendRedirect("donate/donateFailView");
				}
				
			}else if(cmd.contentEquals("/payComplete.do")) {
				//결제 성공시 검증
				String merchant_uid = request.getParameter("merchant_uid");
				String success = request.getParameter("success");
				String name = request.getParameter("name");
				
				if(success.contentEquals("true")) {
					int paid_amount = Integer.parseInt(request.getParameter("paid_amount"));
					DonateDAO dao = DonateDAO.getInstance();
					int result = dao.updateRealPay(merchant_uid, paid_amount);
					result = dao.updateValid(merchant_uid);

					
						PrintWriter pw = response.getWriter();
						
						JsonObject obj = new JsonObject();
						obj.addProperty("name", name);
						obj.addProperty("id", merchant_uid);
						String data = obj.toString();						
						
						pw.append(data);
						
				}else {
					//중간 결제 취소
					//테이블에서 결제 시도 정보 삭제하기
					
					DonateDAO dao = DonateDAO.getInstance();
					dao.delDonateInfo(merchant_uid);	
					PrintWriter pw = response.getWriter();
					pw.append("0");
				}
			}else if(cmd.contentEquals("/toSuccessView.do")) {
				String name = request.getParameter("name");
				String donateId = request.getParameter("id");
				
				DonateDAO dao = DonateDAO.getInstance();
				int realPay = dao.selectRealPay(donateId, name);
				
				request.setAttribute("paid", realPay);
				request.getRequestDispatcher("donate/donatePassView.jsp").forward(request, response);
				
			}//내 후원 보기+
			else if(cmd.contentEquals("/mypageDonation.do")) {
				DonateDAO dao = DonateDAO.getInstance();
				String userId =(String) request.getSession().getAttribute("loginInfo");
				List<DonateDTO> list = dao.selectMy(userId);
				System.out.println(list.size());
				request.setAttribute("result", list);
				request.getRequestDispatcher("member/mypageDonation.jsp").forward(request, response);;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
