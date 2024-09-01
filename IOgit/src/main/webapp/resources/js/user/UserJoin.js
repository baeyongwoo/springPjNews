console.log("JavaScript 호출");

// 이메일 인증 코드 요청 함수
function sendEmailAuth() {
    let email = $("#uemail").val();
    $.ajax({
        type: 'POST',
        url: '/sendAuthCode.do',
        data: { email: email },
        success: function(response) {
            console.log(response);
            if (response === 'success') {
                $('#emailLabel').show();
                $('#emailCheck').show();
                $('#checkBtn').show();
                $('#messageEmail').text('인증 코드가 발송되었습니다.');
            } else {
                $('#messageEmail').text('이메일 발송 실패. 다시 시도해주세요.');
            }
        },
        error: function(xhr, status, error) {
            console.error("이메일 발송 오류:", error);
        }
    });
}

// 인증 코드 확인 함수
function emailAuthCheck() {
    let authCode = $("#emailCheck").val();
    $.ajax({
        type: 'POST',
        url: '/verifyAuthCode.do',
        data: { code: authCode },
        success: function(response) {
            if (response === 'access') {
                $('#messageEmail').text('인증되었습니다.');
                $('#emailCheck').hide();
                $('#emailLabel').hide();
                $('#emailAuth').hide();
                $('#checkBtn').hide();
                $('#uemail').prop('readonly', true);
            } else {
                $('#messageEmail').text('인증 실패하였습니다.');
            }
        },
        error: function() {
            console.log('error');
        }
    });
}

// 폼 유효성 검사 함수
function validateForm(form) {
    console.log('validateForm 호출');

    if (form.uname.value === "") {
        alert("이름을 입력하세요");
        form.uname.focus();
        return false;
    }
    if (form.upwd.value === "") {
        alert("비밀번호를 입력하세요");
        form.upwd.focus();
        return false;
    }
    if (form.upwdch.value === "") {
        alert("비밀번호 확인을 입력하세요");
        form.upwdch.focus();
        return false;
    }
    if (form.upwdch.value !== form.upwd.value) {
        alert("비밀번호와 일치하지 않습니다.");
        form.upwdch.focus();
        return false;
    }
    if ($('#messageEmail').text() === '이미 사용 중인 이메일입니다.') {
        alert('이미 사용중인 이메일입니다. 다시 작성해주세요');
        form.uemail.focus();
        return false;
    }

    return true;
}

// 이메일 인증 관련 요소 숨기기
function removeECheck() {
    $('#messageEmail').empty();
    $('#emailCheck').hide();
    $('#emailLabel').hide();
    $('#emailAuth').hide();
    $('#checkBtn').hide();
}
