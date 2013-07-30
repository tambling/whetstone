var SavedResourceController = {
  initialize: function(){
    $('body').on('ajax:success','.save_resource', SavedResourceController.flashMessage)
  },

  flashMessage: function(event, message){
    console.log(message);
  }
}

$(document).ready( function() {
  var url=window.location.pathname+"/update_queue"
  $( ".sortable" ).sortable({
    update: function(){
      $.post(url, {queue: $(this).sortable('toArray')})
    }
  });
  $( ".sortable" ).disableSelection();
});

