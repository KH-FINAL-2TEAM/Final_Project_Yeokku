
// 업데이트, 삭제는 관리자 또는 해당 유저만 가능하도록 이후 기능구현때 잊으면 안됨
// 신고는한 댓글당 하나의 계정으로 한번만 되도록 하는것도 잊으면 안됨

var updating = false;

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
}


