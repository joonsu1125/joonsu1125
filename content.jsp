<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath}/css/productContent.css" rel="stylesheet">
<script  src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	$(document).ready(function() {
		$('tr').hover(function(){
			$(this).css('cursor', 'pointer');
		});
		$('tr').click(function() {
			var fNo = Number($(this).children(0).eq(0).text()); 
			if (!isNaN(fNo)) {
				location.href = '${conPath}/faq_content_view.do?fNo='+fNo+'&pageNum=${pageNum}';
			}
		});
	});
</script>
<style>
#content #content_bottom{
	width: 1200px;
}
#content #content_bottom table{
font-size: 12px;
margin: 0;
padding: 0;
color: #676767;
table-layout: fixed;
width: 1000px;
border-collapse: collapse;
border-top: 1px solid #a4a9b0;
border-bottom: 1px solid #ececec;
}
#content #content_bottom table thead{
font-size: 25px;
color: #676767;
border-collapse: collapse;
margin: 0;
padding: 0;
}
#content #content_bottom table tbody{
font-size: 18px;
color: #676767;
border-collapse: collapse;
margin: 0;
padding: 0;
}
#content #content_bottom tr:HOVER {cursor: pointer; }
#content #content_bottom td, #content #content_bottom th { text-align: center; padding: 5px; border-bottom: 1px solid #cccccc;}
#content #content_bottom th{
	background-color: #f5f5f5;
}
#content #content_bottom .left{text-align: left;}
</style>
</head>
<body>
	<div id="content">
		<div id="content_top">
		<div id="product_img">
			<div class="bigImage">
				<img src="http://gdimg.gmarket.co.kr/971829233/still/600?ver=1567658430"
						width="600" height="600" alt="상품이미지">
			</div>
			<div class="favoriteClick">
				<button>
					<img src="https://t4.ftcdn.net/jpg/02/05/18/21/240_F_205182152_z0fPFHyA9xM5U3UDAWhGIrd1G0HVt6zi.jpg" width="60" height="60" alt="상품이미지">
				</button>
				<span>5개</span>
			</div>
		</div>
		<div id="product_info">
			<div id="product_info_headline">
				<p>
					<a href=""> 입점상점 </a> <span>상품번호 : 971855654</span>
				</p>
				<hr>
				<br>
				<div class="itemcase_basic">
					<h1>[소다스쿨] 베이킹소다 대용량 3kg 2개</h1>
					<p>
						<span>
							<span>20,000원</span>
						</span><br>
						<strong>6,900원</strong>
					</p>
				</div>
			</div>
			<br>
			<div id="product_datainfo">
				<div id="product_nav">
					무료배송
				</div>
				<div id="product_certification">
					<span>인증정보</span>
					<br>
					<br>
					<span>본 상품은 국내배송만 가능합니다.</span>
				</div>
			</div>
			<div id="items_option_box">
				<select>
					<option>베이킹 소다 대용량 3Kg 2개 / 다양한 용도의 천연세제1</option>
					<option>베이킹 소다 대용량 1Kg 1개 / 다양한 용도의 천연세제2</option>
					<option>베이킹 소다 대용량 2Kg 2개 / 다양한 용도의 천연세제3</option>
					<option>카테고리4</option>
					<option>카테고리5</option>
				</select>
			</div>
			<div id="form_body">
				<div id="goods_option">
					<div id="origin_area">
						<h2>수량</h2>
						<div id="origin_amount">
							<span class="updwon_button">
								<input type="number" class="num" maxlength="3" value="1">
							</span>
						</div>
					</div>
				</div>
			</div>
			<div id="form_bottom">
				<div id="bottom_button">
					<button>장바구니</button>
					<button>구매하기</button>
				</div>
			</div>
		</div>
		</div>
		<div id="content_bottom">
			<div id="product_qna">
				<table>
				<thead>
					<tr>
						<th>번호</th><th>답변상태</th><th>제목</th><th>문의자</th><th>등록일</th>
					</tr>
				<thead>
				<tbody>
					<tr>
						<td>125</td><td>검토중</td><td class="left">상품이안와</td><td>javaMom</td><td>2020.04.16</td>
					</tr>
					<tr>
						<td>125</td><td>검토중</td><td class="left">상품이안와</td><td>javaMom</td><td>2020.04.16</td>
					</tr>
					<tr>
						<td>125</td><td>검토중</td><td class="left">상품이안와</td><td>javaMom</td><td>2020.04.16</td>
					</tr>
					<tr>
						<td>125</td><td>검토중</td><td class="left">상품이안와</td><td>javaMom</td><td>2020.04.16</td>
					</tr>
					<tr>
						<td>125</td><td>검토중</td><td class="left">상품이안와</td><td>javaMom</td><td>2020.04.16</td>
					</tr>
					<tr>
						<td>125</td><td>검토중</td><td class="left">상품이안와</td><td>javaMom</td><td>2020.04.16</td>
					</tr>
					<tr>
						<td>125</td><td>검토중</td><td class="left">상품이안와</td><td>javaMom</td><td>2020.04.16</td>
					</tr>
					<tr>
						<td>125</td><td>검토중</td><td class="left">상품이안와</td><td>javaMom</td><td>2020.04.16</td>
					</tr>
					<tr>
						<td>125</td><td>검토중</td><td class="left">상품이안와</td><td>javaMom</td><td>2020.04.16</td>
					</tr>
					<tr>
						<td>125</td><td>검토중</td><td class="left">상품이안와</td><td>javaMom</td><td>2020.04.16</td>
					</tr>
				</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>