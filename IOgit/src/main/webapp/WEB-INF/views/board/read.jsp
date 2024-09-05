<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<link href="/resources/css/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
<title>Document</title>
<style type="text/css">
	li{
		display:none;
	}
</style>
<script>
	/* 오류가 날 수 있는 코드 (JS 파일로 이동 후 추가) */
	var csrfHeaderName = "<c:out value='${_csrf.headerName}'/>";
	var csrfTokenValue = "<c:out value='${_csrf.token}'/>";
</script>
</head>
<body>
		<%@ include file="/resources/heater/header.jsp" %>
	<div class="container mt-3" style="text-align: right;">


		<div class="row">
			<div class="container-fluid">
				<div class="container mt-3" style="text-align: left;">
					<ol class="list-group">


						<li class="list-group-item"><c:out value="${board.bno}" />번기사</li>
						<li class="list-group-item">

							<h2 style="font-weight: bold;">
								<c:out value="${board.title}" />
							</h2>
						</li>
						<li class="list-group-item"><strong>${board.dname}</strong> <b><c:out
									value="${board.uname}" /></b> <span>(${board.uemail})</span></li>



						<li class="list-group-item"
							style="color: #6c757d; font-style: italic;"><fmt:formatDate
								value="${board.regdate}" pattern="yyyy-MM-dd HH:mm:ss" /></li>
						<li class="list-group-item" style="min-height: 200px;">
							<h4 style="margin: 50px;">
								<c:out value="${board.bcontent}" />
							</h4>
						</li>


					</ol>
				</div>
			</div>
			<div>
				<%-- <form
					action="${pageContext.request.contextPath}/board/edit/${board.bno}"
					method="get" style="display: inline;">
					<button type="submit" class="btn btn-primary">수정</button>
				</form> --%>
				<form action="/board/delete" method="post"
					onsubmit="return confirm('정말 삭제하시겠습니까?');">
					  <input type="hidden" name="bno" value="${board.bno}" />
					<button type="submit" >삭제</button>
				</form>
				<button type="button" onclick="location.href='/board/list'">목록</button>
			</div>
		</div>
		
		<!-- 댓글목록 ---------------------------------------------------------------->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-defualt">
					<div class="panel-heading">
						<i class="fa fa-comments fa-fw">댓글</i>
        				
        				<%-- 로그인한 경우만 댓글등록 버튼 출력 --%>
         				<sec:authorize access="isAuthenticated()">
        				<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">등록</button>
         				</sec:authorize>  
        				
					</div>
					<div class="panel-body">
						<!-- 댓글목록 출력 UL태그 ---------------------------->
						<ul class="chat">
        				
						</ul>
					</div>
					<div class="panel-footer"></div>
				</div>
			</div>
        </div>
		<!-- 댓글목록.end -->
		
		<!-- 모달 ------------------------------------------------------------------->            
	    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">댓글 창</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>댓글</label><a href="#" class="pull-right" id="emoji">emoji</a>
                            <input class="form-control" name='reply' id="message">
                        </div>
                        <div class="form-group">
                            <label>작성자</label>
                             <input class="form-control" name='replyer' readonly>

                         </div>
                        <div class="form-group">
                            <label>등록일</label>
                            <input class="form-control" name='replyDate' value="SYSDATE" readonly>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
                        <button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
                        <button id='modalRegisterBtn' type="button" class="btn btn-primary">등록</button>
                        <button id='modalCloseBtn' type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
	</div>

	<script>   
		/* csrf토큰 *****************************************************************/
		var csrfHeaderName ="${_csrf.headerName}"; 
		var csrfTokenValue="${_csrf.token}";
		
		
		/* 댓글작성자 *****************************************************************************/
      <sec:authorize access="isAuthenticated()">          
         <sec:authentication property="principal" var="pinfo" />
         const replyerid= "${pinfo.username}";
      </sec:authorize>
 		
   </script>


	<script src="/resources/js/board/vanillaEmojiPicker.js"></script>
    <script>

        new EmojiPicker({
            trigger: [
                {
                    selector: '#emoji',
                    insertInto: '#message'
                },
            ],
            closeButton: true,
        });

    </script>


<script src="/resources/js/board/reply.js?bno=<c:out value='${board.bno}'/>"></script>  
	<%@ include file="/resources/heater/footer.jsp" %>
</body>
</html>