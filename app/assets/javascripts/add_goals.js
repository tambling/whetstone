$(document).ready(function(){
  $("#add_goal").on('click', function(){
    var destination = window.location.pathname+'/goals'
    $.post(destination).success(function(){$('#add_goal').hide()});
  });
});
