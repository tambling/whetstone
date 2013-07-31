$(document).ready(function(){
  // TODO: why aren't you using remote => true?
  $("#add_goal").on('click', function(){
    var destination = window.location.pathname+'/stones_users'
    $.post(destination).success(function(){
    	$('#add_goal').hide();
    	alertify.success("Added To Your List of Goals");
    });
  });
});
