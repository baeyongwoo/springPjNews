// reply.js 댓글기능과 관련된 js
$(document).ready(function() {
    // CSRF Token 설정
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
    });

    // 댓글 등록 및 처리
    var bnoValue = param.bno; // 부모 글 번호
    var replyUL = $(".chat"); // 댓글 목록 출력될 ul 태그
    var pageNum = 1; // 기본 페이지

    showList(pageNum); // 첫 페이지 출력

    function showList(p) {
        var page = p || 1;
        $.getJSON("/replies/pages/" + bnoValue + "/" + page + ".json", function(data) {
            if (page == -1) { // 마지막 페이지로 이동
                pageNum = Math.ceil(data.replyCnt / 10.0);
                showList(pageNum);
                return;
            }
            var str = "";
            if (data.list == null || data.list.length == 0) {
                replyUL.empty(); // 댓글 목록 초기화
                replyPageFooter.empty(); // 페이지 번호 목록 초기화
                return;
            }
            for (var i = 0, len = data.list.length || 0; i < len; i++) {
                str += "<li style='cursor:pointer;' data-rno='" + data.list[i].rno + "'>";
                str += "  <div>";
                str += "    <div class='header'>";
                str += "      <strong class='primary-font'>" + data.list[i].replyer + "</strong>";
                str += "      <small class='pull-right text-muted'>" + displayTime(data.list[i].replyDate) + "</small>";
                str += "    </div>";
                str += "    <p>" + data.list[i].reply + "</p>";
                str += "  </div>";
                str += "</li>";
            }
            replyUL.html(str); // ul 태그에 li 태그 출력
            showReplyPage(data.replyCnt); // 페이지 번호 출력
        });
    }

    // 댓글 페이지 번호 출력
    var replyPageFooter = $(".panel-footer");

    function showReplyPage(replyCnt) {
        var endNum = Math.ceil(pageNum / 10.0) * 10;
        var startNum = endNum - 9;
        var prev = startNum != 1;
        var next = false;

        if (endNum * 10 >= replyCnt) {
            endNum = Math.ceil(replyCnt / 10.0);
        }
        if (endNum * 10 < replyCnt) {
            next = true;
        }
        var str = "<ul class='pagination pull-right'>";
        if (prev) {
            str += "<li class='page-item'><a class='page-link' href='" + (startNum - 1) + "'>Previous</a></li>";
        }
        for (var i = startNum; i <= endNum; i++) {
            var active = pageNum == i ? "active" : "";
            str += "<li class='page-item " + active + "'><a class='page-link' href='" + i + "'>" + i + "</a></li>";
        }
        if (next) {
            str += "<li class='page-item'><a class='page-link' href='" + (endNum + 1) + "'>Next</a></li>";
        }
        str += "</ul>";
        replyPageFooter.html(str); // 페이지 번호 출력
    }

    // 댓글 페이지 번호 이벤트 처리
    replyPageFooter.on("click", "li a", function(e) {
        e.preventDefault();
        var targetPageNum = $(this).attr("href");
        pageNum = targetPageNum;
        showList(pageNum); // 해당 페이지 댓글 목록 출력
    });

    // 댓글 수정 버튼 이벤트 처리
    var modal = $(".modal");
    var modalInputReply = modal.find("input[name='reply']");
    var modalInputReplyer = modal.find("input[name='replyer']");
    var modalInputReplyDate = modal.find("input[name='replyDate']");
    var modalModBtn = $("#modalModBtn");
    var modalRemoveBtn = $("#modalRemoveBtn");
    var modalRegisterBtn = $("#modalRegisterBtn");

    modalRegisterBtn.on("click", function(e) {
        var reply = {
            reply: modalInputReply.val(),
            replyer: modalInputReplyer.val(),
            bno: bnoValue
        };

        $.ajax({
            type: "post",
            url: "/replies/new",
            data: JSON.stringify(reply),
            contentType: "application/json; charset=utf-8",
            success: function(result) {
                alert(result);
                modal.find("input").val("");
                modal.modal("hide");
                showList(-1); // 마지막 페이지로 이동
            }
        });
    });

    // 댓글 상세보기 모달창
    $(".chat").on("click", "li", function(e) {
        var rno = $(this).data("rno");
        $.get("/replies/" + rno + ".json", function(reply) {
            modalInputReply.val(reply.reply);
            modalInputReplyer.val(reply.replyer).attr("readonly", "readonly");
            modalInputReplyDate.val(displayTime(reply.replyDate)).attr("readonly", "readonly");
            modal.data("rno", reply.rno);
            modal.find("button[id!='modalCloseBtn']").hide();
            modalModBtn.show();
            modalRemoveBtn.show();
            $(".modal").modal("show");
        });
    });

    // 모달창 close 버튼 이벤트 처리
    $("#modalCloseBtn").on("click", function(e) {
        modal.modal("hide");
    });

    // 모달창 수정 버튼 이벤트 처리
    modalModBtn.on("click", function(e) {
        var reply = {
            rno: modal.data("rno"),
            reply: modalInputReply.val(),
            replyer: modalInputReplyer.val()
        };

        $.ajax({
            type: "put",
            url: "/replies/" + reply.rno,
            data: JSON.stringify(reply),
            contentType: "application/json;charset=utf-8",
            success: function(result) {
                alert(result);
                modal.modal("hide");
                showList(pageNum); // 목록 갱신
            }
        });
    });

    // 모달창 삭제 버튼 이벤트 처리
    modalRemoveBtn.on("click", function(e) {
        var rno = modal.data("rno");
        $.ajax({
            type: "delete",
            url: "/replies/" + rno,
            data: JSON.stringify({ rno: rno, replyer: replyer }),
            contentType: "application/json; charset=utf-8",
            success: function(result) {
                alert(result);
                modal.modal("hide");
                showList(pageNum); // 목록 갱신
            }
        });
    });

    // 날짜 형식 출력 함수
    function displayTime(timeValue) {
        var today = new Date();
        var gap = today.getTime() - timeValue;
        var dateObj = new Date(timeValue);

        if (gap < (24 * 60 * 60 * 1000)) {
            var hh = dateObj.getHours();
            var mi = dateObj.getMinutes();
            var ss = dateObj.getSeconds();
            return [(hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi, ':', (ss > 9 ? '' : '0') + ss].join('');
        } else {
            var yy = dateObj.getFullYear();
            var mm = dateObj.getMonth() + 1;
            var dd = dateObj.getDate();
            return [yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd].join('');
        }
    }

    // 이미지 표시 함수
    function showImage(fileCallPath) {
        $(".bigPictureWrapper").css("display", "flex").show();
        $(".bigPicture").html("<img src='/display?fileName=" + fileCallPath + "'>").animate({ width: '100%', height: '100%' }, 1000);
    }
});
