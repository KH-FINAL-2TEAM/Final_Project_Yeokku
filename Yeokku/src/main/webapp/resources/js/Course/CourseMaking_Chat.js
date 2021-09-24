var url = window.location.host;
var pathname = window.location.pathname;
var appCtx = pathname.substring(0, pathname.indexOf("/",2));
var root = url+appCtx;
var mypfimg = "resources/img/Course/PF2.jpg"; // 임시. 이후 수정 필요
     
function connect() {

	ws.onopen = function () {
		console.log('Socket Open Clear');
		setTimeout( function(){ connect(); }, 1000);
	};
	
	ws.onmessage = function (event) {
	
		let today = new Date();   

		let hours = today.getHours(); // 시
		let minutes = today.getMinutes();  // 분
		let seconds = today.getSeconds();  // 초
		let milliseconds = today.getMilliseconds(); // 밀리초
		
		var fullTime = hours + " : " + minutes + " : " + seconds ;
		
		if(event.data.includes("imgtype&typeline&")) {
			var text = event.data.split("&typeline&");
			var img = new Image();
			img.src = "data:image/png;base64," + text[1];
			
			img.onload = function() {
				ctx.drawImage(img, 0, 0)
			};
			
			$("#Alarm_Area").append(fullTime + "<br>System Log - 그림판 변경<br>= = = = = = = = = = = = =<br>");
			Alarm_Check = true;
			$(Alarm_Img).attr("src", "resources/img/Course/Alarm2.png");
		}
		else if(event.data.includes("pfimgline")) {
			var text = event.data;
			text = text.replace("chat&typeline&", "");
			text = event.data.split("pfimgline");
			
			var all = "<div class='Chat_One'>" +
				"<img class='Your_PF' src='" + text[0] + "'/>" +
				"<div class='Your_Chat Chat_Detail'>" + text[1] + "</div></div>";
			$("#Chat_Middle").append(all);
			
			$("#Alarm_Area").append(fullTime + "<br>System Log - 채팅 도착<br>= = = = = = = = = = = = =<br>");
			Alarm_Check = true;
			$(Alarm_Img).attr("src", "resources/img/Course/Alarm2.png");
		}
		else if(event.data.includes("webSave")) {
		
			var all = event.data.split("&websplit&");
			var content = all[1];
			var q = all[2];
			detail_count = all[3];

			$("#Making_Area>.Detail").remove();
			$("#Making_Area>.Sticker_One").remove();
			$("#Making_Area").append(content);
			
			$("#Alarm_Area").append(fullTime + "<br>System Log - 작업 영역 변경<br>= = = = = = = = = = = = =<br>");
			Alarm_Check = true;
			$(Alarm_Img).attr("src", "resources/img/Course/Alarm2.png");
			
			setTimeout( function(){ webAfterLoading(content, q); }, 300);
		}

	};
	
	ws.onclose = function (event) { console.log('Socket End Clear'); setTimeout( function(){ connect(); }, 1000); };
	ws.onerror = function (event) { console.log('Socket Error !!'); };
}

$('#Chat_Button').on('click', function(evt) {
	if (ws.readyState != 1) { return; }
		
	var msg = $('#Chat_Input').val();
	
	var all = "<div class='Chat_One'>" +
				"<img class='My_PF' src='" + mypfimg + "'/>" +
				"<div class='My_Chat Chat_Detail'>" + msg + "</div></div>";
	$("#Chat_Middle").append(all);
	
	$('#Chat_Input').val('');
	
	msg = "chat&typeline&" + msg;
	
	ws.send(msg);
});

function webAfterLoading(content, q) {

	$(".Queue_List").remove();

	Course_Q = q.split("&&");

	Course_Q.splice(0, 1);
	
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
	
	$("#Queue_All").append(temp);
	
	$(".Queue_One").bind('click', function() { alert("상세 페이지로 이동은 현재 지원하지 않습니다."); });
	
	Q_Index_Update();
	
	//////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////
	
	$("#Making_Area>.Detail").unbind('click');
	$("#Making_Area>.Sticker").unbind('click');
	
	$("#Making_Area>.Detail").bind('click', function() {
	
		if(Dragging == false ) {
			var arr = $(this).attr('class').split(" ");
			$("."+arr[4]).remove(); $("#q_"+arr[4]).remove(); 
			Q_Delete(Course_Q, -1, arr[4]);
			Q_Update();
			setTimeout(function() { webSave(); }, 200);
		}
	});
	
	$("#Making_Area>.Sticker_One").bind('click', function() { 
		$(this).remove(); setTimeout(function() { webSave(); }, 200);
	});
	
	$('#Making_Area>.Detail').draggable({

		drag: function( event, ui ) {
		
			Dragging = true;

			if( $(this).parents("div").attr('id') != "Making_Area" ) { 
				ui.position.top = Math.min( 0, 0 );
				ui.position.left = Math.min( 0, 0 );
			} else {
				// 이후 영역 제한이 필요하다면 이곳에 추가. 근데 귀찮아서 안할듯. HeartIn도 마찬가지
			}
		},
		
		stop: function() { setTimeout(function() { Dragging=false; webSave(); }, 200);  }
	});
	
	$("#Making_Area>.Sticker_One").draggable({
		drag: function( event, ui ) {Dragging = true;},
		stop: function() {setTimeout(function() { Dragging=false; webSave(); }, 200);}
	})
		.bind('click', function(){ if(Dragging == false) {$(this).remove();} })
		.css("border","0px solid white")
		.css("position", "absolute")
		.resizable({
			autoHide: true, 
			aspectRatio: false,
			resize: function() {Dragging = true; webSave();},
			stop: function() {setTimeout(function() { Dragging=false; webSave(); }, 200);}
		});
	
	$("#Making_Area>.Sticker_One>img").bind('click', function() {
		$(this).parent().rotate( parseInt($(this).attr("name")) + 45*1 );
		$(this).attr("name", parseInt($(this).attr("name")) + 45*1 );
		setTimeout(function() { webSave(); }, 200);
		return false;
	});
	
	$("#Making_Area>.Sticker_One").bind('mouseover', function() { $(this).children(".Cycle").css("opacity", 1); });
	$("#Making_Area>.Sticker_One").bind('mouseout', function() { $(this).children(".Cycle").css("opacity", 0); });
}
