<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
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
	<h1>WRITE PAGE</h1>
	<form method="get" action="service">
	<input type="hidden" name="command" value="boardWrite">
        <table border="solid 1px" style="border-collapse: collapse;">
            <tr>  
                <td>제목</td>
                <td>작성자</td>
                <td>비밀번호</td> 
            </tr>
            <tr>
                <td><input type="text" name="title"></td>
                <td><input name="id" value=""></td>
                <td><input name="pw" type="password" value="" class="pw"></td>
            </tr>
            
        </table>
        <textarea name="content"></textarea><br>
        
        <input type="submit" value="작성완료">
    </form>
    	<button onclick="back()">뒤로가기</button>
    
    <script>
    	function back() {
    		location.href='service?command=communityForm';
		}
    </script>
</body>
</html>