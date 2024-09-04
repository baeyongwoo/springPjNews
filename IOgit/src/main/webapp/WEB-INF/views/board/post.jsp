<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="/resources/css/style.css" rel="stylesheet">
<title>Document</title>
</head>
<body>
	<div class="container mt-3" style="text-align: center;">
		<%@ include file="/resources/heater/header.jsp" %>
		<div class="row">
			<div class="container-fluid">
				<form role="form" action="/board/post" method="post" id="postForm" enctype="multipart/form-data">
					<div>제목</div>
					<input type="text" name="tmptitle" placeholder="제목" style="width: 100%; height: 40px;">
					<!-- 로그인시 삭제 
					<div>이메일</div>
					<input type="text" name="uemail" placeholder="제목" style="width: 100%; height: 40px;">
					-->
					<div class="form-floating mb-3 mt-3">
						<select class="form-select" name="caid" style="width: auto; height: 50px;">
							<option value="null">카테고리를 입력하시오</option>
							<c:forEach var="cate" items="${cateList}">
								<option value="${cate.caid}">${cate.category}</option>
							</c:forEach>
						</select>
					</div>
					<div class="list-group-item" style="height: 600px;">
						<textarea name="tmpcontent" style="width: 100%;" rows="20" placeholder="내용"></textarea>
						<!-- <input type="file" name="fileUpload" style="text-align: left;"> -->
					</div>
					
					<input type="text" name="uemail" value="${username}" style="width: 100%; height: 40px;">
					<button type="submit" value="Submit">작성</button>
					<button type="button" onclick="location.href='/board/list'">목록</button>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="/resources/heater/footer.jsp" %>
</body>
</html>
