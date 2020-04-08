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
#content_form table th{
	border-bottom:2px solid #F5A9BC;
	margin: 0; 
	height: 40px;
}
#content_form table tr td{
	border-bottom: 1px solid #cccccc;
}
#content_form .paging b{
	color: black;
}
</style>
<script  src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	$(document).ready(function() {
		$('tr').hover(function(){
			$(this).css('cursor', 'pointer');
		});
		$('tr').click(function() {
			var bNo = Number($(this).children(0).eq(0).text()); 
				if (!isNaN(bNo)) {
					location.href = '${conPath}/freeBoard_content_view.do?bNo='+bNo+'&pageNum=${pageNum}';
				}
		});
	});
</script>
</head>
<body>
	<c:if test="${not empty errorMsg}">
		<script>
			alert('${errorMsg}');
			history.back();
		</script>
	</c:if>
		<c:if test="${not empty freeBoardDeleteResult }">
		<script>
			alert('${freeBoardDeleteResult}');
		</script>
	</c:if>
	<c:if test="${not empty freeBoardWriteResult }">
		<script>
			alert('${freeBoardWriteResult}');
		</script>
	</c:if>
	<c:if test="${not empty freeBoardReplyResult}">
		<script>
			alert('${freeBoardReplyResult}');
		</script>
	</c:if>
	<c:if test="${not empty freeBoardModifyResult }">
		<script>
			alert('${freeBoardModifyResult}');
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp" />
	<div id="content_form">
		<table>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
			<c:if test="${totCnt==0 }">
				<tr>
					<td colspan="6">글이 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${totCnt!=0 }">
				<c:forEach items="${freelist }" var="dto">
					<tr>
						<td>${dto.bNo }</td>
						<td class="left">
							<c:forEach var="i" begin="1" end="${dto.bIndent }">
								<c:if test="${i==dto.bIndent }">
									└─
								</c:if>
								<c:if test="${i!=dto.bIndent }">
									&nbsp; &nbsp;
								</c:if>
							</c:forEach>
						${dto.bTitle }</td>
						<td>${dto.mName }</td>
						<td><fmt:formatDate value="${dto.bRdate }" pattern="yy.M.d" /></td>
						<td>${dto.bHit }</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${not empty member }">
			<tr>
				<td colspan="5">
						<button class="btn" onclick="location.href='${conPath }/freeBoard_write_view.do'">글쓰기</button>
				</td>
			</tr>
			</c:if>
		</table>
		<br>
		<div class="paging">
			<c:if test="${startPage >BLOCKSIZE}">
				<a href="${conPath }/freeBoardList.do?pageNum=${startPage - 1}">◀◀</a>
			</c:if>
	 		<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i == pageNum }">
					<b>  ○  </b>
				</c:if>
				<c:if test="${i != pageNum }">
					[ <a href="${conPath }/freeBoardList.do?pageNum=${i}"> ${i} </a> ]
				</c:if>
			</c:forEach> 
			<c:if test="${endPage<pageCnt }">
		  		 <a href="${conPath }/freeBoardList.do?pageNum=${endPage + 1}">▶▶</a> 
			</c:if>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>