<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
	span{white-space: pre}
	h1{
		color: rgb(59, 170, 59);
	}
	input[type="text"]{
        padding: 10px;
        border: solid 2px rgb(59, 170, 59);
	}
    input[type="button"]{
        cursor: pointer;
        padding: 10px;
        border: none;
        color: white;
        background-color: rgb(59, 170, 59);
    }
    

</style>
<title>login</title>
</head>
<body>
	<!-- MVC2로 로그인서버 완성해보기 -->
	<!-- url : login -> LoginPro.java(servlet) -->
	<form method="get" action="service">
	<input type="hidden" name="command" value="login">
		<h1>login</h1>
		<span>id:&#9;</span><input type="text" name="id"><br><br>
        <span>pw:&#9;</span><input type="text" name="pw"><br><br>
        <input type="submit" value="login">
	</form>
	<button onclick="newjoin()">회원가입</button>
	<button onclick="home()">처음으로</button>
	
	
	
	
	
	
	
	<script>
		function newjoin() {
			location.href='service?command=joinForm';
		}
		function home() {
			location.href='index.jsp';
		}
	</script>
</body>
</html>