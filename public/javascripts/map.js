var canvas;
var context;
var bg;
var generalObj;
var mapWidth;
var mapHeight;

$( function() {
  $("#map").live("click", function(e) {
    var pos = getCursorPosition(e);
    //$.getScript(this.href);
    $.post(this.href, { x: pos.x, y: pos.y },
    function(data){
      alert("success");
    }, "json");
    return false;
  });
  canvas = $("#map")[0];
  if(canvas.getContext) {

  } else {
    alert("Sorry, but the Canvas element is not supported by your browser!");
  }
});
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

  //x = Math.floor(x/80)*80+29;
  //y = Math.floor(y/80)*80+24;

  var pos = new Object();
  pos.x = x;
  pos.y = y;
  return pos;
}