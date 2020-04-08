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
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_form">
		<form action="${conPath }/freeBoard_modify_view.do" method="post">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<input type="hidden" name="bNo" value="${freeBoard_content_view.bNo }">
			<input type="hidden" name="bTitle" value="${freeBoard_content_view.bTitle }">
			<h3>${bContent_view.bTitle }</h3>
			<hr>
			<table>
				<tr>
					<td>
						<span>${freeBoard_content_view.bContent }</span>
					</td>
				</tr>
					<tr>
						<td colspan="2">
							<c:if test="${member.mId eq freeBoard_content_view.mId }">
								<input type="submit" value="수정" class="btn">
								<input type="button" value="삭제" class="btn" onclick="location='${conPath}/freeBoardDelete.do?bNo=${freeBoard_content_view.bNo }&pageNum=${param.pageNum }'">
							</c:if>
							<c:if test="${not empty member }">
									<input type="button" value="답글달기" class="btn" onclick="location='${conPath}/freeBoard_reply_view.do?bNo=${freeBoard_content_view.bNo }&pageNum=${param.pageNum }'">
							</c:if>
							<input type="button" value="목록" class="btn"
								onclick="location='${conPath}/freeBoardList.do?pageNum=${param.pageNum }'">
						</td>
					</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>