
var Icon_Switch = [ 1, 0, 1, 1, 1, 1, 1, 0, 1 ];
var Alarm_Check = true;

var Menu_Lock = "Lock";
var Menu_Loading = false;

var Dragging = false;
var Map_Dragging = false;

window.onload = function()
{	
	$("#Chat").hide();	$(".Search_Area").hide(); $("#Hotel").show();
	$("#Chat").resizable({ autoHide: true });
	$(".Detail").resizable({ autoHide: true });
	$("#Making_Area").resizable({ autoHide: true });
	$(".Search_Area").resizable({ 
		aspectRatio: false, 
		autoHide: true
	});
	$(".Search_Area").css("position", "absolute");
	
	$("#Alarm_Img").bind('click', function() {
		if(Alarm_Check == true) { 
			Alarm_Check = false;
			$(this).attr("src", "resources/img/making/Alarm.png");
		} else {
			Alarm_Check = true;
			$(this).attr("src", "resources/img/making/Alarm2.png");
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
			$(this).attr("src", "resources/img/making/Lock.png");
		} else {
			Menu_Lock = "Unlock";
			$('header').animate( { left:'-100%', right:'100%'}, 300, 'linear');
			$(this).attr("src", "resources/img/making/Unlock.png?ver=1");
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
  		}
	});
	
	$('#Chat_Icon').bind('click', function(){

		if(Icon_Switch[0] == 0) {
			Icon_Switch[0] = 1;
			$("#Chat").hide();
			$("#Chat_Icon").attr("src","resources/img/making/Chat.png");
		} else {
			Icon_Switch[0] = 0;
			$("#Chat").show();
			$("#Chat_Icon").attr("src","resources/img/making/Chat2.png");

            Index_Change("chat");
		}
	});
	
	$('#Chat_Close').bind('click', function(){
		Icon_Switch[0] = 1;
		$("#Chat").hide();
		$("#Chat_Icon").attr("src","resources/img/making/Chat.png");
	});
	
	$('#Chat').bind('dblclick', function(){
		Icon_Switch[0] = 1;
		$("#Chat").hide();
		$("#Chat_Icon").attr("src","resources/img/making/Chat.png");
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
  		}
	});
	
	$('#Hotel_Icon').bind('click', function(){

		if(Icon_Switch[1] == 0) {
			Icon_Switch[1] = 1;
			$("#Hotel").hide();
			$("#Hotel_Icon").attr("src","resources/img/making/Hotel.png");
		} else {
			Icon_Switch[1] = 0;
			$("#Hotel").show();
			$("#Hotel_Icon").attr("src","resources/img/making/Hotel2.png");

            Index_Change("hotel");
		}
	});
	
	$('#Hotel_Close').bind('click', function(){
		Icon_Switch[1] = 1;
		$("#Hotel").hide();
		$("#Hotel_Icon").attr("src","resources/img/making/Hotel.png");
	});
	
	$('#Hotel').bind('dblclick', function(){
		Icon_Switch[1] = 1;
		$("#Hotel").hide();
		$("#Hotel_Icon").attr("src","resources/img/making/Hotel.png");
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
  		}
	});
	
	$('#Food_Icon').bind('click', function(){

		if(Icon_Switch[2] == 0) {
			Icon_Switch[2] = 1;
			$("#Food").hide();
			$("#Food_Icon").attr("src","resources/img/making/Food.png");
		} else {
			Icon_Switch[2] = 0;
			$("#Food").show();
			$("#Food_Icon").attr("src","resources/img/making/Food2.png");

            Index_Change("food");
		}
	});
	
	$('#Food_Close').bind('click', function(){
		Icon_Switch[2] = 1;
		$("#Food").hide();
		$("#Food_Icon").attr("src","resources/img/making/Food.png");
	});
	
	$('#Food').bind('dblclick', function(){
		Icon_Switch[2] = 1;
		$("#Food").hide();
		$("#Food_Icon").attr("src","resources/img/making/Food.png");
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
  		}
	});
	
	$('#GP_Icon').bind('click', function(){

		if(Icon_Switch[3] == 0) {
			Icon_Switch[3] = 1;
			$("#GP").hide();
			$("#GP_Icon").attr("src","resources/img/making/GoodPoint.png");
		} else {
			Icon_Switch[3] = 0;
			$("#GP").show();
			$("#GP_Icon").attr("src","resources/img/making/GoodPoint2.png");

            Index_Change("gp");
		}
	});
	
	$('#GP_Close').bind('click', function(){
		Icon_Switch[3] = 1;
		$("#GP").hide();
		$("#GP_Icon").attr("src","resources/img/making/GoodPoint.png");
	});
	
	$('#GP').bind('dblclick', function(){
		Icon_Switch[3] = 1;
		$("#GP").hide();
		$("#GP_Icon").attr("src","resources/img/making/GoodPoint.png");
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
  		}
	});
	
	$('#Bus_Icon').bind('click', function(){

		if(Icon_Switch[4] == 0) {
			Icon_Switch[4] = 1;
			$("#Bus").hide();
			$("#Bus_Icon").attr("src","resources/img/making/Bus.png");
		} else {
			Icon_Switch[4] = 0;
			$("#Bus").show();
			$("#Bus_Icon").attr("src","resources/img/making/Bus2.png");

            Index_Change("bus");
		}
	});
	
	$('#Bus_Close').bind('click', function(){
		Icon_Switch[4] = 1;
		$("#Bus").hide();
		$("#Bus_Icon").attr("src","resources/img/making/Bus.png");
	});
	
	$('#Bus').bind('dblclick', function(){
		Icon_Switch[4] = 1;
		$("#Bus").hide();
		$("#Bus_Icon").attr("src","resources/img/making/Bus.png");
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
  		}
	});
	
	$('#Map_Icon').bind('click', function(){

		if(Icon_Switch[5] == 0) {
			Icon_Switch[5] = 1;
			$("#Map").hide();
			$("#Map_Icon").attr("src","resources/img/making/Map.png");
		} else {
			Icon_Switch[5] = 0;
			$("#Map").show();
			$("#Map_Icon").attr("src","resources/img/making/Map2.png");

            Index_Change("map");
		}
	});
	
	$('#Map_Close').bind('click', function(){
		Icon_Switch[5] = 1;
		$("#Map").hide();
		$("#Map_Icon").attr("src","resources/img/making/Map.png");
	});
	
	$('#Map').bind('dblclick', function(){
		Icon_Switch[5] = 1;
		$("#Map").hide();
		$("#Map_Icon").attr("src","resources/img/making/Map.png");
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
  		}
	});
	
	$('#Heart_Icon').bind('click', function(){

		if(Icon_Switch[6] == 0) {
			Icon_Switch[6] = 1;
			$("#Heart").hide();
			$("#Heart_Icon").attr("src","resources/img/making/Heart.png");
		} else {
			Icon_Switch[6] = 0;
			$("#Heart").show();
			$("#Heart_Icon").attr("src","resources/img/making/Heart2.png");

            Index_Change("heart");
		}
	});
	
	$('#Heart_Close').bind('click', function(){
		Icon_Switch[6] = 1;
		$("#Heart").hide();
		$("#Heart_Icon").attr("src","resources/img/making/Heart.png");
	});
	
	$('#Heart').bind('dblclick', function(){
		Icon_Switch[6] = 1;
		$("#Heart").hide();
		$("#Heart_Icon").attr("src","resources/img/making/Heart.png");
	});
	
	////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////
	
	$('#Making_Area').draggable({
	
		drag: function( event, ui ) {
		
			var limit_chat_xloc = Math.floor(window.innerWidth * 0.3);
			var limit_chat_yloc = Math.floor(window.innerHeight * 0.6);
				
			ui.position.top = Math.min( limit_chat_yloc*1, ui.position.top );
			ui.position.left = Math.min( limit_chat_xloc*1, ui.position.left );
			
			$("#Making_Area").css("left", ui.position.left*1 );
			$("#Making_Area").css("top", ui.position.top*1 - window.innerHeight * 0.075 );

            Index_Change("book");
  		}
	});
	
	$('#Book_Icon').bind('click', function(){

		if(Icon_Switch[7] == 0) {
			Icon_Switch[7] = 1;
			$("#Making_Area").hide();
			$("#Book_Icon").attr("src","resources/img/making/Book.png");
		} else {
			Icon_Switch[7] = 0;
			$("#Making_Area").show();
			$("#Book_Icon").attr("src","resources/img/making/Book2.png");

            Index_Change("book");
		}
	});
	
	$('#Making_Close').bind('click', function(){
		Icon_Switch[7] = 1;
		$("#Making_Area").hide();
		$("#Book_Icon").attr("src","resources/img/making/Book.png");
	});
	
	$('#Making_Area').bind('dblclick', function(){
		Icon_Switch[7] = 1;
		$("#Making_Area").hide();
		$("#Book_Icon").attr("src","resources/img/making/Book.png");
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
		  },
		  
		  stop: function() { setTimeout(function() { Dragging=false; }, 200); }
	});
	
	$('#Sticker_Icon').bind('click', function(){
	
		if(Icon_Switch[6] == 0) {
			Icon_Switch[6] = 1;
			$("#Sticker").hide();
			$("#Sticker_Icon").attr("src","resources/img/making/Sticker.png");
		} else {
			Icon_Switch[6] = 0;
			$("#Sticker").show();
			$("#Sticker_Icon").attr("src","resources/img/making/Sticker2.png");
	
			Index_Change("sticker");
		}
	});
	
	$('#Sticker_Close').bind('click', function(){
		Icon_Switch[6] = 1;
		$("#Sticker").hide();
		$("#Sticker_Icon").attr("src","resources/img/making/Sticker.png");
	});
	
	$('#Sticker').bind('dblclick', function(){
		Icon_Switch[6] = 1;
		$("#Sticker").hide();
		$("#Sticker_Icon").attr("src","resources/img/making/Sticker.png");
	});
	
	$(".Sticker").bind('click', function(){
		$("#Making_Area").append($(this).parent("div").clone());
		
		$("#Making_Area>div:last").draggable({
			drag: function( event, ui ) {Dragging = true;},
			stop: function() {setTimeout(function() { Dragging=false; }, 200);}
		})
			.bind('click', function(){ if(Dragging == false) {$(this).remove();} })
			.css("border","0px solid white")
			.css("position", "absolute")
			.resizable({
				autoHide: true, 
				aspectRatio: false,
				resize: function() {Dragging = true;},
				stop: function() {setTimeout(function() { Dragging=false; }, 200);}
			});
		
		$("#Making_Area>div:last>img:last").bind('click', function() {
			$(this).parent().rotate( parseInt($(this).attr("name")) + 45*1 );
			$(this).attr("name", parseInt($(this).attr("name")) + 45*1 );
			return false;
		});
		
		$("#Making_Area>div:last").bind('mouseover', function() { $(this).children(".Cycle").css("opacity", 1); });
		$("#Making_Area>div:last").bind('mouseout', function() { $(this).children(".Cycle").css("opacity", 0); });
	});
	
	////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////
	
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
		
		stop: function() { setTimeout(function() { Dragging=false; }, 200); }
	});
	
	$(".Detail").bind('click', function(){
	
		if( $(this).parents("div").attr('id') != "Making_Area" ) { 
			$("#Making_Area").append($(this)); 
			$(this).css("left", 0).css("top", 0).css("position", "absolute");
			$(this).children(".Heart_In").css("opacity", 0);
		} else {
			var origin_loc = $(this).attr("name");
			$("#" + origin_loc).append($(this));
			$(this).css("left", 0).css("top", 0).css("position", "relative");
			$(this).children(".Heart_In").css("opacity", 1);
		}
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
	
		if( $(this).attr("src") == "resources/img/making/Heart_In.png") { 
			$(this).attr("src", "resources/img/making/Heart_In2.png");
			$("#Heart").append($(this).parent().clone());
			
			$("#Heart>div:last").bind('click', function() {
				if(Dragging == true) {return false;}
				if( $(this).parents("div").attr('id') != "Making_Area" ) { 
					$("#Making_Area").append($(this)); 
					$(this).css("left", 0).css("top", 0);
				} else {
					$("#Heart").append($(this));
					$(this).css("left", 0).css("top", 0);
				}
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

				$("#"+temp).children(".Heart_In").attr("src", "resources/img/making/Heart_In.png");
			});
			
			$("#Heart>div:last>img:eq(1)").bind('click', function() {
				if(Dragging == true){return false;}
				window.open('http://www.naver.com', '상세 정보 페이지');
				return false;
			});
			
			$("#Heart>div:last>span").bind('mouseover', function(){ Dragging = true; });
			$("#Heart>div:last>span").bind('mouseout', function(){ Dragging = false; });
			
		} else {
			$(this).attr("src", "resources/img/making/Heart_In.png");
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

	if(target == "chat") { $("#Chat_Icon").css("z-index", "51");$("#Chat").css("z-index", "31");  }
	else if(target == "hotel") { $("#Hotel_Icon").css("z-index", "51");$("#Hotel").css("z-index", "31");  }
	else if(target == "food") { $("#Food_Icon").css("z-index", "51");$("#Food").css("z-index", "31");  }
	else if(target == "gp") { $("#GP_Icon").css("z-index", "51");$("#GP").css("z-index", "31");  }
	else if(target == "bus") { $("#Bus_Icon").css("z-index", "51");$("#Bus").css("z-index", "31");  }
	else if(target == "map") { $("#Map_Icon").css("z-index", "51");$("#Map").css("z-index", "31");  }
	else if(target == "heart") { $("#Heart_Icon").css("z-index", "51");$("#Heart").css("z-index", "31");  }
    else if(target == "book") { $("#Book_Icon").css("z-index", "51");$("#Making_Area").css("z-index", "31");  }
    else if(target == "sticker") { $("#Sticker_Icon").css("z-index", "51");$("#Sticker").css("z-index", "31");  }
}

////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////

