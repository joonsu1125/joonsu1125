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
<link href="${conPath }/css/movie_content.css" rel="stylesheet">
<link href="${conPath }/css/h3_btn.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	$(document).ready(function() {
		if (Number('${totCnt}') < 6) {
			$('#ReviewListMore').css('display', 'none');
		}
		$('#ReviewListMore').click(function() {
			$(this).css('cursor', 'pointer');
			var pageNum = Number($('#pageNum').val()) + 1;
			$('#pageNum').val(pageNum);
			$.ajax({
				url : '${conPath}/appendReviewList.do',
				type : 'get',
				data : 'pageNum='+ pageNum+ '&movieNo=${movie_content_view.movieNo }',
				dataType : 'html',
				success : function(data) {
					$('#appendReviewList').append(data);
				},
				error : function(code) {
					alert(code.status);
				}
			});
		});
		$('#notMember').click(function() {
			alert('로그인 하신 후 이용해 주시기 바랍니다.')
			location.href='${conPath}/member/login.jsp';
		});
	});
</script>
</head>
<c:if test="${not empty review_write_result }">
	<script>
		alert('${review_write_result}');
	</script>
</c:if>
<c:if test="${not empty errorMsg }">
	<script>
		alert('${errorMsg}');
	</script>
</c:if>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_form">
		<form action="${conPath }/movie_modify_view.do" method="post">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<input type="hidden" name="movieNo" value="${movie_content_view.movieNo }">
			<div id="moviePoster">
			<table>
				<tr>
					<td rowspan="3" width="100"><c:if
							test="${not empty movie_content_view.movieData }">
							<img src="${conPath }/movieData/${movie_content_view.movieData }"
								alt="영화포스터">
						</c:if></td>
				</tr>
				<tr>
					<th height="30">${movie_content_view.movieName }</th>
				</tr>
				<tr>
					<td>${movie_content_view.movieContent }</td>
				</tr>
	
				<c:if test="${empty member and not empty admin }">
					<tr>
						<td colspan="2">
							<input type="submit" value="수정" class="btn">
						 	<input type="button" value="삭제" class="btn" 
						 		onclick="location='${conPath}/movieDelete.do?movieNo=${movie_content_view.movieNo }&pageNum=${param.pageNum }'">
							<input type="button" value="목록" class="btn"
								onclick="location='${conPath}/movieList.do?pageNum=${param.pageNum }'">
						</td>
					</tr>
				</c:if>
				<c:if test="${empty admin }">
					<tr>
						<td colspan="3"><input type="button" value="목록" class="btn"
							onclick="location.href='${conPath}/movieList.do'"></td>
					</tr>
				</c:if>
			</table>
			</div>
		</form>
		<!-- 댓글입력창 -->
		<div id="reviewWrite">
			<form action="${conPath }/review_write.do" method="post">
				<input type="hidden" name="movieNo" value="${movie_content_view.movieNo }">
				<c:if test="${empty member }">
					<table>
						<tr>
							<td><input type="text" id="notMember" readonly="readonly" placeholder="댓글을 작성하려면 로그인 해주세요"
								style="height: 50px; width: 960px" ></td>
						</tr>
					</table>
				</c:if>
				<c:if test="${not empty member }">
					<div id="memberWrite">
						<table>
							<tr>
								<td><c:if test="${not empty member }">
										<h5>${member.mName }(${member.mId })</h5>
									</c:if> <br> <textarea style="width: 960px;" rows="5" cols="3" name="rContent" placeholder="주제와 무관한 댓글, 악플은 삭제될 수 있습니다."></textarea><br>
									<input type="submit" value="등록" class="btn"></td>
							</tr>
						</table>
					</div>
				</c:if>
			</form>
		</div>
		<!-- 댓글목록 -->
		<div id="reviewList">
			<c:if test="${totCnt!=0 }">
				<c:forEach items="${reviewlist }" var="dto">
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
		<div id="appendReviewList"></div>
		<input type="hidden" id="pageNum" value="1">
		<div id="ReviewListMoreCover">
			<span id="ReviewListMore">더보기</span>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>