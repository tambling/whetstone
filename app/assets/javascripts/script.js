var StoneController = {
  initialize: function (){
    $('body').on('ajax:success','.get_overview', StoneViews.renderOverview);
  }
}

var StoneViews = {
  initialize: function(){
    this.$container = $('.content');
  },

  renderOverview: function(event, overview){
    StoneViews.$container.empty();
    StoneViews.$container.append(overview);
  }
}

$(document).ready(function(){
  StoneController.initialize();
  StoneViews.initialize();
  ResourceController.initialize();
  ResourceViews.initialize();
  DiscussionController.initialize();
  DiscussionViews.initialize();
  
  SavedResourceController.initialize();
});
