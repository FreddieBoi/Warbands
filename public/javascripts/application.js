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
});