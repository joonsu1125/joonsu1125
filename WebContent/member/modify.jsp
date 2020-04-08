<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
<link href="${conPath }/css/h3_btn.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
	$(document).ready(function() {
		$('input[value="탈퇴"]').click(function(){
			var mPw = $('input[name="mPw"]').val();
			location.href='${conPath}/memberDelete.do?mId=${member.mId }&mPw='+mPw;
		});
	});
</script>
</head>
<body>
	<c:if test="${not empty errorMsg }">
		<script>
			alert('${errorMsg}');
			history.go(-1);
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div id="content_form">
	<form action="${conPath }/modify.do" method="post">
	<input type="hidden" name="mMod" value="${member.mMod }">
		<h2>개인정보수정</h2>
		<hr>
		<table>
			<tr><th>아이디</th>
				<td><input type="text" name="mId" readonly="readonly" value="${member.mId }"></td>
			</tr>
			<tr><th>비밀번호</th>	
				<td><input type="password" name="mPw" required="required"></td>
			</tr>
			<tr><th>이름</th>
				<td><input type="text" name="mName" readonly="readonly" value="${member.mName }"></td>
			<tr><th>생년월일</th>
				<td><input type="date" name="mBirth" readonly="readonly" value="${member.mBirth }"></td>
			</tr>
			<tr><th>메일</th>
				<td><input type="text" name="mEmail" readonly="readonly" value="${member.mEmail }"></td>
			</tr>
			<tr><th>전화번호</th>
				<td><input type="text" name="mTel" readonly="readonly"  value="${member.mTel }"></td>
			</tr>
			<tr><th>주소</th>
				<td><input type="text" name="mAddress" readonly="readonly" value="${member.mAddress }"></td>
			</tr>
			<tr><td colspan="2">
						<input type="submit" value="정보수정" class="btn">
						<input type="reset" value="취소" class="btn">
						<input type="button" value="탈퇴" class="btn">
				</td>
		</table>
	</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>