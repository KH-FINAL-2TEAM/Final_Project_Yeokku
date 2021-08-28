
var pos = { drawable: false, x: -1, y: -1 };
var canvas, ctx;
var Line_Width = 1;
var Line_Color = 'black';

canvas = document.getElementById("canvas");
ctx = canvas.getContext("2d");
ctx.lineWidth = 1;

function listener(event){
    switch(event.type){
        case "mousedown": initDraw(event); draw(event); break;
        case "mousemove": if(pos.drawable) { draw(event); }  break;
        case "mouseout": 
        case "mouseup": finishDraw(); break;
    }
}

//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

function initDraw(event){
    ctx.beginPath();
    pos.drawable = true;
    var coors = getPosition(event);
    pos.X = coors.X;
    pos.Y = coors.Y;
    ctx.moveTo(pos.X, pos.Y);
}
 
function draw(event){
	var coors = getPosition(event);
	
	if(now_pencil == "pencil") {
	    ctx.lineTo(coors.X, coors.Y);
	    pos.X = coors.X;
	    pos.Y = coors.Y;
	    ctx.stroke();
	} else if ( now_pencil == "eraser" ) {
		ctx.clearRect(coors.X-Line_Width/2, coors.Y-Line_Width/2, Line_Width, Line_Width);
	}
}
 
function finishDraw(){
    pos.drawable = false;
    pos.X = -1;
    pos.Y = -1;
}
 
function getPosition(event){
    var x = event.pageX - canvas.offsetLeft - $("#canvas").offset().left;
    var y = event.pageY - canvas.offsetTop - $("#canvas").offset().top;
    
    x = x*1960/parseInt($("#canvas").css("width"));
    y = y*1280/parseInt($("#canvas").css("height"));
    
    return {X: x, Y: y};
}

//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

var color_save = "black";

function init(){

	var tag = "";
	var pallet = [["#FF0000", "#FF5E00", "#FFBB00", "#FFE400", "#ABF200", "#1DDB16", "#00D8FF", "#0054FF", "#0100FF", "#5F00FF", "#FF00DD", "#FF007F", "#000000", "#FFFFFF"],
	              ["#FFD8D8", "#FAE0D4", "#FAECC5", "#FAF4C0", "#E4F7BA", "#CEFBC9", "#D4F4FA", "#D9E5FF", "#DAD9FF", "#E8D9FF", "#FFD9FA", "#FFD9EC", "#F6F6F6", "#EAEAEA"],
	              ["#FFA7A7", "#FFC19E", "#FFE08C", "#FAED7D", "#CEF279", "#B7F0B1", "#B2EBF4", "#B2CCFF", "#B5B2FF", "#D1B2FF", "#FFB2F5", "#FFB2D9", "#D5D5D5", "#BDBDBD"],
	              ["#F15F5F", "#F29661", "#F2CB61", "#E5D85C", "#BCE55C", "#86E57F", "#5CD1E5", "#6799FF", "#6B66FF", "#A566FF", "#F361DC", "#F361A6", "#A6A6A6", "#8C8C8C"],
	              ["#CC3D3D", "#CC723D", "#CCA63D", "#C4B73B", "#9FC93C", "#47C83E", "#3DB7CC", "#4374D9", "#4641D9", "#8041D9", "#D941C5", "#D9418C", "#747474", "#5D5D5D"],
	              ["#980000", "#993800", "#997000", "#998A00", "#6B9900", "#2F9D27", "#008299", "#003399", "#050099", "#3F0099", "#990085", "#99004C", "#4C4C4C", "#353535"],
	              ["#670000", "#662500", "#664B00", "#665C00", "#476600", "#22741C", "#005766", "#002266", "#030066", "#2A0066", "#660058", "#660033", "#212121", "#191919"]];
	
	for(i=0; i<pallet.length; i++){
		for(j=0; j<pallet[i].length; j++){
	    	tag += "<div id="+pallet[i][j]+" class='Color_Box_One' onclick='colorSet(this)'></div>";
	  	}
	  	tag +="<br>";
	}
	
	document.getElementById("Pallet_Box").innerHTML = tag;
	var colorBox = document.getElementsByClassName("Color_Box_One");
	for(i=0; i<colorBox.length; i++){ colorBox[i].style.background = colorBox[i].id; }
}

init();

function colorSet(target){ 
	color_save = target.id;
	ctx.strokeStyle = target.id;
	$("#Pencil_Pencil").css("background-color", target.id); 
	now_pencil = "pencil";
	$("#Pencil_Pencil>img").attr("src","resources/img/making/Pencil2.png");
	$("#Pencil_Eraser>img").attr("src","resources/img/making/Eraser.png");
}

//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

var now_pencil = "pencil";

$('#Pencil_Pencil').bind('click', function(){
	if(now_pencil == "pencil") { return; }
	now_pencil = "pencil";
	$("#Pencil_Pencil>img").attr("src","resources/img/making/Pencil2.png");
	$("#Pencil_Eraser>img").attr("src","resources/img/making/Eraser.png");
	$("#Pencil_Pencil").css("background-color", color_save);
});

$('#Pencil_Eraser').bind('click', function(){
	if(now_pencil == "eraser") { return; }
	now_pencil = "eraser";
	$("#Pencil_Pencil").css("background-color","rgba(255, 255, 255, 0)");
	$("#Pencil_Pencil>img").attr("src","resources/img/making/Pencil.png");
	$("#Pencil_Eraser>img").attr("src","resources/img/making/Eraser2.png");
});

$('#Pencil_Size').draggable({
	
		drag: function( event, ui ) {
		
			if( ui.position.left >= 1 ) {
			  	ui.position.left = Math.min( 170, ui.position.left );
				ui.position.top = Math.min( 5, 5 );
			} else { ui.position.left = 1;  ui.position.top = Math.min( 5, 5 ); }
			
				Line_Width = ui.position.left/5 + 1;
				ctx.lineWidth = Line_Width;
				$("#Pencil_Size>span").html(Line_Width);
		  }
	});
