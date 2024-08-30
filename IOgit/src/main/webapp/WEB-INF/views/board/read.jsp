<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <title>Document</title>
</head>
<body>
    <div class="container mt-3" style="text-align: right;">

        <nav class="navbar navbar-expand-sm">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.html">
                    <img src="img/IOLogo.png" alt="Logo" id="logo">
                </a>
                <div class="navbar-nav">
                    <h1>IO</h1>
                </div>
                <div class="navbar-nav right">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="login.html">로그인</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="userjoin.html">회원가입</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="row">
            <div class="container-fluid">
                <div class="container mt-3" style="text-align: left;">
                    <ol class="list-group">
                        <li class="list-group-item">제목</li>
                        <li class="list-group-item">기자 이름, 소속사</li>
                        <li class="list-group-item" style="min-height: 200px; text-align: center;">
                          <img src="img/swan-7479623_1280.jpg" width="80%" style="margin-bottom: 50px;">
                          <div style="padding: 30px;">이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐이게 나라냐</div>
                        </li>
                    </ol>
                </div>
            </div>
            <div>
                <button>수정</button>
                <button>삭제</button>
            </div>
        </div>
	<!-- 댓글 start -------------------------------------------------------------------------------------------------->
        <div>
            <div class="container mt-3">
                <h3 style="text-align: center;">댓글</h3>
                <button>댓글 작성</button>
                <ol class="list-group" style="text-align: left;">
                  <li class="list-group-item">
                    <ul class="list-group list-group-horizontal chat">
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
                <div class="panel-footer"></div>
              </div>
        </div>
        <!-- 댓글 end -->
    </div>
    
    <script src="/resources/js/reply.js?bno=<c:out value='${board.bno}'/>"></script>
    
    <footer class="container-fluid d-flex justify-content-center">
        <a href=".navbar" title="To Top">
            <span class="glyphicon glyphicon-chevron-up"></span>
        </a>
        <p>&copy; IO All rights reserved.</p>
    </footer>
</body>
</html>