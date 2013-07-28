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

    // Move to Resources Views
    $('body').on('ajax:success','.add_resource_link', StoneViews.renderAddResourceForm);
  }
}

var SavedResourceController = {
  saveResource: function(event, ui) {
    console.log("Save To Timeline");
    var url = ui.helper.data('save-url');
    var id = ui.helper.data('id');
    $.post({
      url: url
      data: id
    })
    .done(SavedResourceController.flashMessage);
  },

  flashMessage: function(message){
    console.log(message);
  }
}

var DnD = {

  initialize: function() {
    this.$saveBar = $('#save_bar');
    this.bindDraggable();
    this.bindDroppable();
  },

  bindDraggable: function($elements) {
    $elements = typeof $elements !== 'undefined' ? $elements: $('.resource');

    $elements.draggable({ revert: "invalid",
                          appendTo: 'body',
                          helper: "clone",
                          start: DnD.dragStart
                        });
  },

  bindDroppable: function() {
        DnD.$saveBar.droppable({ accept: '.resource',
                               hoverClas: 'drop_hover',
                               drop: SavedResourceController.saveResource
                              });
  },

  dragStart: function( event, ui ) {
    console.log("dragStart");
    DnD.$saveBar.animate({ bottom: '+=150' }, 250);

    $(ui.helper).on('mouseup', DnD.dragStop)
  },

  dragStop: function() {
      DnD.$saveBar.animate({ bottom: '-=150' }, 250);
      $(this).off('mouseup');
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
    DnD.initialize();
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
    $('div.form').remove();
    Avgrund.hide();
  },

  renderOverview: function(event, overview){
    StoneViews.$container.empty()
    StoneViews.$container.append(overview)
  },

  renderAddResourceForm: function(event, addResourceForm){
    $('html').prepend(addResourceForm);
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

    DnD.bindDraggable($(elems));
  },

  renderResources: function(event,resources){
    StoneViews.$container.empty()
    StoneViews.$container.append(resources);

    Masonry.initialize();
  },

  renderDiscussion: function(event,discussion){
    StoneViews.$container.find('.discussions').prepend(discussion);
  },

  renderDiscussions: function(event, discussions){
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
