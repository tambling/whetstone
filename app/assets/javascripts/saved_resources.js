$(document).ready( function() {
  var url=window.location.pathname+"/update_queue"
  $( ".sortable" ).sortable({
    update: function(){
      $.post(url, {queue: $(this).sortable('toArray')})
    }
  });
  $( ".sortable" ).disableSelection();
});
