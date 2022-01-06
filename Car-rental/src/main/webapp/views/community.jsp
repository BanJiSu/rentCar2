<%@page import="model.dao.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
	.ListBtn{
        cursor: pointer;
        padding: 10px;
        border: none;
        color: white;
        background-color: rgb(59, 170, 59);
        font-size: 20px;
        margin-right: 40px ;
    }
    
    nav{
    grid-area: nav;
    text-align: center;
    }
  
    
    td{
            width: 200px;
            text-align: center;
        }
        table{
            margin: auto;
        }
</style>
<title>Insert title here</title>
</head>
<body>
	<header id="main" onclick="main()">Green 렌터카</header>
	
	<nav>
		<input type="button" class="ListBtn" onclick="main()" value="메인">
		<input type="button" class="ListBtn" onclick="rental()" value="렌탈">
		
	</nav>
	
	
	<h1>게시판</h1>
	<%
		BoardDAO dao = BoardDAO.getInstance();
		dao.getBoard();
		
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
	<%
		for(int i=0; i<dao.getBoard().size(); i++){
			int no = dao.getBoard().get(i).getNo();
			String title = dao.getBoard().get(i).getTitle();
			String id = dao.getBoard().get(i).getId();
			int like = dao.getBoard().get(i).getLikes();
			Timestamp regDate = dao.getBoard().get(i).getRegDate();
			
	%>
            <tr>
                <td><a href="service?command=boardView&idx=<%=no %>">
                <%=no %></a></td>
                <td><a href="service?command=boardView&idx=<%=no %>">
                <%=title %></a></td>
                <td><%=id %></td>
                <td><%=like %></td>
                <td><%=regDate %></td>
            </tr>
	
	<% 
	}
	%>
        </table>
    </div>
    <button onclick="logout()">로그아웃</button>
	<button onclick="addBoard()">글쓰기</button>
	
	
	<script>

	document.querySelector('#login').addEventListener('click', e=>{
		location.href='service?command=loginForm';
	});
	document.querySelector('#community').addEventListener('click', e=>{
		location.href='service?command=communityForm';
	});
	document.querySelector('#main').addEventListener('click', e=>{
		location.href='service?command=main';
	});
	document.querySelector('#main2').addEventListener('click', e=>{
		location.href='service?command=main';
	});
	
	function main(){
		location.href='service?command=main';
	}
	function rental(){
		location.href='service?command=rentalForm';
	}
	
	function logout(){
		alert("로그아웃 완료");
		location.href='service?command=loginForm';
	}
	function addBoard(){
		location.href='_10_boardWrite.jsp';
	}
	
	</script>
</body>
</html>