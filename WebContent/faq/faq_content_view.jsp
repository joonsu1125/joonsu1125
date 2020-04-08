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
#content_form tr td span{text-align: left;}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_form">
		<form action="${conPath }/faq_modify_view.do" method="post">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<input type="hidden" name="fNo" value="${faq_content_view.fNo }">
			<h3>${faq_content_view.fTitle }</h3>
			<hr>
			<table>
				<tr>
					<td>
						<span>${faq_content_view.fContent }</span>
					</td>
				</tr>
				<c:if test="${empty member and not empty admin }">
					<tr>
						<td colspan="2">
							<input type="submit" value="수정" class="btn">
							<input type="button" value="삭제" class="btn" onclick="location='${conPath}/faqDlete.do?fNo=${faq_content_view.fNo }&pageNum=${param.pageNum }'">
							<input type="button" value="목록" class="btn"
								onclick="location='${conPath}/faqList.do?pageNum=${param.pageNum }'">
						</td>
					</tr>
				</c:if>
				<c:if test="${empty admin }">
					<tr>
						<td colspan="2">
							<input type="button" value="목록" class="btn"
							onclick="location.href='${conPath}/faqList.do'">
						</td>
					</tr>
				</c:if>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>