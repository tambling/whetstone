$(document).ready(function(){

  $('form#new_message').bind("ajax:success", function(evt, data, status, xhr){
    if ($('form#new_message textarea').val()!=""){
      $('#messages').append(data);
    }
    $('form#new_message textarea').val("");
  });
});
