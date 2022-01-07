
<%@page import="model.dto.RentcarBean"%>
<%@page import="model.dao.RentcarDao"%>
<%@page import="java.util.Vector"%>

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
<title>Insert title here</title>
</head>
<body>
<nav>
		<input type="button" class="ListBtn" id="main2" value="메인">
		<input type="button" class="ListBtn" id="community" value="커뮤니티">
		<input type="button" class="ListBtn" id="rental" value="렌트">
		<input type="button" class="ListBtn" id="login" value="로그인">
	</nav>
<div align="center">
	<table>
		<tr height="60">
		<td align="center" colspan="3">
			<font size="6" color="gray">전체 렌트카 보기</font>
		</td>
		</tr>	
	<%
			RentcarDao rdao = RentcarDao.getInstance();
				
				Vector<RentcarBean> v = rdao.getAllCar();
				// tr을 3개씩 보여주고, 다시 tr을 실행할 수 있도록 하는 변수 선언
				int j = 0;
				for(int i=0; i<v.size(); i++){
			// 벡터에 저장되어 있는 bean클래스를 추출
			RentcarBean bean = v.get(i);
			
			
			if(j % 3 == 0){
		%>
		<tr height="220">
						
<%			} %>
		<td width="333" align="center">
			<a href="service?command=carReserveInfo&no=<%=bean.getNo()%>">
			<img alt="" src="resources/img/<%= bean.getImg()%>" width="300" height="200">
			</a><p>
			<font size="3" color="gray"><b>차량명 | <%=bean.getName() %></b></font>
		</td>
<%
		// j값을 증가하여 하나의 행에 총 3개의 차량 정보를 보여주기 위해서 증가
		j = j + 1;
		}
	%>
	</tr>
	</table>
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