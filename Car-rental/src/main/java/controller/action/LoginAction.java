package controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UserDAO;

public class LoginAction implements Action{

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		System.out.println("id:" + id);
		System.out.println("pw:" + pw);
		
		// 검증 후(Model에 접근) -> 어디로 갈지(url), 다음 페이지로 넘겨주면() 됨
		UserDAO dao = UserDAO.getInstance();
		
		String url = "";
		if(dao.checkLogin(id,pw)) {
			url = "views/main.jsp";
		}
		else {
			url = "views/login.jsp";
		}
		
		// 디스패쳐를 통한 포워드를 하면 -> url의 변화가 없음
		// http://localhost:8084/login22-server-mvc2/login
		RequestDispatcher dispatcher = request.getRequestDispatcher(url); // set
		dispatcher.forward(request, response);
	}
}
