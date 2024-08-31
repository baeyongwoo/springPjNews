        
    function checkThisTempContent(tno) {
    // hidden input에서 값 가져오기
    var title = document.getElementById("title_" + tno).value;
    var content = document.getElementById("content_" + tno).value;
    var regdate = document.getElementById("regdate_" + tno).value;
    var email = document.getElementById("email_" + tno).value;
    var name = document.getElementById("name_" + tno).value;

    // 모달창에 데이터 설정
    document.getElementById("modalTno").innerText = tno;
    document.getElementById("modalTitle").innerText = title;
    document.getElementById("modalContent").innerText = content;
    document.getElementById("modalRegdate").innerText = regdate;
    document.getElementById("modalEmail").innerText = email;
    document.getElementById("modalName").innerText = name;
    // 모달창 표시
    console.log('click실행');
    $('#myModal').modal('show');
}


        function approve() {
        	let code = 'permit';
        	dataUpdate(code);
            alert("허가되었습니다.");
            $('#myModal').modal('hide');
        }

        function reject() {
        	let code = 'reject';
        	dataUpdate(code);
            alert("거절되었습니다.");
            $('#myModal').modal('hide');
        }
        
        function dataUpdate(code){
         let tno = document.getElementById("modalTno").innerText;
         console.log('tno' + tno);
        	 $.ajax({
        	type: "POST",
        	url: "/admin/updateData",
        	data: { tno: tno, code:code},
        	success: function(response) {
				location.reload();            	
            	$('#myModal').modal('hide');
        },
        error: function(error) {
            console.error(error);
        }
    });
        
        }

function cancelModal() {
      location.reload();
}





