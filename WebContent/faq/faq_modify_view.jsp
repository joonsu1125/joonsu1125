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
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_form">
		<form action="${conPath }/faqModify.do" method="post">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<input type="hidden" name="fNo" value="${faq_modify_view.fNo }">
			<h2>Notice</h2>
			<hr>
			<table>
				<tr>
					<td>TITLE</td>
					<td><input type="text" name="fTitle" required="required" value="${faq_modify_view.fTitle }"
						size="30"></td>
				</tr>
				<tr>
					<td>CONTENT</td>
					<td><textarea name="fContent" rows="30" cols="30" >${faq_modify_view.fContent}</textarea>}</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="submit" value="공지사항 수정" class="btn">
						<input type="reset" value="취소" class="btn" onclick="locatiron.href='history.go(-1)'"> 
						<input type="button" value="목록" class="btn"
							onclick="location.href='${conPath}/faqList.do'">
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>