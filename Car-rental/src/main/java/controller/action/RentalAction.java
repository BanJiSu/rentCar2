package controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UserDAO;

public class RentalAction implements Action{

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
String id = request.getParameter("id");
		
		String reserveDetail = request.getParameter("reserveDetail");
		String date1 = request.getParameter("date1");
		String date2 = request.getParameter("date2");
		String time1 = request.getParameter("time11");
		String time2 = request.getParameter("time22");
		String area = request.getParameter("area");
		
		System.out.println("id:" + id);
		System.out.println("date1:" + date1);
		System.out.println("date2:" + date2);
		System.out.println("time1:" + time1);
		System.out.println("time2:" + time2);
		System.out.println("area:" + area);
		
		
		// 검증 후(Model에 접근) -> 어디로 갈지(url), 다음 페이지로 넘겨주면() 됨
		UserDAO dao = UserDAO.getInstance();
		
		String url = "";
		/////////////////////////////////////////////////미완
		
		url = "views/pay.jsp";
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url); // set
		dispatcher.forward(request, response);
	}
}
