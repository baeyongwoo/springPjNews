<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@ include file="../includes/header.jsp" %>

<!-- 페이지 스타일 -->
<style>
    .panel-heading {
        font-size: 18px;
        font-weight: bold;
        background-color: #f5f5f5;
    }

    .form-group label {
        font-weight: bold;
    }

    .form-control {
        border-radius: 4px;
    }

    .btn-default {
        margin-top: 10px;
    }

    .uploadResult ul {
        list-style-type: none;
        padding: 0;
    }

    .uploadResult li {
        border-bottom: 1px solid #ddd;
        padding: 10px 0;
    }

    .bigPictureWrapper {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.8);
        justify-content: center;
        align-items: center;
    }

    .bigPicture img {
        max-width: 90%;
        max-height: 90%;
    }

    .modal-content {
        position: relative;
    }

    .modal-header .close {
        margin: -1rem -1rem -1rem auto;
    }

    .modal-footer {
        display: flex;
        justify-content: space-between;
    }
</style>

<script>
    /* 오류가 날 수 있는 코드 (JS 파일로 이동 후 추가) */
    var csrfHeaderName = "<c:out value='${_csrf.headerName}'/>";
    var csrfTokenValue = "<c:out value='${_csrf.token}'/>";
</script>

<div class="container">
    <!-- 여기에 JSP 내용이 들어갑니다. -->
    <!-- 예시로, 게시글 제목과 내용, 댓글 목록 등을 출력하는 부분 -->
    <div class="panel panel-default">
        <div class="panel-heading">게시글 제목</div>
        <div class="panel-body">
            게시글 내용
        </div>
        <div class="panel-footer">
            <!-- 페이지 네비게이션 -->
        </div>
    </div>

    <!-- 댓글 목록 출력 -->
    <ul class="chat"></ul>

    <!-- 첨부파일 목록 -->
    <div class="uploadResult">
        <ul></ul>
    </div>

    <!-- 원본 이미지 보기 모달 -->
    <div class="bigPictureWrapper">
        <div class="bigPicture"></div>
    </div>

    <!-- 댓글 관련 모달 -->
    <div class="modal fade" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="replyModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="replyModalLabel">댓글</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="replyForm">
                        <div class="form-group">
                            <label for="replyer">작성자</label>
                            <input type="text" class="form-control" name="replyer" id="replyer">
                        </div>
                        <div class="form-group">
                            <label for="reply">댓글 내용</label>
                            <input type="text" class="form-control" name="reply" id="reply">
                        </div>
                        <div class="form-group">
                            <input type="hidden" name="replyDate" id="replyDate">
                            <input type="hidden" name="rno" id="rno">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" id="modalCloseBtn" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="modalRegisterBtn">Register</button>
                    <button type="button" class="btn btn-primary" id="modalModBtn">Modify</button>
                    <button type="button" class="btn btn-danger" id="modalRemoveBtn">Remove</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript 파일 링크 -->
 <!-- 파일위치 확인 후 변경 -->
<script src="/resources/js/board.js"></script>
