<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
	<nav class="navbar navbar-expand-sm">
			<div class="container">
				<a class="navbar-brand" href="/board/list"> <img
					src="/resources/logo/IOLogo.png" alt="Logo" id="logo">
				</a>
				<div class="navbar-nav">
					<p id="Logoo">IO</p>
				</div>
				<div class="navbar-nav right">
					<ul class="navbar-nav">
						<c:choose>
							<c:when test="${loggedIn}">
								<li class="nav-item"><a class="nav-link"
									href="/user/logout">로그아웃</a></li>
							<li class="nav-item"><a class="nav-link" href="/user/mypage">마이페이지</a></li>
							</c:when>
							<c:otherwise>
								<li class="nav-item"><a class="nav-link" href="/user/login">로그인</a></li>
								<li class="nav-item"><a class="nav-link" href="/user/join">회원가입</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		<aside class="side-bar">
			<ul class="nav nav-tabs" role="tablist">
				<i class="fi fi-rr-list"></i>
				<li><a class="nav-link" href="/board/list"><i
						class="fi fi-rr-home"> </i>홈</a></li>
				<li><a class="nav-link" href="/board/list/all"><i
						class="fi fi-rr-home"> </i>전체보기</a></li>
				<c:forEach var="cate" items="${cateList}">
					<li><a class="nav-link" href="/board/list/${cate.caid}"><i
							class="fi fi-rr-lock"> </i>${cate.category}</a></li>

				</c:forEach>


			</ul>
		</aside>
		</nav>
</header>
</body>
</html>