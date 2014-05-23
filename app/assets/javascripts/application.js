// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require chosen-jquery
//= require dataTables/jquery.dataTables
//= require dataTables/jquery.dataTables.bootstrap3
//= require_tree .

$(function() {
  $("#user_list th a").on("click", function() {
    $.getScript(this.href);
    return false;
  });
  
  $("#user_list_search input").keyup(function() {
    $.get($("#user_list_search").attr("action"), $("#user_list_search").serialize(), null, "script");
    return false;
  });
  
  $("#user_list_search option").on("click", function() {
    $.get($("#user_list_search").attr("action"), $("#user_list_search").serialize(), null, "script");
    return false;
  });

  $('.datatable').dataTable({
    "sPaginationType": "bootstrap",
    "iDisplayLength": 50,
  });

  
  $("#role_list_search input").keyup(function() {
    $.get($("#role_list_search").attr("action"), $("#role_list_search").serialize(), null, "script");
    return false;
  });
  
  $("#role_list_search option").on("click", function() {
    $.get($("#role_list_search").attr("action"), $("#role_list_search").serialize(), null, "script");
    return false;
  });


});
