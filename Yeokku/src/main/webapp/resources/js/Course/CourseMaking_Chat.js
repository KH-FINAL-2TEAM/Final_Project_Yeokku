/*function connect() }
	var ws = new WebSocket("ws://localhost:8787/yeokku/chatting.do");

	ws.onopen = function() {
		console.log("연결 됨");
		setTimeout( function() { connect(); }, 1000);
	};
	
	ws.onmessage = function (event) {
		console.log(event.data+'\n');
	};
	
	ws.onclose = function (event) { console.log("일반 닫음"); }
	ws.onerror = function (err) { console.log("에러" + err); }
}

$("#Chat_Button").on("click", function(e) { 
	e.preventDefault();

	if(socket.readyState !== 1) return;
		let msg = $("#Chat_Unpt").val()
		ws.send(msg);
});








*/








/*
var sock = new SockJS('http://localhost:8787/chatting');
sock.onmessage = onMessage;
sock.onclose = onClose;
sock.onopen = onOpen;

$("#Chat_Button").on("click", function(e) { sendMessage(); $('#Chat_Input').val('') });

function sendMessage() { sock.send($("#Chat_Input").val()); }

function onClose(evt) {}
function onOpen(evt) {}

function onMessage(msg) {
	
	var data = msg.data;
	var sessionId = null; //데이터를 보낸 사람
	var message = null;
	
	var arr = data.split(":");
	
	for(var i=0; i<arr.length; i++){
		console.log('arr[' + i + ']: ' + arr[i]);
	}
	
	var cur_session = '${userid}'; //현재 세션에 로그인 한 사람
	console.log("cur_session : " + cur_session);
	
	sessionId = arr[0];
	message = arr[1];
	
    //로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
	if(sessionId == cur_session){
		
		var str = "<div class='col-6'>";
		str += "<div class='alert alert-secondary'>";
		str += "<b>" + sessionId + " : " + message + "</b>";
		str += "</div></div>";
		
		$("#msgArea").append(str);
	}
	else{
		
		var str = "<div class='col-6'>";
		str += "<div class='alert alert-warning'>";
		str += "<b>" + sessionId + " : " + message + "</b>";
		str += "</div></div>";
		
		$("#msgArea").append(str);
	}
}
*/