$(document).ready(function(){
  window.location.href = "#bottom"
  $('form#new_message').bind("ajax:success", function(evt, data, status, xhr){
    if ($('form#new_message textarea').val()!=""){
      $('#messages').append(data);
      window.location.href = "#bottom"
    }
    $('form#new_message textarea').val("");
  });
});
