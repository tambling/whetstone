var SavedResourceController = {
  initialize: function(){
    $('body').on('ajax:success','.save_resource', SavedResourceController.flashMessage)
  },

  flashMessage: function(event, message){
    console.log(message);
  }
}

$(document).ready( function() {
	$(function() {
    $( ".sortable" ).sortable();
    $( ".sortable" ).disableSelection();
    $( ".sortable" ).onUpdate();
	});
});

