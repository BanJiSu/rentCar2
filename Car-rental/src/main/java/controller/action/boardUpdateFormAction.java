package controller.action;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.BoardDAO;
import model.dto.BoardDTO;

public class boardUpdateFormAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
//		request.setCharacterEncoding("utf-8");

		BoardDAO dao = BoardDAO.getInstance();
		dao.getBoard();
		String idx = request.getParameter("idx");
		int num = Integer.parseInt(idx);
		
		int no = dao.getBoard().get(num-1).getNo();
		String title = request.getParameter("title2");
		String id = request.getParameter("id2");
		String pw = dao.getBoard().get(num-1).getPw();
		Timestamp regDate = dao.getBoard().get(num-1).getRegDate();
		String content = request.getParameter("content2");
		int like = dao.getBoard().get(num-1).getLikes();
		
		BoardDTO dto = new BoardDTO(no, id, pw, title, content, like, regDate);
		
		dao.updateData(dto);

		String url = "";
		if(dao.updateData(dto) != 0) {
			url = "views/community.jsp";
		}
		else {
			url = "views/boardUpdate.jsp";
		}
		


		RequestDispatcher dispatcher = request.getRequestDispatcher(url); 
		dispatcher.forward(request, response);
	}



}
