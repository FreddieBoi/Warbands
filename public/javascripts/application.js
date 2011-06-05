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

function update_items() {
  // Move replaced items back somehow.
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
  

  $(".droppable").droppable({
    drop: function( event, ui ) {
      var item_id = ui.draggable.attr("data-id");
      $(".droppable [data-id="+item_id+"]").remove();
      $("<li></li>", {
        "html": ui.draggable.html(),
        "data-id": item_id,
        "class": "draggable item"
      }).appendTo(this);
      
      //$("#inventory [data-id="+item_id+"]").remove();
      var member_id = $(this).parent().attr("data-id");
      var warband_id = $(this).attr("data-id");
      if (member_id !== undefined) {
        var url = "/members/"+member_id; // Go to members/:id path
        var data = { "member[id]": member_id,
                     "item_id": item_id, // The item to equip
                     "_method": "put" }; // Use members#update (not show)
        $.post(url, data, update_items, "json");
      } else if (warband_id !== undefined) {
        var url = "/warbands/"+warband_id; // Go to members/:id path
        var data = { "warband[id]": warband_id,
                     "item_id": item_id, // The item to equip
                     "_method": "put" }; // Use members#update (not show)
        $.post(url, data, update_items, "json");
      }
    }
  }).sortable({
    items: "li:not(.placeholder)",
    sort: function() {
        $(this).removeClass("ui-state-default");
    }
  });
});