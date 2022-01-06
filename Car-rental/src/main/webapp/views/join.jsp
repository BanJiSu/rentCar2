<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
	span{white-space: pre}
	input[type="text"]{
        padding: 10px;
        border: solid 2px rgb(59, 170, 59);
	}
	
</style>
<title>join</title>
</head>
<body>
	<form method="get" action="service">
		<input type="hidden" name="command" value="join">
		<h1>회원가입</h1>
		<span>id:&#9;&#9;</span><input type="text" name="id">
		<button>중복체크</button>
		<br><br>
        <span>pw:&#9;&#9;</span><input type="text" name="pw"><br><br>
        <span>name:&#9;</span><input type="text" name="userName"><br><br>
        <span>전화번호:&#9;</span><input type="text" name="phone"><br><br>
        <input type="radio" name="license" value="1" onclick="checklicense(event)" />1종 면허
		<input type="radio" name="license" value="2" onclick="checklicense(event)" />2종 면허
		<input type="radio" name="license" value="3" onclick="checklicense(event)" checked/>면허 없음
		<input type="hidden" id="result">
        <input type="hidden" name="admin" value="1">
        <input type="submit" onclick="return joinCheck()" value="확인">
	</form>
	<button onclick="home()">처음으로</button>
	

	
	<script>
		function home() {
			location.href='index.jsp';
		}
		function joinCheck() {
			if (document.frm.name.value.length == 0) {
				alert("이름을 써주세요.");
				frm.name.focus();
				return false;
			}
			if (document.frm.userid.value.length == 0) {
				alert("아이디를 써주세요");
				frm.userid.focus();
				return false;
			}
			if (document.frm.userid.value.length < 4) {
				alert("아이디는 4글자이상이어야 합니다.");
				frm.userid.focus();
				return false;
			}
			if (document.frm.pwd.value == "") {
				alert("암호는 반드시 입력해야 합니다.");
				frm.pwd.focus();
				return false;
			}
			if (document.frm.pwd.value != document.frm.pwd_check.value) {
				alert("암호가 일치하지 않습니다.");
				frm.pwd.focus();
				return false;
			}
			if (document.frm.reid.value.length == 0) {
				alert("중복 체크를 하지 않았습니다.");
				frm.userid.focus();
				return false;
			}
			return true;
		}
		
		function checklicense(event) {
			  document.getElementById("result").innerText = event.target.value;
			  console.log(event.target.value);
		}
	</script>
	
</body>
</html>