<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  $("#option1").click(function(){
    $(".css_test").toggle();
  });
});
</script>

<style type="text/css">
    .css_test {
        border-radius : 5px;
        border : 5px solid gray;
        box-shadow : 0 0 5px silver;
        padding : 20px;
    }
</style>

<title>Insert title here</title>
</head>
<body>
<h1>대형</h1>
	<button type="button" id ="option1"onclick="$('.css_test').toggle(1000, 'easeInOutBack')">눌러보세용</button>

	<div class="css_test" style="display:none">
		<img
			src="https://www.lotterentacar.net/atch/getImage.do?atchFileId=FILE0000000000717288"
			height="150px" width="300px" alt="카니발">
		<span>카니발 </span>
		<span>3500만원</span>
   		<ul class="option">
   			<li class="left-side">
   				<div>상세옵션</div>
   				<div>9인승, 오토</div>
   			</li>
   			<li class="right-side">
   				<div>프레스티지2.2(D)</div>
   				<div>CARNIVAL KA4(D) 2.2프레스티지 9인승</div>
   			</li>
   		</ul>
	</div>
</body>
</html>