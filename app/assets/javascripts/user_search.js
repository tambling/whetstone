$(document).ready(function(){
  $('#user').submit(function(event){
    event.preventDefault();
    $.post('/users_search', {username: $('#user_username').val()}).success(function(response){
      $('#results').html(response);
    });
  });
});
