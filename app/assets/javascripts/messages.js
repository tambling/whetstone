$(document).ready(function(){

  $('form#new_message').bind("ajax:success", function(evt, data, status, xhr){
    $('#messages').append(data);
    window.location.href = "#bottom";
    $('form#new_message textarea').val("");
  });
});
