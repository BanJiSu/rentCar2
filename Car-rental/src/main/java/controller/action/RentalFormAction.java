package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RentalFormAction implements Action{

	@Override
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
		
		
		
		String url = "views/rental.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}


}
