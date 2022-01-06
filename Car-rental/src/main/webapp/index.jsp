<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
@font-face {
  src: url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/142996/Anders.ttf');
  font-family: test;
}

.inner {
	position: absolute;
	top: 35%;
	left: 50%;
	transform: translate(-50%,-50%);
	font-size: 3rem;
	text-transform: uppercase;
  	font-family: test;
  	color: white;
  	cursor: pointer;
}
body {
        height: 100vh;
        background-image: url("https://t1.daumcdn.net/cfile/tistory/9956833359851E3324");
        background-repeat : no-repeat;
        background-size : cover;      
}


</style>
<title>index</title>
</head>
<body>
    <div class="inner">
    <h1 class="title" id="main">Green 렌터카</h1>
    </div>


	<script>
	document.querySelector('#main').addEventListener('click', e=>{
		location.href='service?command=main';
	});



	</script>
	
</body>
</html>