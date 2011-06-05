// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// Animate the flash if any message to show
function animate_flash() {
  // Hide the flash div
  $(".flash").hide();
  // Nothing to show? Get out!
  if (!$(".flash").html())
    return;

  var flash = $(".flash")
  //flash.show();
  flash.fadeIn(400);
  // Wait a bit, then fadeOut and hide
  setTimeout( function() {
    flash.fadeOut(800, function() {
      flash.hide()
    })
  },
  3000);
}

// On document load do...
$( function() {
  // Animate flash if any message
  animate_flash();

  // $(".hpbar_inner").each(function() {
  // $(this).hover(function() {
  // $(this).parent().append("<div class='hp-text'>"+$(this).attr("data-hp")+"</div>");
  // }, function() {
  // $(".hp-text").remove();
  // });
  // });

  /*for (var i = 0; i < bars.length; i++) {
   bars[i].onmouseover = function() {
   alert(this.attr("data-hp"))
   this.html(this.attr("data-hp"));
   };
   }*/
  
  $(".draggable").draggable({
    containment: "#wrapper",
    revert: "invalid",
    appendTo: "body"
  }).disableSelection();
  
  /*$( "#inventory" ).droppable({
      drop: function( event, ui ) {
        $(this).find( "h3" ).html( "Dropped!" );
        ui.draggable.css('position', 'absolute')
        ui.draggable.css('left', $(this).offset().left);
        var offset = 0;
        $(this).children("li").each(function(i, element) {
          if ($(element).innerHTML !== ui.draggable.innerHTML) {
            offset += $(element).outerHeight();
          }
        });
        ui.draggable.css('top', $(this).offset().top+offset);
      }
    });*/
  $( ".droppable" ).droppable({
    drop: function( event, ui ) {
      //$(this).find( "h3" ).html( "Dropped!" );
      var item_id = ui.draggable.attr("data-id");
      $(".droppable [data-id="+item_id+"]").remove();
      var li = $("<li></li>", {
        "html": ui.draggable.html(),
        "data-id": item_id,
        "class": "draggable" 
      });
      /*li.draggable({
        containment: "#wrapper",
        revert: "invalid",
        appendTo: "body"
      }).disableSelection();*/
      li.appendTo(this);
      
      $("#inventory [data-id="+item_id+"]").remove();
      
      /*ui.draggable.css('position', 'absolute')
      ui.draggable.css('left', $(this).find(".item-slot").offset().left);
      ui.draggable.css('top', $(this).find(".item-slot").offset().top);*/
    }
  }).sortable({
    items: "li:not(.placeholder)",
    sort: function() {
        $(this).removeClass("ui-state-default");
    }
  });
  /*$( ".sortable" ).disableSelection();*/
});