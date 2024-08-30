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
		var yy=dateOBJ.getFullTear();
		var mm=getMonth()+1;
		var dd=dateOBJ.getDate();
		
		return [yy, '/', (mm>9?'':'0'+mm, '/', (dd>9?'':'0')+dd ].join('');
	}
}