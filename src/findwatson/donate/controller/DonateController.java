package findwatson.donate.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import findwatson.donate.dao.DonateDAO;
import findwatson.donate.dto.DonateDTO;


@WebServlet("*.do")
public class DonateController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = requestURI.substring(contextPath.length());
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("컨트롤러 : " + cmd);
		
		try {
			
			if(cmd.contentEquals("/donate.do")) {
				//결제 넘어가기 전에 결제 시도 정보 입력하기
				
				String userId = request.getParameter("dName");
				String phone = request.getParameter("dPhone");
				int support = Integer.parseInt(request.getParameter("support"));
				
				System.out.println(userId+";"+phone+";"+support);
				
				request.setAttribute("userId", userId);
				request.setAttribute("phone", phone);
				request.setAttribute("support", support);
				
				DonateDAO dao = DonateDAO.getInstance();
				
				//후원 고유 번호 부여하기
				String donateId = dao.getDonateId();
				request.setAttribute("dId", donateId);
				
				//결제 전 결제 정보 입력하기
				DonateDTO dto = new DonateDTO(donateId, support, 0, null, userId, phone, null, null, "F");
				int result = dao.setDonateInfo(dto);
				
				if(result > 0) {
					request.getRequestDispatcher("donate/ingDonateView.jsp").forward(request, response);
				}else {
					response.sendRedirect("donate/donateFailView");
				}
				
			}else if(cmd.contentEquals("/payComplete.do")) {
				//결제 성공시 검증
				String merchant_uid = request.getParameter("merchant_uid");
				String success = request.getParameter("success");
				
				if(success.contentEquals("true")) {
					
					
					int paid_amount = Integer.parseInt(request.getParameter("paid_amount"));
					
					DonateDAO dao = DonateDAO.getInstance();
					int result = dao.updatePass(merchant_uid, paid_amount);
					
					if(result > 1) {
						//정상적인 결제
						PrintWriter pw = response.getWriter();
						
						JsonObject obj = new JsonObject();
						obj.addProperty("result", true);
						String data = obj.toString();						
						
						System.out.println("정상결제 : " + data);
						pw.append(data);
						
						
					}else {
						//비정상적인 결제
						result = dao.realPayment(merchant_uid, paid_amount);
						
						PrintWriter pw = response.getWriter();
						
						JsonObject obj = new JsonObject();
						obj.addProperty("result", true);
						obj.addProperty("msg", "비정상적인 결제 시도입니다");
						String data = obj.toString();	
						
						pw.append(data);
					}
				}else {
					//중간 결제 취소
					//테이블에서 결제 시도 정보 삭제하기
					
					DonateDAO dao = DonateDAO.getInstance();
					dao.delDonateInfo(merchant_uid);	
				}
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
