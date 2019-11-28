package findwatson.search.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;

import findwatson.admin.dto.HListDTO;
import findwatson.configuration.Configuration;
import findwatson.search.dao.HospitalListDAO;

@WebServlet("*.s")
public class SearchController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html; charset=UTF-8"); 
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = requestURI.substring(contextPath.length());

		System.out.println("컨트롤러 : " + cmd);

		try {
			HospitalListDAO dao = HospitalListDAO.getInstance();
			//지역 서울 선택시 해당하는 구 List 보내주기
			if(cmd.contentEquals("/selectGu.s")) {
				
				String city = request.getParameter("city");
				
				List<String> result = dao.selectGu(city);

				response.setContentType("text/html; charset=UTF-8");
				response.setCharacterEncoding("UTF-8");

				JsonArray j = new JsonArray();
				for(String tmp:result) {
					j.add(tmp);
				}

				PrintWriter pw = response.getWriter();				
				pw.append(j.toString());  	

			// 병원 검색 결과 출력
			}else if(cmd.contentEquals("/searchFrom.s")) {
				
				// 검색 결과 받아오는 부분 
				
				String address1 = request.getParameter("address1");			
				String address2 = request.getParameter("address2");

				if (address1.contentEquals("null") & !(address2.contentEquals("null"))) {
					address1 = "";
					System.out.println("1");
				}else if (address2.contentEquals("null") & !(address1.contentEquals("null"))){
					address2 = "";
					System.out.println("2");
				}else if (address1.contentEquals("null") & address2.contentEquals("null")) {
					address1 = "";
					address2 = "";
					System.out.println("3");
				}else {
					System.out.println("address 다 안나와");
				}

				System.out.println("시 : " + address1);
				System.out.println("구 : " + address2);
				
				String[] animal_check = request.getParameterValues("animal");
				String animal = Arrays.toString(animal_check).replace("{","").replace("}","").replace("[","").replace("]","").replace(", ",";");
				System.out.println(animal.contentEquals("null"));
				if(animal.contentEquals("null")) {
					animal = "";
				}
				System.out.println("animal : " + animal);

				String[] time_check = request.getParameterValues("time");
				//System.out.println(Arrays.toString(time_check));
				// NULL이 NULL이라는 문자열로 바뀌었다.. 
				String time = Arrays.toString(time_check).replace("{","").replace("}","").replace("[","").replace("]","").replace(", ",";");
				//System.out.println( time.equals("null"));
				if(time.contentEquals("null")) {
					time = "";
				}
				System.out.println("time : " + time);

			
				//for(HListDTO list2 : list) {
				//	System.out.println(list2);}
				
				// 네비게이터 받아오는 부분 
				int currentPage =1;
				String page = request.getParameter("currentPage");
				if(page != null) {
				currentPage = Integer.parseInt(page);
			}
			int start = currentPage * Configuration.recordCountPerPage - (Configuration.recordCountPerPage-1);
				int end = currentPage * Configuration.recordCountPerPage;
			
				List<HListDTO> list = new ArrayList<>();
				list = HospitalListDAO.getInstance().selectByPage("%"+address1+"%", "%"+address2+"%", "%"+animal+"%", "%"+time+"%",start, end);
				String navi = dao.getPageNavi(currentPage, "%"+address1+"%", "%"+address2+"%", "%"+animal+"%", "%"+time+"%");
				request.setAttribute("navi", navi);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/search/hospitalSearchView.jsp").forward(request, response);

			// 병원 이름 클릭하면 상세페이지 
			}else if(cmd.contentEquals("/contents.s")) {


					// 내용 전송 
					int seq = Integer.parseInt(request.getParameter("seq"));
					System.out.println(seq);
					HListDTO contents = HospitalListDAO.getInstance().select(seq);
					//System.out.println(contents.getTitle());
					//System.out.println(contents.getContents());
					
					HospitalListDAO.getInstance().plusss(contents.getViewCount(),seq);
					request.setAttribute("contents", contents);

					request.getRequestDispatcher("/search/hospitalSearchDetail_1.jsp").forward(request, response);
		
			
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
