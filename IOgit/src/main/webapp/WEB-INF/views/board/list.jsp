<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IO</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn-uicons.flaticon.com/2.5.1/uicons-regular-rounded/css/uicons-regular-rounded.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Sevillana&display=swap" rel="stylesheet">
    <link href="/resources/css/style.css" rel="stylesheet">
    <link href="/resources/css/logo" rel="stylesheet">
    <script>
        $(document).ready(function(){
    $(".box").mouseenter(function(){
        var target = $(this).find(".box-content");
        target.animate({top: "0"}, 300);
        target.find(".default-content").hide();
        target.find(".hidden-content").show();
    }).mouseleave(function(){
        var target = $(this).find(".box-content");
        target.animate({top: "240px"}, 300);
        target.find(".default-content").show();
        target.find(".hidden-content").hide();
    });
});
    </script>
</head>
<body>
    <figure class="vid">
        <video loop autoplay muted>
            <source src="/resources/logo/simhea.mp4" type="video/mp4">
        </video>
    </figure>
    <div class="container-fluid">
        <nav class="navbar navbar-expand-sm">
            <div class="container">
                <a class="navbar-brand" href="index.html">
                    <img src="/resources/logo/IOLogo.png" alt="Logo" id="logo">
                </a>
                <div class="navbar-nav">
                    <p id="Logoo">IO</p>
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
        <!-- Nav tabs -->
        <aside class="side-bar">
            <ul class="nav nav-tabs" role="tablist">
                <i class="fi fi-rr-list"></i>
              <li>
                <a class="nav-link active" data-bs-toggle="tab" href="#menu1"><i class="fi fi-rr-home"> </i>홈</a>
              <li>
                <a class="nav-link" data-bs-toggle="tab" href="#menu2"><i class="fi fi-rr-lock"> </i>해킹/보안</a>
              </li>
              <li>
                <a class="nav-link" data-bs-toggle="tab" href="#menu3"><i class="fi fi-rr-rss"> </i>인터넷/SNS</a>
              </li>
            </ul>
          </aside>
        <!-- Tab panes -->
        <div class="tab-content">
            <div id="menu1" class="container tab-pane active"><br>
                <div class="row">
                    <a type="submit button">
                        <h3>최신순 <i class="fi fi-rr-angle-right"></i></h3>
                    </a>
                    <div class="container_fluid">
                        <a type="button" class="box">
                            <img src="/resources/img/IOLogo.png" class="mx-auto d-block" style="width:100%">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                        <a class="box">
                            <img src="" class="mx-auto d-block" style="width:100%">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                        <a class="box">
                            <img src="" class="mx-auto d-block" style="width:100%">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="row">
                    <a type="submit">
                        <h3>인기순 <i class="fi fi-rr-angle-right"></i></h3>
                    </a>
                    <div class="container_fluid">
                        <a class="box">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                        <a class="box">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                        <a class="box">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="row">
                    <a type="submit">
                        <h3>보안/해킹 <i class="fi fi-rr-angle-right"></i></h3>
                    </a>
                    <div class="container_fluid">
                        <a class="box">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                        <a class="box">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                        <a class="box">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="row">
                    <a type="submit">
                        <h3>인터넷/SNS <i class="fi fi-rr-angle-right"></i></h3>
                    </a>
                    <div class="container_fluid">
                        <a class="box">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                        <a class="box">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                        <a class="box">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <div id="menu2" class="container tab-pane fade"><br>
                <div class="row">
                    <div class="container_fluid">
                        <a class="box">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                        <a class="box">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                        <a class="box">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                    </div>
                </div><div class="row">
                    <div class="container_fluid">
                        <a class="box">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                        <a class="box">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                        <a class="box">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                    </div>
                </div><div class="row">
                    <div class="container_fluid">
                        <a class="box">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                        <a class="box">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                        <a class="box">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                    </div>
                </div><div class="row">
                    <div class="container_fluid">
                        <a class="box">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                        <a class="box">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                        <a class="box">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <div id="menu3" class="container tab-pane fade"><br>
                <div class="row">
                    <div class="container_fluid">
                        <a class="box">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                        <a class="box">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                        <a class="box">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                    </div>
                </div><div class="row">
                    <div class="container_fluid">
                        <a class="box">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                        <a class="box">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                        <a class="box">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                    </div>
                </div><div class="row">
                    <div class="container_fluid">
                        <a class="box">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                        <a class="box">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                        <a class="box">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                    </div>
                </div><div class="row">
                    <div class="container_fluid">
                        <a class="box">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                        <a class="box">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                        <a class="box">
                            <div class="box-content">
                                <div class="default-content">제목
                                    <div class="container-fluid" style="text-align: left;">기자</div>
                                </div>
                                <div class="hidden-content">내용</div>
                            </div>
                        </a>
                    </div>
                </div>
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
