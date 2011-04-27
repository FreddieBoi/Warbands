/*
Author: DT
This is a mapmockup. It requires jQuery.
*/

var canvas;
var context;
var bg;
var generalObj;
var mapWidth;
var mapHeight;

$(document).ready(function() {
  
  canvas = document.getElementById('map');
  if (canvas.getContext) {
    context = canvas.getContext('2d');
    
    mapWidth = canvas.width;
    mapHeight = canvas.height;
    
    bg = new Image();
    bg.src = 'images/map_bg.png';
    bg.onload = function(){
      context.drawImage(bg,0,0);
    };
    
    generalImg = new Image();
    generalImg.src = 'images/huskarl.png';
/*    general.onload = function(){
      context.drawImage(general,0,0);
    };*/
    
    generalObj = new Object();
    generalObj.img = generalImg
    
    // give generaObj a draw function
    generalObj.draw = function(){
      context.drawImage(this.img ,this.x, this.y);
    }
    
    $(canvas).click(function(e) {
      var pos = getCursorPosition(e);
      generalObj.x = pos.x;
      generalObj.y = pos.y;
      redraw();
    });
    
    redraw();
    
  } else {
    alert("The Canvas element is not supported by your browser!");
  }
});

function redraw() {
  canvas.width = canvas.width; //clears the canvas
  context.drawImage(bg,0,0); // draw background
  generalObj.draw();
}

// an object ?
function Pos(x, y) {
  this.x = x;
  this.y = y;
}

function getCursorPosition(e) {
  var x;
  var y;
  if (e.pageX != undefined && e.pageY != undefined) {
    x = e.pageX;
    y = e.pageY;
  } else {
    x = 0;
    y = 0;
  }
  
  x -= canvas.offsetLeft;
  y -= canvas.offsetTop;
  
  x = Math.floor(x/80)*80+29;
  y = Math.floor(y/80)*80+24;
  
  var pos = new Pos(x,y);
  return pos;
}