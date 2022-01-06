<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header id="main">Green 렌터카</header>
	
	<nav>
		<input type="button" class="ListBtn" id="rental" value="렌트">
		<input type="button" class="ListBtn" id="main2" value="메인">
		<input type="button" class="ListBtn" id="login" value="로그인">
	</nav>
	
	
	<h1>커뮤니티</h1>
	
	
	<script>

	document.querySelector('#login').addEventListener('click', e=>{
		location.href='service?command=loginForm';
	});
	document.querySelector('#rental').addEventListener('click', e=>{
		location.href='service?command=rentalForm';
	});
	document.querySelector('#main').addEventListener('click', e=>{
		location.href='service?command=main';
	});
	document.querySelector('#main2').addEventListener('click', e=>{
		location.href='service?command=main';
	});
	
	</script>
</body>
</html>