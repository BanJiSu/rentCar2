
<%@page import="model.dto.RentcarBean"%>
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
<title>10_carReserveInfo</title>
</head>
<body>
	<%
		int no = Integer.parseInt(request.getParameter("no"));

			// 데이터베이스에 접근
			RentcarDao rdao = RentcarDao.getInstance();

			// 렌트카 하나에 대한 정보를 얻어옴
			RentcarBean bean = rdao.getOneCar(no);

			int category = bean.getCategory();
			String temp = "";
			if (category == 1)
		temp = "소형";
			else if (category == 2)
		temp = "중형";
			else if (category == 3)
		temp = "대형";
	%>
	<nav>
		<input type="button" class="ListBtn" id="main2" value="메인">
		<input type="button" class="ListBtn" id="community" value="커뮤니티">
		<input type="button" class="ListBtn" id="rental" value="렌트">
		<input type="button" class="ListBtn" id="login" value="로그인">
	</nav>

	<div align="center">

		<form action="11_carOptionSelect.jsp"
			method="post">

			<table>
				<tr height="100">
					<td align="center" colspan="3"><font size="6" color="gray">
							<%=bean.getName()%> 차량 선택
					</font></td>
				</tr>
				<tr>
					<td rowspan="6" width="500" align="center"><img alt=""
						src="resources/img/<%=bean.getImg()%>" width="450"></td>
					<td width="250" align="center">차량이름</td>
					<td width="250" align="center"><%=bean.getName()%></td>
				</tr>
				<tr>
					<td width="250" align="center">차량수량</td>
					<td width="250" align="center"><select name="qty">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
					</select></td>
				</tr>
				<tr>
					<td width="250" align="center">차량분류</td>
					<td width="250" align="center"><%=temp%></td>
				</tr>
				<tr>
					<td width="250" align="center">대여가격</td>
					<td width="250" align="center"><%=bean.getPrice()%>원</td>
				</tr>
				<tr>
					<td width="250" align="center">제조회사</td>
					<td width="250" align="center"><%=bean.getCompany()%></td>
				</tr>
				<tr>
					<td width="250" align="center">
						<%-- 이전 차량에 관한 정보 --%> <input type="hidden" name="no"
						value="<%=bean.getNo()%>" /> <input type="hidden" name="img"
						value="<%=bean.getImg()%>" /> <input type="submit"
						value="옵션선택후 구매하기" />
					</td>
				</tr>
			</table>

			<br />
			<br />
			<br /> <font size="5" color="gray">차랑 정보 보기</font>
			<p>
				<%= bean.getInfo() %>
		</form>



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