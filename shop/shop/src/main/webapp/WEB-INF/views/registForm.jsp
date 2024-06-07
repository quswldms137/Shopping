<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container, h2 {
display: flex;
justify-content: center;
align-items: center;
flex-direction: column; 
}
h2{padding:10px;}
.container form {
display: flex;
flex-direction: column;
align-items: flex-start;
}
.container form input[type="text"] {
width: 100px;  
height: 10px; 
padding: 10px;
margin: -5px; 
  }
.container form input[type="submit"] {
padding: 5px;
margin: -5px; 
  }
</style>
</head>
<body>
<header>
	<%@ include file="header.jsp" %>
</header>
<session>
<hr>
<h2>회원가입</h2>
<div class="container">
<form action="regist" method="post">
	<input type="text" name="username" placeholder="아이디"><br>
	<input type="text" name="password" placeholder="비밀번호"><br>
	<input type="text" name="name" placeholder="이름"><br>
	<input type="text" name="address" placeholder="주소"><br>
	<input type="text" name="tel" placeholder="전화번호"><br>
	<input type="hidden" name="role" value="M">
	<input type="submit" value="회원가입">
</form>
</div>
</session>
</body>
</html>