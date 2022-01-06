package controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UserDAO;
import model.dto.UserDTO;

public class JoinAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String userName = request.getParameter("userName");
		
		System.out.println("id: " + id);
		System.out.println("pw: " + pw);
		System.out.println("userName: " + userName);
		
		UserDAO dao = UserDAO.getInstance();
		
		UserDTO dto = new UserDTO(id, pw);
		dao.addUser(dto);
		
		String url = "";
		if(dao.addUser(dto) != -1) {
			url = "views/main.jsp";
		}
		else {
			url = "views/login.jsp";
		}
		
//		if(dao.checkLogin(id,pw)) {
//			url = "views/main.jsp";
//		}
//		else {
//			url = "views/login.jsp";
//		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url); 
		dispatcher.forward(request, response);
	}

}
