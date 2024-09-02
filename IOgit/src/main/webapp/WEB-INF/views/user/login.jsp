<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>로그인</title>
</head>
<body>
    <div class="container" style="text-align: center; margin-top: 90px;">
        <a class="navbar-brand" href="/index.html">
        <img src="/img/IOLogo.png" alt="Logo" style="width: 100px; border-radius: 20%; margin-bottom: 100px;">
        </a>
        
        <div class="container d-flex justify-content-center">
            <div>
                <h3>로그인</h3>
                <form method="post" id="operForm" class="was-validated">
                    <div class="mb-3 mt-3">
                        <label for="uname" class="form-label">아이디:</label>
                        <input type="email" class="form-control" id="userId" placeholder="email-id" name="userId">
                    </div>
                    <div class="mb-3">
                        <label for="pwd" class="form-label">비밀번호:</label>
                        <input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력하세요" name="pwd">
                    </div>
                
                    <button type="submit" data-oper="regist" class="btn btn-primary" href="userjoin.html">회원가입</button>
                    <button type="submit" data-oper="login" class="btn btn-primary">로그인</button>
                    <button type="reset" data-oper="cancle" class="btn btn-primary">취소</button>
                    <button type="button" class="btn btn-primary">메인페이지</button>
                </form>
            </div>
        </div>
    </div>
    <footer class="container-fluid d-flex justify-content-center">
        <a href=".navbar" title="To Top">
            <span class="glyphicon glyphicon-chevron-up"></span>
        </a>
        <p>&copy; IO All rights reserved.</p>
    </footer>
</body>
</html>
