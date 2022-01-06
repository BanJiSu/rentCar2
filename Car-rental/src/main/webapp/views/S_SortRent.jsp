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

<h1>소형</h1>
	<button type="button" id ="option1"onclick="$('.css_test').toggle(1000, 'easeInOutBack')">눌러보세용</button>

	<div class="css_test" style="display:none">
		<img
			src=data:image/jpeg;base64,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
			height="150px" width="300px" alt="모닝">
		<span>모닝 </span>
		<span>1050만원</span>
   		<ul class="option">
   			<li class="left-side">
   				<div>상세옵션</div>
   				<div>5인승, 오토</div>
   			</li>
   			<li class="right-side">
   				<div>프레스티지2.2(D)</div>
   				<div>CARNIVAL KA4(D) 2.2프레스티지 9인승</div>
   			</li>
   		</ul>
	</div>
</body>
</html>