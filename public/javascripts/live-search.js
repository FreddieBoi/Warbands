$( function() {
  // Sort and pagination through ajax
  $("#warbands th a, #warbands .pagination a, #users th a, #users .pagination a, #regions th a, #regions .pagination a, #members th a, #members .pagination a, #items th a, #items .pagination a, #news th a, #news .pagination a, #enemies th a, #enemies .pagination a, #achievements th a, #achievements .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
  // Live search
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
  $("#achievements_search").submit( function() {
    $.get(this.action, $(this).serialize(), null, "script");
    return false;
  });
  $("#achievements_search input").keyup( function() {
    $.get($("#achievements_search").attr("action"), $("#achievements_search").serialize(), null, "script");
    return false;
  });
});