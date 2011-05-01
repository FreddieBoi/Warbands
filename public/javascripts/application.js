// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$( function() {
  $("#warbands th a, #warbands .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#warbands_search input").keyup(function() {
    $.get($("#warbands_search").attr("action"), $("#warbands_search").serialize(), null, "script");
    return false;
  });
});
