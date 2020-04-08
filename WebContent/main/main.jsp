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
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<style>
#content_form{
	width: 1500px;
	margin: 0 auto;
}
#content_form #visual{
	position: relative;
}
#content_form #visual button{
	position: absolute; z-index: 10; top:50%; transform:translateY(-50%);
	width: 71px; height: 71px; border-radius: 100%; background: raba(0,0,0,0.5) ;
	border: none;
}
#content_form #visual div img{
	margin:30px 5px 0 5px;
	max-width: 100%; height: 700px;
}
#content_form #visual button:before{font-family: 'xeicon'; color: white; font-size:45px;}
#content_form #visual button.slick-prev {left:5px; font-size: 0; background-color: transparent;}
#content_form #visual button.slick-prev:before{content: "\e93d";}
#content_form #visual button.slick-next {right:5px; font-size: 0; background-color: transparent;}
#content_form #visual button.slick-next:before{content:"\e940";}
#content_form a{text-decoration: none;}
</style>
</head>
<body>
	<c:if test="${not empty errorMsg}">
		<script>
			alert('${errorMsg}');
			history.back();
		</script>
	</c:if>
		<c:if test="${not empty LoginResult}">
		<script>
			alert('${LoginResult}');
		</script>
	</c:if>
	<c:if test="${not empty modifyResult }">
		<script>
			alert('${modifyResult}');
		</script>
	</c:if>
	<jsp:include page="header.jsp"/>
	<div id="content_form">
	<i id="beforeBtn"></</i>
	<i id="afterBtn"></</i>
	<section id="visual">
		<div><a href="https://movie.naver.com/movie/bi/mi/basic.nhn?code=189001"><img src="${conPath }/img/mainMovie1.jpg" alt=""></a></div>
		<div><a href="https://movie.naver.com/movie/bi/mi/basic.nhn?code=190728"><img src="${conPath }/img/mainMovie2.jpg" alt=""></a></div>
		<div><a href="https://movie.naver.com/movie/bi/mi/basic.nhn?code=187321"><img src="${conPath }/img/mainMovie3.jpg" alt=""></a></div>
		<div><a href="https://movie.naver.com/movie/bi/mi/basic.nhn?code=179181"><img src="${conPath }/img/mainMovie4.jpg" alt=""></a></div>
		<div><a href="https://movie.naver.com/movie/bi/mi/basic.nhn?code=186613"><img src="${conPath }/img/mainMovie5.jpg" alt=""></a></div>
		<div><a href="https://movie.naver.com/movie/bi/mi/basic.nhn?code=186821"><img src="${conPath }/img/mainMovie6.jpg" alt=""></a></div>
	</section>
	<script type="text/javascript">
	$('#visual').slick({
		 infinite: true,
		 slidesToShow: 3,
		 slidesToScroll: 3,
		autoplay: true,
		autoplaySpeed: 2000
	});
	</script>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>