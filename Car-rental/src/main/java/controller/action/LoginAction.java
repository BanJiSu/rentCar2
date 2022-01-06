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
		
		// ���� ��(Model�� ����) -> ���� ����(url), ���� �������� �Ѱ��ָ�() ��
		UserDAO dao = UserDAO.getInstance();
		
		String url = "";
		if(dao.checkLogin(id,pw)) {
			url = "views/main.jsp";
		}
		else {
			url = "views/login.jsp";
		}
		
		// �����ĸ� ���� �����带 �ϸ� -> url�� ��ȭ�� ����
		// http://localhost:8084/login22-server-mvc2/login
		RequestDispatcher dispatcher = request.getRequestDispatcher(url); // set
		dispatcher.forward(request, response);
	}
}
