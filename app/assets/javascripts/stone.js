var StoneController = {
  initialize: function (){
    $('form.create_resource').on('ajax:success', StoneViews.renderResource);
  }
}

var StoneViews = {
  initialize: function(){
    this.$container = $('#stone');
  },

  renderResource: function(event, data){
    StoneViews.$container.find('.resources').prepend(data);
  }
}

$(document).ready(function(){
  StoneController.initialize();
  StoneViews.initialize();
});
