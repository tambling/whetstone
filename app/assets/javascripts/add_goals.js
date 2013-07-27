$(document).ready(function(){
  $("#add_goal").on('click', function(){
    var destination = window.location.pathname+'/stones_users'
    $.post(destination).success(function(){$('#add_goal').hide()});
  });
});
