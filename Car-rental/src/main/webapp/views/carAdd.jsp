<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <button onclick="location.href='adminMainPage.html'">뒤로가기</button>
    <form method="get" action="">
        <span>추가할 차량 이미지<input type="file" name="car_img" required></span><br><br>
        <span>추가할 차량명<input type="text" name="car_name" required></span><br><br>
        <span>추가할 차량 가격<input type="text" name="car_price" required></span><br><br>
        <span>추가할 차량 렌트 기간 <input type="number" name="car_rent_term_year" required>년 
            <input type="number" name="car_rent_term_month" required>개월
            <input type="number" name="car_rent_term_day" required>일</span><br><br>
        <span>추가할 차량 종류 
        <select name="car_type">
            <option value="경차">경차</option>
            <option value="중형차">중형차</option>
            <option value="SUV">SUV</option>
        </select></span><br><br>
        <span>추가할 차량 번호<input type="text" name="car_num" required></span><br><br>
        <input type="submit" value="추가">
    </form>
</body>
</html>