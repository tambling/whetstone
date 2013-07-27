var StoneController = {
  initialize: function (){
    $('form.create_resource').on('ajax:success', StoneViews.renderResource);
    $('#stone').on('click','a.filter', StoneViews.applyResourceFilter);
    $('#stone').on('click','a.sort', StoneViews.applyResourceSort);
  }
}

var StoneViews = {
  initialize: function(){
    this.$container = $('#stone');
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
