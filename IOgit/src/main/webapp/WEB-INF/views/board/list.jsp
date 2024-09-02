<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IO</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn-uicons.flaticon.com/2.5.1/uicons-regular-rounded/css/uicons-regular-rounded.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Sevillana&display=swap"
	rel="stylesheet">
<link href="/resources/css/style.css" rel="stylesheet">
<link href="/resources/css/logo" rel="stylesheet">
<script>
        $(document).ready(function(){
            $(".box").mouseenter(function(){
                var target = $(this).find(".box-content");
                target.animate({top: "0"}, 300);
                target.find(".default-content").hide();
                target.find(".hidden-content").show();
            }).mouseleave(function(){
                var target = $(this).find(".box-content");
                target.animate({top: "240px"}, 300);
                target.find(".default-content").show();
                target.find(".hidden-content").hide();
            });
        });
    </script>
</head>
<body>
	<!-- Video Section -->
	<figure class="vid">
		<video loop autoplay muted>
			<source src="/resources/logo/simhea.mp4" type="video/mp4">
		</video>
	</figure>

	<!-- Navigation Bar -->
	<div class="container-fluid">
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
						<li class="nav-item"><a class="nav-link" href="/user/login">로그인</a></li>
						<li class="nav-item"><a class="nav-link" href="/user/join">회원가입</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- Sidebar Navigation -->
		<aside class="side-bar">
			<ul class="nav nav-tabs" role="tablist">
				<i class="fi fi-rr-list"></i>
				<li><a class="nav-link active" 
					href="/board/list"><i class="fi fi-rr-home"> </i>홈</a></li>
				<li><a class="nav-link active" 
					href="/board/list/all"><i class="fi fi-rr-home"> </i>전체보기</a></li>	
					<c:forEach var="cate" items="${cateList}">
						<li><a class="nav-link" href="/board/list/${cate.caid}"><i
						class="fi fi-rr-lock"> </i>${cate.category}</a></li>
						
					</c:forEach>
				

			</ul>
		</aside>

		<!-- Tab Content -->
		<div class="tab-content">
			<c:forEach var="entry" items="${boardMap}">
				<c:choose>
					<c:when test="${entry.key == '최신순'}">
						<div id="menu1" class="container tab-pane active">
							<br>
							<div class="row">
								<a type="submit button">
									<h3>
										${entry.key} <i class="fi fi-rr-angle-right"></i>
									</h3>
								</a>
								<div class="container_fluid">
									<c:forEach var="board" items="${entry.value}">
										<a type="button" class="box"> <img
											src="/resources/img/IOLogo.png" class="mx-auto d-block"
											style="width: 100%">
											<div class="box-content">
												<div class="default-content">
													${board.title}
													<div class="container-fluid" style="text-align: left;">${board.uname}</div>
												</div>
												<div class="hidden-content">${board.bcontent}</div>
											</div>
										</a>
									</c:forEach>
								</div>
							</div>
						</div>
					</c:when>

					<c:when test="${entry.key == '비즈니스'}">
						<div id="menu1" class="container tab-pane active">
							<br>
							<div class="row">
								<a type="submit button">
									<h3>
										${entry.key} <i class="fi fi-rr-angle-right"></i>
									</h3>
								</a>
								<div class="container_fluid">
									<c:forEach var="board" items="${entry.value}">
										<a type="button" class="box"> <img
											src="/resources/img/IOLogo.png" class="mx-auto d-block"
											style="width: 100%">
											<div class="box-content">
												<div class="default-content">
													${board.title}
													<div class="container-fluid" style="text-align: left;">${board.uname}</div>
												</div>
												<div class="hidden-content">${board.bcontent}</div>
											</div>
										</a>
									</c:forEach>
								</div>
							</div>
						</div>
					</c:when>

					<c:when test="${entry.key == '기술'}">
						<div id="menu1" class="container tab-pane active">
							<br>
							<div class="row">
								<a type="submit button">
									<h3>
										${entry.key} <i class="fi fi-rr-angle-right"></i>
									</h3>
								</a>
								<div class="container_fluid">
									<c:forEach var="board" items="${entry.value}">
										<a type="button" class="box"> <img
											src="/resources/img/IOLogo.png" class="mx-auto d-block"
											style="width: 100%">
											<div class="box-content">
												<div class="default-content">
													${board.title}
													<div class="container-fluid" style="text-align: left;">${board.uname}</div>
												</div>
												<div class="hidden-content">${board.bcontent}</div>
											</div>
										</a>
									</c:forEach>
								</div>
							</div>
						</div>
					</c:when>


				</c:choose>
			</c:forEach>
		</div>
		<!-- tabEnd -->
	</div>
	<!-- content end -->

	<!-- Footer -->
	<footer class="container-fluid d-flex justify-content-center">
		<a href=".navbar" title="To Top"> <span
			class="glyphicon glyphicon-chevron-up"></span>
		</a>
		<p>© IO All rights reserved.</p>
	</footer>
</body>
</html>
