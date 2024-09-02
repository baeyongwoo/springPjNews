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
    <link href="css/style.css" rel="stylesheet">
    <title>Document</title>
</head>
<body>
    <div class="container mt-3" style="text-align: center;">

        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <div class="container">
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
                <div class="container mt-3">
                    <ol class="list-group">
                      <li class="list-group-item">
                        <input type="text" placeholder="제목" style="width: 100%; height: 40px;">
                        <div class="form-floating mb-3 mt-3">
                            <select class="form-select" style="width: auto; height: 50px;">
                                <option value="no">카테고리을 입력하시오</option>
                                <option value="it">보안/해킹</option>
                                <option value="ingea">인터넷/SNS</option>
                            </select>
                        </div>
                      </li>
                      <li class="list-group-item" style="height: 600px;">
                          <textarea type="text" style="width: 100%;" rows="20 ,auto" cols="60" placeholder="내용"></textarea>
                          <input type="file" style="text-align: left;">
                        </li>
                    </ol>
                </div>
            </div>
            <div style="text-align: right;">
                <button>수정</button>
                <button>삭제</button>
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
    <footer class="container-fluid d-flex justify-content-center">
        <a href=".navbar" title="To Top">
            <span class="glyphicon glyphicon-chevron-up"></span>
        </a>
        <p>&copy; IO All rights reserved.</p>
    </footer>
</body>
</html>