
var pos = {
    drawable: false,
    x: -1,
    y: -1
};
var canvas, ctx;
 
canvas = document.getElementById("canvas");
ctx = canvas.getContext("2d");

function listener(event){
    switch(event.type){
        case "mousedown":
            initDraw(event);
            break;
        case "mousemove":
            if(pos.drawable)
                draw(event);
            break;
        case "mouseout":
        case "mouseup":
            finishDraw();
            break;
    }
}

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
    ctx.lineTo(coors.X, coors.Y);
    pos.X = coors.X;
    pos.Y = coors.Y;
    ctx.stroke();
}
 
function finishDraw(){
    pos.drawable = false;
    pos.X = -1;
    pos.Y = -1;
}
 
function getPosition(event){
    var x = event.pageX - canvas.offsetLeft - $("#canvas").offset().left;
    var y = event.pageY - canvas.offsetTop - $("#canvas").offset().top;
    
    x = x*300/parseInt($("#canvas").css("width"));
    y = y*150/parseInt($("#canvas").css("height"));
    
    console.log($("#canvas").offset().left + " / " + $("#canvas").offset().top);
    
    return {X: x, Y: y};
}