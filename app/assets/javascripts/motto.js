$(document).ready(function(){
  $('.motto .item').each(function(index){
    var self = this
    window.setTimeout(function(){
      $(self).fadeIn(500).delay(1000).fadeOut(600);
    }, 2200*index);
  });
  window.setTimeout(function(){$('.motto #logo').fadeIn();}, 6600);
});
