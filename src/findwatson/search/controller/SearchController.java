package findwatson.search.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;

import findwatson.admin.dto.HospitalListDTO;
import findwatson.search.dao.HospitalListDAO;

@WebServlet("*.s")
public class SearchController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = requestURI.substring(contextPath.length());		
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("컨트롤러 : " + cmd);
		
		try {
			if(cmd.contentEquals("/selectGu.s")) {
				//지역 서울 선택시 해당하는 구 List 보내주기
				String city = request.getParameter("city");
				HospitalListDAO dao = HospitalListDAO.getInstance();
				List<String> result = dao.selectGu(city);
				
				response.setContentType("text/html; charset=UTF-8");
				response.setCharacterEncoding("UTF-8");
				
				JsonArray j = new JsonArray();
				for(String tmp:result) {
					j.add(tmp);
				}
				
				PrintWriter pw = response.getWriter();				
				pw.append(j.toString());  	
				
			}else if(cmd.contentEquals("/search.s")) {
				
			String input_city = request.getParameter("city");
			String input_gu = request.getParameter("gu");
			String input_dong = request.getParameter("dong");
			String input_medicalAnimal= request.getParameter("medicalAnimal");
			String input_medicalDept = request.getParameter("medicalDept");
			String input_infoRegist = request.getParameter("infoRegist");
			
			List<HospitalListDTO> list = new ArrayList<>();
			
			list = HospitalListDAO.getInstance().selectAll(input_city, input_gu, input_dong, input_medicalAnimal, input_medicalDept, input_infoRegist);
			request.setAttribute("list", list);
			request.getRequestDispatcher("index.jsp").forward(request, response);
			
		}
		}catch(Exception e) {
			e.printStackTrace();
		}

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
