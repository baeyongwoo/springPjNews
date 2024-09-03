<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<link href="/resources/css/style.css" rel="stylesheet">
<title>Document</title>

<script>
	/* 오류가 날 수 있는 코드 (JS 파일로 이동 후 추가) */
	var csrfHeaderName = "<c:out value='${_csrf.headerName}'/>";
	var csrfTokenValue = "<c:out value='${_csrf.token}'/>";
</script>
</head>
<body>
	<div class="container mt-3" style="text-align: right;">

		<nav class="navbar navbar-expand-sm">
			<div class="container-fluid">
				<a class="navbar-brand" href="index.html"> <img
					src="img/IOLogo.png" alt="Logo" id="logo">
				</a>
				<div class="navbar-nav">
					<h1>IO</h1>
				</div>
				<div class="navbar-nav right">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="login.html">로그인</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="userjoin.html">회원가입</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>





		<div class="row">
			<div class="container-fluid">
				<div class="container mt-3" style="text-align: left;">
					<ol class="list-group">


						<li class="list-group-item"><c:out value="${board.bno}" />번기사</li>
						<li class="list-group-item">

							<h2 style="font-weight: bold;">
								<c:out value="${board.title}" />
							</h2>
						</li>
						<li class="list-group-item"><strong>${board.dname}</strong> <b><c:out
									value="${board.uname}" /></b> <span>(${board.uemail})</span></li>



						<li class="list-group-item"
							style="color: #6c757d; font-style: italic;"><fmt:formatDate
								value="${board.regdate}" pattern="yyyy-MM-dd HH:mm:ss" /></li>
						<li class="list-group-item" style="min-height: 200px;">
							<h4 style="margin: 50px;">
								<c:out value="${board.bcontent}" />
							</h4>
						</li>


					</ol>
				</div>
			</div>
			<div>
				<form
					action="${pageContext.request.contextPath}/board/edit/${board.bno}"
					method="get" style="display: inline;">
					<button type="submit" class="btn btn-primary">수정</button>
				</form>
				<form action="/board/delete" method="post"
					onsubmit="return confirm('정말 삭제하시겠습니까?');">
					  <input type="hidden" name="bno" value="${board.bno}" />
					<button type="submit" >삭제</button>
				</form>

			</div>
		</div>
		<div>
			<div class="container mt-3">
				<h3 style="text-align: center;">댓글</h3>
				<button>댓글 작성</button>
				<ol class="list-group" style="text-align: left;">
					<li class="list-group-item">
						<ul class="list-group list-group-horizontal">
							<li class="list-group-item" style="width: 10%;">닉네임</li>
							<li class="list-group-item" style="width: 90%;">댓글</li>
						</ul>
						<button>수정</button>
						<button>삭제</button>
					</li>
				</ol>
				<ol class="list-group" style="text-align: left;">
					<li class="list-group-item">
						<ul class="list-group list-group-horizontal">
							<li class="list-group-item" style="width: 10%;">닉네임</li>
							<li class="list-group-item" style="width: 90%;">댓글</li>
						</ul>
						<button>수정</button>
						<button>삭제</button>
					</li>
				</ol>
				<ol class="list-group" style="text-align: left;">
					<li class="list-group-item">
						<ul class="list-group list-group-horizontal">
							<li class="list-group-item" style="width: 10%;">닉네임</li>
							<li class="list-group-item" style="width: 90%;">댓글</li>
						</ul>
						<button>수정</button>
						<button>삭제</button>
					</li>
				</ol>
				<ol class="list-group" style="text-align: left;">
					<li class="list-group-item">
						<ul class="list-group list-group-horizontal">
							<li class="list-group-item" style="width: 10%;">닉네임</li>
							<li class="list-group-item" style="width: 90%;">댓글</li>
						</ul>
						<button type="button" onclick="location.href='/board/list'">목록</button>
						<button>수정</button>
						<button>삭제</button>
					</li>
				</ol>
			</div>
		</div>
	</div>
	<footer class="container-fluid d-flex justify-content-center">
		<a href=".navbar" title="To Top"> <span
			class="glyphicon glyphicon-chevron-up"></span>
		</a>
		<p>&copy; IO All rights reserved.</p>
	</footer>
</body>
</html>