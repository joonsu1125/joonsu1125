<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#content_form #reviewList table{
	border-bottom: 1px solid #cccccc;
}
#content_form #reviewList table tr {
	overflow: hidden;
	margin: 0;
	padding: 5px;
}

#content_form #reviewList table  tr:nth-child(1) td:nth-child(1) {
	float: left;
	font-weight: bold;
	border-right: 2px solid #cccccc;
}

#content_form #reviewList table tr:nth-child(1) td:nth-child(2) {
	float: left;
}

#content_form #reviewList table tr:nth-child(2) td:nth-child(1) {
	float: left;
	font-size: 0.7em;
}
</style>
</head>
<body>
		<div id="reviewList">
			<c:if test="${totCnt!=0 }">
				<c:forEach items="${appendReviewList }" var="dto">
					<table>
						<tr>
							<td rowspan="2" class="left">${dto.mName }</td>
							<td rowspan="2" class="left">${dto.rContent }</td>
						</tr>
						<tr><td><fmt:formatDate value="${dto.rRdate }" pattern="YYYY.M.d"/> </td></tr>
					</table>
				</c:forEach>
			</c:if>
		</div>
</body>
</html>