$(document).ready(function(){
  $('form#new_message').bind("ajax:success", function(evt, data, status, xhr){
    $('form#new_message textarea').val("");
    $('#messages').append(data);
  });
});
