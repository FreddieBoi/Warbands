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
  
  // Show form error messages if any
  clientSideValidations.callbacks.element.fail = function(element, message, callback) {
    callback();
    if (element.data('valid') !== false) {
      element.parent().find('.message').hide().show('slide', {direction: "left", easing: "easeOutBounce"}, 500);
    }
  }
  
  clientSideValidations.callbacks.element.pass = function(element, callback) {
    // Take note how we're passing the callback to the hide() 
    // method so it is run after the animation is complete.
    element.parent().find('.message').hide('slide', {direction: "left"}, 500, callback);
  }

  $("#warbands th a, #warbands .pagination a, #users th a, #users .pagination a, #regions th a, #regions .pagination a, #members th a, #members .pagination a, #items th a, #items .pagination a, #news th a, #news .pagination a, #enemies th a, #enemies .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#warbands_search").submit( function() {
    $.get(this.action, $(this).serialize(), null, "script");
    return false;
  });
  $("#warbands_search input").keyup( function() {
    $.get($("#warbands_search").attr("action"), $("#warbands_search").serialize(), null, "script");
    return false;
  });
  $("#users_search").submit( function() {
    $.get(this.action, $(this).serialize(), null, "script");
    return false;
  });
  $("#users_search input").keyup( function() {
    $.get($("#users_search").attr("action"), $("#users_search").serialize(), null, "script");
    return false;
  });
  $("#regions_search").submit( function() {
    $.get(this.action, $(this).serialize(), null, "script");
    return false;
  });
  $("#regions_search input").keyup( function() {
    $.get($("#regions_search").attr("action"), $("#regions_search").serialize(), null, "script");
    return false;
  });
  $("#members_search").submit( function() {
    $.get(this.action, $(this).serialize(), null, "script");
    return false;
  });
  $("#members_search input").keyup( function() {
    $.get($("#members_search").attr("action"), $("#members_search").serialize(), null, "script");
    return false;
  });
  $("#items_search").submit( function() {
    $.get(this.action, $(this).serialize(), null, "script");
    return false;
  });
  $("#items_search input").keyup( function() {
    $.get($("#items_search").attr("action"), $("#items_search").serialize(), null, "script");
    return false;
  });
  $("#news_search").submit( function() {
    $.get(this.action, $(this).serialize(), null, "script");
    return false;
  });
  $("#news_search input").keyup( function() {
    $.get($("#news_search").attr("action"), $("#news_search").serialize(), null, "script");
    return false;
  });
  $("#enemies_search").submit( function() {
    $.get(this.action, $(this).serialize(), null, "script");
    return false;
  });
  $("#enemies_search input").keyup( function() {
    $.get($("#enemies_search").attr("action"), $("#enemies_search").serialize(), null, "script");
    return false;
  });

});