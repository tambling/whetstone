$(document).ready(function(){
  $('.motto p').each(function(index){
    var self = this
    window.setTimeout(function(){
      $(self).fadeIn(500).delay(2000).fadeOut(500);
    }, 3000*index);
  });
  window.setTimeout(function(){$('.motto #logo').fadeIn();}, 9000);
});
