$(document).ready(function() {
    // 댓글 목록을 표시하는 함수
    function showList(page) {
        $.getJSON("/replies/pages/" + bnoValue + "/" + (page || 1) + ".json", function(data) {
            var str = "";
            if (!data.list || data.list.length == 0) {
                $("#replyList").html("댓글이 없습니다.");
                return;
            }

            $(data.list).each(function(index, reply) {
                var replyHTML = "<li class='list-group-item' data-id='" + reply.rno + "'>" +
                                "<h5 class='list-group-item-heading'>작성자: " + reply.rname + "</h5>" +
                                "<p class='list-group-item-text'>" + reply.rcon + "</p>" +
                                "<button class='btn btn-warning btn-sm float-end mx-1 edit-reply-btn' data-id='" + reply.rno + "'>수정</button>" +
                                "<button class='btn btn-danger btn-sm float-end delete-reply-btn' data-id='" + reply.rno + "'>삭제</button>" +
                                "</li>";
                str += replyHTML;
            });
            $("#replyList").html(str);
        });
    }

    // 댓글 삭제 함수
    function deleteReply(rno) {
        var rpwd = prompt("댓글 비밀번호를 입력하세요:");
        if (rpwd) {
            $.ajax({
                type: "DELETE",
                url: "/replies/" + rno,
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ rpwd: rpwd }),
                success: function(result) {
                    alert(result);
                    showList(); // 댓글 목록 새로고침
                },
                error: function(xhr, status, error) {
                    alert("댓글 삭제 실패: " + error);
                }
            });
        }
    }

    // 댓글 수정 함수
    function editReply(rno) {
        var rpwd = prompt("댓글 비밀번호를 입력하세요:");
        if (rpwd) {
            $.getJSON("/replies/" + rno + ".json", function(reply) {
                $('#replyer').val(reply.rname);
                $('#reply').val(reply.rcon);
                $('#password').val(rpwd); // 비밀번호 필드에 기존 비밀번호 입력
                $('#addReplyBtn').hide();
                $('#updateReplyBtn').show().data('rno', rno);
            });
        }
    }

    // 댓글 등록 버튼 클릭 이벤트
    $('#addReplyBtn').click(function() {
        var reply = {
            bno: bnoValue,
            rname: $('#replyer').val(),
            rpwd: $('#password').val(),
            rcon: $('#reply').val()
        };

        $.ajax({
            type: "POST",
            url: "/replies/new",
            data: JSON.stringify(reply),
            contentType: "application/json; charset=utf-8",
            success: function(result) {
                alert(result);
                $('#replyer').val('');
                $('#reply').val('');
                $('#password').val('');
                showList(); // 댓글 목록 새로고침
            },
            error: function(xhr, status, error) {
                alert("댓글 등록 실패: " + error);
            }
        });
    });

    // 댓글 수정 버튼 클릭 이벤트
    $('#updateReplyBtn').click(function() {
        var reply = {
            rname: $('#replyer').val(),
            rpwd: $('#password').val(),
            rcon: $('#reply').val()
        };
        var rno = $(this).data('rno');

        $.ajax({
            type: "PATCH",
            url: "/replies/" + rno,
            data: JSON.stringify(reply),
            contentType: "application/json; charset=utf-8",
            success: function(result) {
                alert(result);
                $('#replyer').val('');
                $('#reply').val('');
                $('#password').val('');
                $('#addReplyBtn').show();
                $('#updateReplyBtn').hide();
                showList(); // 댓글 목록 새로고침
            },
            error: function(xhr, status, error) {
                alert("댓글 수정 실패: " + error);
            }
        });
    });

    // 댓글 삭제 버튼 클릭 이벤트
    $(document).on('click', '.delete-reply-btn', function() {
        var rno = $(this).data('id');
        deleteReply(rno);
    });

    // 댓글 수정 버튼 클릭 이벤트
    $(document).on('click', '.edit-reply-btn', function() {
        var rno = $(this).data('id');
        editReply(rno);
    });

    // 페이지 로드시 댓글 목록 가져오기
    showList();


});