<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

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
<script src="/resources/js/user/UserJoin.js"></script>
<title>회원가입</title>

</head>
<body>
	<div class="container" style="text-align: center; margin-top: 90px;">
		<a class="navbar-brand" href="/index.html"> <img
			src="/img/IOLogo.png" alt="Logo"
			style="width: 100px; border-radius: 20%; margin-bottom: 100px;">
		</a>

		<div class="container d-flex justify-content-center">
			<div>
				<h3>회원가입</h3>
				<form action="/user/join" method="post" id="joinForm"
					class="was-validated" onsubmit="return validateForm(this);">
					<div class="mb-3 mt-3">
						<label for="uname" class="form-label">이름:</label> <input
							type="text" class="form-control" id="uname"
							placeholder="이름을 입력하세요" name="uname" required>
					</div>
					<div class="mb-3">
						<label for="upwd" class="form-label">비밀번호:</label> <input
							type="password" class="form-control" id="upwd"
							placeholder="비밀번호를 입력하세요" name="upwd" required>
					</div>
					<div class="mb-3">
						<label for="upwdch" class="form-label">비밀번호 확인:</label> <input
							type="password" class="form-control" id="upwdch"
							placeholder="비밀번호 확인을 입력하세요" name="upwdch"required>
					</div>
					<div class="mb-3">
						<label for="uemail" class="form-label">이메일:</label> <input
							type="email" class="form-control" id="uemail" name="uemail"
							placeholder="Email" required>
						<div class="invalid-feedback">이메일을 입력하세요.</div>
						<button type="button" id="emailAuth"
							class="btn btn-info my-1 mb-3" onclick="sendEmailAuth();">이메일
							인증</button>
						<label id="emailLabel" for="emailCheck" class="form-label mb-1"
							style="display: none;">인증 코드:</label> <input type="text"
							id="emailCheck" name="emailCheck" class="form-control mt-0"
							style="display: none;" placeholder="인증 코드를 입력하세요" required>
						<button type="button" id="checkBtn" class="btn btn-info my-1 mb-3"
							style="display: none;" onclick="emailAuthCheck();">인증 코드
							확인</button>
						<div id="messageEmail" class="form-text"></div>
					</div>

					<div class="mb-3">
						<label for="email" class="form-label">소속:</label> <select
							name="did">
							<option value="D01">부서1</option>
							<option value="D02">부서2</option>
						</select>
					</div>
					<div class="mb-3">
						<label for="email" class="form-label">권한</label>
						<input type="checkbox" name="role" value="ROLE_ADMIN">관리자
						<input type="checkbox" name="role" value="ROLE_MEMBER">기자
						<input type="checkbox" name="role" value="ROLE_USER">일반
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					</div>
					

					<button type="submit" class="btn btn-primary">회원가입</button>
					<button type="button" class="btn btn-primary"
						onclick="location.href='/board/list'">메인페이지</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
