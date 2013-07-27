var StoneController = {
  initialize: function (){
    $('#stone').on('ajax:success','form.create_resource', StoneViews.renderResource);
    $('#stone').on('click','a.filter', StoneViews.applyResourceFilter);
    $('#stone').on('click','a.sort', StoneViews.applyResourceSort);

    $('body').on('ajax:success','.get_overview', StoneViews.renderOverview);
    $('body').on('ajax:success','.get_discussions', StoneViews.renderDiscussions);
    $('body').on('ajax:success','.get_resources', StoneViews.renderResources);
  }

}

var StoneViews = {
  initialize: function(){
    this.$container = $('#stone');
  },

  renderOverview: function(){

  },

  renderResources: function(event,resources){
    console.log("Rendering Resources", resources);
    StoneViews.$container.empty()
    StoneViews.$container.append(resources);
  },

  renderDiscussions: function(event, discussions){
    console.log("Rendering Discussions", discussions);
    StoneViews.$container.empty()
    StoneViews.$container.append(discussions);
  },

  renderResource: function(event, data){
    StoneViews.$container.find('.resources').prepend(data);
  },

  applyResourceFilter: function(event, data){
    event.preventDefault();
    var filterClass = $(this).text();
    StoneViews.$container.find('.resource').hide()
    StoneViews.$container.find("div." + filterClass).show()
  },

  applyResourceSort: function(event, data){
    event.preventDefault();
    var sortType = $(this).data('sort');

    if (sortType === 'ASC') {
      StoneViews.$container.find('.resource').sort(ascSort).appendTo('.resources')
    }
    else {
      StoneViews.$container.find('.resource').sort(descSort).appendTo('.resources') 
    }
    
  }
}

function ascSort(a, b){ return ($(b).text()) < ($(a).text()) ? 1 : -1; }

function descSort(b, a){ return ($(b).text()) < ($(a).text()) ? 1 : -1; }

$(document).ready(function(){
  StoneController.initialize();
  StoneViews.initialize();
});
