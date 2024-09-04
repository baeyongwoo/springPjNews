<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<header>
	<nav class="navbar navbar-expand-sm">
      <div class="container">
         <a class="navbar-brand" href="index.html"> <img
            src="/resources/img/IOLogo.png" alt="Logo" id="logo">
         </a>
         <div class="navbar-nav">
            <p id="Logoo">IO</p>
         </div>
         <div class="navbar-nav right">
            <ul class="navbar-nav">
               <li class="nav-item"><a class="nav-link" href="/user/login">로그인</a>
               </li>
               <li class="nav-item"><a class="nav-link" href="/user/join">회원가입</a>
               </li>
            </ul>
         </div>
      </div>
      <aside class="side-bar">
         <ul class="nav nav-tabs" role="tablist">
            <li><a class="nav-link active" data-bs-toggle="tab"
               href="/board/list"><i class="fi fi-rr-home"> </i>홈</a>
            <li><a class="nav-link active" data-bs-toggle="tab"
               href="/board/list/all"><i class="fi fi-rr-home"> </i>전체보기</a>
            <li><a class="nav-link active" data-bs-toggle="tab"
               href="/board/list/C01">><i class="fi fi-rr-lock"> </i>해킹/보안
            </a></li>
            <li><a class="nav-link active" data-bs-toggle="tab"
               href="/board/list/C02">><i class="fi fi-rr-rss"></i>인터넷/SNS
            </a></li>
         </ul>
      </aside>
   </nav>
</header>
</body>
</html>