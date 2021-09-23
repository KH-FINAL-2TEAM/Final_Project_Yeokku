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
	
		if(event.data.includes("pfimgline")) {
			var text = event.data.split("pfimgline");
			var all = "<div class='Chat_One'>" +
				"<img class='Your_PF' src='" + text[0] + "'/>" +
				"<div class='Your_Chat Chat_Detail'>" + text[1] + "</div></div>";
			$("#Chat_Middle").append(all);
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
	ws.send(msg);
});
