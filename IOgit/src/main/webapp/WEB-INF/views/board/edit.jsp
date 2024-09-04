<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
</head>
<body>
	<div class="container mt-3" style="text-align: center;">

		<%@ include file="/resources/heater/header.jsp" %>
		<div class="row">
			<div class="container-fluid">
				<div class="container mt-3">
					<form action="${pageContext.request.contextPath}/board/edit"
						method="post">
						<ol class="list-group">
							<input type="hidden" name="tno" value="${tboard.tno}" />

							<div class="mb-3">
								<label for="title" class="form-label">제목</label> <input
									type="text" name="tmptitle" id="title" class="form-control"
									value="${tboard.tmptitle}" required>
							</div>

							<div class="mb-3">
								<label for="category" class="form-label">카테고리</label> <input
									type="text" id="category" class="form-control"
									value="${tboard.category}" readonly>
							</div>

							<div class="mb-3">
								<label for="content" class="form-label">내용</label>
								<textarea name="tmpcontent" id="content" class="form-control"
									rows="10" required>${tboard.tmpcontent}</textarea>
							</div>


							<button type="submit">수정 완료</button>
						</ol>
					</form>
				</div>
			</div>

		</div>
	</div>
	<div>
		<div>
			<div class="container mt-3" style="text-align: right;">
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
						<button>수정</button>
						<button>삭제</button>
					</li>
				</ol>
			</div>
		</div>
	</div>
	<%@ include file="/resources/heater/footer.jsp" %>
</body>
</html>