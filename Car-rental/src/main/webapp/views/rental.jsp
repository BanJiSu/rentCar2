<%@page import="model.dto.RentcarBean"%>
<%@page import="java.util.Vector"%>
<%@page import="model.dao.RentcarDao"%>
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
	
	<nav>
		<input type="button" class="ListBtn" id="main2" value="메인">
		<input type="button" class="ListBtn" id="community" value="커뮤니티">
		<input type="button" class="ListBtn" id="rental" value="렌트">
		<input type="button" class="ListBtn" id="login" value="로그인">
	</nav>
	<%
	RentcarDao rdao = RentcarDao.getInstance();
	
	Vector<RentcarBean> v = rdao.getSelectCar();
%>
	
	<table>
		<tr height="60">
		<td align="center" colspan="3">
			<font size="6" color="gray">최신형 자동차</font>
		</td>
		</tr>
		<tr height="240">
		<% for(int i=0; i<v.size(); i++){ 
			RentcarBean bean = v.get(i);
		%>
			<td width="333" align="center">
			<a href="service?command=carReserveInfo&no=<%= bean.getNo() %>">
				<img alt="" src="resources/img/<%=bean.getImg() %>" width="300" height="220">
			</a><p>
			차량명 : <%= bean.getName() %>
			</td>
		<%} %>	
		</tr>
	</table>
	
	<!-- ================================================== -->
	
	<hr size="3" color="red">
	<p>
	<font size="4" color="gray"><b>차량 검색 하기</b></font>
	
	<form method="get" action="service">
	<input type="hidden" name="command" value="carCategoryList">
		<font size="3" color="gray"><b>차량 검색 하기</b></font>&nbsp;&nbsp;
		<select name="category">
			<option value="1">소형</option>
			<option value="2">중형</option>
			<option value="3">대형</option>
		</select>
		<input type="submit" value="검색" />&nbsp;&nbsp;
	</form>
	
	<button onclick="location.href='service?command=carAllList'">전체 검색</button>
	
	
	</div>
	
	
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
	document.querySelector('#rental').addEventListener('click', e=>{
		location.href='service?command=rentalForm';
	});
	
	</script>
	
</body>
</html>