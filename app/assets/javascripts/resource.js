var Masonry = {
  initialize: function(){
    Masonry.$container = $('#resource .resources');
    Masonry.$container.masonry({
      gutter: 30,
      columnWidth: 10,
      itemSelector: '.resource'
    });

    Masonry.mason = Masonry.$container.data('masonry');
  }
}

var ResourceController = {
  initialize: function(){

    $('body').on('ajax:success','.get_resources', ResourceViews.renderResources);

    $('body').on('ajax:success','.add_resource_link', ResourceViews.renderAddResourceForm);

    $(document).on('ajax:success','form.create_resource', ResourceViews.renderResource);

    $('body').on('click','a.filter', ResourceViews.applyResourceFilter);

    $('body').on('click','a.sort', ResourceViews.applyResourceSort);

    $('body').on('mouseenter', '.resource', function(){
      $(this).find('.toolbar_options').fadeIn('fast');
    });

    $('body').on('mouseleave', '.resource', function(){
      $(this).find('.toolbar_options').fadeOut('fast');
    });

    $(document).on('click','.close_modal', ResourceViews.closeDialog);

  }
}

var ResourceViews = {

  initialize: function(){
    this.$container = $('.content');
  },

  openDialog: function() {
    $('.left_nav').hide();
    Avgrund.show('.modal');
  },   

  closeDialog: function() {
    $('div.modal').remove();
    Avgrund.hide();
    $('.left_nav').fadeIn();
  },

  renderAddResourceForm: function(event, addResourceForm){
    $('html').prepend(addResourceForm);
    ResourceViews.openDialog();
  },

  renderResource: function(event, data){
    
    ResourceViews.closeDialog();
    ResourceViews.$container.find('.resources').prepend(data)
    alertify.success("Added New Resource!");

    // var fragment = document.createDocumentFragment();
    // var elems = [];
    // $.each($(data), function(index,elem) {
    //   fragment.appendChild(elem);
    //   elems.push(elem);
    // });

    // Masonry.$container.prepend( fragment );
    // Masonry.mason.prepended( elems );
  },

  renderResources: function(event,resources){
    ResourceViews.$container.empty()
    ResourceViews.$container.append(resources);
    alertify.success("Listing Resources ...");
    $('.fixed_tab.active').removeClass('active');
    $(this).addClass('active');
  },

  filterResources: function(event, resources){
    console.log(resources);
  },

  applyResourceFilter: function(event, data){
    event.preventDefault();
    var filterClass = $(this).text();
    ResourceViews.$container.find('.resource').hide();
    ResourceViews.$container.find("div." + filterClass).fadeIn('fast')
  },

  applyResourceSort: function(event, data){
    event.preventDefault();
    var sortType = $(this).data('sort');

    if (sortType === 'ASC') {
      ResourceViews.$container.find('.resource').sort(ascSort).appendTo('.resources')
    }
    else {
      ResourceViews.$container.find('.resource').sort(descSort).appendTo('.resources')
    }

  }
}

function ascSort(a, b){ return ($(b).text()) < ($(a).text()) ? 1 : -1; }

function descSort(b, a){ return ($(b).text()) < ($(a).text()) ? 1 : -1; }

