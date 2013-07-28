var StoneController = {
  initialize: function (){
    $(document).on('ajax:success','form.create_resource', StoneViews.renderResource);
    $(document).on('ajax:success','form.create_discussion', StoneViews.renderDiscussion);
    $(document).on('ajax:success','form.create_comment', StoneViews.renderComment);
    

    $('#stone').on('click','a.filter', StoneViews.applyResourceFilter);
    $('#stone').on('click','a.sort', StoneViews.applyResourceSort);

    $('body').on('ajax:success','.get_overview', StoneViews.renderOverview);
    $('body').on('ajax:success','.get_discussions', StoneViews.renderDiscussions);
    $('body').on('ajax:success','.show_discussion', StoneViews.renderShowDiscussion);
    $('body').on('ajax:success','.get_resources', StoneViews.renderResources);

    $('body').on('ajax:success','.add_resource_link', StoneViews.renderAddResourceForm)
  }
}

var Masonry = {
  initialize: function(){
    Masonry.$container = $('.resources');

    Masonry.$container.masonry({
      columnWidth: 10,
      itemSelector: '.resource'
    });

    Masonry.mason = Masonry.$container.data('masonry');

    $('.resource').draggable({revert: "invalid"});
  }
}

var StoneViews = {
  initialize: function(){
    this.$container = $('#stone');
  },

  openDialog: function() {
    Avgrund.show('.form');
  },      

  closeDialog: function() {
    Avgrund.hide();
    $('.avgrund-popup').remove();
  },

  renderOverview: function(){

  },

  renderAddResourceForm: function(event, addResourceForm){
    $('body').prepend(addResourceForm);
    StoneViews.openDialog();
  },

  renderResource: function(event, data){
    StoneViews.closeDialog();
    
    var fragment = document.createDocumentFragment();
    var elems = [];
    $.each($(data), function(index,elem) {
      fragment.appendChild(elem);
      elems.push(elem);
    });

    Masonry.$container.prepend( fragment );
    Masonry.mason.prepended( elems );
  },

  renderResources: function(event,resources){
    console.log("Rendering Resources", resources);
    StoneViews.$container.empty()
    StoneViews.$container.append(resources);

    Masonry.initialize();
  },

  renderDiscussion: function(event,discussion){
    StoneViews.$container.find('.discussions').prepend(discussion);
  },

  renderDiscussions: function(event, discussions){
    console.log("Rendering Discussions", discussions);
    StoneViews.$container.empty()
    StoneViews.$container.append(discussions);
  },

  renderShowDiscussion: function(event, discussion) {
    console.log("Showing discussion");
    StoneViews.$container.empty()
    StoneViews.$container.append(discussion);
  },

  renderComment: function(event, comment) {
    console.log("Rendering Comment");
    $(this).after(comment);
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
