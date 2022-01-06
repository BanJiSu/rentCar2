<%@page import="model.dto.UserDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<!-- jquery -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

<!-- timepicker -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

<!-- css -->
<link rel="stylesheet" type="text/css" href="resources/css/Main.css">

<title>main page</title>
</head>
<body>

<%
	UserDAO dao = UserDAO.getInstance();
	ArrayList<UserDTO> datas = dao.getUsers();
	
	for(int i=0; i<datas.size(); i++){
		UserDTO user = datas.get(i);
		System.out.println(user.toString());
	}

%>
	<header id="main">Green 렌터카</header>
	
	
	<nav>
		<input type="button" class="ListBtn" id="rental" value="렌트">
		<input type="button" class="ListBtn" id="community" value="커뮤니티">
		<input type="button" class="ListBtn" id="login" value="로그인">
	</nav>

 <div class="wrap">
	<br>
	<%
	String id = request.getParameter("id");	
	%>
	<span><%=(id == null)? "게스트" : id %>님 환영합니다.</span>
	
	<main class="testmain">
	<section class="sec1">
	<div class="calendar">
		<div class="header">
		<button class="calendar_btn" onclick="prevCal();">&lt;</button>
		<div class="title"><span class="year"></span><span class="month"></span></div>
		<button class="calendar_btn" onclick="nextCal();">&gt;</button>
	</div>
	<div class="day">
		<div>일</div>
		<div>월</div>
		<div>화</div>
		<div>수</div>
		<div>목</div>
		<div>금</div>
		<div>토</div>
	</div>
	<div class="dates"></div>
</div>
<input type="text" id="period_1" required size="10"> ~ <input type="text" id="period_2" required size="10">
</section>
<section class="sec2">
<ul id="menu">
<li class="ui-state-disabled"><div>지역선택</div></li>
	<li class="area1"><div>서울</div>
  		<ul>
  			<li><div>가신디지털</div></li>
  			<li><div>광명</div></li>
  			<li><div>성동</div></li>
  			<li><div>노현</div></li>
    		<li><div>종로</div></li>
    		<li><div>관악</div></li>
    		<li><div>구로디지털</div></li>
    	</ul>
	</li>
  	<li class="area2"><div>인천/경기</div>
	  	<ul>
	      	<li><div>강릉</div></li>
  			<li><div>부천</div></li>
  			<li><div>성남</div></li>
  			<li><div>분당</div></li>
    		<li><div>수원</div></li>
    		<li><div>부평</div></li>
    		<li><div>간석</div></li>
	    </ul>
    </li>
  	<li class="area3"><div>충청/대전/세종</div>
    	<ul>
	      	<li><div>대전</div></li>
  			<li><div>유성</div></li>
  			<li><div>세종</div></li>
  			<li><div>오송역</div></li>
    		<li><div>논산역</div></li>
    		<li><div>서산</div></li>
    		<li><div>천안</div></li>
	    </ul>
  	</li>
  	<li class="area4"><div>전라/광주</div>
    	<ul>
	      	<li><div>군산</div></li>
  			<li><div>나주역</div></li>
  			<li><div>전남대</div></li>
  			<li><div>장성역</div></li>
    		<li><div>목포역</div></li>
    		<li><div>순천</div></li>
    		<li><div>여수</div></li>
	    </ul>
  	</li>
  	<li class="area5"><div>경상/대구/부산</div>
    	<ul>
	      	<li><div>구미</div></li>
  			<li><div>김천역</div></li>
  			<li><div>대구역</div></li>
  			<li><div>부산역</div></li>
    		<li><div>울산공항</div></li>
    		<li><div>진주</div></li>
    		<li><div>창원</div></li>
	    </ul>
  	</li>
  </ul>
  <br><br>
  <input type="text" id="areaChoise" required size="10" value="전 지역">
  </section>
  <section class="sec3">
<label for="time">시간 선택</label>
<input type="text" class="choise" name="time1" id="time1" value="" placeholder="대여시간" required size="13" maxlength="5"> ~
<input type="text" class="choise" name="time2" id="time2" value="" placeholder="반납시간" required size="13" maxlength="5">

<button class="allChoise" onclick="choise()">확인</button>
</section>

</div>
</main>

  <section class="sec4">
  <div class="reserve">
  	<h2>예약내역</h2>
  </div>
 </section>
  
  	                
  <form method="get" action="service">
		<input type="hidden" name="command" value="rentalForm">
		<input type="hidden" name="id" value=<%=id %>>
		<input type="text" id="reserveDetail" required size="40" name="reserveDetail">
		<input type="hidden" id="date1" name="date1" >
		<input type="hidden" id="date2" name="date2" >
		<input type="hidden" id="time11" name="time11" >
		<input type="hidden" id="time22" name="time22" >
		<input type="hidden" id="area" name="area" >
        <input type="submit" value="차량검색">
	</form>

	
<script src="resources/js/Main.js"></script>

</body>

</html>