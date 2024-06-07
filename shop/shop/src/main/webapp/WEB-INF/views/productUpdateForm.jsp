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
.container form .form-group {
display: flex;
align-items: center; 
}
.container form .form-group label {
  margin-right: 10px;
  width: 100px; /* 레이블 폭 조정 */
  text-align: right;
}
.container form input[type="text"], input[tyoe="file"] {
width: 100px;  
height: 10px; 
padding: 10px; 
margin: 5px;
  }
.container form input[type="submit"] {
  margin-top: 20px;
  margin-left: 130px;
  padding: 10px 10px;
}
</style>
</head>
<body>
<header>
	<%@ include file="header.jsp" %>
</header>
<session>
<hr>
<h2>상품수정</h2>
<br>
<div class="container">
<form action="productUpdate" method="post">
	<input type="hidden" name="pno" value="${product.pno }">
	<div class="form-group">
		<label for="pname">상품이름</label>
		<input type="text" name="pname" value="${product.pname }"><br>
	</div>
	<div class="form-group">
		<label for="price">상품가격</label>
		<input type="text" name="price" value="${product.price }"><br>
	</div>
	<div class="form-group">	
		<label for="pitem">상품품목</label>
		<input type="text" name="pitem" value="${product.pitem }"><br>
	</div>
	<div class="form-group">	
		<label for="stock">상품수량</label>
		<input type="text" name="stock" value="${product.stock }"><br>
	</div>
	<div class="form-group">
		<label for="stock">상품판매수</label>
		<input type="text" name="sales" value="${product.sales }"><br>
	</div>
	<div class="form-group">
		<label for="url">상품이미지</label>
		<input type="file" name="url" ><br> <!-- 수정할 이미지 -->
	</div>
	<div>
		<input type="hidden" name="url2" value="${product.url }" ><br> <!-- 기존이미지 -->
	</div>
	<div class="form-group">
		<input type="submit" value="상품수정">	
	</div>
</form>
</div>
</session>
</body>
</html>