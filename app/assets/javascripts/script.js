var StoneController = {
  initialize: function (){
    $('body').on('ajax:success','.get_overview', StoneViews.renderOverview);
    $('body').on('ajax:success','.add_goal', StoneViews.renderGoal);
  }
}

var StoneViews = {
  initialize: function(){
    this.$container = $('.content');
  },

  renderOverview: function(event, overview){
    StoneViews.$container.empty();
    StoneViews.$container.append(overview);
    $('.fixed_tab.active').removeClass('active');
    $(this).addClass('active');

  },

  renderGoal: function(event,data){
    $('.left_nav').find('.goals').append(data);
    $(event.target).fadeOut('fast', function(){
    });
    alertify.success("Added To Your List of Goals");
  }
}

var Navigation = {
  initialize: function() {

  var meny = Meny.create({
    // The element that will be animated in from off screen
    menuElement: document.querySelector( '.left_nav' ),

    // The contents that gets pushed aside while Meny is active
    contentsElement: document.querySelector( '.meny' ),

    // The alignment of the menu (top/right/bottom/left)
    position: 'left',

    // The height of the menu (when using top/bottom position)
    height: 200,

    // The width of the menu (when using left/right position)
    width: 260,

    // Use mouse movement to automatically open/close
    mouse: true,

    // Use touch swipe events to open/close
    touch: true
  });
  },

  showNav: function(){
    $('.left_nav').show();
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
  VoteController.initialize();
  Navigation.initialize();
});
