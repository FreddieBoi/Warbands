var canvas;
var context;
var bg;
var warband;
var mapWidth;
var mapHeight;

var mapItems = new Array();

// when document is loaded?
$(document).ready( function() {
  // register a click handler on the map/canvas
  $("#map").live("click", function(e) {
    var pos = getCursorPosition(e);
    // send an ajax request
    $.post(this.href, {
      pos_x: pos.x,
      pos_y: pos.y
    },
    getWarbandPos, "json");
    return false;
  });
  // create a warband and get its position
  warband = new Object();
  warband.img = new Image();
  warband.img.src = 'images/huskarl.png';
  warband.img.onload = function() {
    redraw();
  };
  warband.x = 0;
  warband.y = 0;
  getWarbandPos();

  canvas = $("#map")[0];

  if(canvas.getContext) {
    context = canvas.getContext('2d');

    bg = new Object();
    bg.img = new Image();
    bg.img.src = 'images/map_bg.png';
    bg.x = 0;
    bg.y = 0;
    bg.img.onload = function() {
      redraw();
    };
    // add the bg image
    mapItems.push(bg);
    mapItems.push(warband)

  } else {
    alert("Sorry, but the Canvas element is not supported by your browser!");
  }
});

function getWarbandPos() {
  $.get("warbands/1.json", updateWarbandPos, "json");
}

function updateWarbandPos(data) {
  warband.x = data['warband']['pos_x'];
  warband.y = data['warband']['pos_y'];
  redraw();
}

function redraw() {
  clearCanvas();
  for ( var obj in mapItems ) {
    context.drawImage(mapItems[obj].img, mapItems[obj].x, mapItems[obj].y);
  }
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

  //x = Math.floor(x/80)*80+29;
  //y = Math.floor(y/80)*80+24;

  var pos = new Object();
  pos.x = x;
  pos.y = y;
  return pos;
}

function clearCanvas() {
  context.clearRect(0, 0, canvas.width, canvas.height);
  var w = canvas.width;
  canvas.width = 1;
  canvas.width = w;
}