
var Icon_Switch = [ 1, 0, 1, 1, 1, 1, 1, 0, 1, 1 ];
var Alarm_Check = false;

var Menu_Lock = "Lock";
var Menu_Loading = false;

var Dragging = false;
var Map_Dragging = false;

var Course_Q = [];

var Scroll_Check;

window.onload = function()
{
	setTimeout(function() { remakeLoading(); $("#Making_Area").append("<span></span>"); }, 300);
	
	$("#Start_Area").bind('click', function() { document.documentElement.requestFullscreen(); $("#Start_Area").fadeOut();});

	$("#Chat").hide();	$(".Search_Area").hide(); $("#Hotel").show(); $("#Alarm_Area").toggle();
	$("#Pencil").hide(); $("#Save_Area").hide(); $("#Black_Mask").hide();
	$("#Chat").resizable({ autoHide: true });
	//$(".Detail").resizable({ autoHide: true });
	$("#Making_Area").resizable({ 
		autoHide: true,
		resize: function() { 
			//$(this).children(".ui-resizable-handle").css("width", $(this).css('width')).css("height", $(this).css('height'));
		}
	});
	$(".Search_Area").resizable({ 
		aspectRatio: false, 
		autoHide: true
	});
	$(".Search_Area").css("position", "absolute");
	
	$("#Alarm_Img").bind('click', function() {
	
		$("#Alarm_Area").toggle();
		$(this).attr("src", "resources/img/Course/Alarm.png");
		Alarm_Check = false;
		
		/*
		if(Alarm_Check == true) { 
			Alarm_Check = false;
			$(this).attr("src", "resources/img/Course/Alarm.png");
		} else {
			Alarm_Check = true;
			$(this).attr("src", "resources/img/Course/Alarm2.png");
		}*/
	});
	
	
	$(".Search_Area").on('mousewheel',function(e){
		var wheel = e.originalEvent.wheelDelta;
		$(this).children(".ui-resizable-s").css("bottom", -5-$(this).scrollTop());
		$(this).children(".ui-resizable-se").css("bottom", -5-$(this).scrollTop());
	});
	
	////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////
	
	$("#Save_Icon").bind('click', function() {
		
		if(Icon_Switch[0] == 0) {
			Icon_Switch[9] = 1;
			$("#Save_Area").hide(); $("#Black_Mask").hide();
			$("#Save_Icon").attr("src","resources/img/Course/Save.png");
		} else {
			Icon_Switch[9] = 0;
			$("#Save_Area").show(); $("#Black_Mask").show();
			$("#Save_Icon").attr("src","resources/img/Course/Save2.png");
		}
	});
	
	////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////
	
	$("#Menu_Icon").bind('mouseover', function() {
		if(Menu_Lock == "Unlock" && Menu_Loading != true) { 
		Menu_Loding = true;
		$('header').animate( { left:'0', right:'0'}, 300, 'linear'); }
		setTimeout(function() { Menu_Loading = false; $('header').clearQueue(); }, 350);
	});
	
	$("#Menu_Icon").bind('mouseout', function() {
		if(Menu_Lock == "Unlock" && Menu_Loading != true ) { 
		Menu_Loding = true;
		$('header').animate( { left:'-100%', right:'100%'}, 300, 'linear'); }
		setTimeout(function() { Menu_Loading = false; $('header').clearQueue(); }, 350);
	});
	
	$("#Menu_Icon").bind('click', function() {
		if(Menu_Lock == "Unlock") { 
			Menu_Lock = "Lock";
			$('header').animate( { left:'0', right:'0'}, 300, 'linear');
			$(this).attr("src", "resources/img/Course/Lock.png");
		} else {
			Menu_Lock = "Unlock";
			$('header').animate( { left:'-100%', right:'100%'}, 300, 'linear');
			$(this).attr("src", "resources/img/Course/Unlock.png?ver=1");
		}
	});
	
	////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////
	
	$('#Chat').draggable({ 
	
		drag: function( event, ui ) {
		
			var limit_chat_xloc = Math.floor(window.innerWidth * 0.8);
			var limit_chat_yloc = Math.floor(window.innerHeight * 0.6);
				
			ui.position.top = Math.min( limit_chat_yloc*1, ui.position.top );
			ui.position.left = Math.min( limit_chat_xloc*1, ui.position.left );
			
			$("#Chat").css("left", ui.position.left*1 + window.innerWidth*0.01 + 20 );
			$("#Chat").css("top", ui.position.top*1 + window.innerHeight * 0.1 );

            Index_Change("chat");
            window.scrollTo({left:0});
  		}
	});
	
	$('#Chat_Icon').bind('click', function(){

		if(Icon_Switch[0] == 0) {
			Icon_Switch[0] = 1;
			$("#Chat").hide();
			$("#Chat_Icon").attr("src","resources/img/Course/Chat.png");
		} else {
			Icon_Switch[0] = 0;
			$("#Chat").show();
			$("#Chat_Icon").attr("src","resources/img/Course/Chat2.png");

            Index_Change("chat");
		}
	});
	
	$('#Chat_Close').bind('click', function(){
		Icon_Switch[0] = 1;
		$("#Chat").hide();
		$("#Chat_Icon").attr("src","resources/img/Course/Chat.png");
	});
	
	$('#Chat').bind('dblclick', function(){
		Icon_Switch[0] = 1;
		$("#Chat").hide();
		$("#Chat_Icon").attr("src","resources/img/Course/Chat.png");
	});
	
	////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////
	
	$('#Hotel').draggable({
	
		drag: function( event, ui ) {
		
			var limit_chat_xloc = Math.floor(window.innerWidth * 0.75);
			var limit_chat_yloc = Math.floor(window.innerHeight * 0.6);
				
			ui.position.top = Math.min( limit_chat_yloc*1, ui.position.top );
			ui.position.left = Math.min( limit_chat_xloc*1, ui.position.left );
			
			$("#Hotel").css("left", ui.position.left*1 + 20 + 70 + window.innerWidth*0.02 );
			$("#Hotel").css("top", ui.position.top*1 + window.innerHeight * 0.1 );

            Index_Change("hotel");
            window.scrollTo({left:0});
  		}
	});
	
	$('#Hotel_Icon').bind('click', function(){

		if(Icon_Switch[1] == 0) {
			Icon_Switch[1] = 1;
			$("#Hotel").hide();
			$("#Hotel_Icon").attr("src","resources/img/Course/Hotel.png");
		} else {
			Icon_Switch[1] = 0;
			$("#Hotel").show();
			$("#Hotel_Icon").attr("src","resources/img/Course/Hotel2.png");

            Index_Change("hotel");
		}
	});
	
	$(document).on("click","#Hotel_Close", function(){
		Icon_Switch[1] = 1;
		$("#Hotel").hide();
		$("#Hotel_Icon").attr("src","resources/img/Course/Hotel.png");
	});
	
	$('#Hotel').bind('dblclick', function(){
		Icon_Switch[1] = 1;
		$("#Hotel").hide();
		$("#Hotel_Icon").attr("src","resources/img/Course/Hotel.png");
	});
	
	////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////
	
	$('#Food').draggable({
	
		drag: function( event, ui ) {
		
			var limit_chat_xloc = Math.floor(window.innerWidth * 0.7);
			var limit_chat_yloc = Math.floor(window.innerHeight * 0.6);
				
			ui.position.top = Math.min( limit_chat_yloc*1, ui.position.top );
			ui.position.left = Math.min( limit_chat_xloc*1, ui.position.left );
			
			$("#Food").css("left", ui.position.left*1 + 20 + 140 + window.innerWidth*0.03 );
			$("#Food").css("top", ui.position.top*1 + window.innerHeight * 0.1 );

            Index_Change("food");
            window.scrollTo({left:0});
  		}
	});
	
	$('#Food_Icon').bind('click', function(){

		if(Icon_Switch[2] == 0) {
			Icon_Switch[2] = 1;
			$("#Food").hide();
			$("#Food_Icon").attr("src","resources/img/Course/Food.png");
		} else {
			Icon_Switch[2] = 0;
			$("#Food").show();
			$("#Food_Icon").attr("src","resources/img/Course/Food2.png");

            Index_Change("food");
		}
	});
	
	$(document).on("click","#Food_Close", function(){
		Icon_Switch[2] = 1;
		$("#Food").hide();
		$("#Food_Icon").attr("src","resources/img/Course/Food.png");
	});
	
	$('#Food').bind('dblclick', function(){
		Icon_Switch[2] = 1;
		$("#Food").hide();
		$("#Food_Icon").attr("src","resources/img/Course/Food.png");
	});
	
	////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////
	
	$('#GP').draggable({
	
		drag: function( event, ui ) {
		
			var limit_chat_xloc = Math.floor(window.innerWidth * 0.65);
			var limit_chat_yloc = Math.floor(window.innerHeight * 0.6);
				
			ui.position.top = Math.min( limit_chat_yloc*1, ui.position.top );
			ui.position.left = Math.min( limit_chat_xloc*1, ui.position.left );
			
			$("#GP").css("left", ui.position.left*1 + 20 + 220 + window.innerWidth*0.04 );
			$("#GP").css("top", ui.position.top*1 + window.innerHeight * 0.1 );

            Index_Change("gp");
            window.scrollTo({left:0});
  		}
	});
	
	$('#GP_Icon').bind('click', function(){

		if(Icon_Switch[3] == 0) {
			Icon_Switch[3] = 1;
			$("#GP").hide();
			$("#GP_Icon").attr("src","resources/img/Course/GoodPoint.png");
		} else {
			Icon_Switch[3] = 0;
			$("#GP").show();
			$("#GP_Icon").attr("src","resources/img/Course/GoodPoint2.png");

            Index_Change("gp");
		}
	});
	
	$(document).on("click","#GP_Close", function(){
		Icon_Switch[3] = 1;
		$("#GP").hide();
		$("#GP_Icon").attr("src","resources/img/Course/GoodPoint.png");
	});
	
	$('#GP').bind('dblclick', function(){
		Icon_Switch[3] = 1;
		$("#GP").hide();
		$("#GP_Icon").attr("src","resources/img/Course/GoodPoint.png");
	});
	
	////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////
	
	$('#Bus').draggable({
	
		drag: function( event, ui ) {
		
			var limit_chat_xloc = Math.floor(window.innerWidth * 0.6);
			var limit_chat_yloc = Math.floor(window.innerHeight * 0.6);
				
			ui.position.top = Math.min( limit_chat_yloc*1, ui.position.top );
			ui.position.left = Math.min( limit_chat_xloc*1, ui.position.left );
			
			$("#Bus").css("left", ui.position.left*1 + 20 + 295 + window.innerWidth*0.05 );
			$("#Bus").css("top", ui.position.top*1 + window.innerHeight * 0.1 );

            Index_Change("bus");
            window.scrollTo({left:0});
  		}
	});
	
	$('#Bus_Icon').bind('click', function(){
	
		alert("해당 기능은 국토교통부의 API가 서비스 중지함으로서 부득이하게 제외하였습니다....ㅠㅠ \n다 만들어놨는데.. ㅠㅠ");
		return;

		if(Icon_Switch[4] == 0) {
			Icon_Switch[4] = 1;
			$("#Bus").hide();
			$("#Bus_Icon").attr("src","resources/img/Course/Bus.png");
		} else {
			Icon_Switch[4] = 0;
			$("#Bus").show();
			$("#Bus_Icon").attr("src","resources/img/Course/Bus2.png");

            Index_Change("bus");
		}
	});
	
	$('#Bus_Close').bind('click', function(){
		Icon_Switch[4] = 1;
		$("#Bus").hide();
		$("#Bus_Icon").attr("src","resources/img/Course/Bus.png");
	});
	
	$('#Bus').bind('dblclick', function(){
		Icon_Switch[4] = 1;
		$("#Bus").hide();
		$("#Bus_Icon").attr("src","resources/img/Course/Bus.png");
	});
	
	////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////
	
	$('#Map').draggable({
	
		drag: function( event, ui ) {
		
			var limit_chat_xloc = Math.floor(window.innerWidth * 0.55);
			var limit_chat_yloc = Math.floor(window.innerHeight * 0.6);
				
			ui.position.top = Math.min( limit_chat_yloc*1, ui.position.top );
			ui.position.left = Math.min( limit_chat_xloc*1, ui.position.left );
			
			$("#Map").css("left", ui.position.left*1 + 20 + 370 + window.innerWidth*0.06 );
			$("#Map").css("top", ui.position.top*1 + window.innerHeight * 0.1 );

            Index_Change("map");
            window.scrollTo({left:0});
  		}
	});
	
	$('#Map_Icon').bind('click', function(){

		if(Icon_Switch[5] == 0) {
			Icon_Switch[5] = 1;
			$("#Map").hide();
			$("#Map_Icon").attr("src","resources/img/Course/Map.png");
		} else {
			Icon_Switch[5] = 0;
			$("#Map").show();
			$("#Map_Icon").attr("src","resources/img/Course/Map2.png");

            Index_Change("map");
		}
	});
	
	$('#Map_Close').bind('click', function(){
		Icon_Switch[5] = 1;
		$("#Map").hide();
		$("#Map_Icon").attr("src","resources/img/Course/Map.png");
	});
	
	$('#Map').bind('dblclick', function(){
		Icon_Switch[5] = 1;
		$("#Map").hide();
		$("#Map_Icon").attr("src","resources/img/Course/Map.png");
	});
	
	$(".map_wrap").bind("mouseover", function(){
		$('#Map').draggable({disabled: true});
	});
	
	$(".map_wrap").bind("mouseout", function(){
		$('#Map').draggable({disabled: false});
	});
	
	////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////
	
	$('#Heart').draggable({
	
		drag: function( event, ui ) {
		
			var limit_chat_xloc = Math.floor(window.innerWidth * 0.55);
			var limit_chat_yloc = Math.floor(window.innerHeight * 0.6);
				
			ui.position.top = Math.min( limit_chat_yloc*1, ui.position.top );
			ui.position.left = Math.min( limit_chat_xloc*1, ui.position.left );
			
			$("#Heart").css("left", ui.position.left*1 + 20 + 370 + window.innerWidth*0.06 );
			$("#Heart").css("top", ui.position.top*1 + window.innerHeight * 0.1 );

            Index_Change("heart");
            window.scrollTo({left:0});
  		}
	});
	
	$('#Heart_Icon').bind('click', function(){

		if(Icon_Switch[6] == 0) {
			Icon_Switch[6] = 1;
			$("#Heart").hide();
			$("#Heart_Icon").attr("src","resources/img/Course/Heart.png");
		} else {
			Icon_Switch[6] = 0;
			$("#Heart").show();
			$("#Heart_Icon").attr("src","resources/img/Course/Heart2.png");

            Index_Change("heart");
		}
	});
	
	$('#Heart_Close').bind('click', function(){
		Icon_Switch[6] = 1;
		$("#Heart").hide();
		$("#Heart_Icon").attr("src","resources/img/Course/Heart.png");
	});
	
	$('#Heart').bind('dblclick', function(){
		Icon_Switch[6] = 1;
		$("#Heart").hide();
		$("#Heart_Icon").attr("src","resources/img/Course/Heart.png");
	});
	
	////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////
	
	$("#Making_Area").on('mousewheel',function(e){
		var wheel = e.originalEvent.wheelDelta;
		$(this).children(".ui-resizable-s").css("bottom", -5-$(this).scrollTop());
		$(this).children(".ui-resizable-se").css("bottom", -5-$(this).scrollTop());
	});
	
	$("#Queue_All").draggable({ drag:function(){Index_Change("book");} });

	$('#Making_Area').draggable({
	
		drag: function( event, ui ) {
		
			var limit_chat_xloc = Math.floor(window.innerWidth * 0.3);
			var limit_chat_yloc = Math.floor(window.innerHeight * 0.6);
				
			ui.position.top = Math.min( limit_chat_yloc*1, ui.position.top );
			ui.position.left = Math.min( limit_chat_xloc*1, ui.position.left );
			
			$("#Making_Area").css("left", ui.position.left*1 );
			$("#Making_Area").css("top", ui.position.top*1 - window.innerHeight * 0.075 );

            Index_Change("book");
            window.scrollTo({left:0});
  		}
	});
	
	$('#Making_Icon').bind('click', function(){

		if(Icon_Switch[7] == 0) {
			Icon_Switch[7] = 1;
			$("#Making_Area").hide(); $("#Queue_All").hide();
			$("#Making_Icon").attr("src","resources/img/Course/Book.png");
		} else {
			Icon_Switch[7] = 0;
			$("#Making_Area").show(); $("#Queue_All").show();
			$("#Making_Icon").attr("src","resources/img/Course/Book2.png");

            Index_Change("book");
		}
	});
	
	$('#Making_Close').bind('click', function(){
		Icon_Switch[7] = 1;
		$("#Making_Area").hide(); $("#Queue_All").hide();
		$("#Making_Icon").attr("src","resources/img/Course/Book.png");
	});
	
	$('#Making_Area').bind('dblclick', function(){
		Icon_Switch[7] = 1;
		$("#Making_Area").hide(); $("#Queue_All").hide();
		$("#Making_Icon").attr("src","resources/img/Course/Book.png");
	});
	
	////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////
	
	$('#Sticker').draggable({
	
		drag: function( event, ui ) {
		
			Dragging = true;
		
			var limit_chat_xloc = Math.floor(window.innerWidth * 0.55);
			var limit_chat_yloc = Math.floor(window.innerHeight * 0.6);
				
			ui.position.top = Math.min( limit_chat_yloc*1, ui.position.top );
			ui.position.left = Math.min( limit_chat_xloc*1, ui.position.left );
			
			$("#Sticker").css("left", ui.position.left*1 + 20 + 370 + window.innerWidth*0.06 );
			$("#Sticker").css("top", ui.position.top*1 + window.innerHeight * 0.1 );
	
			Index_Change("sticker");
			window.scrollTo({left:0});
		  },
		  
		  stop: function() { setTimeout(function() { Dragging=false; webSave(); }, 200); }
	});
	
	$('#Sticker_Icon').bind('click', function(){
	
		if(Icon_Switch[6] == 0) {
			Icon_Switch[6] = 1;
			$("#Sticker").hide();
			$("#Sticker_Icon").attr("src","resources/img/Course/Sticker.png");
		} else {
			Icon_Switch[6] = 0;
			$("#Sticker").show();
			$("#Sticker_Icon").attr("src","resources/img/Course/Sticker2.png");
	
			Index_Change("sticker");
		}
	});
	
	$('#Sticker_Close').bind('click', function(){
		Icon_Switch[6] = 1;
		$("#Sticker").hide();
		$("#Sticker_Icon").attr("src","resources/img/Course/Sticker.png");
	});
	
	$('#Sticker').bind('dblclick', function(){
		Icon_Switch[6] = 1;
		$("#Sticker").hide();
		$("#Sticker_Icon").attr("src","resources/img/Course/Sticker.png");
	});
	
	$(".Sticker").bind('click', function(){
		$("#Making_Area").append($(this).parent("div").clone());
		
		$("#Making_Area>div:last").draggable({
			drag: function( event, ui ) {Dragging = true;},
			stop: function() {setTimeout(function() { Dragging=false; webSave(); }, 200);}
		})
			.bind('click', function(){ if(Dragging == false) {$(this).remove();} })
			.css("border","0px solid white")
			.css("position", "absolute")
			.resizable({
				autoHide: true, 
				aspectRatio: false,
				resize: function() {Dragging = true;},
				stop: function() {setTimeout(function() { Dragging=false; webSave(); }, 200);}
			});
		
		$("#Making_Area>div:last>img:last").bind('click', function() {
			$(this).parent().rotate( parseInt($(this).attr("name")) + 45*1 );
			$(this).attr("name", parseInt($(this).attr("name")) + 45*1 );
			setTimeout(function() { webSave(); }, 200);
			return false;
		});
		
		$("#Making_Area>div:last").bind('mouseover', function() { $(this).children(".Cycle").css("opacity", 1); });
		$("#Making_Area>div:last").bind('mouseout', function() { $(this).children(".Cycle").css("opacity", 0); });
		
		setTimeout(function() { webSave(); }, 200);
	});
	
	////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////
	
	$('#Pencil').draggable({
	
		drag: function( event, ui ) {
		
			var limit_chat_xloc = Math.floor(window.innerWidth * 0.65);
			var limit_chat_yloc = Math.floor(window.innerHeight * 0.6);
				
			ui.position.top = Math.min( limit_chat_yloc*1, ui.position.top );
			ui.position.left = Math.min( limit_chat_xloc*1, ui.position.left );
			
			$("#Pencil").css("left", ui.position.left*1 + 20 + 220 + window.innerWidth*0.04 );
			$("#Pencil").css("top", ui.position.top*1 + window.innerHeight * 0.1 );
	
			Index_Change("pencil");
			window.scrollTo({left:0});
		  }
	});
	
	$('#Pencil_Icon').bind('click', function(){
	
		if(Icon_Switch[3] == 0) {
			Icon_Switch[3] = 1;
			$("#Pencil").hide();
			$("#Pencil_Icon").attr("src","resources/img/Course/Pencil.png");
			
			$("#Making_Area").draggable("enable");
			$("#canvas").css("z-index", 29);
			
			canvas.removeEventListener("mousedown", listener);
			canvas.removeEventListener("mousemove", listener);
			canvas.removeEventListener("mouseup", listener);
			canvas.removeEventListener("mouseout", listener);
		} else {
			Icon_Switch[3] = 0;
			$("#Pencil").show();
			$("#Pencil_Icon").attr("src","resources/img/Course/Pencil2.png");
			
			canvas.addEventListener("mousedown", listener);
			canvas.addEventListener("mousemove", listener);
			canvas.addEventListener("mouseup", listener);
			canvas.addEventListener("mouseout", listener);
			
			$("#Making_Area").draggable("disable");
			$("#canvas").css("z-index", 50);
			Index_Change("pencil");
			
			now_pencil = "pencil";
			$("#Pencil_Pencil>img").attr("src","resources/img/Course/Pencil2.png");
			$("#Pencil_Eraser>img").attr("src","resources/img/Course/Eraser.png");
			$("#Pencil_Pencil").css("background-color", color_save);
		}
	});
	
	$('#Pencil_Close').bind('click', function(){
		Icon_Switch[3] = 1;
		$("#Pencil").hide();
		$("#Pencil_Icon").attr("src","resources/img/Course/Pencil.png");
		
		$("#Making_Area").draggable("enable");
		$("#canvas").css("z-index", 29);
		
		canvas.removeEventListener("mousedown", listener);
		canvas.removeEventListener("mousemove", listener);
		canvas.removeEventListener("mouseup", listener);
		canvas.removeEventListener("mouseout", listener);
	});
	
	$('#Pencil').bind('dblclick', function(){
		Icon_Switch[3] = 1;
		$("#Pencil").hide();
		$("#Pencil_Icon").attr("src","resources/img/Course/Pencil.png");
		
		$("#Making_Area").draggable("enable");
		$("#canvas").css("z-index", 29);
		
		canvas.removeEventListener("mousedown", listener);
		canvas.removeEventListener("mousemove", listener);
		canvas.removeEventListener("mouseup", listener);
		canvas.removeEventListener("mouseout", listener);
	});
		
	///////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////
	
	$('.Detail').draggable({
	
		drag: function( event, ui ) {
		
			Dragging = true;

			if( $(this).parents("div").attr('id') != "Making_Area" ) { 
				ui.position.top = Math.min( 0, 0 );
				ui.position.left = Math.min( 0, 0 );
			} else {
				// 이후 영역 제한이 필요하다면 이곳에 추가. 근데 귀찮아서 안할듯. HeartIn도 마찬가지
			}
		},
		
		stop: function() { setTimeout(function() { Dragging=false; webSave(); }, 200); }
	});
	
	$(".Detail").bind('click', function(){
	

			$("#Making_Area").append($(this).clone());
			
			var id = $("#Making_Area>div:last").attr("id");
			$("#Making_Area>div:last").addClass(id+"_"+detail_count);
			
			$("#Making_Area>div:last").css("left", 0).css("top", 0).css("position", "absolute");
			$("#Making_Area>div:last").children(".Heart_In").remove();
			
			$("#Making_Area>div:last").draggable({
				drag: function(){Dragging = true;},
				stop: function() { setTimeout(function() { Dragging=false; webSave();}, 200); }		
			});
			
			$("#Making_Area>div:last").bind('click', function() { 
				var arr = $(this).attr('class').split(" ");
				$("."+arr[4]).remove(); $("#q_"+arr[4]).remove(); 
				Q_Delete(Course_Q, -1, arr[4]);
				setTimeout(function() { Dragging=false; webSave(); }, 200);
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
			setTimeout(function() { webSave(); }, 200);
			Q_Update();

	});
	
	$(".Detail_Img").bind('click', function(){
		if(Dragging == true){return;}
		 window.open('http://www.naver.com', '상세 정보 페이지');
		 return false;
		 // 이후 이미지 클릭마다 페이지 이동 관련 수정할때 이 부분 건드려야 함. HeartIn도 마찬가지.
	});
	
	////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////
	
	
	$(".Heart_In").bind('click', function(){
	
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
}

////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////

function Index_Change(target) {

	$(".Icon").css("z-index", "50");
	$("#Chat").css("z-index", "50");
    $(".Search_Area").css("z-index", "30");
	$("#Making_Area").css("z-index", "30");
	$("#Pencil").css("z-index", "29");
	$("#Queue_List").css("z-index", "30");

	if(target == "chat") { $("#Chat_Icon").css("z-index", "51");$("#Chat").css("z-index", "31");  }
	else if(target == "hotel") { $("#Hotel_Icon").css("z-index", "51");$("#Hotel").css("z-index", "31");  }
	else if(target == "food") { $("#Food_Icon").css("z-index", "51");$("#Food").css("z-index", "31");  }
	else if(target == "gp") { $("#GP_Icon").css("z-index", "51");$("#GP").css("z-index", "31");  }
	else if(target == "bus") { $("#Bus_Icon").css("z-index", "51");$("#Bus").css("z-index", "31");  }
	else if(target == "map") { $("#Map_Icon").css("z-index", "51");$("#Map").css("z-index", "31");  }
	else if(target == "heart") { $("#Heart_Icon").css("z-index", "51");$("#Heart").css("z-index", "31");  }
    else if(target == "book") { $("#Making_Icon").css("z-index", "51");$("#Making_Area").css("z-index", "31"); $("#Queue_All").css("z-index", "31"); }
    else if(target == "sticker") { $("#Sticker_Icon").css("z-index", "51");$("#Sticker").css("z-index", "31");  }
    else if(target == "pencil") { $("#Pencil_Icon").css("z-index", "51");$("#Pencil").css("z-index", "31");  }
}

////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////

var Q_Size = "big";

$("#Queue_Size").bind('click', function() {
	if(Q_Size == "big") { 
		$("#Queue_All").css("width", "3vw");
		$("#Queue_All").children('div').hide();
		$("#Queue_Size").attr("src", "resources/img/Course/Plus.png"); 
		Q_Size = "small";
	}
	else { 
		$("#Queue_All").children('div').show(); 
		$("#Queue_All").css("width", "50%");
		$("#Queue_Size").attr("src", "resources/img/Course/Minus.png"); 
		Q_Size = "big";
	}
}); 

function Q_Update() {

	if(Q_Size == "big") { $("#Queue_All").html('<img id="Queue_Size" src="resources/img/Course/Minus.png">');}
	else { $("#Queue_All").html('<img id="Queue_Size" src="resources/img/Course/Plus.png">'); }
	
	$("#Queue_Size").bind('click', function() {
		if(Q_Size == "big") { 
			$("#Queue_All").css("width", "3vw");
			$("#Queue_All").children('div').hide();
			$("#Queue_Size").attr("src", "resources/img/Course/Plus.png"); 
			Q_Size = "small";
		}
		else { 
			$("#Queue_All").children('div').show(); 
			$("#Queue_All").css("width", "50%");
			$("#Queue_Size").attr("src", "resources/img/Course/Minus.png"); 
			Q_Size = "big";
		}
	});
	
	var temp = '';
	var count = 1;
	
	temp += "<div class='Queue_List'> <div id='Q_Start' class='Queue_One'>시 작</div> &nbsp;&nbsp; <div class='Queue_Next'></div> &nbsp;&nbsp;"; // 여기
	
	for(var j=0; j<=Course_Q.length/5; j++) {
	
		for(var i=j*5; i<j*5+5; i++) {
		
			try {
				if(Course_Q[i] == null) {continue;}
			} catch(e){}
			
			var id = Course_Q[i];
			var title = '';
		
			temp += '<div class="Queue_One" id="q_' + id + '">';

			if(id.includes("map_detail_")) { title = $("."+id).children('h5').html(); }
			else { title = $("."+id).children('span:first').children('b').html(); title = title + ""; title = title.substr(3, title.length-6); }

			temp += title + '</div> &nbsp;&nbsp';
			if( i != Course_Q.length-1 ) { temp += "<div class='Queue_Next'></div> &nbsp;&nbsp;"; }
			else { }
		}
	}
	
	temp += "<div class='Queue_Next'></div> &nbsp;&nbsp;<div id='Q_End' class='Queue_One'>종 료</div></div>"; // 여기
	
	$("#Queue_All").append(temp);
	
	if(Q_Size == "small") { $("#Queue_All").children('div').hide();}
	else {  $("#Queue_All").children('div').show(); }
	
	Q_Bind();
	Q_Index_Update();
	Q_Drag_Grant();
} 

function Q_Bind() {
	$(".Queue_One").unbind('click');
	$(".Queue_One").bind('click', function() {
	
		if( Dragging == true ) { return false; }
		
		var id = $(this).attr("id").substr(2, $(this).attr("id").length);
		
		$(this).next().remove(); $("."+id).remove();
		Q_Delete(Course_Q, -1, id);
		Q_Update();
	}); 
	
	$("#Q_Start").unbind('click');
	$("#Q_End").unbind('click');
}

function Q_Delete(arr, index, content) {

	if(index != -1) {
		for(var i=index; i<arr.length-1; i++) { arr[i] = arr[i+1]; }
	} else {
		var index2 = 0;
		for(var i=0; i<arr.length; i++) {  if(arr[i]==content){index2=i;} }	
		for(var i=index2; i<arr.length-1; i++) { arr[i] = arr[i+1]; }
	}
	arr.pop();
}

function Q_Index_Update() {
	for(var i=1; i<Course_Q.length+1; i++) {
		$("."+Course_Q[i-1]).children(".Index_Num").children("b").html(i);
	}
}

function Q_Index_Return(id) {
	for(var i=0; i<Course_Q.length; i++) {
		if( Course_Q[i] == id ) { return i; }
	}
	return Course_Q.length;
}

function Q_Change(x, y) {

	var min; var max; var type;
	if( x > y ) { max=x; min=y; type="front"; } else { max=y; min=x; type="back";}
	
	var temp_min = Course_Q[min];
	var temp_max = Course_Q[max];

	if(type == "front") {
		for(var i=max; i>min; i--) {
			Course_Q[i] = Course_Q[i-1];
		}
		Course_Q[min] = temp_max;
	} else {
		for(var i=min; i<max-1; i++) {
			Course_Q[i] = Course_Q[i+1];
		}
		Course_Q[max-1] = temp_min;
	}
	
	Q_Update();
}

var Dragging_Target;

function Q_Drag_Grant() {

	$('.Queue_One').draggable({ 
		drag: function( event, ui ) {
		
			Dragging = true;
			Dragging_Target = $(this).attr('id');
		
            $("#Queue_All").scrollLeft(0);
            
  		},
  		stop: function() { setTimeout(function() { Dragging_Target=""; Dragging=false; }, 350); },
  		
  		revert : true
	});
	
	$( ".Queue_Next" ).droppable({
		drop: function( event, ui ) {
		
			var arr = Dragging_Target.split("q_");
			var main_id = arr[1];	
			
			var left_id = $(this).prev().attr("id").split("q_");
			var right_id = $(this).next().attr("id").split("q_");

			if( Dragging_Target == $(this).prev().attr("id") ) { alert("경고! 옳지 않은 행동 ! 반복시 강제종료 !"); return; }
			if( Dragging_Target == $(this).next().attr("id") ) { alert("경고! 옳지 않은 행동 ! 반복시 강제종료 !"); return; }
			
			var point_index = Q_Index_Return(main_id);
			var left_index = Q_Index_Return(left_id[1]);
			var right_index = Q_Index_Return(right_id[1]);

			Q_Change(point_index, right_index);
		}
	});
	
	$( "#Q_Start" ).draggable( "destroy" );
	$( "#Q_End" ).draggable( "destroy" );
}

////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////

function scUpdate() {

	var title = $("#Content_Title").val();
	var tag = $("#Content_Tag").val();
	var content = $("#Making_Area").html();
	var open = $(':radio[name="open_check"]:checked').val();
	
	const imgBase64 = canvas.toDataURL('image/png', 'image/octet-stream');
	const decodImg = atob(imgBase64.split(',')[1]);

	const img = imgBase64.replace("data:image/png;base64," ,"");
	
	 let array = [];
	 for (let i = 0; i < decodImg.length; i++) {
	    array.push(decodImg.charCodeAt(i));
	 }

	var temp = [];
	temp = content.split('<img class="Close" id="Making_Close" src="resources/img/Course/Close.png">');
	content = temp[1];
	
	var q = "START";
	for(var i=0; i<Course_Q.length; i++) {
		q += "&&" + Course_Q[i];
	}
	
	var Room = {
		"tc_title":title,
		"tc_content":content,
		"tc_open":open,
		"tc_tag":tag,
		"tc_jpg":img,
		"tc_q":q
	}
	
	ws.send(Room);
}

function save() {

	var title = $("#Content_Title").val();
	var tag = $("#Content_Tag").val();
	var content = $("#Making_Area").html();
	var open = $(':radio[name="open_check"]:checked').val();
	
	const imgBase64 = canvas.toDataURL('image/png', 'image/octet-stream');
	const decodImg = atob(imgBase64.split(',')[1]);

	const img = imgBase64.replace("data:image/png;base64," ,"");
	
	 let array = [];
	 for (let i = 0; i < decodImg.length; i++) {
	    array.push(decodImg.charCodeAt(i));
	 }

	var temp = [];
	content = content.replace('<div class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se" style="z-index: 90; display: none;"></div>', "");
	content = content.replace('<div class="ui-resizable-handle ui-resizable-s" style="z-index: 90; display: none;"></div>', "");
	content = content.replace('<div class="ui-resizable-handle ui-resizable-e" style="z-index: 90; display: none;"></div>', "");
	content = content.split('<img class="Close" id="Making_Close" src="resources/img/Course/Close.png">');
	content = content[1];
	
	var q = "START";
	for(var i=0; i<Course_Q.length; i++) {
		q += "&&" + Course_Q[i];
	}
	
	var Room = {
		"tc_title":title,
		"tc_content":content,
		"tc_open":open,
		"tc_tag":tag,
		"tc_jpg":img,
		"tc_q":q,
		"tc_dc":detail_count
	}

	$.ajax({
		type:"post",
		url:"roomsave.do",
		data:JSON.stringify(Room),
		contentType:"application/json",
		dataType:"json",
		success:function(msg) {
			if(msg.check == true) {
				var back = confirm(" 저장 완료 \n 현재 페이지에서 나가시겠습니까? ");
				if(back==true) {location.href="mypage.do";}
			} else {
				alert("[F] 오류가 발생하였습니다. 반복된다면 문의 부탁드립니다.");
			}
		},
		error:function() {
			alert("[E] 오류가 발생하였습니다. 반복된다면 문의 부탁드립니다.");
		}
	});
	
    Icon_Switch[9] = 1;
	$("#Save_Area").hide(); $("#Black_Mask").hide();
	$("#Save_Icon").attr("src","resources/img/Course/Save.png");
}

function webSave() {

	var content = $("#Making_Area").html();
	var content2 = [];
	var content3 = [];
	
	content2 = content.split('<span></span>');

	var q = "START";
	for(var i=0; i<Course_Q.length; i++) {
		q += "&&" + Course_Q[i];
	}
	
	var all = "webSave" + "&websplit&" + content2[1] + "&websplit&" +  q +  "&websplit&" + detail_count;
	
	ws.send(all);
}

////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////

function remakeLoading() {

	Course_Q = tc_q.split("&&");
	
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
	
	//////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////
	
	$("#Making_Area>.Detail").unbind('click');
	$("#Making_Area>.Sticker").unbind('click');
	
	$("#Making_Area>.Detail").bind('click', function() { 
		var arr = $(this).attr('class').split(" ");
		$("."+arr[4]).remove(); $("#q_"+arr[4]).remove(); 
		Q_Delete(Course_Q, -1, arr[4]);
		Q_Update();
	});
	
	$("#Making_Area>.Sticker_One").bind('click', function() { 
		$(this).remove();
	});
	
	//////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////

	var img = new Image();
	img.src = png;
	
	img.onload = function() {
		ctx.drawImage(img, 0, 0)
	};
	
}








