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
<link href="${conPath }/css/style.css" rel="stylesheet">
<link href="${conPath }/css/h3_btn.css" rel="stylesheet">
<style>
#content_form table th {
	border-bottom: 2px solid #F5A9BC;
	margin: 0;
	height: 40px;
}

#content_form table tr td {
	border-bottom: 1px solid #cccccc;
}
</style>
</head>
<body>

	<c:if test="${not empty errorMsg }">
		<script>
			alert('${errorMsg}');
			history.go(-1);
		</script>
	</c:if>
	<c:if test="${not empty adminResult && empty errorMsg }">
		<script>
			alert('${adminResult}');
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp" />
	<div id="content_form">
		<h2>회원목록</h2>
		<table>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일</th>
			</tr>
			<c:if test="${totCnt==0 }">
				<tr>
					<td colspan="7">등록된 회원이 없습니다</td>
				</tr>
			</c:if>
			<c:forEach var="member" items="${members }">
				<tr>
					<td>${member.mId }</td>
					<td>${member.mName }</td>
					<td>${member.mBirth }</td>
					<td>${member.mEmail }</td>
					<td>${member.mTel }</td>
					<td class="left">${member.mAddress }</td>
					<td>${member.mRdate }</td>
				</tr>
			</c:forEach>
		</table>
		<div class="paging">
			<c:if test="${startPage >BLOCKSIZE}">
				[ <a href="${conPath }/memberList.do?pageNum=${startPage - 1}">이전
				</a> ]
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i == pageNum }">
					<b> [ ${i } ] </b>
				</c:if>
				<c:if test="${i != pageNum }">
					[ <a href="${conPath }/memberList.do?pageNum=${i}"> ${i } </a> ]
				</c:if>
			</c:forEach>
			<c:if test="${endPage<pageCnt }">
		  		[ <a href="${conPath }/memberList.do?pageNum=${endPage + 1}">다음
				</a> ]
			</c:if>
		</div>
		<div>&nbsp;&nbsp;&nbsp;</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
