<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container {
display: flex; /* 자식 요소들을 flexbox 레이아웃으로 설정하여 유연하게 배치하고 정렬할 수 있게 합니다 */
flex-wrap: wrap; /* 자식 요소들이 한 줄에 다 들어가지 않으면 다음 줄로 넘어가도록 합니다 */
justify-content: center; /* 세로축 가운데 정렬 */
flex-direction: row; /* 자식 요소들을 가로 방향(row)으로 배치합니다 */
padding: 10px; /* 컨테이너 안의 모든 면에 10픽셀의 패딩(안쪽 여백)을 추가합니다 */
}
.container-all {
display: flex; /* 자식 요소들을 flexbox 레이아웃으로 설정하여 유연하게 배치하고 정렬할 수 있게 합니다 */
flex-wrap: wrap; /* 자식 요소들이 한 줄에 다 들어가지 않으면 다음 줄로 넘어가도록 합니다 */
justify-content: center; /* 세로축 가운데 정렬 */
align-items: flex-start; 
flex-direction: row; /* 자식 요소들을 가로 방향(row)으로 배치합니다 */
padding: 10px; /* 컨테이너 안의 모든 면에 10픽셀의 패딩(안쪽 여백)을 추가합니다 */
}
h2{padding:10px;}
.hot, .new{
	width:88%;
}
.all{width:100%}
.img {
    display: flex;
    flex-direction:column; /* 수평 정렬 */
    align-items: center; /* 가로축 가운데 정렬 */
    justify-content: flex-start; 
    border-radius: 7px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 설정 */
    padding: 15px; /* 테두리와 내용 사이의 간격 설정 */
    margin: 10px; /* 각 이미지 간의 간격 설정 */
    width: 200px;
    height: 200px;
    text-align: center; /* 텍스트 가운데 정렬 */
}
.img:hover {
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4); /* hover 효과에 대한 그림자 설정 */
}
.img:nth-child(4n+1) {
    clear: left; /* 매 4번째 요소에서 줄 바꿈 */
}
#img-img{
	border-radius:7px;
}
</style>
</head>
<body>
<header>
	<%@ include file="header.jsp" %>
</header>
<session>
<hr>
<div class="container">
	<div class="hot"><인기상품👍></div>
	<c:forEach var="product" items="${product }">
	<div class="img">
		<img id="img-img" src="/images/${product.url }" alt="${product.pname }" width="190px" height="150px"><br>
		<a href="productDetail?pno=${product.pno }">${product.pname }</a>
	</div>
	</c:forEach>
</div>
<hr>
<div class="container">
	<div class="new"><신상품👀></div>
	<c:forEach var="product2" items="${product2 }">
	<div class="img">
		<img id="img-img" src="/images/${product2.url }" alt="${product2.pname }" width="190px" height="150px"><br>
		<a href="productDetail?pno=${product2.pno }">${product2.pname }</a>
	</div>
	</c:forEach>
</div>
<hr>
<div class="container-all">
	<div class="all"><전체상품></div>
	<c:forEach var="products" items="${products }">
	<div class="img">
		<img id="img-img" src="/images/${products.url }" alt="${products.pname }" width="190px" height="150px"><br>
		<a href="productDetail?pno=${products.pno }">${products.pname }</a>
	</div>
	</c:forEach>
</div>
</session>
</body>
</html>