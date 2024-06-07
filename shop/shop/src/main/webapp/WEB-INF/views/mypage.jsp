<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
td {
padding: 15px; /* 셀 내부 패딩 설정 */
text-align: center; /* 텍스트 가운데 정렬 */
}

</style>
</head>
<body>
<header>
	<%@ include file="header.jsp" %>
</header>
<session>
<hr>
<h2>관리자페이지</h2>
<br>
<div class="container">
<a href="productRegistForm">상품등록</a>
<table border="1">
	<tr>
		<th>품번</th>
		<th>제품명</th>
		<th>가격</th>
		<th>품목</th>
		<th>재고수량</th>
		<th>판매수량</th>
		<th>판매등록일</th>
		<th>수정</th>
		<th>삭제</th>
	</tr>
	<c:forEach var="product" items="${product }">
	<tr>
		<td>${product.pno }</td>
		<td>${product.pname }</td>
		<td>${product.price }</td>
		<td>${product.pitem }</td>
		<td>${product.stock }</td>
		<td>${product.sales }</td>
		<td>${product.saleregdate }</td>
		<td><a href="productUpdateForm?pno=${product.pno }">수정</a></td>
		<td><a href="productDelete?pno=${product.pno }">삭제</a></td>
	</tr>
	</c:forEach>
</table>
</div>
</session>
</body>
</html>