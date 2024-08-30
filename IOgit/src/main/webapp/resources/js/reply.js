function displayTime(timeValue){
	var today=new Date(); //현재날짜+시간
	var gap=today.getTime()-timeValue; //댓글등록시간-현재시간=댓글등록 후 지난 시간
	var dateOBJ=new Date(timeValue); //댓글작성시간 Date타입으로 변환
	
	//gap<24h일 경우
	if(gap<(24*60*60*1000)){
		var hh=dateOBJ.getHours();
		var mi=dateOBJ.getMinutes();
		var ss=dateOBJ.getSeconds();
		
		return[(hh>9?'':'0')+hh, ':' , (mi>9?'':'0')+mi, ':' , (ss>9?'':'0')+ss].join('');
	}else{
		var yy=dateObj.getFullYear();
		var mm=dateObj.getMonth()+1;
		var dd=dateObj.getDate();

		return [yy, '/', (mm>9?'':'0')+mm, '/', (dd>9?'':'0')+dd ].join('');
	}
}

$(document).ready(function(){
	/* 댓글목록 */
	var replyUL=$(".chat"); //UI태그 찾기
	
	showList(1); //첫페이지 출력
	
	function showList(p){
		var bno=bnoValue; //부모글번호
		var page=p || 1; //page번호. 변수저장
		$.getJSON("/replies/pages/"+bno+"/"+page+".json",function(data){
			if(page==-1){
				pageNum=Math.ceil(data.replyCnt/10.0);
				showList(pageNum);
				return;
			}
			var str="";
			if(data.list==null || data.list.length==0){
				replyUL.empty();
				replyPageFooter.empty();
				return;
			}
			for(var i=0,len=data.list.length||0; i<len; i++){
				str+="<li style='cursor:pointer;' data-rno='"+data.list[i].rno+"'>";
				str+="	<div>";
				str+="		<div class='header'>";
				str+="			<strong class='primary-font'>"+data.list[i].replyer+"</strong>";
				str+="			<small class='pull-right text-muted'>"+displayTime(data.list[i].replyDate)+"</small>";
				str+="		</div>";
				str+="		<p>"+data.list[i].reply+"</p>";
				str+="	</div>";
				str+="</li>";
			}
			replyUL.html(str);
			
			showReplyPage(data.replyCnt);
		});
	}
	
	/* 댓글 페이징. 페이지 번호 출력 */
	var pageNum=1;
	var replyPageFooter=$(".panel-footer");
	
	function showReplyPage(replyCnt){
		var endNum=Math.ceil(pageNum/10.0)*10;
		var startNum=endNum-9;
		var prev=startNum!=1;
		var next=false;
		
		if(endNum*10>=replyCnt){
			endNum=Math.ceil(replyCnt/10.0);
		}
		if(endNum*10<replyCnt){
			next=ture;
		}
		var str="<ul class='pagination pull-right'>";
		if(prev){
			str+="<li class='page-item'><a class='page-link' href='"+(startNum-1)+"'>Previous</a></li>";
		}
		for(var i=startNum; i<=endNum; i++){
			var active=pageNum==i?"active":"";
			str+="<li class='page-item "+active+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>";
		}
		if(next){
			str+="<li class='page-item'><a class='page-link' href='"+(endNum+1)+"'>Next</a></li>";
		}
		str+="</ul>";
		replyPageFooter.html(str);
	}
	
	/* 댓글 페이지 번호 이벤트 */
	replyPageFooter.on("click","li a", function(e){
		e.preventDefault();
		var targetPageNum=$(this).attr("href");
		pageNum=targetPageNum;
		showList(pageNum);
	});
	
	/* 수정 삭제 버튼 이벤트 */
	var operForm=$("#operForm");
	$("button[data-oper='modify']").on("click",function(e){
		operForm.attr("action","/board/modify").submit();//수정화면으로 전송
	});
	$("button[data-oper='list']").on("click",function(e){
		operForm.find("#bno").remove();// hidden태그 bno삭제.목록에서는 bno가 필요없음
		operForm.attr("action","/board/list").submit();//목록화면으로 전송
	});
	
	/* 댓글 등록 */
	var modal=$(".modal");
	

	
	
	
});