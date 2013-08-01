var SavedResourceController = {
  initialize: function(){
    $('body').on('ajax:success','.save_resource', StatusHandler.successMessage);

    $(document).on('ajax:error', StatusHandler.errorMessage)
  }
}

$(document).ready( function(){
  // $('.sortable').on("click", function() {

  //   var url=window.location.pathname+"/update_queue"
  //   $(document).find('.sortable').sortable({
  //     update: function(){
  //       $.post(url, {queue: $(this).sortable('toArray')})
  //     }
  //   });
  //   $( ".sortable" ).disableSelection();
  // });
});

