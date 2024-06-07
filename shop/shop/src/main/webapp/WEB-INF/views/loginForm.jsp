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
align-items: center; 
}
.container form input[type="text"] {
width: 100px;  
height: 10px; 
padding: 10px; 
margin: 5px;
  }
.container form input[type="password"] {
width: 100px;  
height: 10px; 
padding: 10px;
margin: 5px; 
  }

</style>
</head>
<body>
<header>
	<%@ include file="header.jsp" %>
</header>
<session>
	<hr>
	<h2>로그인</h2>
	<div class="container">
	<form action="login" method="post">
		<input type="text" name="username" placeholder="아이디"><br>
		<input type="password" name="password" placeholder="비밀번호"><br>
		<input type="submit" value="로그인">
	</form>
	</div>
</session>

</body>
</html>