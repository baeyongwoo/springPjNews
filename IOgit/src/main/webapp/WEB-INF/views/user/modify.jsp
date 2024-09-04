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
    <link href="/css/style.css" rel="stylesheet">
    <title>회원정보 수정</title>
</head>
<body>
    <div class="container" style="text-align: center; margin-top: 90px;">
        <a class="navbar-brand" href="/index.html">
        <img src="/img/IOLogo.png" alt="Logo" style="width: 100px; border-radius: 20%; margin-bottom: 100px;">
        </a>
        
        <div class="container d-flex justify-content-center">
            <div>
                <h3>회원정보수정</h3>
                <form method="post" id="operForm" class="was-validated">
                    <div class="mb-3 mt-3">
                        <label for="uname" class="form-label">이름:</label>
                        <input type="text" class="form-control" id="uname" placeholder="이름을 입력하세요" name="uname">
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">이메일:</label>
                        <input type="email" class="form-control" id="pwd" placeholder="이메일을 입력하세요" name="email">
                    </div>
                    <div class="mb-3">
                        <label for="pwd" class="form-label">비밀번호:</label>
                        <input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력하세요" name="pwd">
                    </div>
                    <div class="mb-3">
                        <label for="pswdch" class="form-label">비밀번호 확인:</label>
                        <input type="password" class="form-control" id="pswdch" placeholder="비밀번호확인를 입력하세요" name="pwdch">
                    </div>
                	<label for="did" class="form-label">소속:</label> 
                	<select name="did">
						<option value="D01">부서1</option>
						<option value="D02">부서2</option>
					</select>
                   	<button type="submit" data-oper="regist" class="btn btn-primary">변경</button>
                    <button type="reset" data-oper="cancle" class="btn btn-primary">취소</button>
                </form>
            </div>
        </div>
    </div>
    <%@ include file="/resources/heater/footer.jsp" %>
</body>
</html>
