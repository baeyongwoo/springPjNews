<!--회원가입  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
	
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
<link href="/resources//css/style.css" rel="stylesheet">
<script src="/resources/js/UserJoin.js'/>"></script>    
<title>회원가입</title>

<!--수정 후 js파일로 따로 옮길 예정  -->
<!-- <script>
function validateForm(form){
if(form.epwdch.value!=form.epwd.value){
            alert("비밀번호와 일치하지 않습니다.");
            form.epwdch.focus();
            return false;
        }
}
</script> -->

</head>
<body>
 <script src="/resources/js/UserJoin.js'/>"></script>    
	<div class="container" style="text-align: center; margin-top: 90px;">
		<a class="navbar-brand" href="/index.html"> <img
			src="/img/IOLogo.png" alt="Logo"
			style="width: 100px; border-radius: 20%; margin-bottom: 100px;">
		</a>

		<div class="container d-flex justify-content-center">
			<div>
				<h3>회원가입</h3>
				<form action="/user/join" method="post" id="joinForm"
					class="was-validated">
					<div class="mb-3 mt-3">
						<label for="uname" class="form-label">이름:</label> <input
							type="text" class="form-control" id="uname"
							placeholder="이름을 입력하세요" placeholder="uname" name="uname">
					</div>
					<div class="mb-3">
						<label for="pwd" class="form-label">비밀번호:</label> <input
							type="password" class="form-control" id="upwd"
							placeholder="비밀번호를 입력하세요" placeholder="upwd" name="upwd">
					</div>
					<div class="mb-3">
						<label for="pswdch" class="form-label">비밀번호 확인:</label> <input
							type="password" class="form-control" id="upwdch"
							placeholder="비밀번호확인를 입력하세요" placeholder="password check"
							name="upwdch">
					</div>
					<div class="mb-3">
						<label for="pwd" class="form-label">email</label> <input
							type="email" class="form-control" id="uemail"
							placeholder="Email" name="uemail"
							required>
						<div class="invalid-feedback">이메일을 입력하세요.</div>
						
					</div>
					<div class="mb-3">
						<label for="email" class="form-label">소속:</label> 
						<select name="did">
							<option value="D01">부서1</option>
							<option value="D02">부서2</option>
						
						</select>
							
					</div>
					<button type="submit" class="btn btn-primary">회원가입</button>
					<button type="reset" data-oper="cancle" class="btn btn-primary">취소</button>
					<button type="submit" class="btn btn-primary">메인페이지</button>
				</form>
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

