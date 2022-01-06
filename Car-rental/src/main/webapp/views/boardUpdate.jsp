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
        span{
            white-space: pre;
        }
    </style>
<title>Insert title here</title>
</head>
<body>
	<h1>Update</h1>
	<%
		request.setCharacterEncoding("utf-8");

		BoardDAO dao = BoardDAO.getInstance();
		dao.getBoard();
		String idx = request.getParameter("idx");
		int num = Integer.parseInt(idx);
		
		int no = dao.getBoard().get(num-1).getNo();
		String title = dao.getBoard().get(num-1).getTitle();
		String id = dao.getBoard().get(num-1).getId();
		String pw = dao.getBoard().get(num-1).getPw();
		Timestamp regDate = dao.getBoard().get(num-1).getRegDate();
		String content = dao.getBoard().get(num-1).getContent();
		
	%>
        
		<form method="post" action="" name="myForm">
        <table border="solid 1px" style="border-collapse: collapse;">
            <tr>  
                <td>글번호</td>
                <td>제 목</td>
                <td>작성자</td>
                <td>비밀번호</td>
            </tr>
            <tr>
                <td><%=no %></td>
                <td><input name="title2" value=<%=title %>></td>
                <td><input name="id2" value=<%=id %>></td>
                <td><input name="pw2" ></td>
                
            </tr>
            
        </table>
        <textarea name="content2" ><%=content %></textarea><br>
        
        <input type="button" value="수정하기" onclick="checkUp()">
        <input type="button" value="삭제하기" onclick="delboard()">
        <input type="button" value="취소" onclick="back()">
    </form>
    <script>
    	function checkUp() {
			f = document.myForm;
			
			str = f.title2.value;
			str = str.trim();
			if(!str){
				alert("제목을 입력하세요");
				f.title2.focus();
				return;
			}
			
			str = f.pw2.value;
			str = str.trim();
			if(!str){
				alert("비밀번호를 입력하세요");
				f.pw2.focus();
				return;
			}
			f.pw2.value = str;
			var temp = '<%=pw %>';
			if(str != temp){
				alert("비밀번호를 다시입력하세요");
				f.pw2.focus();
				return;
			}
			f.action = "_14_boardUpdatePro.jsp?idx=<%=no %>";
			f.submit();
		}
    	
    	function delboard() {
			f = document.myForm;
			
			str = f.pw2.value;
			str = str.trim();
			if(!str){
				alert("비밀번호를 입력하세요");
				f.pw2.focus();
				return;
			}
			f.pw2.value = str;
			var temp = '<%=pw %>';
			if(str != temp){
				alert("비밀번호를 다시입력하세요");
				f.pw2.focus();
				return;
			}
			f.action = "_15_boardDeletePro.jsp?idx=<%=no %>";
			f.submit();
		}
    	function back() {
    		location.href='service?command=communityForm';
		}
    
    </script>
    
</body>
</html>