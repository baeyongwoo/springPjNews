<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <title>Document</title>
<script>
  $(function () {
    $(".shado").click(function () {
        var url = $(this).attr("href");
        $("body div").animate({
            "opacity": "0",
            "top": "10px"
        },500, function () {
            document.location.href = "/board/list";
        });
        return false;
    });
});
</script>
<style>
  body {
    margin: 0;
    overflow: hidden;
    background-color: #3a3a3a;
    color: #000000;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    font-family: "Nanum Pen Script", cursive;
  }
  .shado{
    padding: 50px;
    border-radius: 50%;
    box-shadow: 0px 0px 20px rgb(153, 255, 0), 0px 20px 20px rgb(255, 0, 0);
    background-color: #4e4e4e;
  }
  img{
    border-radius: 20%;
  }
</style>

<body>
      <div class="shado">
        <a type="button">
          <h1 class="animate__animated animate__flipInX">Information Ocsean
            <img src="img/IOLogo.png" style="height: 60px;" id="Logo">
          </h1>
        </a>
      </div>
</body>
</html>