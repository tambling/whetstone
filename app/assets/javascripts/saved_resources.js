var SavedResourceController = {
  initialize: function(){
    $('body').on('ajax:success','.save_resource', SavedResourceController.flashMessage)
  },

  flashMessage: function(event, message){
    alertify.success("Saved To Goals ...");
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

