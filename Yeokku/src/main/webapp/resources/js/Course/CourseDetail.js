
// 업데이트, 삭제는 관리자 또는 해당 유저만 가능하도록 이후 기능구현때 잊으면 안됨
// 신고는한 댓글당 하나의 계정으로 한번만 되도록 하는것도 잊으면 안됨

var updating = false;
var Course_Q = [];

window.onload = function() {	

	$(".review_update").bind('click', function() {
	
		var div_name = $(this).parent().parent().attr("id");
		var content_string = $("#"+div_name).children('.review_detail').children('.content').html();	
	
		if(updating == false) {
			updating = true;
			$("#"+div_name).children('.review_detail').children('.content').remove();
			$("#"+div_name).children('.review_detail').append( "<textarea style='font-size:15px;' class='content input_content'>"+content_string+"</textarea>" );
			$(this).attr("src", "resources/img/Course/Pencil2.png");
		} else {
			updating = false;
			var temp = $("#"+div_name).children('.review_detail').children('.content').val();
			$("#"+div_name).children('.review_detail').children('.content').remove();
			$("#"+div_name).children('.review_detail').append( '<div class="content">' + temp + '</div>' );
			$(this).attr("src", "resources/img/Course/Pencil.png");
			alert("수정되었습니다.");
		}
	
	});
	
	
	$(".review_close").bind('click', function() {
		alert("댓글이 삭제되었습니다..");
		$(this).parent().parent().remove();
	});
	
	
	$(".review_alert").bind('click', function() {
		alert("신고가 완료되었습니다.");
	});
	
	/////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////
	
	Course_Q = tc_q.split("&&");
	
	console.log( $(".hotel_2_2").children('span:first').children('b').html() );
	var temp = '';
	var count = 1;
	
	temp += "<div class='Queue_List'> <div id='Q_Start' class='Queue_One'>시 작</div> &nbsp;&nbsp; <div class='Queue_Next'></div> &nbsp;&nbsp;"; // 여기
	
	for(var j=0; j<=Course_Q.length/5; j++) {
	
		for(var i=j*5; i<j*5+5; i++) {
		
			try {
				if( (Course_Q[i] == null) || (Course_Q[i] == "START") ) {continue;}
			} catch(e){}
			
			var id = Course_Q[i];
			var title = '';
		
			temp += '<div class="Queue_One" id="q_' + id + '">';

			if(id.includes("map_detail_")) { title = $("."+id).children('h5').html(); }
			else {
				title = $("."+id).children('span:first').children('b').html();
				title = title + "";
				title = title.substr(3, title.length-6);
			}

			temp += title + '</div> &nbsp;&nbsp';
			if( i != Course_Q.length-1 ) { temp += "<div class='Queue_Next'></div> &nbsp;&nbsp;"; }
			else { }
		}
	}
	
	temp += "<div class='Queue_Next'></div> &nbsp;&nbsp;<div id='Q_End' class='Queue_One'>종 료</div></div>"; // 여기
	
	$("#q_list_detail").append(temp);
	
	$(".Queue_One").bind('click', function() { alert("상세 페이지로 이동은 현재 지원하지 않습니다."); });
	
}

