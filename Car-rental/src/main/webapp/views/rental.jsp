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
    } 
    
    nav{
    grid-area: nav;
    text-align: center;
    }
    #rental{
    margin-right: 40px ;
    }
    #community{
    margin-right: 40px ;
    }
    #login{
    margin-right: 40px ;
    }
    #main2{
    margin-right: 40px ;
    }
</style>
<title>rental page</title>
</head>
<body>
	<header id="main">Green 렌터카</header>
	
	<%
		String date1 = request.getParameter("date1");
		String date2 = request.getParameter("date2");
		String time1 = request.getParameter("time11");
		String time2 = request.getParameter("time22");
		String area = request.getParameter("area");
	
	%>
	
	<nav>
		<input type="button" class="ListBtn" id="main2" value="메인">
		<input type="button" class="ListBtn" id="community" value="커뮤니티">
		<input type="button" class="ListBtn" id="login" value="로그인">
	</nav>
	<h1>렌탈</h1>
	
	<input type="button" value="소형" onclick="location.href='service?command=S_SortRent'">
	<input type="button" value="중형" onclick="location.href='service?command=M_SortRent'">
	<input type="button" value="대형" onclick="location.href='service?command=L_SortRent'">
	
	
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
	
	</script>
	
</body>
</html>