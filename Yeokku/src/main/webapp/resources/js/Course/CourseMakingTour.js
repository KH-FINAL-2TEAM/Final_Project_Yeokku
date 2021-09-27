
$('#Search_Icon').on('click',function(){
	var select = $('#Select').val();

	if(select == '32'){
		hotelSearchList();
	}else if(select =='39'){
		foodSearchList();
	}else if(select =='12'){
		gpSearchList();
	}
});


function hotelSearchList(){
	$.ajax({
		type : 'post',
		url : 'tour_search_list.do',
		data:{
			select : $('#Select').val(),
			keyword : $('#Search_Input').val()
		},
		dataType: "json",
		success: function(data) { 
			console.log(data);
			$("#Hotel").empty();
			$("#Hotel").append('<img class="Close" id="Hotel_Close"  src="resources/img/Course/Close.png">');
			$.each(data, function(index, item) { // 데이터 =item
				var div = '<div class="Hotel_One tour_detail" id="Hotel_'+index+'" name="Hotel">'
						+ '<img class="Heart_In" src="resources/img/Course/Heart_In.png" >'
						+ '<img class="Hotel_Img Detail_Img" src='+ item.firstimage +' onerror="this.src=\'resources/img/noimg.png\'"><br><hr>'
						+ '<span><b>:: '+ item.title +'  ::</b></span><br><hr>'
						+ '<span class="Detail_Reduce">주소 : '+ item.addr1 +'</span><br>'
						+ '<span class="Detail_Reduce">연락처 : '+ item.tel +'</span>'
						+ '</div>';
						
				$('#Hotel').append(div);
			});
			$("#Hotel").show();
			$('#Search_Input').val("");
		},
		error : function(){
			alert("통신 실패");
		}
	});
}

function foodSearchList(){
	$.ajax({
		type : 'post',
		url : 'tour_search_list.do',
		data:{
			select : $('#Select').val(),
			keyword : $('#Search_Input').val()
		},
		dataType: "json",
		success: function(data) { 
			console.log(data);
			$("#Food").empty();
			$("#Food").append('<img class="Close" id="Food_Close"  src="resources/img/Course/Close.png">');
			$.each(data, function(index, item) { // 데이터 =item
				var div = '<div class="Food_One tour_detail" id="Food_'+index+'" name="Food">'
						+ '<img class="Heart_In" src="resources/img/Course/Heart_In.png" >'
						+ '<img class="Food_Img Detail_Img" src='+ item.firstimage +' onerror="this.src=\'resources/img/noimg.png\'"><br><hr>'
						+ '<span><b>:: '+ item.title +'  ::</b></span><br><hr>'
						+ '<span class="Detail_Reduce">주소 : '+ item.addr1 +'</span><br>'
						+ '<span class="Detail_Reduce">연락처 : '+ item.tel +'</span>'
						+ '</div>';
						
				$('#Food').append(div);
				
			});
			$("#Food").show();
			$('#Search_Input').val("");
		},
		error : function(){
			alert("통신 실패");
		}
	});
}

function gpSearchList(){
	$.ajax({
		type : 'post',
		url : 'tour_search_list.do',
		data:{
			select : $('#Select').val(),
			keyword : $('#Search_Input').val()
		},
		dataType: "json",
		success: function(data) { 
			console.log(data);
			$("#GP").empty();
			$("#GP").append('<img class="Close" id="GP_Close"  src="resources/img/Course/Close.png">');
			$.each(data, function(index, item) { // 데이터 =item
				var div = '<div class="GP_One tour_detail" id="GP_'+index+'" name="GP">'
						+ '<img class="Heart_In" src="resources/img/Course/Heart_In.png" >'
						+ '<img class="GP_Img Detail_Img" src='+ item.firstimage +' onerror="this.src=\'resources/img/noimg.png\'"><br><hr>'
						+ '<span><b>:: '+ item.title +'  ::</b></span><br><hr>'
						+ '<span class="Detail_Reduce">주소 : '+ item.addr1 +'</span>'
						+ '</div>';
				$('#GP').append(div);
			});
			$("#GP").show();
			$('#Search_Input').val("");
		},
		error : function(){
			alert("통신 실패");
		}
	});
}


$("#Hotel,#Food,#GP").on('click','.tour_detail', function(){
	

			$("#Making_Area").append($(this).clone());
			
			var id = $("#Making_Area>div:last").attr("id");
			$("#Making_Area>div:last").addClass(id+"_"+detail_count);
			$("#Making_Area>div:last").css("left", 0).css("top", 0).css("position", "absolute");
			$("#Making_Area>div:last").children(".Heart_In").remove();
			
			$("#Making_Area>div:last").draggable({
				drag: function(){Dragging = true;},
				stop: function() { setTimeout(function() { Dragging=false; }, 200); }		
			});
			
		
			$("#Making_Area>div:last").bind('click', function() { 
				var arr = $(this).attr('class').split(" ");
				$("."+arr[2]).remove(); $("#q_"+arr[2]).remove(); 
				Q_Delete(Course_Q, -1, arr[2]);
				Q_Update();
			});
			
			$("#Making_Area>div:last").prepend("<img class='OF' src='resources/img/Course/Minus.png'>");
			$("#Making_Area>div:last").prepend("<div class='Index_Num'><b></b></div>");
			
			$("#Making_Area>div:last>img:first").bind('click', function() {
				if(Dragging == true) { return false; }
				if( $(this).attr("src") == "resources/img/Course/Plus.png" ) {
					$(this).attr("src","resources/img/Course/Minus.png");
					$(this).nextAll('.Detail_Reduce').show();
					$(this).nextAll('hr').show(); $(this).nextAll('br').show();
					$(this).parent().css("height", "292px");
				} else {
					$(this).attr("src","resources/img/Course/Plus.png");
					$(this).nextAll('.Detail_Reduce').hide();
					$(this).nextAll('hr').hide(); $(this).nextAll('br').hide();
					$(this).parent().css("height", "auto");
				}
				return false;
			});

			Course_Q.push( $(this).attr("id")+"_"+(detail_count) );
			detail_count++;
			Q_Update();
	});

	
	$("#Hotel,#Food,#GP").on('click',".Heart_In", function(){
	
		if( $(this).attr("src") == "resources/img/Course/Heart_In.png") { 
		
			$(this).attr("src", "resources/img/Course/Heart_In2.png");
			$("#Heart").append($(this).parent().clone());
			
			$("#Heart>div:last").bind('click', function() {
			
				if(Dragging == true) {return false;}
				
				$("#Making_Area").append($(this).clone());
				
				var id = $("#Making_Area>div:last").attr("id");
				$("#Making_Area>div:last").addClass(id+"_"+detail_count);
				
				$("#Making_Area>div:last").css("left", 0).css("top", 0).css("position", "absolute");
				$("#Making_Area>div:last").children(".Heart_In").remove();
				
				$("#Making_Area>div:last").draggable({
					drag: function(){Dragging = true;},
					stop: function() { setTimeout(function() { Dragging=false; }, 200); }		
				});
				
				$("#Making_Area>div:last").bind('click', function() { 
					var arr = $(this).attr('class').split(" ");
					$("."+arr[4]).remove(); $("#q_"+arr[4]).remove(); 
					Q_Delete(Course_Q, -1, arr[4]);
					Q_Update();
				});
				$("#Making_Area>div:last").prepend("<img class='OF' src='resources/img/Course/Minus.png'>");
				$("#Making_Area>div:last").prepend("<div class='Index_Num'><b></b></div>");
				
				$("#Making_Area>div:last>img:first").bind('click', function() {
					if(Dragging == true) { return false; }
					if( $(this).attr("src") == "resources/img/Course/Plus.png" ) {
						$(this).attr("src","resources/img/Course/Minus.png");
						$(this).nextAll('.Detail_Reduce').show();
						$(this).nextAll('hr').show(); $(this).nextAll('br').show();
						$(this).parent().css("height", "292px");
					} else {
						$(this).attr("src","resources/img/Course/Plus.png");
						$(this).nextAll('.Detail_Reduce').hide();
						$(this).nextAll('hr').hide(); $(this).nextAll('br').hide();
						$(this).parent().css("height", "auto");
					}
					return false;
				});
				
				Course_Q.push( $(this).attr("id")+"_"+detail_count );
				detail_count++;
				Q_Update();
			});
			
			$('#Heart>div:last').draggable({
	
				drag: function( event, ui ) {
				
					Dragging = true;
		
					if( $(this).parents("div").attr('id') != "Making_Area" ) { 
						ui.position.top = Math.min( 0, 0 );
						ui.position.left = Math.min( 0, 0 );
					}
				},
				
				stop: function() { setTimeout(function() { Dragging=false; }, 200); }
			});
			
			$("#Heart>div:last>img:first").bind('click', function() {
				var temp = $(this).parent().attr("id");
				$(this).parent().remove();

				$("#"+temp).children(".Heart_In").attr("src", "resources/img/Course/Heart_In.png");
			});
			
			$("#Heart>div:last>img:eq(1)").bind('click', function() {
				if(Dragging == true){return false;}
				window.open('http://www.naver.com', '상세 정보 페이지');
				return false;
			});
			
			$("#Heart>div:last>span").bind('mouseover', function(){ Dragging = true; });
			$("#Heart>div:last>span").bind('mouseout', function(){ Dragging = false; });
			
		} else {
			$(this).attr("src", "resources/img/Course/Heart_In.png");
			var temp = $(this).parent().attr("id");
			$("#Heart").children("#"+temp).remove();
		}

		return false;
	});