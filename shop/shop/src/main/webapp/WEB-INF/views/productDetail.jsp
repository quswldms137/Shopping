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
.img {
    display: flex;
    flex-direction: column; /* 수직 정렬 */
    align-items: flex-start; 
    justify-content: flex-start; 
    border: 1px solid black; /* 테두리 스타일 및 두께 설정 */
    padding: 15px; /* 테두리와 내용 사이의 간격 설정 */
    width: 300px;
    height: 400px;
    text-align: center; /* 텍스트 가운데 정렬 */
}
.text {
    padding: 10px;
}
.text li{
	margin:10px;
}
.btn {
    display: flex;
    flex-direction: row; /* 수직 정렬 */
    align-items: center; /* 가로축 가운데 정렬 */
    justify-content: center; /* 세로축 가운데 정렬 */
}
.btn button{
	padding:10px;
	margin-top:30px;
	margin-left:45px;
}

</style>
</head>
<body>
<header>
	<%@ include file="header.jsp" %>
</header>
<session>
<hr>
<h2>상품상세정보</h2>
<br>
<div class="container">
	<div class="img">
		<img id="img-img" src="/images/${product.url }" alt="${product.pname }" width="300px" height="250px">
		<div class="text">
			<ul>
				<li>상품 이름 : ${product.pname }</li>
				<li>상품 가격 : ${product.price }원</li>
				<li>상품 수량 : ${product.stock }개</li>
				<li>상품 판매수 : ${product.sales }개</li>
			</ul>
		</div>
		<div class="btn">
			<a href="orderDo"><button>주문하기</button></a>
			<a href="cartDo"><button>장바구니담기</button></a>
		</div>
	</div>
</div>
</session>
</body>
</html>