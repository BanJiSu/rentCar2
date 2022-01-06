
<%@page import="model.dto.BoardDTO"%>
<%@page import="model.dao.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<style>
        td{
            width: 200px;
            text-align: center;
        }
		table{
            width: 70%;
            margin: auto;
        }
        textarea{
            width: 70%;
            height: 200px;
            margin-left: 15%;
        }
        tr{
            text-align: center;
        }
    </style>
<title>Insert title here</title>
</head>
<body>
	<h1>상세페이지</h1>
	<%
		BoardDAO dao = BoardDAO.getInstance();
		dao.getBoard();
		String idx = request.getParameter("idx");
		int num = Integer.parseInt(idx);
		
		int no = dao.getBoard().get(num-1).getNo();
		String id = dao.getBoard().get(num-1).getId();
		String pw = dao.getBoard().get(num-1).getPw();
		String title = dao.getBoard().get(num-1).getTitle();
		int like = dao.getBoard().get(num-1).getLikes()+1;
		Timestamp regDate = dao.getBoard().get(num-1).getRegDate();
		String content = dao.getBoard().get(num-1).getContent();
		
		BoardDTO dto2 = new BoardDTO(no, id, pw, title, content, like, regDate);
		dao.getBoardOfInfo(dto2);
	%>
	<div class="wrap">
		<table border="solid 1px" style="border-collapse: collapse;">
			<tr>
                <td>글번호</td>
                <td>제 목</td>
                <td>작성자</td>
                <td>조회수</td>
                <td>작성일</td>
            </tr>

			<tr>
                <td><%=no %></td>
                <td><%=title %></a></td>
                <td><%=id %></td>
                <td><%=like %></td>
                <td><%=regDate %></td>
            </tr>
		</table>
		<textarea><%=content %></textarea><br>
		<input type="hidden" name="num" id="num" value="num">
	</div>

	<td><a href="service?command=communityForm">글 목록</a></td>
	<td><a href="service?command=boardUpdate&idx=<%=no %>">글 수정</a></td>

</body>
</html>