<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<link href="/resources/adcss/css/styles.css" rel="stylesheet" />



<title>Dashboard - SB Admin</title>


</head>

<body class="sb-nav-fixed">

	<div id="layoutSidenav">

		<!-- Sidebar -->
		<aside class="side-bar">
			<ul class="nav nav-tabs" role="tablist">
				<i class="fi fi-rr-list"></i>
				<li><a class="nav-link active" data-bs-toggle="tab"
					href="#menu1"><i class="fi fi-rr-home"> </i>홈</a>
				<li><a class="nav-link" data-bs-toggle="tab" href="#menu2"><i
						class="fi fi-rr-lock"> </i>해킹/보안</a></li>
				<li><a class="nav-link" data-bs-toggle="tab" href="#menu3"><i
						class="fi fi-rr-rss"> </i>인터넷/SNS</a></li>
			</ul>
		</aside>
		<!-- End of Sidebar -->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4" style="width: 95%; float: right;">
					<a href="${pageContext.request.contextPath}/admin/index">
						<h1 class="mt-4">DashBoard</h1>
					</a>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active"></li>
					</ol>


					<!-- 게시글 -->
					<div class="col-sm-6">
						<div class="content">
							<div class="main">
								<div class="manu">

									<c:choose>
										<c:when test="${code == 'complete'}">
											<h3>완료된 기사</h3>
										</c:when>
										<c:when test="${code == 'permit'}">
											<h3>허가된 기사</h3>
										</c:when>
										<c:when test="${code == 'ready'}">
											<h3>미확인 기사</h3>
										</c:when>
										<c:when test="${code == 'reject'}">
											<h3>거부된 기사</h3>
										</c:when>
										<c:otherwise>
											<h3>알 수 없는 상태</h3>
										</c:otherwise>
									</c:choose>
									<div class="row">
										<div class="col-sm-12">
											<div class="card">
												<table class="table table-dark table-hover text-center">
													<tr>
														<th>row</th>
														<th>제목</th>
														<th>내용</th>
														<th>작성일자</th>
														<th>이메일</th>
														<th>작성자</th>
														<th>처리</th>
													</tr>
													<c:forEach items="${tboardList}" var="ul" varStatus="row">
														<tr class="${ul.code == 'complete' ? 'complete' : ''}">
															<input type="hidden" id="tno" value="${ul.tno}" />
															<td><c:out value="${row.index+1}" /></td>
															<td><c:out value="${ul.tmptitle}" /></td>
															<td><c:out value="${ul.tmpcontent}" /></td>
															<td><c:out value="${ul.tmpregdate}" /></td>
															<td><c:out value="${ul.uemail}" /></td>
															<td><c:out value="${ul.uname}" /></td>
															<td class="check-btn"
																onclick="checkThisTempContent('${ul.tno}',
                												'${ul.tmptitle}',
                												'${ul.tmpcontent}',
                												'${ul.tmpregdate}', 
                												'${ul.uemail}', 
                												'${ul.uname}')"
																style="cursor: pointer;"><c:out value="확인하기" /></td>
														</tr>
													</c:forEach>
												</table>


											</div>
										</div>

									</div>
								</div>

							</div>
						</div>

					</div>

				</div>
		</div>
		</main>
		<footer class="py-4 bg-light mt-auto">
			<div class="container-fluid px-4">
				<div class="d-flex align-items-center justify-content-between small">
					<div class="text-muted">Copyright &copy; Information Ocean
						Company</div>
				</div>
			</div>
		</footer>
	</div>
	<!-- 모달창 -->
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- 모달 헤더 -->
				<div class="modal-header">
					<h4 class="modal-title">상세 정보</h4>
					<button type="button" class="close" data-dismiss="modal"
						onclick="cancelModal()">×</button>
				</div>
				<!-- 모달 바디 -->
				<div class="modal-body">
					<p>
						<strong>TNO:</strong> <span id="modalTno"></span>
					</p>
					<p>
						<strong>제목:</strong> <span id="modalTitle"></span>
					</p>
					<p>
						<strong>내용:</strong> <span id="modalContent"></span>
					</p>
					<p>
						<strong>작성일자:</strong> <span id="modalRegdate"></span>
					</p>
					<p>
						<strong>이메일:</strong> <span id="modalEmail"></span>
					</p>
					<p>
						<strong>작성자:</strong> <span id="modalName"></span>
					</p>
				</div>
				<!-- 모달 푸터 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-success" onclick="approve()">허가</button>
					<button type="button" class="btn btn-danger" onclick="reject()">거절</button>
				</div>
			</div>
		</div>
	</div>
	<script src="/resources/js/admin/scripts.js"></script>
	<script type="text/javascript">
		window.onload = function() {
			var rows = document.querySelectorAll('tr.complete');
			rows.forEach(function(row) {
				var ths = row.parentNode.querySelectorAll('th');
				var tds = row.querySelectorAll('td');

				var hideIndex = 6;

				ths[hideIndex].style.display = 'none';
				tds[hideIndex].style.display = 'none';
			});
		};
	</script>

</body>
</html>
