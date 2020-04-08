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
	<jsp:include page="../main/header.jsp"/>
	<div id="content_form">
		<form action="${conPath }/freeBoardReply.do" method="post">
			<input type="hidden" name="mId" value="${member.mId }">
			<input type="hidden" name="bGroup" value="${freeBoard_reply_view.bGroup }">
			<input type="hidden" name="bStep" value="${freeBoard_reply_view.bStep }">
			<input type="hidden" name="bIndent" value="${freeBoard_reply_view.bIndent }">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<table>
				<tr>
					<td><input type="text" name="bTitle" placeholder="제목을 입력하여 주세요"></td>
				</tr>
				<tr>
					<td><textarea rows="5" cols="20" name="bContent" placeholder="내용을 입력하세요."></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="답변쓰기" class="btn">
						<input type="reset" value="취소" class="btn"> 
						<input type="button" value="목록" class="btn"
										onclick="location.href='${conPath}/freeBoardList.do'">
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>