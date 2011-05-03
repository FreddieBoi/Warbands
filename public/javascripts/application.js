// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$( function() {
  $("#warbands th a, #warbands .pagination a, #users th a, #users .pagination a, #regions th a, #regions .pagination a, #members th a, #members .pagination a, #items th a, #items .pagination a").live("click", function() {
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
});